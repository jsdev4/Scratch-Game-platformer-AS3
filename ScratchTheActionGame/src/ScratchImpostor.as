package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Juan
	 */
	public class ScratchImpostor extends Entity
	{
		[Embed(source = "player_sprite_map.png")]
		private const IMPOSTOR:Class;
		private var imp:Spritemap;
		private var direcc:int;
		[Embed(source = "MEOW2.mp3")]
		private const MEOW:Class;
		private var meow:Sfx;
		
		
		public function ScratchImpostor(px:Number = 0,py:Number=0,dir:int=0) 
		{
			imp = new Spritemap(IMPOSTOR, 36, 40);
			imp.add("flying",[4], 30, false);
			imp.play("flying");
			imp.color = 0x000000;
			direcc = dir;
			mask = new Pixelmask(IMPOSTOR);
			type = "impostor";
			meow = new Sfx(MEOW);
			super(px, py, imp);
		}
		
		override public function update():void
		{
			if (direcc == 0)
			{
				imp.flipped = true;
				x -= 100 * FP.elapsed;
			}
			if (direcc == 1)
			{
				imp.flipped =false;
				x += 100 * FP.elapsed;
			}
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				FP.world = new GameWorld();
				meow.play();
			}
			
			super.update();
		}
		
	}

}