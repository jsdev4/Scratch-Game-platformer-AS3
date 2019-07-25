package 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class GameWorld extends World
	{
		public var back:Background;
		private var ground_:Ground;
		private var left_wall:LeftWall;
		private var right_wall:RightWall;
		protected var player:Player;
		private var platform_:Platform;
		private var platform_1:Platform;
		private var platform_2:Platform;
		private var platform_3:Platform;
		private var platform_4:Platform1;
		private var platform_5:Platform1;
		private var platform_6:Platform1;
		private var platform_7:Platform1;
		
		private var platform_8:Platform;
		private var platform_9:Platform2;
		private var platform_10:Platform2;
		private var platform_11:Platform2;
		private var platform_12:Platform;
		private var computer_:Computer;
		
		private var npc_:Npc;
		private var npc_1:Npc;
		private var impostor_:ScratchImpostor;
		private var impostor_1:ScratchImpostor;
		//posiciones del background
		private var posX:int;
		private var posY:int;
		private var time_counter:Number;
		public function GameWorld() 
		{
			time_counter = 0;
			posX = -30;
			posY =-1060;
			back = new Background(-130,posY);
			ground_ = new Ground(96, 243);
			left_wall = new LeftWall(FP.screen.width - 610, -960);
			right_wall = new RightWall(380, -960);
			player = new Player(FP.screen.width / 2, 202);
			platform_ = new Platform(88, 166);
			platform_1 = new Platform(320, 111);
			platform_2 = new Platform(128, 26);
			platform_3 = new Platform(320, -50);
			
			platform_4 = new Platform1(128, -129);
			platform_5 = new Platform1(210, -199);
			platform_6 = new Platform1(210, -289);
			platform_7 = new Platform1(210, -379);
			platform_8 = new Platform(210, -459);
			platform_9 = new Platform2(-20, -549);
			platform_10 = new Platform2( -90, -649);
			platform_11 = new Platform2( -160, -739);
			platform_12 = new Platform(210, -749);
			computer_ = new Computer(210, -769);
			npc_ = new Npc(140, 202);
			npc_1 = new Npc(325, 71);
			//impostor_ = new ScratchImpostor( -40, -14, 1);
			//impostor_1 = new ScratchImpostor(440, -104,0);
			this.add(back);
			
			this.add(platform_);
			this.add(platform_1);
			this.add(platform_2);
			this.add(platform_3);
			this.add(platform_4);
			this.add(platform_5);
			this.add(platform_6);
			this.add(platform_7);
			this.add(platform_8);
			this.add(platform_9);
			this.add(platform_10);
			this.add(platform_11);
			this.add(platform_12);
			this.add(computer_);
			//this.add(impostor_);
			//this.add(impostor_1);
			this.add(npc_);
			this.add(npc_1);
			
			this.add(ground_);
			this.add(left_wall);
			this.add(right_wall);
			
			this.add(player);
		}
		
		override public function update():void
		{
			time_counter += FP.elapsed;
			FP.world.camera.x = player.x - FP.halfWidth;
			FP.world.camera.y = player.y - FP.halfHeight;
		
			if (time_counter >= 15)
			{
				FP.world = new GameWorld();
			}
			
			
			super.update();
		}
		
	}

}
