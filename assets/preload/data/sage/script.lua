local countDownsToBlock = 2;
function onStartCountdown()
	if not seenCutscene and isStoryMode  then
		setProperty('dad.visible', false);
		setProperty('boyfriendGroup.visible', false);
		setProperty('camGame.zoom', 1.7)
		setProperty('camHUD.visible', false);
		setProperty('camFollow.y', getProperty('camFollow.y') + 100, 0.1);
		
		makeAnimatedLuaSprite('fag', 'V/cutscenes/sage', defaultOpponentX, (defaultOpponentY) + 400);
			luaSpriteAddAnimationByPrefix('fag', 'thediag', 'vrage_1t2' , 24, false)
		makeAnimatedLuaSprite('bluefag', 'V/cutscenes/sagebf', defaultBoyfriendX, (defaultBoyfriendY) + 520);
			luaSpriteAddAnimationByPrefix('bluefag', 'stop', 'idle' , 24, false)
			luaSpriteAddAnimationByPrefix('bluefag', 'diag', 'bf_up_intro' , 24, false)
		
		addLuaSprite('fag')
		addLuaSprite('bluefag')
	
		setObjectOrder('fag', 13)
		setObjectOrder('bluefag', 14)

		runTimer('start', 5);
		runTimer('focusonthesmurf', 2.4);
		
		
		seenCutscene = true;
		countDownsToBlock = countDownsToBlock - 2;
	return Function_Stop;
	end
	return Function_Continue;
end
function onCreate()	
		
	makeAnimatedLuaSprite('FUUUUU', 'V/cutscenes/fuck', defaultOpponentX, (defaultOpponentY) + 400);
		luaSpriteAddAnimationByPrefix('FUUUUU', 'UUUUUUUUCK', 'vrage_ffff' , 24, true)
		
	math.randomseed(os.time());		
	animname = string.format('yotdo%i', math.random(1 , 5));
	objectPlayAnimation('yot', animname, true);
	if isStoryMode then
		playMusic('sage')
	end
	
end


function onStepHit()
	if curStep == 344 then
		addLuaSprite('xtan')
	end
	
	if curStep == 366 then	
		addLuaSprite('trv')
		
	-- you cant really see him so bruh --
		
	end
end
	
function onBeatHit()
	if curBeat > 352 and curBeat < 413 then	
		triggerEvent('Add Camera Zoom', '0.02', '0.001')
	end	
	
	if curBeat == 415 then	
		setProperty('dad.visible', false);
		addLuaSprite('FUUUUU')
		runTimer('TERREMOTOCTM', 0.6);			
	end
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'TERREMOTOCTM' then		
		triggerEvent('Screen Shake', '4, 0.006', '4, 0.006')
	end
	
	if tag == 'start' then
		soundFadeOut('' , 0.2 , 0)
		runTimer('dacamerafix', 1.7);
		removeLuaSprite('fag')
		removeLuaSprite('bluefag')
		setProperty('dad.visible', true);
		setProperty('boyfriendGroup.visible', true);
		setProperty('camHUD.visible', true);
		doTweenZoom('zoomTween', 'camGame', 0.9, 1.7, 'smootherStepInOut');
		doTweenX('camXTween', 'camFollowPos', getProperty('camFollow.x') - 320, 1.7, 'smootherStepInOut');
		doTweenY('camYTween', 'camFollowPos', getProperty('camFollow.y') - 100, 1.7, 'smootherStepInOut');
		startCountdown()
	end
	
	if tag == 'dacamerafix' then
		setProperty('camFollow.x', getProperty('camFollow.x') - 320, 0.1);
		setProperty('camFollow.y', getProperty('camFollow.y') - 100, 0.1);
	end
		
	if tag == 'focusonthesmurf' then
		setProperty('camFollow.x', getProperty('camFollow.x') + 320, 0.1);
		runTimer('beepmf', 0.4);
	end
	
	if tag =='beepmf' then
	objectPlayAnimation('bluefag', 'diag', true);
		runTimer('boopmf', 0.3);
	end
	
	if tag == 'boopmf' then
	playSound('beepsage');
	end
	
end
