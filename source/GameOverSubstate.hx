package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var camFollow:FlxObject;

	var stageSuffix:String = "";

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.curStage;
		var daBf:String = '';
		switch (PlayState.SONG.player1)
		{
			case 'bf-pixel':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';
			case 'bf-terrarian':
				stageSuffix = '-terra';
				daBf = 'bf-terrarian-dead';
			case 'bf-daft':
				stageSuffix = '-pixel';
				daBf = 'bf-daft-dead';
			case 'bf-penguin':
				stageSuffix = '-pixel';
				daBf = 'bf-penguin-dead';
			case 'bf-robot':
				stageSuffix = '-pixel';
				daBf = 'bf-robot-dead';
			case 'bf-enforcer':
				stageSuffix = '-pixel';
				daBf = 'bf-enforcer-dead';
			case 'bf-crew':
				daBf = 'bf-crew';
			case 'bf-phone':
				stageSuffix = '-phone';
				daBf = 'bf-phone';
			case 'bf-gramps':
				daBf = 'bf-gramps';
			case 'bf-link':
				daBf = 'bf-link';
			case 'bf-mouse':
				daBf = 'bf-mouse';
			case 'bf-mouse2':
				daBf = 'bf-mouse';
			case 'bf-quote':
				stageSuffix = '-cave';
				daBf = 'bf-quote';
			case 'bf-vitas':
				daBf = 'bf-vitas';
			case 'bf-kapi':
				daBf = 'bf-kapi';
			case 'bf-diddy-car':
				daBf = 'bf-diddy-car';
			case 'bf-back':
				daBf = 'bf-back';
			case 'bf-barkley':
				stageSuffix = '-slam';
				daBf = 'bf-barkley';
			case 'bf-kong':
				daBf = 'bf-kong';
			case 'bf-klk':
				daBf = 'bf-klk';
			case 'bf-mcgroove':
				daBf = 'bf-mcgroove';
			case 'bf-the-creator':
				daBf = 'bf-the-creator';
			default:
				daBf = 'bf';
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);
        if (PlayState.SONG.song.toLowerCase() == 'wocky'){
		    camFollow = new FlxObject(bf.getGraphicMidpoint().x + 365, bf.getGraphicMidpoint().y + 300, 1, 1);
		}else{
		    camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		}
		add(camFollow);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));
		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		bf.playAnim('firstDeath');
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
			PlayState.loadRep = false;
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix));
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
	}

	override function beatHit()
	{
		super.beatHit();

		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music('gameOverEnd' + stageSuffix));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
