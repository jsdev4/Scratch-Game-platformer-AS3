package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Juan
	 */
	public class RightWall extends Entity
	{
		[Embed(source = "right_wall1.png")] private const RWALL:Class;
		private var rwall:Image;
		[Embed(source = "MEOW2.mp3")]
		private const MEOW:Class;
		private var meow:Sfx;
		
		public function RightWall(px:Number = 0,py:Number=0) 
		{
			rwall = new Image(RWALL);
			super(px, py, rwall);
			setHitbox(x, y);
			mask = new Pixelmask(RWALL);
			type = "rightWall";
			meow = new Sfx(MEOW);
		}
		override public function update():void
		{
			var collidable:Entity = this.collide( "Player", this.x, this.y);
		
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				tempPlayer.x = this.x - tempPlayer.width;
				FP.world.camera.x -= 50 * FP.elapsed;
				meow.play();
			}
			super.update();
		}
	}
}