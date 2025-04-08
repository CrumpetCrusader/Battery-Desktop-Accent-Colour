# Battery Desktop Accent Colour
To change Windows accent colour depending on BatteryState

I intend to change the Microsoft Windows 11 accent Colour Depending on the battery state, AC = Green, DC= Red 

I use laptops in event production, and mid-even,t a laptop died as I didn't notice someone had unplugged the laptop's power

I want the script to
Check power state 
If AC/Mains make windows accent colour GREEN
If on DC/Battery, make windows Accent colour RED
restart explorer.exe

# INSTRUCTIONS:
Install TranslucentTB
You'll have to edit the script.ps1 to point it to your TranslucentTB settings.json
mine is at:
C:\Users\Ben\AppData\Local\Packages\28017CharlesMilette.TranslucentTB_v826wp6bftszj\RoamingState

Only 2 files needed: script.ps1 and hidden.vbs, put them somewhere together.

Then open Task Scheduler,
navigate to Microsoft/Windows/Application Experience
create a task. Name it, create a trigger, begin the task on event, log: system, source: Kernel-power, Event-ID: 105. click ok,
create another trigger 'at system start-up'.

Under Actions, click New, click Browse and point it to where you've saved Hidden.vbs (keep script .ps1 in the same location).

click ok and ok again.
Done.

# Notes
This is my first coding venture on Git Hub, I hope you good people can help correct my code, I don't know what I'm doing, ha.

edit:
Can someone help me make an installer ha.
