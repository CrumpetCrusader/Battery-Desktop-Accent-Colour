# Battery-Desktop-Accent-Colour
To change Windows accent colour depending on BatteryState

My intention is change microsoft windows 11 accent Colour Depending on battery state, AC = Green DC= Red 

i use laptops in event production and mid event a laptop died as i didnt notice someone had unplugged the laptops power
so now i aim make a script for windows to run in task schecular, upon system event 105 (which i think is power state change).

i want the scrpt to
check power state 
if AC/Mains make windos accent colour GREEN
if on DC/Battery Make windows Accent colour RED
restart explorer.exe

i made 2 regedits that do the job, im just trying to powershell send the regestry Values by itself, but it wont... ha

this is my first coding venture on github, i hope you good people can help correct my code, still working out how to publish code ha

filename= prcol.ps1


$RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'

#RED VALUES
$RAccpal        = '5f,ff,a5,00,26,ff,8e,00,00,e7,75,00,00,cc,6a,00,00,b2,5a,00,00,76,35,00,00,3f,13,00,e3,00,8c,00'
$RValueS        = 'ff5ab200'
$RValueA        = 'ff6acc00'

#GREEN VALUES
$GAccPal        = 'f7,b1,a5,00,e8,80,7a,00,d8,4b,4c,00,d1,34,38,00,be,2b,2e,00,8d,1a,1c,00,61,09,0a,00,64,7c,64,00'
$GValueS        = 'ff2e2bbe'
$GValueA        = 'ff3834d1'

# Determine power source
function Get-PowerSource {
    $powerStatus = (Get-WmiObject -Namespace root\WMI -Class BatteryStatus).PowerOnline
    return $powerStatus
}

# Main script
$powerSource = Get-PowerSource

if ($powerSource -eq $true) {
    # AC power (plugged in) - green accent color
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $RAccPal -PropertyType HEX -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $RValueS -Type DWORD -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $RValueA -Type DWORD -Force  
    Stop-Process -Name explorer -Force
} else {
    # DC power (battery) - red accent color
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $GAccPal -PropertyType HEX -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $GValueS -PropertyType DWORD -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $GValueA -PropertyType DWORD -Force 
    Stop-Process -Name explorer -Force
}

