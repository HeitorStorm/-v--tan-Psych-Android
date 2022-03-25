local countDownsToBlock = 3;
function onStartCountdown()
	if isStoryMode and not seenCutscene then
		runTimer('start', 1.4);
		setProperty('inCutscene', true);
		setProperty('dad.visible', false);
		setProperty('gf.visible', false)
		setProperty('camHUD.visible', false);
		

		makeAnimatedLuaSprite('zordWake', 'zord/introz', -300, 200);
		luaSpriteAddAnimationByPrefix('zordWake', 'idle', 'zord_intro', 24, false);
		addLuaSprite('zordWake');
		
		countDownsToBlock = countDownsToBlock - 3;
		seenCutscene = true;
		return Function_Stop;
	end
		runTimer('start', 0.1);
		return Function_Continue;
	end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start' then
	setProperty('inCutscene', false);
	setProperty('dad.visible', true);
	setProperty('gf.visible', false)
	setProperty('camHUD.visible', true);
	removeLuaSprite('zordWake');
	startCountdown();
	noteTweenX('byezordarrows1', 0, -200, 0.01, 'linear')
        noteTweenX('byezordarrows2', 1, -200, 0.01, 'linear')
        noteTweenX('byezordarrows3', 2, -200, 0.01, 'linear')
        noteTweenX('byezordarrows4', 3, -200, 0.01, 'linear')
	noteTweenX('middletime1', 4, 414, 0.01, 'linear')
        noteTweenX('middletime2', 5, 527, 0.01, 'linear')
        noteTweenX('middletime3', 6, 637, 0.01, 'linear')
        noteTweenX('middletime4', 7, 750, 0.01, 'linear')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
setProperty('health', getProperty('health')-0.01);
noteTweenAlpha('enemy0', 0, 0, 0)
	    noteTweenAlpha('enemy1', 1, 0, 0)
	    noteTweenAlpha('enemy2', 2, 0, 0)
	    noteTweenAlpha('enemy3', 3, 0, 0)
end

function onBeatHit()
	if curBeat == 618 then
		setProperty('boyfriend.visible', true)
		doTweenZoom('zordeffect2', 'camGame', 1.1, 0.01, 'backOut')
		objectPlayAnimation('zordhand', 'idle', false)
	end
end