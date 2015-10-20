package business
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class TableVO
	{
		public var title:String
		public var tid:String;
		public var bgColor:uint;
		public var fontColor:uint;
		public var fieldList:ArrayCollection = new ArrayCollection();
	}
}