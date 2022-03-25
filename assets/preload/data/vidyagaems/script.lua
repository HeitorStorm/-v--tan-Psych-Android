local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		luaSpriteMakeGraphic('transitionBlack', screenWidth * 2, screenHeight * 2, '000000');
		setLuaSpriteScrollFactor('transitionBlack', 0, 0);
		addLuaSprite('transitionBlack', true);
		setProperty('inCutscene', true);
		startVideo('V-ideo1');
		allowCountdown = true;
		seenCutscene = true;
		return Function_Stop;
	end
	return Function_Continue;
end
stepHitFuncs = {
	[830] = function()
	doTweenAlpha('V', 'V', 1, 0.0001, 'linear')
		objectPlayAnimation('V', 'Punch', true)
		setProperty('dad.visible', false)
	end,
	
	[836] = function()
		triggerEvent('Screen Shake', '0.15, 0.006', '0.15, 0.006')
	end,
	
	[832] = function()
		triggerEvent('Screen Shake', '0.15, 0.006', '0.15, 0.006')
	end,
	
	[189] = function()
		characterPlayAnim('gf', 'hey', true)
	end,
	
	[200] = function()
		addLuaSprite('xtan')
	end,
	[848] = function()
		setProperty('dad.visible', true)
		removeLuaSprite('V')
	end,
	
	--dont you fucking ask why--
	[840] = function()
		objectPlayAnimation('V', 'singDOWN', true)
	end,
	[844] = function()
		objectPlayAnimation('V', 'singLEFT', true)
	end,
	[846] = function()
		objectPlayAnimation('V', 'singUP', true)
	end
		
}
function onStepHit()

	if stepHitFuncs[curStep] then 
		stepHitFuncs[curStep]()
		end
end

--i had no other choice, FUCK--

function onCreate()
	makeAnimatedLuaSprite('V', 'characters/v-rage',  defaultOpponentX , (defaultOpponentY) + 400)
	addAnimationByPrefix('V', 'idle', 'vrage_idle', 24, false);
	addAnimationByPrefix('V', 'singLEFT', 'vrage_left', 24, false);
	addAnimationByPrefix('V', 'singDOWN', 'vrage_down', 24, false);
	addAnimationByPrefix('V', 'singUP', 'vrage_up', 24, false);
	addAnimationByPrefix('V', 'Punch', 'vrage_pun', 24, false);
	addLuaSprite('V', true)
	doTweenAlpha('V', 'V', 0, 0.0001, 'linear')
	end
	