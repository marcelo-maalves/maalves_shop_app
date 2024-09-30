
$command = $args -join " "
if (!$command) {
  Write-Output "Usage: $0 <command(s)>"
  exit 1
}

$FILES = Get-ChildItem -r -fi pubspec.yaml
foreach ($file in $FILES) {
  Write-Output "------- $($file.Directory.Name)"
  Set-Location $file.Directory
  Invoke-Expression $command
  Set-Location -
}
