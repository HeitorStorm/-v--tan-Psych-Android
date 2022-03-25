local allowCountdown = false
local seenCutsceneend = false;
local actuallend = false;
local seenCutscene = false;
function onStartCountdown()
	if not seenCutscene and isStoryMode then
		setProperty('camFollow.x', getProperty('camFollow.x') + 250, 0.1);
		setProperty('camGame.zoom', 1.5)
		setProperty('dad.visible', false);
		setProperty('boyfriendGroup.visible', false);
		setProperty('inCutscene', true);
		addLuaSprite('cancergrab', true)	
		runTimer('herewego', 15.8);
		runTimer('showtime', 0.1);
		seenCutscene = true;
		return Function_Stop;
	end		
	if not allowCountdown  and isStoryMode then
		return Function_Stop;
		end
	return Function_Continue;
end

local seenCutsceneend = false;
local actuallend = false;
function onCreate()	
		luaSpriteMakeGraphic('niggascreen', screenWidth * 2, screenHeight * 2, '000000');
		setLuaSpriteScrollFactor('niggascreen', 0, 0);
	end
	
function onEndSong()
	if not seenCutsceneend and isStoryMode then
		addLuaSprite('transitionBlack', true);
		setProperty('inCutscene', true);
		runTimer('transition', 0.1);
		seenCutsceneend = true;
		return Function_Stop;
	end		
	if not actuallend and isStoryMode then
		return Function_Stop;
		end
	return Function_Continue;
end
function onCreate()	
		luaSpriteMakeGraphic('niggascreen', screenWidth * 2, screenHeight * 2, '000000');
		setLuaSpriteScrollFactor('niggascreen', 0, 0);
	end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'transition' then
		if misses < 5 then 
		runTimer('funny', 9.3);
		startVideo('cancergood');
		else
		runTimer('funny', 8.3);
		startVideo('cancerbad');
		end
	end
	
	
	if tag == 'herewego' then
		runTimer('fall', 2);
		runTimer('zoom', 0.5);
		objectPlayAnimation('cancergrab', '2', true);
	end
		
	if tag == 'zoom' then
		doTweenZoom('zoomTween', 'camGame', 0.95, 1.5, 'smootherStepInOut');
		doTweenX('camXTween', 'camFollowPos', getProperty('camFollow.x') -250, 1.5, 'smootherStepInOut');
		setProperty('camFollow.x', getProperty('camFollow.x') - 250, 0.1);
		end
		
	if tag == 'fall' then
		doTweenZoom('zoomTween', 'camGame', 0.95, 1, 'smootherStepInOut');
		addLuaSprite('bffall', true)	
		addLuaSprite('cancerfall', true)	
	end
	
	if tag == 'funny' then
	actuallend = true
		endSong()
	end
	
	if tag == 'showtime' then
		startVideo('cancerintro')
		runTimer('showtimefr', 17.7);
	end
	
	if tag == 'showtimefr' then
		removeLuaSprite('cancergrab')	
		removeLuaSprite('bffall')	
		removeLuaSprite('cancerfall')	
		setProperty('dad.visible', true);
		setProperty('boyfriendGroup.visible', true);
		allowCountdown = true;
		startCountdown()
	end
end



		--;--