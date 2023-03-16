write-host 'Setup ScriptBlock'
Start-sleep -Seconds 3

$scriptblock = {
write-host 'Writing ScriptBlock'
Start-sleep -Seconds 3
write-host 'Getting OneDrive Path'
$Path = (Get-ChildItem -Path $env:LOCALAPPDATA -Recurse -Filter "OneDrive.exe" | Select-Object -First 1).FullName
Start-sleep -Seconds 3
#if (!$Path) {
#	write-host 'OneDrive Missing. Stopping script.'
#	exit 1
#}
#else{
	if(-not (Get-Module RunAsUser -ListAvailable)){
	Install-Module RunAsUser -Scope CurrentUser -Force
	}
	Else{
	Start-sleep -Seconds 3
	write-host 'Executing OneDrive'
	Start-sleep -Seconds 3
	& $Path
	Start-sleep -Seconds 5
	exit 1	
	}
 #  }
}

write-host 'Sleeping 10 Seconds'

Start-sleep -Seconds 10


write-host 'Attempting to invoke RunAs'
Start-sleep -Seconds 3
Invoke-AsCurrentUser -NonElevatedSession -scriptblock $scriptblock

