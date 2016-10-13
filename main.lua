-- Audio Bug Test
-- Background: The purpose of this project is to illustrate the issues discovered using the audio library in Corona
-- Elements of the the "AudioPlayer" demo provided by Corona were used to create this project.
-- Instructions: Mash the "Reset Sound Button" a bit (might need to try out different paces). 
--    Sometimes the library does not correctly stop and play the audio 
--    and the channel incorrectly displays if it is active or not.

local s1 = audio.loadSound("bouncing.mp3");
local c1 = 1;
audio.reserveChannels(1)

-------------------------------------------------
-- Channel State Text
-------------------------------------------------
local channel1Params = {
	text = "Channel 1 State:",
	x = display.contentCenterX,
	y = 100,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local channel1Text = display.newText(channel1Params);

local channel2Params = {
	text = "Active. Now stopping channel.",
	x = display.contentCenterX,
	y = 130,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local channel2Text = display.newText(channel2Params);
channel2Text:setFillColor(0,1,0,1)
channel2Text.alpha = 0

local channel3Params = {
	text = "Not active.",
	x = display.contentCenterX,
	y = 130,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local channel3Text = display.newText(channel3Params);
channel3Text:setFillColor(1,0,0,1)
channel3Text.alpha = 0

-------------------------------------------------
-- Play State Text
-------------------------------------------------
local play1Params = {
	text = "Play State:",
	x = display.contentCenterX,
	y = 200,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local play1Text = display.newText(play1Params);
local play2Params = {
	text = "Playing.",
	x = display.contentCenterX,
	y = 230,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local play2Text = display.newText(play2Params);
play2Text:setFillColor(0,1,0,1)
play2Text.alpha = 0

local play3Params = {
	text = "Not playing. Audio.play returned 0",
	x = display.contentCenterX,
	y = 230,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local play3Text = display.newText(play3Params);
play3Text:setFillColor(1,0,0,1)
play3Text.alpha = 0

-------------------------------------------------
-- Button
-------------------------------------------------
local r1 = display.newRect( display.contentCenterX, 350, 100, 60 )
r1:setFillColor(1,0,0)
local btnTextParams = {
	text = "Reset Sound Button (Mash this!)",
	x = r1.x,
	y = r1.y,
	width = 90,
	font = native.systemFont,
	fontSize = 13,
	align = "center",	
}
local btnText = display.newText(btnTextParams);

-- Touch Handler
function r1:touch( event )
    if event.phase == "began" then 
    	
    	-- if audio.isChannelActive(c1) then 
    	-- 	print("Channel " .. c1 .. " is active --> Stopping audio")
    	-- 	audio.stop(c1) 
    	-- else
    	-- 	print("Channel " .. c1 .. " is not active --> Not stopping audio")
    	-- end
    	--print("Stop returned: " .. audio.stop(c1)) --> Uncomment if you would like to test if audio.stop(c1) is actually working
    	print("Channel: " .. c1)
     	local channelReturned = audio.play(s1, { channel = c1 })
    	if channelReturned == 0 then
    		print("audio.play returning 0. Did not play audio.")
    		play2Text.alpha, play3Text.alpha = 0, 1
    	else
    		local myStr = "Playing on Channel: " .. channelReturned
    		print(myStr)
    		play2Text.text = myStr
    		play2Text.alpha, play3Text.alpha = 1, 0
    	end

    	if audio.isChannelActive(c1) then 
    		channel2Text.alpha, channel3Text.alpha = 1, 0
    	else
    		channel2Text.alpha, channel3Text.alpha = 0, 1
    	end
    end
    return true
end 
r1:addEventListener( "touch", r1 )