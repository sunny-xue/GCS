package business
{
	import flash.net.FileReference;
	
	[Bindable]
	public class ImageVO
	{
		public var label:String;
		public var x:Number;
		public var y:Number;
		public var w:Number = 0;
		public var h:Number = 0;
		
		public var parentid:String;
		public var fontColor:uint;
		public var bgColor:uint;
		public var hasAlreadyBuild:Number = 0;
		
		public var fileReference:FileReference;
		public var src:String = "upload";
		
		public var isLink:Boolean = false;
		public var linkFid:String;
		public var linkType:int = 0;
		
		public function clone():ImageVO{
			var image:ImageVO = new ImageVO();
			image.label = label;
			image.x = x;
			image.y = y;
			image.w = w;
			image.h = h;
			
			image.parentid = parentid;
			image.fontColor = fontColor;
			image.bgColor = bgColor;
			image.hasAlreadyBuild = hasAlreadyBuild;
			
			image.fileReference = fileReference;
			image.src = src;
			
			image.isLink = isLink;
			image.linkFid = linkFid;
			image.linkType = linkType;
			
			image.hasAlreadyBuild = hasAlreadyBuild;
			
			return image;
		}
	}
}