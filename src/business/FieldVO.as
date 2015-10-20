package business
{
	[Bindable]
	public class FieldVO
	{
		public var label:String;
		public var fid:String;
		public var x:Number;
		public var y:Number;
		public var w:Number;
		public var h:Number;
		public var bgColor:uint;
		public var fontColor:uint;
		public var parentName:String;
		public var parentid:String;
		public var size:int = -1;
		public var align:String;
		public var weight:String;
		public var style:String;
		public var lr:Boolean = false;
		public var txt:String;
		public var showTestTxt:Boolean = false;
		public var isConst:Boolean = false;
		public var hasAlreadyBuild:Number = 0;
		
		public var isLink:Boolean = false;
		public var linkFid:String;
		public var linkType:int = 1;
		
		public function clone():FieldVO{
			var field:FieldVO = new FieldVO();
			field.label = label;
			field.fid = fid;
			field.x = x;
			field.y = y;
			field.w = w;
			field.h = h;
			field.bgColor = bgColor;
			field.fontColor = fontColor;
			field.parentName = parentName;
			field.parentid = parentid;
			field.size = size;
			field.align = align;
			field.weight = weight;
			field.style = style;
			field.lr = lr;
			field.txt = txt;
			field.showTestTxt = showTestTxt;
			field.isConst = isConst;
			field.hasAlreadyBuild = hasAlreadyBuild;
			
			field.isLink = isLink;
			field.linkFid = linkFid;
			field.linkType = linkType;
			
			return field;
		}
	}
}