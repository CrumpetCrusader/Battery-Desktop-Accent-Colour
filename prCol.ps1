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
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $RAccPal -Type HEX -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $RValueS -Type DWORD -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $RValueA -Type DWORD -Force  
    Stop-Process -Name explorer -Force
} else {
    # DC power (battery) - red accent color
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $GAccPal -Type HEX -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $GValueS -Type DWORD -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $GValueA -Type DWORD -Force 
    Stop-Process -Name explorer -Force
}
