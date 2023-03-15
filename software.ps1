$allComputers=Get-Content -Path C:\temp\pc.txt
foreach($computer in $allComputers)
{

$isonline=test-connection -Quiet -count 2 -ComputerName $computer
if($isonline)
{


$output = Get-WmiObject -Query "select * from Win32_Product Where NOT Name Like 'Adobe Acrobat%' AND NOT Name Like 'Office%' AND NOT Name Like 'Auto%' AND NOT Name Like 'Microsoft%' AND NOT Name Like 'Windows%' AND NOT Name Like 'Dell%'" -ComputerName $computer | select InstallDate, Name, Version, PSComputerName | Out-String;
#Get-WmiObject -Query "select * from Win32_Product Where Name Like 'Adobe Acrobat%' OR Name Like 'Office%' OR Name Like 'Auto%'" -ComputerName $computer | select InstallDate, Name, Version, PSComputerName


Write-Host -ForegroundColor Green "$computer is online $output";
$output="";
}
else
{
Write-Host -ForegroundColor Red "`n$computer is offline `n";
}

}
