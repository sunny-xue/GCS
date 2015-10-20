package com.zavoo.svg
{
	import com.zavoo.svg.nodes.SVGRoot;
	
	import mx.containers.Canvas;

	public class SVGViewer extends Canvas
	{
		private var svgRoot:SVGRoot;
		
		public function SVGViewer(){
			svgRoot = new SVGRoot();	
			this.rawChildren.addChild(svgRoot);				
		}
				
		/**
		 * Get / Set Functions 
		 **/
		 
		public function set scale(scale:Number):void {
			svgRoot.scale = scale;

			//Scale canvas to match size of  SVG
			this.width = svgRoot.origWidth * scale;
			this.height = svgRoot.origHeight * scale; 
		}
		
		public function get scale():Number {
			return svgRoot.scale;				
		}
		
		public function get origWidth():Number{
			return svgRoot.origWidth;
		}
		
		public function get origHeight():Number{
			return svgRoot.origHeight;
		}
		
		public function get xml():XML {
			return svgRoot.xml;
		}
				
		public function set xml(xml:XML):void {
						
			//Pass XML off to svgDocReader
			this.svgRoot.xml = xml;
			
			//Have svgDocReader draw SVG
			svgRoot.draw();
			
			// Set/Reset scale
			this.scale = 1;	
		}
		
		override public function set scaleX(value:Number):void {
			trace('scaleX: Use SVGViewer.scale');	
		}
		
		override public function set scaleY(value:Number):void {
			trace('scaleY: Use SVGViewer.scale');
		}
		
	}
}