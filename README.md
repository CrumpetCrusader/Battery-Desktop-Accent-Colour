 Battery Desktop Accent Colour
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