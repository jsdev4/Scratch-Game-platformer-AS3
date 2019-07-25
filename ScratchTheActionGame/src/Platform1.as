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
	public class Platform1 extends Entity
	{
		[Embed(source = "platform_01.png")]
		private const PLATF1:Class;
		private var platform1:Image;
		private var hit:Boolean;
		private var platform_counter:int;
		public function Platform1(px:Number=0,py:Number=0) 
		{
			platform1 = new Image(PLATF1);
			mask = new Pixelmask(PLATF1);
			type = "platform";
			platform_counter = 0;
			super(px, py, platform1);
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			var tempPlayer:Player = collidable as Player;
			if (collidable&&this.y > tempPlayer.y)
			{
				tempPlayer.y = this.y -tempPlayer.height;
				hit = true;
				platform_counter++;
			}
			if (collidable && this.y < tempPlayer.y)
			{
				tempPlayer.die();
			}
			if (hit == true)
			{
				y += 80 * FP.elapsed;
			}
			super.update();
		}
	}
}