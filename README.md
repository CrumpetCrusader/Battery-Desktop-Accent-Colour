# Battery Desktop Accent Colour
To change Windows accent colour depending on BatteryState

I intend to change the Microsoft Windows 11 accent Colour Depending on the battery state, AC = Green DC= Red 

I use laptops in event production and mid-event a laptop died as I didn't notice someone had unplugged the laptop's power
so now I am making a script for Windows to run in the task scheduler, upon system event 105 (System/Kernal-power) (which I think is power state change).

I want the script to
check power state 
if AC/Mains make windows accent colour GREEN
if on DC/Battery Make windows Accent colour RED
restart explorer.exe

I made 2 reg edits that do the job, I'm just trying to Powershell send the registry Values by itself, but it won't... ha

this is my first coding venture on Git Hub, I hope you good people can help correct my code, I don't know what I'm doing ha.

script= prcol.ps1
Task schedule= Colourchanger.xml

edit:
can someone optimise this ha and comment if there's an argument for Powershell to run silently
