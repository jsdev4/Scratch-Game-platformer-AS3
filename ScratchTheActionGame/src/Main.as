package
{
	
	import net.flashpunk.FP;
	import net.flashpunk.Engine;
	
	/**
	 * ...
	 * @author Juan
	 */
	[SWF(width="480",height="320")]
	public class Main extends Engine
	{
		
		public function Main() 
		{
			super(480, 320, 30, false);
			FP.world = new GameWorld();
		}
	}
}