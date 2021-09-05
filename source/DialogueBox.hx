package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitMiddle:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai' | 'senpai beta mix' | 'senpai in game ver':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'lunchbox':
				FlxG.sound.playMusic(Paths.music('LunchboxPhone'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'lunchbox in game ver':
				FlxG.sound.playMusic(Paths.music('LunchboxWasher'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns beta mix':
				FlxG.sound.playMusic(Paths.music('LunchboxGiygas'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		var gaming:Bool = PlayState.SONG.song.toLowerCase() != 'lo-fight' && PlayState.SONG.song.toLowerCase() != 'overhead' && PlayState.SONG.song.toLowerCase() != 'ballistic';


		if (gaming)
			{
				bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
				bgFade.scrollFactor.set();
				bgFade.alpha = 0;
				add(bgFade);

                if (PlayState.SONG.song.toLowerCase() == 'wocky')
                {
                    new FlxTimer().start(0.2, function(tmr:FlxTimer)
                    {
                                bgFade.alpha = .5;
                                bgFade.alpha += (.05);
                                if (bgFade.alpha > 0.7)
                                bgFade.alpha = 0.7;
                    }, 5);
                }else{
                    new FlxTimer().start(0.83, function(tmr:FlxTimer)
                        {
                            bgFade.alpha += (1 / 5) * 0.7;
                            if (bgFade.alpha > 0.7)
                                bgFade.alpha = 0.7;
                        }, 5);
				}
			}
			else
				{
					bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), FlxColor.GRAY);
					bgFade.scrollFactor.set();
					bgFade.alpha = 0;
					add(bgFade);

					new FlxTimer().start(0.83, function(tmr:FlxTimer)
						{
							bgFade.alpha += (1 / 5) * 0.7;
							if (bgFade.alpha > 0.7)
								bgFade.alpha = 0.7;
						}, 5);
				}

			box = new FlxSprite(-20, 45);

			var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'wocky':
				hasDialog = true;
			    box = new FlxSprite(0, 0);
				box.frames = Paths.getSparrowAtlas('kapi/dialogueBox-kapi');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'senpai' | 'senpai beta mix':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'lunchbox' | 'lunchbox in game ver':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'senpai in game ver':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-enforcer');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiDaft');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);
			case 'roses beta mix':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-smithMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);
			case 'roses itch io build':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'roses ost ver':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('SKELETRON_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-skeletron');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);

			case 'thorns beta mix':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-giygas');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/giygasFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			case 'lo-fight' | 'overhead' | 'ballistic':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
				box.antialiasing = true;
		}

		box.animation.play('normalOpen');
		if (gaming)
		    if (PlayState.SONG.song.toLowerCase() == 'wocky'){
		        box.setGraphicSize(Std.int(box.width * 1));
		    }else{
			    box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
			}
		else
			{
				box.y = FlxG.height - 285;
				box.x = 20;
			}

		box.updateHitbox();

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;

		if (gaming)
			{
                switch (PlayState.SONG.song.toLowerCase())
                {
                    case 'lunchbox' | 'senpai' | 'senpai beta mix' | 'roses itch io build' | 'thorns' | 'thorns beta mix' | 'roses beta mix':
                        portraitLeft = new FlxSprite(-20, 40);
                        portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
                        portraitRight = new FlxSprite(0, 40);
                        portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');

                    case 'senpai in game ver':
                        portraitLeft = new FlxSprite(-20, 40);
                        portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiSkullPortrait');
                        portraitRight = new FlxSprite(0, 40);
                        portraitRight.frames = Paths.getSparrowAtlas('weeb/bfEnforcerPortrait');

                    case 'roses':
                        portraitLeft = new FlxSprite(-20, 40);
                        portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
                        portraitRight = new FlxSprite(0, 40);
                        portraitRight.frames = Paths.getSparrowAtlas('weeb/bfDaftPortrait');

                    case 'roses ost ver':
                        portraitLeft = new FlxSprite(-20, 40);
                        portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
                        portraitRight = new FlxSprite(0, 40);
                        portraitRight.frames = Paths.getSparrowAtlas('weeb/trPortrait');

                    case 'lunchbox in game ver':
                        portraitLeft = new FlxSprite(-20, 40);
                        portraitLeft.frames = Paths.getSparrowAtlas('weeb/washerPortrait');
                        portraitRight = new FlxSprite(0, 40);
                        portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');

                    case 'wocky':
                        portraitLeft = new FlxSprite(0, 160);
                        portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapi');
		                portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 1));
                        portraitRight = new FlxSprite(700, 145);
                        portraitRight.frames = Paths.getSparrowAtlas('kapi/bf');
		                portraitRight.setGraphicSize(Std.int(portraitRight.width * 1));

                }
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		        if (PlayState.SONG.song.toLowerCase() != 'wocky'){
				    portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				}
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

				portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		        if (PlayState.SONG.song.toLowerCase() != 'wocky'){
				    portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
				}
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;

                portraitMiddle = new FlxSprite(350, 90);
                portraitMiddle.frames = Paths.getSparrowAtlas('kapi/gf');
                portraitMiddle.animation.addByPrefix('enter', 'Girlfriend portrait enter', 24, false);
                portraitMiddle.setGraphicSize(Std.int(portraitRight.width * 1));
                portraitMiddle.updateHitbox();
                portraitMiddle.scrollFactor.set();
                add(portraitMiddle);
                portraitMiddle.visible = false;
			}
			else
			{
					portraitLeft = new FlxSprite(200, FlxG.height - 525);
					portraitLeft.frames = Paths.getSparrowAtlas('whittyPort');


					switch(PlayState.SONG.song.toLowerCase())
					{
						case 'lo-fight':
							portraitLeft.animation.addByPrefix('enter', 'Whitty Portrait Normal', 24, false);
						case 'overhead':
							portraitLeft.animation.addByPrefix('enter', 'Whitty Portrait Agitated', 24, false);
						case 'ballistic':
							portraitLeft.animation.addByPrefix('enter', 'Whitty Portrait Crazy', 24, true);
					}

					portraitLeft.antialiasing = true;
					portraitLeft.updateHitbox();
					portraitLeft.scrollFactor.set();
					add(portraitLeft);
					portraitLeft.visible = false;

					portraitRight = new FlxSprite(800, FlxG.height - 489);

					switch(PlayState.SONG.song.toLowerCase())
					{
						case 'ballistic':
                            portraitRight.frames = Paths.getSparrowAtlas('boyfriendPortMouse');
                        default:
                            portraitRight.frames = Paths.getSparrowAtlas('boyfriendPort');
                    }

					portraitRight.animation.addByPrefix('enter', 'BF portrait enter', 24, true);
					portraitRight.antialiasing = true;
					portraitRight.updateHitbox();
					portraitRight.scrollFactor.set();
					add(portraitRight);
					portraitRight.visible = false;

                    portraitMiddle = new FlxSprite(350, 90);
                    portraitMiddle.frames = Paths.getSparrowAtlas('kapi/gf');
                    portraitMiddle.animation.addByPrefix('enter', 'Girlfriend portrait enter', 24, false);
                    portraitMiddle.setGraphicSize(Std.int(portraitRight.width * 1));
                    portraitMiddle.updateHitbox();
                    portraitMiddle.scrollFactor.set();
                    add(portraitMiddle);
                    portraitMiddle.visible = false;

					portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
					portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.8));
			}



		add(box);

		box.screenCenter(X);
		if (gaming && PlayState.SONG.song.toLowerCase() != 'wocky')
		    portraitLeft.screenCenter(X);



		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		if (gaming){
		    if (PlayState.SONG.song.toLowerCase() == 'wocky'){
                dropText = new FlxText(185, 500, Std.int(FlxG.width * 1), "", 48);
                dropText.font = 'Delfino';
                dropText.color = 0x00000000;
		    }else{
                dropText.font = 'Pixel Arial 11 Bold';
                dropText.color = 0xFFD89494;
            }
		}
		else
		{
		    dropText.font = 'VCR OSD Mono';
			dropText.color = FlxColor.RED;
			dropText.antialiasing = true;
		}
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		if (gaming){
		    if (PlayState.SONG.song.toLowerCase() == 'wocky'){
                swagDialogue = new FlxTypeText(182, 497, Std.int(FlxG.width * 1), "", 48);
                swagDialogue.font = 'Delfino';
                swagDialogue.color = 0xFFFFFFFF;
		    }else{
                swagDialogue.font = 'Pixel Arial 11 Bold';
                swagDialogue.color = 0xFF3F2021;
            }
		}
		else
		{
		    swagDialogue.font = 'VCR OSD Mono';
			swagDialogue.color = FlxColor.BLACK;
			swagDialogue.antialiasing = true;
		}

		if (PlayState.SONG.song.toLowerCase() != 'lo-fight' && PlayState.SONG.song.toLowerCase() != 'overhead')
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		else if (PlayState.SONG.song.toLowerCase() == 'ballistic')
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('ballistic', 'shared'), 0.6)];
		else if (PlayState.SONG.song.toLowerCase() == 'wocky')
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('kapiText', 'shared'), 0.6)];
		else
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('whitty', 'shared'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);

		this.dialogueList = dialogueList;
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'roses beta mix')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'roses itch io build')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'roses ost ver')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
			portraitLeft.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() == 'thorns beta mix')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
			portraitLeft.visible = false;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY)
		{
			remove(dialogue);

			if (PlayState.SONG.song.toLowerCase() != 'wocky'){
			    FlxG.sound.play(Paths.sound('clickText'), 0.8);
			}else{
			    FlxG.sound.play(Paths.sound('clickKapi'), 0.8);
			}

			if (dialogueList[1] == null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						portraitMiddle.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');

					if (PlayState.SONG.song.toLowerCase() == 'ballistic')
						swagDialogue.sounds =  [FlxG.sound.load(Paths.sound('ballistic', 'shared'), 0.6)];
					else if (PlayState.SONG.song.toLowerCase() == 'lo-fight' || PlayState.SONG.song.toLowerCase() == 'overhead')
						swagDialogue.sounds =  [FlxG.sound.load(Paths.sound('whitty', 'shared'), 0.6)];
				}
			case 'kapii':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapi');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
					swagDialogue.sounds =  [FlxG.sound.load(Paths.sound('kapiText', 'shared'), 0.6)];
				}
			case 'kapimad':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapimad');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'kapiconfused':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapiconfused');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'kapicute':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapicute');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'kapistare':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/kapistare');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'wap':
				portraitRight.visible = false;
				portraitMiddle.visible = false;
				portraitLeft.frames = Paths.getSparrowAtlas('kapi/wap');
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				portraitMiddle.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					trace('bf pog!!!');
					portraitRight.animation.play('enter');
					if (PlayState.SONG.song.toLowerCase() != 'wocky')
					    swagDialogue.sounds =  [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				}
			case 'bfwhat':
				portraitLeft.visible = false;
				portraitMiddle.visible = false;
				portraitRight.frames = Paths.getSparrowAtlas('kapi/bfwhat');
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'bftalk':
				portraitLeft.visible = false;
				portraitMiddle.visible = false;
				portraitRight.frames = Paths.getSparrowAtlas('kapi/bftalk');
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'gf':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('kapi/gf');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}
			case 'gfwave':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('kapi/gfwave');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}
			case 'gflaugh':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitMiddle.frames = Paths.getSparrowAtlas('kapi/gflaugh');
				if (!portraitMiddle.visible)
				{
					portraitMiddle.visible = true;
					portraitMiddle.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
