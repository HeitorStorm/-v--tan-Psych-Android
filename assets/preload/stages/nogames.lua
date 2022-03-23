function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfzord');
	makeLuaSprite('bg', 'zord/bg', -310, 230)
	makeAnimatedLuaSprite('zordhand', 'characters/zordhand', -70, 322);
	addAnimationByPrefix('zordhand', 'idle', 'handidle', 24, false);
	addAnimationByPrefix('zordhand', 'singUP', 'handup', 24, false);
	addAnimationByPrefix('zordhand', 'singLEFT', 'handleft', 24, false);
	addAnimationByPrefix('zordhand', 'singRIGHT', 'handright', 24, false);
	addAnimationByPrefix('zordhand', 'singDOWN', 'handdown', 24, false);
	addAnimationByPrefix('zordhand', 'singDOWNalt', 'althanddown', 24, false);
	addAnimationByPrefix('zordhand', 'singUPalt', 'althandup', 24, false);
	addAnimationByPrefix('zordhand', 'singLEFTalt', 'althandleft', 24, false);
	addAnimationByPrefix('zordhand', 'singRIGHTalt', 'althandright', 24, false);
	addAnimationByPrefix('zordhand', 'singDOWNalt', 'althanddown', 24, false);
	addLuaSprite('bg', false);
	addLuaSprite('zordhand', true)
	setObjectOrder('dadGroup', 1)
	setObjectOrder('zordhand', 2)
	setObjectOrder('boyfriendGroup', 4)
	
end
singList = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
singListalt = {"singLEFTalt", "singDOWNalt", "singUPalt", "singRIGHTalt"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
doTweenZoom('zordeffect', 'camGame', 1.18, 0.01, 'backIn')
triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
    local direction = direction + 1; -- Lua counts from 1, not 0
	if curBeat < 335 then
	objectPlayAnimation('zordhand', singList[direction], true)
	setProperty('boyfriend.visible', false)
	elseif curBeat > 391 then
	objectPlayAnimation('zordhand', singList[direction], true)
	setProperty('boyfriend.visible', false)
    elseif curBeat > 335 then
	objectPlayAnimation('zordhand', singListalt[direction], true)
	elseif curBeat < 391 then
	objectPlayAnimation('zordhand', singListalt[direction], true)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
setProperty('boyfriend.visible', true)
doTweenZoom('zordeffect2', 'camGame', 1.1, 0.01, 'backOut')
if curBeat < 335 then
objectPlayAnimation('zordhand', 'idle', false)
elseif curBeat > 391 then
objectPlayAnimation('zordhand', 'idle', false)
end
end
function noteMiss(id, direction, noteType, isSustainNote)
setProperty('boyfriend.visible', true)
if curBeat < 335 then
objectPlayAnimation('zordhand', 'idle', false)
elseif curBeat > 391 then
objectPlayAnimation('zordhand', 'idle', false)
end
end
