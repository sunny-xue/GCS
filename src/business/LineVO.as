package business
{
	[Bindable]
	public class LineVO
	{
		public var label:String;
		public var x:Number;
		public var y:Number;
		public var w:Number;
		public var h:Number;
		
		public var parentid:String;
		public var bgColor:uint;
		public var fontColor:uint;
		public var hasAlreadyBuild:Number = 0;
		
		public var showTop:Boolean = false;
		public var topColor:uint = 0x000000;
		public var topSize:Number = 1;
		
		public var showBottom:Boolean = false;
		public var bottomColor:uint = 0x000000;
		public var bottomSize:Number = 1;
		
		public var showLeft:Boolean = false;
		public var leftColor:uint = 0x000000;
		public var leftSize:Number = 1;
		
		public var showRight:Boolean = false;
		public var rightColor:uint = 0x000000;
		public var rightSize:Number = 1;
		
		public var isLink:Boolean = false;
		public var linkFid:String;
		public var linkType:int = 0;
		
		public function clone():LineVO{
			var line:LineVO = new LineVO();
			line.label = label;
			line.x = x;
			line.y = y;
			line.w = w;
			line.h = h;
			
			line.parentid = parentid;
			line.bgColor = bgColor;
			line.fontColor = fontColor;
			line.hasAlreadyBuild = hasAlreadyBuild;
			
			line.showTop = showTop;
			line.topColor = topColor;
			line.topSize = topSize;
		
			line.showBottom = showBottom;
			line.bottomColor = bottomColor;
			line.bottomSize = bottomSize;
		
			line.showLeft = showLeft;
			line.leftColor = leftColor;
			line.leftSize = leftSize;
		
			line.showRight = showRight;
			line.rightColor = rightColor;
			line.rightSize = rightSize;
			
			line.isLink = isLink;
			line.linkFid = linkFid;
			line.linkType = linkType;
			
			line.hasAlreadyBuild = hasAlreadyBuild;
			
			return line;
		}
	}
}