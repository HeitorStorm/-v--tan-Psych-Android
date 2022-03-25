
function onStartCountdown()
	if difficulty < 2 then
		function onStepHit()
		setScore(0)
		setRatingPercent(0)
		setProperty('health', 2);
		end
	makeLuaSprite('casual', 'V/fucking-casual/bg', -0,0)
	makeAnimatedLuaSprite('dumbass', 'V/fucking-casual/hard', 750, 550)
	luaSpriteAddAnimationByPrefix('dumbass', 'stoopid', 'hard', 24, true)
	setLuaSpriteScrollFactor('casual', 0, 0)
	setLuaSpriteScrollFactor('dumbass', 0, 0)
	addLuaSprite('casual', true);
	addLuaSprite('dumbass', false)
	setObjectCamera('casual', 'other')
	setObjectCamera('dumbass', 'other')
	setObjectOrder('casual', 1)
	setObjectOrder('dumbass', 2)
	end
end
