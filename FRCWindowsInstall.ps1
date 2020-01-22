#install missing PS modules
if (-Not (Get-Module -ListAvailable -Name powershell-yaml))
{
	Install-Module -Name powershell-yaml -Force -Repository PSGallery -Scope CurrentUser
}
$downloadsPath = ".\downloads"
if(!(test-path $downloadsPath))
{
	Write-Host "Creating directory " $downloadsPath
    New-Item -ItemType Directory -Force -Path $downloadsPath
}
#read configuration file
$fileContent = Get-Content -Raw ".\config.yml"
$ymlConfig = (ConvertFrom-Yaml -Yaml $fileContent -Ordered)

$packages = $ymlConfig.packages.GetEnumerator()

#download all packages and install
foreach ($p in $packages)
{	
	$package = $p.Value
	$fileName = Join-Path -Path $downloadsPath\ -ChildPath $package.fileName
	if (!((test-path $fileName) -Or ($package.downloadURL -Eq "None")))
	{
		Write-Host "Downloading $fileName"
		Invoke-WebRequest -Uri $package.downloadURL -OutFile $fileName
	}
	switch ($package.installation.installationType)
	{
		"run"
		{
			Write-Host "Installing $fileName"
			Start-Process $fileName -NoNewWindow -Wait
		}
		"unzip"
		{
			Write-Host "unpacking" $fileName "to" $package.installation.destinationPath
			Expand-Archive -LiteralPath $fileName -DestinationPath $package.installation.destinationPath -Force
		}
	}
}