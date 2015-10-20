package events
{
	import flash.events.Event;
	
	import ui.Field;
	import ui.Line;

	public class FieldSelectEvent extends Event
	{
		public static const FIELD_SELECTED:String = "fieldSelected";
		
		public var field:Field;
		public var line:Line;
		
		public function FieldSelectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		
	}
}