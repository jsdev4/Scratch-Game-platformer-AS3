package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
		import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Juan
	 */
	public class Computer extends Entity
	{
		[Embed(source = "computer.png")]
		private const PC:Class;
		private var pc:Image;
		public var game_finished:Boolean;
		private var time_counter:Number;
		public function Computer(px:Number=0,py:Number=0) 
		{
			game_finished = false;
			pc = new Image(PC);
			mask = new Pixelmask(PC);
			type = "pc";
			super(px, py, pc);
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			var tempPlayer:Player = collidable as Player;
			if (collidable&&this.y > tempPlayer.y)
			{	
				if (Input.check(Key.ENTER))
				{
					FP.world.recycle(this);
					game_finished = true;
				}	
				if (game_finished==true)
				{
					FP.world = new GameWorld();
				}
			}
			super.update();
		}
	}
}