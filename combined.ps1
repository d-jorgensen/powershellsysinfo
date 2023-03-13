$allComputers=Get-Content -Path C:\temp\pc.txt
foreach($computer in $allComputers)
{

$isonline=test-connection -Quiet -count 2 -ComputerName $computer
if($isonline)
{


$diskStatus= Get-WmiObject win32_diskdrive -ComputerName $computer|Select-Object -ExpandProperty Status

$cpuStatus= Get-WmiObject -Class Win32_Processor -ComputerName $computer | Select-Object -Property Name 

$ramStatus= (Get-WmiObject Win32_ComputerSystem -ComputerName $computer).totalphysicalmemory / (1024 * 1024 * 1024) 

Write-Host -ForegroundColor Green "$computer is online and disk status is $diskStatus , memory is $ramStatus , cpu is $cpuStatus";
$cpuStatus=""; $diskStatus=""; $ramStatus="";
}
else
{
Write-Host -ForegroundColor Red "$computer is offline";
}

}
