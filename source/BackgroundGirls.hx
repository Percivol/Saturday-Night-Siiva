package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BackgroundGirls extends FlxSprite
{
	public function new(x:Float, y:Float, theStage)
	{
		super(x, y);

		// BG fangirls dissuaded
		var temp = 'weeb/bgFreaks';
		switch (theStage)
		{
		    case 'school-hypnospace':
		        temp = 'weeb/bgHypnoFreaks';
		    case 'school-terraria':
		        temp = 'weeb/trFreaks';
		    default:
		        temp = 'weeb/bgFreaks';
		}
        frames = Paths.getSparrowAtlas(temp);

		animation.addByIndices('danceLeft', 'BG girls group', CoolUtil.numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG girls group', CoolUtil.numberArray(30, 15), "", 24, false);

		animation.play('danceLeft');
	}

	var danceDir:Bool = false;

	public function getScared():Void
	{
		animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(30, 15), "", 24, false);
		dance();
	}

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}
