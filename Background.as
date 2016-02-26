/**
 * VERSION: 1.0
 * DATE: 15/09/2015
 * ActionScript 3
 * AUTHOR: J. De Smedt
 **/
package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[SWF(frameRate="40", backgroundColor="0x675E6C", width="120", height="120")]
	public class Background extends Sprite
	{
		private var _stageWidth:int;
		private var _stageHeight:int;
		
		public function Background():void
		{
			if(stage)
				initBackground();
			else
				addEventListener(Event.ADDED_TO_STAGE, initBackground);
		}
		
		protected function initBackground(event:Event=null):void
		{
			if(event)
				EventDispatcher(event.target).removeEventListener(event.type, arguments.callee);

			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			stage.addEventListener(Event.RESIZE, ResizePattern);
			
			FillBackground();
			trace("trace from initBackground function");
		}
		private function FillBackground():void
		{
			for(var i:int=0 ;i <= ((Math.round(stage.stageWidth/30)*Math.round(stage.stageHeight/30)));i++)
			{
				addChild(new Pattern(((i%Math.round(stage.stageWidth/30))*30),(Math.floor(i/Math.round(stage.stageWidth/30))*30)));
				trace("count: "+i+" Coord: "+(i%Math.round(stage.stageWidth/30)*30)+" "+(Math.floor(i/Math.round(stage.stageWidth/30))*30));
			}
			
			/*for(var iY:int=1; iY*30<=stage.stageHeight;iY++)
			{
				for(var iX:int=1; iX*30<=stage.stageWidth; iX++)
				{
					addChild(new Pattern((iX*30),(iY*30)));
				}
			}*/
			_stageWidth=stage.stageWidth;
			_stageHeight=stage.stageHeight;
		}
		private function ResizePattern(e:Event):void
		{
			if(_stageWidth<stage.stageWidth)
			{
				for(var iX:int=_stageWidth; iX<=stage.stageWidth; iX++)
				{
					if(iX%30==0)
					{
						for(var iY:int=1; iY*30<=stage.stageHeight; iY++)
						{
							addChild(new Pattern(iX,iY*30));
						}
					}
				}
				_stageWidth=stage.stageWidth;
			}
			if(_stageHeight<stage.stageHeight)
			{
				for( iY=_stageHeight; iY<=stage.stageHeight; iY++)
				{
					if(iY%30==0)
					{
						for(iX=1; iX*30<=stage.stageWidth; iX++)
						{
							addChild(new Pattern(iX*30,iY));
						}
					}
				}
				_stageHeight=stage.stageHeight;
			}
		}
	}
}
import flash.display.Sprite;

class Pattern extends Sprite
{
	public function Pattern($x:int,$y:int):void
	{
		graphics.beginFill(0xEAEAEA);
		graphics.drawRect($x-1, $y-1, 1, 1);
		graphics.endFill();
	}
}
