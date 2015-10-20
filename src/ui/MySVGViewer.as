package ui
{
	import com.zavoo.svg.SVGViewer;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;

	public class MySVGViewer extends SVGViewer
	{
		private var initW:Number;
		private var initH:Number;
		
		public function MySVGViewer(w:Number = -1, h:Number = -1)
		{
			initW = w;
			initH = h;
			super();
		}
		
		public function loadSVGbyXML(xml:XML):void{
			this.xml = xml;
			
			var obj:Object = this;
            flash.utils.setTimeout(function ():void{
            	obj.dispatchEvent(new Event(Event.INIT, true));
            }, 500); 
		}
		
		public function loadSVGbyURL(url:String):void {
            //Load SVG File
            var urlLoader:URLLoader = new URLLoader(new URLRequest(url));
            urlLoader.addEventListener(Event.COMPLETE, onURLLoaded);    
        }
        
        private function onURLLoaded(event:Event):void {
        	trace("onURLLoaded");
            var loader:URLLoader = URLLoader(event.currentTarget);
             loader.removeEventListener(Event.COMPLETE, onURLLoaded);
            
            //Load XML data into the SVGViewer
            this.xml = new XML(loader.data);
            
            var obj:Object = this;
            flash.utils.setTimeout(function ():void{
            	if(obj.initW != -1){
            		obj.scale = obj.initW / obj.origWidth;
            	}
            	obj.dispatchEvent(new Event(Event.INIT, true));
            }, 500); 
        }
		
	}
}