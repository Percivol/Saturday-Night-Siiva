package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-barkley', [80, 81], 0, false, isPlayer);
		animation.add('bf-klk', [84, 85], 0, false, isPlayer);
		animation.add('bf-link', [77, 78], 0, false, isPlayer);
		animation.add('bf-phone', [0, 1], 0, false, isPlayer);
		animation.add('bf-kapi', [0, 1], 0, false, isPlayer);
		animation.add('bf-quote', [58, 59], 0, false, isPlayer);
		animation.add('bf-mcgroove', [0, 1], 0, false, isPlayer);
		animation.add('bf-crew', [30, 31], 0, false, isPlayer);
		animation.add('bf-mouse', [65, 66], 0, false, isPlayer);
		animation.add('bf-mouse2', [65, 66], 0, false, isPlayer);
		animation.add('bf-cauldron', [0, 1], 0, false, isPlayer);
		animation.add('bf-deez', [0, 1], 0, false, isPlayer);
		animation.add('bf-the-creator', [40, 41], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-diddy-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('bf-terrarian', [70, 70], 0, false, isPlayer);
		animation.add('bf-robot', [56, 56], 0, false, isPlayer);
		animation.add('bf-enforcer', [57, 57], 0, false, isPlayer);
		animation.add('bf-penguin', [21, 21], 0, false, isPlayer);
		animation.add('bf-daft', [46, 46], 0, false, isPlayer);
		animation.add('bf-old', [0, 1], 0, false, isPlayer);
		animation.add('bf-back', [0, 1], 0, false, isPlayer);
		animation.add('bf-gramps', [0, 1], 0, false, isPlayer);
		animation.add('bf-kong', [0, 1], 0, false, isPlayer);
		animation.add('bf-vitas', [0, 1], 0, false, isPlayer);
		animation.add('pixel-bf', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('spooky-ball', [82, 83], 0, false, isPlayer);
		animation.add('spooky-bomberman', [34, 35], 0, false, isPlayer);
		animation.add('spooky-gambino', [50, 51], 0, false, isPlayer);
		animation.add('spooky-tetris', [54, 55], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('pico-wrld', [75, 76], 0, false, isPlayer);
		animation.add('pico-mario', [14, 15], 0, false, isPlayer);
		animation.add('pico-igor', [44, 45], 0, false, isPlayer);
		animation.add('pico-gramps', [38, 39], 0, false, isPlayer);
		animation.add('pico-fetty', [26, 27], 0, false, isPlayer);
		animation.add('pico-back', [4, 5], 0, false, isPlayer);
		animation.add('pico-homestuck', [28, 29], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('mom-klk', [86, 87], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('dad-king', [69, 79], 0, false, isPlayer);
		animation.add('kapi', [73, 74], 0, false, isPlayer);
		animation.add('dad-sus', [32, 33], 0, false, isPlayer);
		animation.add('dad-dub', [67, 68], 0, false, isPlayer);
		animation.add('dad-chungus', [42, 43], 0, false, isPlayer);
		animation.add('dad-bus', [36, 37], 0, false, isPlayer);
		animation.add('dad-empty', [21, 21], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-washer', [88, 88], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('skeletron', [71, 71], 0, false, isPlayer);
		animation.add('senpai-daft', [47, 47], 0, false, isPlayer);
		animation.add('senpai-smith', [52, 52], 0, false, isPlayer);
		animation.add('senpai-enforcer', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [49, 49], 0, false, isPlayer);
		animation.add('spirit-penguin', [49, 49], 0, false, isPlayer);
		animation.add('spirit-giygas', [53, 53], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-klk', [16], 0, false, isPlayer);
		animation.add('gf-zelda', [16], 0, false, isPlayer);
		animation.add('gf-kapi', [16], 0, false, isPlayer);
		animation.add('gf-yankin', [48], 0, false, isPlayer);
		animation.add('gf-curly', [60], 0, false, isPlayer);
		animation.add('gf-opponent', [16], 0, false, isPlayer);
		animation.add('gf-phone', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('gf-guide', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.add('whitty', [61, 62], 0, false, isPlayer);
		animation.add('whitty-mars', [61, 62], 0, false, isPlayer);
		animation.add('whittyCrazy', [63, 64], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
