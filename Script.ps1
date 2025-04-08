$RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'

# RED VALUES
$GAccPal        = [byte[]](0x5f,0xff,0xa5,0x00,0x26,0xff,0x8e,0x00,0x00,0xe7,0x75,0x00,0x00,0xcc,0x6a,0x00,0x00,0xb2,0x5a,0x00,0x00,0x76,0x35,0x00,0x00,0x3f,0x13,0x00,0xe3,0x00,0x8c,0x00)
$GValueS        = 0xff5ab200
$GValueA        = 0xff6acc00

# GREEN VALUES
$RAccPal        = [byte[]](0xf7,0xb1,0xa5,0x00,0xe8,0x80,0x7a,0x00,0xd8,0x4b,0x4c,0x00,0xd1,0x34,0x38,0x00,0xbe,0x2b,0x2e,0x00,0x8d,0x1a,0x1c,0x00,0x61,0x09,0x0a,0x00,0x64,0x7c,0x64,0x00)
$RValueS        = 0xff2e2bbe
$RValueA        = 0xff3834d1

# Determine power source
function Get-PowerSource {
    $powerStatus = (Get-WmiObject -Query "SELECT * FROM Win32_Battery").BatteryStatus
    return $powerStatus
}

# Main script
$powerSource = Get-PowerSource

if ($powerSource -eq 2) {
    # AC power (plugged in) - green accent color
	# Set the path to your JSON file
	$filePath = "C:\Users\Ben\AppData\Local\Packages\28017CharlesMilette.TranslucentTB_v826wp6bftszj\RoamingState\settings.json"

	# Read all lines into an array
	$lines = Get-Content $filePath

	# Replace line 14 (index 13) with the new color line
	$lines[13] = '    "color": "#10893EFF",'

	# Write the modified lines back to the file
	$lines | Set-Content $filePath 
} else {
    # DC power (battery) - red accent color
	# Set the path to your JSON file
	$filePath = "C:\Users\Ben\AppData\Local\Packages\28017CharlesMilette.TranslucentTB_v826wp6bftszj\RoamingState\settings.json"

	# Read all lines into an array
	$lines = Get-Content $filePath

	# Replace line 14 (index 13) with the new color line
	$lines[13] = '    "color": "#E81123FF",'

	# Write the modified lines back to the file
	$lines | Set-Content $filePath
}

# Restart explorer to apply changes
#Stop-Process -Name explorer -Force

Exit
