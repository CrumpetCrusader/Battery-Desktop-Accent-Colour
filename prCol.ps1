$RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'

# RED VALUES
$RAccPal        = [byte[]](0x5f,0xff,0xa5,0x00,0x26,0xff,0x8e,0x00,0x00,0xe7,0x75,0x00,0x00,0xcc,0x6a,0x00,0x00,0xb2,0x5a,0x00,0x00,0x76,0x35,0x00,0x00,0x3f,0x13,0x00,0xe3,0x00,0x8c,0x00)
$RValueS        = 0xff5ab200
$RValueA        = 0xff6acc00

# GREEN VALUES
$GAccPal        = [byte[]](0xf7,0xb1,0xa5,0x00,0xe8,0x80,0x7a,0x00,0xd8,0x4b,0x4c,0x00,0xd1,0x34,0x38,0x00,0xbe,0x2b,0x2e,0x00,0x8d,0x1a,0x1c,0x00,0x61,0x09,0x0a,0x00,0x64,0x7c,0x64,0x00)
$GValueS        = 0xff2e2bbe
$GValueA        = 0xff3834d1

# Determine power source
function Get-PowerSource {
    $powerStatus = (Get-WmiObject -Query "SELECT * FROM Win32_Battery").BatteryStatus
    return $powerStatus
}

# Main script
$powerSource = Get-PowerSource

if ($powerSource -eq 2) {
    # AC power (plugged in) - green accent color
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $GAccPal -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $GValueS -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $GValueA -Force  
} else {
    # DC power (battery) - red accent color
    Set-ItemProperty -Path $RegistryPath -Name AccentPalette -Value $RAccPal -Force
    Set-ItemProperty -Path $RegistryPath -Name StartColorMenu -Value $RValueS -Force 
    Set-ItemProperty -Path $RegistryPath -Name AccentColorMenu -Value $RValueA -Force 
}

# Restart explorer to apply changes
Stop-Process -Name explorer -Force
