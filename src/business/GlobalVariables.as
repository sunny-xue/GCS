package business
{
	import flash.system.Capabilities;
	
	import ui.Template;
	
	[Bindable]
	public class GlobalVariables
	{
		public static const NO_EDIT_STATE:uint = 0;
		public static const FIELD_EDITING_STATE:uint = 1;
		public static const BACKGROUND_EDITING_STATE:uint = 2;
		//编辑状态
		public static var editState:uint = NO_EDIT_STATE;
		//模版名称
		public static var templateName:String;
		//模版宽度
		public static var templateWidth:Number;
		//模版高度
		public static var templateHeight:Number;
		//tid与table名称的键值对
		public static var tableNameLib:Object = new Object();
		//tid与bgColor的键值对
		public static var bgColorLib:Object = new Object();
		//tid与fontColor的键值对
		public static var fontColorLib:Object = new Object();
		//TODO  测试的时候设置为true   打印状态
		public static var printReady:Boolean = false;
		//像素和毫米的比值
		public static var dpiRatio:Number = 0.03937 * Capabilities.screenDPI;
		//当前正在编辑的模版
		public static var template:Template;
		//拖拽时的鼠标x坐标
		public static var dropX:Number;
		//拖拽时的鼠标y坐标
		public static var dropY:Number;
		//可关联字段列表
		public static var linkFieldXML:XML = <root/>;
		//是否打印背景
		public static var isPrintBg:Boolean = false;
	}
}