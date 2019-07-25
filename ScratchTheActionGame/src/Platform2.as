package 
{import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Juan
	 */
	public class Platform2 extends Entity
	{
		[Embed(source = "platform_02.png")]
		private const PLATF2:Class;
		private var platform2:Image;

		public function Platform2(px:Number=0,py:Number=0) 
		{	
			platform2 = new Image(PLATF2);
			mask = new Pixelmask(PLATF2);
			type = "platform";
			super(px, py, platform2);
		}
		override public function update():void
		{
			x += 40 * FP.elapsed;
			var collidable:Entity = this.collide("Player", this.x, this.y);
			var tempPlayer:Player = collidable as Player;
			if (collidable&&this.y > tempPlayer.y)
			{
				tempPlayer.y = this.y -tempPlayer.height;
				tempPlayer.x += 40 * FP.elapsed;
			}
			if (collidable && this.y < tempPlayer.y)
			{
				tempPlayer.die();
			}
			super.update();			
		}		
	}
}