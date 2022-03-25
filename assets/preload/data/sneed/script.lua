function onCreate()
	-- Precaching Stuff
	precacheImage('simpson/switch')
	addCharacterToList('bsneed', 'dad')
	precacheImage('simpson/pardonUs')
	precacheImage('simpson/switchsecond')
	precacheImage('simpson/groom')	
	
	-- Sprites
	makeAnimatedLuaSprite('groomH', 'simpson/groom', 585, -50);
	makeAnimatedLuaSprite('pardonUs', 'simpson/pardonUs', 75, -15);
	makeAnimatedLuaSprite('switch', 'simpson/switch', -216, -85);
	makeAnimatedLuaSprite('switch2', 'simpson/switchsecond', -216, -85);
	
	-- Animations
	addAnimationByPrefix('groomH', 'idle', 'homoor_groom', 24, false);
	addAnimationByPrefix('pardonUs', 'parondsUs', 'chuckie_pardonus', 24, false);
	addAnimationByPrefix('switch', 'pullup', 'bsneed_switch', 24, false);
	addAnimationByPrefix('switch2', 'putdown', 'bsneed_switch_2', 24, false);
	
	-- Starting Events
	cameraSetTarget('boyfriend')
	triggerEvent('Set GF Speed', 2, '');
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if getProperty('health') > 1 then

    setProperty('health', 1);

	end
end

beatHitFuncs = {
	[140] = function() 
		setProperty('dad.visible', false);
		addLuaSprite('switch', true);
	end,
	[144] = function()
		setProperty('dad.visible', true);
		removeLuaSprite('switch');
	end,
	[268] = function()
		setProperty('dad.visible', false);
		addLuaSprite('switch2', true);
	end,
	[272] = function()
		setProperty('dad.visible', true);
		removeLuaSprite('switch2');
	end,
}



function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
	end
end


stepHitFuncs = {
	[1] = function()
		addLuaSprite('switch', false)
	end,
	[2] = function()
		removeLuaSprite('switch', false)
	end,
	[694] = function()
		setProperty('gf.visible', false);
		addLuaSprite('pardonUs', false);
	end,
	[704] = function()
		setProperty('gf.visible', true);
		removeLuaSprite('pardonUs');
	end,
	[1362] = function()
		setProperty('boyfriend.visible', false);
		addLuaSprite('groomH', false);
	end,
}

function onStepHit()

	if stepHitFuncs[curStep] then 
		stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
	end 

end