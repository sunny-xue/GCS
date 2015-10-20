package events
{
	import flash.events.Event;
	
	import ui.ResizableCanvas;

	public class ResizeableCanvasEvent extends Event
	{
		public static const DROP:String = "resizeableCanvasDrop";
		public var object:ResizableCanvas;
		public var stageX:Number;
		public var stageY:Number;
		
		public function ResizeableCanvasEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}