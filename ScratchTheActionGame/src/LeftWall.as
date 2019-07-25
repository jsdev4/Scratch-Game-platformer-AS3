package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Acid
	 */
	public class LeftWall extends Entity
	{
		[Embed(source="left_wall1.png")]
		private const ENEMY_IMG:Class;
		private var enemyImg:Image;		
		
		[Embed(source = "MEOW2.mp3")]
		private const MEOW:Class;
		private var meow:Sfx;
		
		public function LeftWall(px:Number = 0, py:Number = 0)
		{
			enemyImg = new Image(ENEMY_IMG);
			meow = new Sfx(MEOW);
			mask = new Pixelmask(ENEMY_IMG);
			type = "Enemy";
			super(px, py, enemyImg);
		}
		
		override public function update():void
		{			

			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				//tempPlayer.die();
				tempPlayer.x = this.x + this.width;
				FP.world.camera.x += 50 * FP.elapsed;
				meow.play();
			}
		}
	}
}