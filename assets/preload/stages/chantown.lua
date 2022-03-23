function onCreate()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-v');

	--general stage
	makeLuaSprite('whitebg', 'V/whitebg', -375,-113)
	makeLuaSprite('mountains', 'V/mountains', -325,27)
	makeLuaSprite('houses', 'V/homes', -275,64)
	makeLuaSprite('ground', 'V/ground', -300,550)
	
	setScrollFactor('mountains', 0.4, 0.4)
	setScrollFactor('houses', 0.6, 0.6)
	
	addLuaSprite('whitebg', false)
	addLuaSprite('mountains', false)
	addLuaSprite('houses', false)
	addLuaSprite('ground', false);
	
	--bg people --
	
	makeAnimatedLuaSprite('ball', 'V/moot', 406, -75)
		addAnimationByPrefix('ball', 'idle', 'fakemoot', 24, false)
	makeAnimatedLuaSprite('ball', 'V/moot', 406, -75)
		addAnimationByPrefix('ball', 'idle', 'fakemoot', 24, false)
	makeAnimatedLuaSprite('yot', 'V/yotsuba', 600, 320)
		addAnimationByPrefix('yot', 'yotdo1', 'Ysitting0', 24, true)
		addAnimationByPrefix('yot', 'yotdo2', 'Ysitting2', 24, false)
		addAnimationByPrefix('yot', 'yotdo3', 'Ystanding', 24, false)
		addAnimationByPrefix('yot', 'yotdo4', 'Ysleeping', 24, true)
		addAnimationByPrefix('yot', 'yotdo5', 'ygrave', 24, true)
	makeAnimatedLuaSprite('nig', 'V/nigger', 145,296)
		addAnimationByPrefix('nig', 'dontlook', 'nonigger', 24, false)
		addAnimationByPrefix('nig', 'look', 'nigger', 24, false)
	makeAnimatedLuaSprite('xtan', 'V/xtan', 980,260)
		addAnimationByPrefix('xtan', 'peeking', 'xtans', 24, false)
	makeAnimatedLuaSprite('trv', 'V/trv', 232,-280)
		addAnimationByPrefix('trv', 'walking', 'trv', 24, false)
	
	
	scaleLuaSprite('yot', 0.85, 0.85)
	scaleLuaSprite('xtan', 0.82, 0.82)
	scaleLuaSprite('trv', 0.8, 0.8)
		
	setScrollFactor('ball', 0.5, 0.5)
	setScrollFactor('yot', 0.62, 0.62)
	setScrollFactor('nig', 0.6, 0.6)
	setScrollFactor('xtan', 0.62, 0.62)
	setScrollFactor('trv', 0.62, 0.62)
	
	addLuaSprite('yot', false)
	addLuaSprite('ball', false)
	
	--layering--
	
	setObjectOrder('whitebg', 1)
	setObjectOrder('trv', 2)
	setObjectOrder('mountains', 3)
	setObjectOrder('ball', 4)
	setObjectOrder('houses', 5)
	setObjectOrder('yot', 6)
	setObjectOrder('nig', 7)
	setObjectOrder('xtan', 8)
	setObjectOrder('ground', 9)
	setObjectOrder('gfGroup', 10)
	setObjectOrder('dadGroup', 11)
	setObjectOrder('boyfriendGroup', 12)
	
  end
 
function onBeatHit()
	objectPlayAnimation('ball', 'idle', true);
end