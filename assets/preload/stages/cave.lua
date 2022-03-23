function onCreate()
	setProperty('gfGroup.visible', false);
	makeLuaSprite('bg', 'V/birthday/bg', -590, -300)
	makeLuaSprite('F', 'V/birthday/sad', 50,850)
		setScrollFactor('F', 1.1, 1.1)
	addLuaSprite('F', true)
	addLuaSprite('bg', false);

  end