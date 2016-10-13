Background: This Corona project is used to demonstrate an issue that sometimes occur when trying to stop and play audio on a single channel.

Resources: 
- https://forums.coronalabs.com/topic/46314-testing-error-with-clearing-buffer-from-source-invalid-operationwarning-audio-error-failed-to-clear-buffer-from-source-invalid-operation/

Expected Behavior:
- When stopping a channel and then immediately playing audio on that same channel, the previous sound effect should stop and the new one should start.

Issue Description: Sometimes this expected behavior does not happen.
- First, the audio playing will not stop.
- Second, unable to play new audio on that particular channel until current audio is complete.
- On the Corona Mac Simulator, comes with the following errors:
	- "17dTesting Error with clearing buffer from source: Invalid OperationWarning: audio error: Failed to clear buffer from source: Invalid Operation"
	- "Warning: audio error: Could not bind data to source: Invalid Operation"

Why is this important to fix?
- People have been bringing this issue up for at least two years now.
- Channels should work correctly. If a channel is stopped, it should stop. If we try to play a sound effect on that channel, that sound effect should work.
- Hacking "work arounds" like using timers requires a lot of work. Not only do we now have to start and stop channels, but we also need to start and cancel timers to do something that should be extremely simple. Having all that timer maintenance is frustrating when this should literally be a two line behavior. (Assuming you have multiple characters and each character has it's own channel... now each character also needs a timer just so that the audio/channel can work correctly)

Instructions: 
- Open the project in Corona
- Mash the Reset Sound Button
	- Might need to try out different paces
	- On iPad, might need to try a little while longer than on Corona Mac Simulator

Tested with: Corona 2016.2970
- Corona Mac Simulator: 
	- Easily reproducible. Can reproduce in a matter of seconds
	- Errors/Warnings discussed above show in Console log
	- See Simulator Test Log.txt
- iPad Mini: 
	- Harder to reproduce than Mac Simulator. But still reproducible.
	- Errors/Warnings discussed above do NOT show in Console log
	- See iPad Test Log.txt
- Samsung Tab3: 
	- Unable to reproduce.
	- No Errors/Warnings discussed above
	- Sometimes the current audio will not stop and will have to wait a tiny bit. But, it is not the case that I need to wait until the current audio is 100% complete.
		- The difference between this and the Mac and iPad tests is that if I keep pressing the button, eventually it will register and play the new sound effect. 
		- Whereas on the Mac and iPad, even if I keep pressing the button, it will not work until the current SFX is over.
