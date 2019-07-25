package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;

	public class Player extends Entity
	{
		[Embed(source="player.png")]
		private const PLAYER_IMG:Class;
		[Embed(source = "player_sprite_map.png")]
		private const PLAYER:Class;
		private var player_sprite:Spritemap;
		private var gravity:Number;
		public var jumping:Boolean;
		public var on_air:Boolean;
		private var can_jump:Boolean;
		[Embed(source = "MEOW2.mp3")]
		private const MEOW:Class;
		private var meow:Sfx;
		private var time_for_jump:Number;
		private var time_to_jump:Number;
		
		public function Player(px:Number = 0, py:Number = 0)
		{
			time_to_jump = 0;
			time_for_jump = 0;
			player_sprite = new Spritemap(PLAYER, 36, 40);
			player_sprite.add("standby", [0], 30, false);
			player_sprite.add("running", [1, 2, 3], 30, true);
			player_sprite.add("jumping", [4], 30, false);
			player_sprite.add("death", [5], 30, true);
			mask = new  Pixelmask(PLAYER_IMG);
			gravity = 100;
			can_jump = true;
			meow = new Sfx(MEOW);
			super(px, py, player_sprite);
			type = "Player";
			player_sprite.play("standby");
		}
		
		override public function update():void
		{
			
			if (jumping == false)
			{
				y += gravity * FP.elapsed;
			
			}
			if (Input.check(Key.RIGHT))
			{
				player_sprite.flipped = false;
				player_sprite.play("running");
				
				if ((this.x + this.getWidth()) < FP.screen.width)					
				{	x += 200 * FP.elapsed;
					FP.world.camera.x += 50 * FP.elapsed;
				}
				else
				{
					this.x = FP.screen.width - this.getWidth();
				}
			}
			else if (Input.check(Key.LEFT))
			{	player_sprite.flipped = true;
				player_sprite.play("running");
				FP.world.camera.x -= 50 * FP.elapsed;
			
				if (this.x > 0)			
				{
					x -= 300 * FP.elapsed;
				}
				else
				{
					this.x = 0;
				}
			}	
			if (Input.released(Key.RIGHT)||Input.released(Key.LEFT))
			{
				player_sprite.play("standby");
			}
			
			if(can_jump==true){if(Input.pressed(Key.SPACE))
			{
				jumping = true;
				player_sprite.play("jumping");
				meow.play();
				can_jump = false;
			}
			}
			if (Input.released(Key.SPACE)||Input.check(Key.UP))
			{
				player_sprite.play("standby");
			}	
			
			if (Input.check(Key.DOWN))
			{
				player_sprite.play("death");
			}
			
			if (jumping == true)
			{time_for_jump += FP.elapsed;
				y -= 900 * FP.elapsed;
			}
			if (time_for_jump >= 0.1)
			{
				jumping = false;
				time_for_jump -= 0.1;
			}
			if (can_jump == false)
			{
				time_to_jump += FP.elapsed;
			}
			if (time_to_jump >= 0.5)
			{
				can_jump = true;
				time_to_jump -= 0.5;
			}
			
			if (player_sprite.currentAnim == "death" && player_sprite.complete)
				{
					FP.world = new GameWorld();
				}
			super.update();
		}
		
		public function getWidth():Number
		{
			return (player_sprite.width / player_sprite.columns);
		}
		
		public function getHeight():Number
		{
			return (player_sprite.height / player_sprite.rows);
		}
		
		public function die():void
		{
			player_sprite.play("death");
		}
	}
}