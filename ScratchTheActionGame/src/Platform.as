package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Juan
	 */
	public class Platform extends Entity
	{
		[Embed(source = "platform_00.png")]
		private const PLATF0:Class;
		private var platform:Image;
		public function Platform(px:Number=0,py:Number=0) 
		{	
				platform = new Image(PLATF0);
				mask = new Pixelmask(PLATF0);
			type = "platform";

			super(px, py, platform);
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			var tempPlayer:Player = collidable as Player;
			if (collidable&&this.y > tempPlayer.y)
			{
				tempPlayer.y = this.y -tempPlayer.height;		
			}
			if (collidable && this.y < tempPlayer.y)
			{			
				tempPlayer.die();
			}
			super.update();		
		}
	}
}