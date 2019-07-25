package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Juan
	 */
	public class Npc extends Entity
	{
		[Embed(source = "plant_npc.png")] 
		private const NPC:Class;
		private var npc:Spritemap;
		
		public function Npc(px:Number=0,py:Number=0) 
		{
			npc = new Spritemap(NPC, 40, 40);
			npc.add("standby", [0, 1], 3, true);
			npc.play("standby");
			super(px, py, npc);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}