function onCreate()
	-- Sprites
	makeLuaSprite('sneedbg', 'simpson/bg', -131,-55)
	makeLuaSprite('sneeds', 'simpson/dabuilding', -82,-85)

	-- Properties
	setObjectOrder('dadGroup', 2)
	setScrollFactor('sneedbg', 0.8, 0.8);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'homoomor');
	
	-- Adding
	addLuaSprite('sneedbg', false);
	addLuaSprite('sneeds', false);
	
	close(true);
end