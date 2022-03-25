local countDownsToBlock = 2;
local allowCountdown = false
local seenCutsceneend = false;
local actuallend = false;
local seenCutscene = false;
function onStartCountdown()
	if  not seenCutscene and countDownsToBlock > 0 and isStoryMode  then
	
	makeAnimatedLuaSprite('V', 'V/cutscenes/harmony', defaultOpponentX, (defaultOpponentY) + 400);
		luaSpriteAddAnimationByPrefix('V', 'idle', 'vrage_2t3' , 24, false)
		
	setObjectOrder('vr', 20)
		setProperty('dad.visible', false);
		setProperty('boyfriendGroup.visible', false);
		setProperty('camGame.zoom', 1.7)
		setProperty('camHUD.visible', false);
		setProperty('camFollow.y', getProperty('camFollow.y') + 100, 0.1);
		setProperty('camFollow.x', getProperty('camFollow.x') - 100, 0.1);
		
		addLuaSprite('V', true)
		
		runTimer('showtime', 2);
		
		countDownsToBlock = countDownsToBlock - 2;
	return Function_Stop;
	end
	seenCutscene = true;
	return Function_Continue;
end
function onCreate()	

	makeAnimatedLuaSprite('vr', 'V/vr', -300 , 350);
		luaSpriteAddAnimationByPrefix('vr', 'howdy', 'vr' , 24, false)
		scaleLuaSprite('vr', 1.3, 1.3)
	makeAnimatedLuaSprite('vr2', 'V/vr2', -300 , 350);
		luaSpriteAddAnimationByPrefix('vr2', 'idle', 'vr2' , 24, false)
		scaleLuaSprite('vr2', 1.3, 1.3)
			
	setScrollFactor('vr', 1.1, 1.1)
	setScrollFactor('vr2', 1.1, 1.1)
	
	setObjectOrder('vr', 20)
	
	addLuaSprite('nig', false)
	
		
	math.randomseed(os.time());		
	animname = string.format('yotdo%i', math.random(1 , 5));
	objectPlayAnimation('yot', animname, true);
	
end
function onEndSong()
	if not seenCutsceneend and isStoryMode then
		runTimer('transition', 0.1);
		seenCutsceneend = true;
		return Function_Stop;
	end		
	if not actuallend and isStoryMode then
		return Function_Stop;
		end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'showtime' then	
		runTimer('dacamerafix', 1.7);
		removeLuaSprite('V', true)
		setProperty('dad.visible', true);
		setProperty('boyfriendGroup.visible', true);
		setProperty('camHUD.visible', true);
		doTweenZoom('zoomTween', 'camGame', 0.9, 1.7, 'smootherStepInOut');
		doTweenY('camYTween', 'camFollowPos', getProperty('camFollow.y') - 100, 1.7, 'smootherStepInOut');
		doTweenX('camXTween', 'camFollowPos', getProperty('camFollow.x') + 100, 1.7, 'smootherStepInOut');
		startCountdown()
	end
	if tag == 'idle' then		
		addLuaSprite('vr2', true)
		removeLuaSprite('vr', true)
	end
	if tag == 'dacamerafix' then
		setProperty('camFollow.y', getProperty('camFollow.y') - 100);
		setProperty('camFollow.x', getProperty('camFollow.x') + 100);
	end
	
	if tag == 'transition' then
		if difficulty == 2 then 
		runTimer('funny', 75.3);
		startVideo('vgood');
		else
		runTimer('funny', 55.3);
		startVideo('vbad');
		end
	end
	
	if tag == 'funny' then
	actuallend = true
		endSong()
	end
end

function onBeatHit()
	objectPlayAnimation('vr2', 'idle', false);
end
function onStepHit()
	if curStep == 500 then
	objectPlayAnimation('nig', 'look', true);
	end
	if curStep == 620 then
		runTimer('idle', 1.5);
		addLuaSprite('vr', true)
	end
end