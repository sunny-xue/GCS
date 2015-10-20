package ui
{
	import events.ResizeableCanvasEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import mx.containers.Canvas;
	import mx.events.ResizeEvent;
	import mx.managers.CursorManager;

	public class ResizableCanvas extends Canvas
	{
		
		private var _bothEdges:resizeIcon;
		private var _currentCursorId:int = -1;
		private var _dragStartHPosition:Number;
		private var _dragStartVPosition:Number;
		private var _dragLastWidth:Number;
		private var _dragLastHeight:Number;
		private var _dragStarted:Boolean = false;
        //private var _dragStartPosition:Number = 0;
        
        private var _dragable:Boolean = false;
        private var _resizable:Boolean = false;
        
        public var dragInParentRect:Boolean = true;
        public var allowBringToFront:Boolean = true;
        public var allowBringToBack:Boolean = true;
        public var keepProportion:Boolean = false;
        
        public function ResizableCanvas(){
        	addEventListener(ResizeEvent.RESIZE, resizeHandler);
        	this.doubleClickEnabled = true;
        	this.addEventListener(MouseEvent.DOUBLE_CLICK, handleDoubleClick);
        }
        
        public function resizeHandler(event:ResizeEvent):void{
        	_bothEdges.x = width - _bothEdges.width;
			_bothEdges.y = height - _bothEdges.height;
        }
        
        private function bringToFront():void{
        	/* if(allowBringToFront)
        		parent.setChildIndex(this, parent.numChildren - 1); */
        }
        
        private function handleDoubleClick(event:MouseEvent):void{
        	bringToBack();
        }
        
        private function bringToBack():void{
        	if(allowBringToBack)
        		parent.setChildIndex(this, 0);
        }
        
        public function set dragable(value:Boolean):void{
        	_dragable = value;
        	if(_dragable){
        		addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        	}
        	else{
        		removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        	}
        }
        
        public function get dragable():Boolean{
        	return _dragable;
        }
        
        public function set resizable(value:Boolean):void{
        	_resizable = value;
        	if(_resizable){
        		if(_bothEdges){
        			_bothEdges.visible = true;
        			_bothEdges.addEventListener(MouseEvent.MOUSE_OVER, 
			            handleBothResizeOver, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_MOVE, 
				            handleBothResizeOver, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_OUT, 
				            handleResizeOut, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_DOWN, 
				            handleBothDragStart, false, 0 ,true);
        		}
        	}
        	else{
        		if(_bothEdges){
        			_bothEdges.visible = false;
        			_bothEdges.removeEventListener(MouseEvent.MOUSE_OVER, 
			            handleBothResizeOver);
				    _bothEdges.removeEventListener(MouseEvent.MOUSE_MOVE, 
				            handleBothResizeOver);
				    _bothEdges.removeEventListener(MouseEvent.MOUSE_OUT, 
				            handleResizeOut);
				    _bothEdges.removeEventListener(MouseEvent.MOUSE_DOWN, 
				            handleBothDragStart);
        		}
        	}
        }
		
		public function get resizable():Boolean{
        	return _resizable;
        }
		
		private function mouseOverHandler(event:MouseEvent):void
		{
		    if (_currentCursorId == -1)
		        _currentCursorId = 
		                CursorManager.setCursor(moveCursor,1);
		}
		
		private function mouseOutHandler(event:MouseEvent):void
        {
            if (!_dragStarted) {
                CursorManager.removeCursor(_currentCursorId);
                _currentCursorId = -1;
            }
        }
		
		private var dragStartMouseX:Number;
		private var dragStartMouseY:Number;
		private function mouseDownHandler(event:MouseEvent):void{
			bringToFront();
			dragStartMouseX = stage.mouseX;
			dragStartMouseY = stage.mouseY;
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
			if(dragInParentRect){
				startDrag(false, new Rectangle(0, 0, parent.width - width, parent.height - height));
			}
			else{
				startDrag();
			}
		}
		
		private function mouseUpHandler(event:MouseEvent):void{
			stopDraging();
		}
		
		private function mouseLeaveHandler(event:Event):void{
			stopDraging();
		}
		
		private function stopDraging():void{
			if(!isNaN(this.getStyle("horizontalCenter"))){
				var currentHC:Number = this.getStyle("horizontalCenter") as Number;
				this.setStyle("horizontalCenter", currentHC + (stage.mouseX - dragStartMouseX));
			}
			if(!isNaN(this.getStyle("verticalCenter"))){
				var currentVC:Number = this.getStyle("verticalCenter") as Number;
				this.setStyle("verticalCenter", currentVC + (stage.mouseY - dragStartMouseY));
			}
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
			stopDrag();
			var evt:ResizeableCanvasEvent = new ResizeableCanvasEvent(ResizeableCanvasEvent.DROP, true);
			evt.object = this;
			evt.stageX = stage.mouseX;
			evt.stageY = stage.mouseY;
			dispatchEvent(evt);
		}
		
		override protected function createChildren():void{
			super.createChildren();
			
			if (!_bothEdges)
			{
			    _bothEdges = new resizeIcon();
			    _bothEdges.label = "";
			    _bothEdges.toolTip = null;
			    _bothEdges.tabEnabled = false;
			    //_bothEdges.setStyle("right", 0);
			    //_bothEdges.setStyle("bottom",0);
			    //_bothEdges.styleName = "canvasBothEdges";
				 
				if(resizable){
					_bothEdges.visible = true;
				 	_bothEdges.addEventListener(MouseEvent.MOUSE_OVER, 
			            handleBothResizeOver, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_MOVE, 
				            handleBothResizeOver, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_OUT, 
				            handleResizeOut, false, 0 ,true);
				    _bothEdges.addEventListener(MouseEvent.MOUSE_DOWN, 
				            handleBothDragStart, false, 0 ,true);
				}
				else{
					_bothEdges.visible = false;
				}
			    rawChildren.addChild(_bothEdges);
			    
			    _bothEdges.x = width - _bothEdges.width;
			    _bothEdges.y = height - _bothEdges.height;
			}
		}
		
		private function handleBothResizeOver(event:MouseEvent):void
		{
		    if (_currentCursorId == -1)
		        _currentCursorId = 
		                CursorManager.setCursor(bothSideCursor,2);
		}
		
		private function handleResizeOut(event:MouseEvent):void
        {
            if (!_dragStarted) {
                CursorManager.removeCursor(_currentCursorId);
                _currentCursorId = -1;
            }
        }
		
		private function handleBothDragStart(event:MouseEvent):void
		{
			bringToFront();
			event.stopImmediatePropagation();
	        _dragStarted = true;
	        _dragStartHPosition = stage.mouseX;
	        _dragLastWidth = width;
	        _dragStartVPosition = stage.mouseY;
	        _dragLastHeight = height;
		    //_bothEdges.addEventListener(Event.ENTER_FRAME, handleBothDragMove, false, 0 ,true);
			if (stage != null){
				stage.addEventListener(MouseEvent.MOUSE_MOVE, handleBothDragMove);
				stage.addEventListener(MouseEvent.MOUSE_UP, 
		                handleDragStop, false, 0 ,true);
			}  
		}
		
		private function handleDragStop(event:MouseEvent):void
        {
        	//_bothEdges.removeEventListener(Event.ENTER_FRAME, handleBothDragMove);
			if (stage != null){
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleBothDragMove);
				stage.removeEventListener(MouseEvent.MOUSE_UP, 
		                handleDragStop);
			}
		        
            _dragStarted = false;
            CursorManager.removeCursor(_currentCursorId);
            _currentCursorId = -1;
        }
		
		private function handleBothDragMove(event:MouseEvent):void
		{
		    if (_dragStarted)
		    {
		        var hMovement:Number = (stage.mouseX - _dragStartHPosition);
		        if (hMovement <= 0)
		        {
		            if (minWidth < _dragLastWidth + hMovement)
		                width = _dragLastWidth + hMovement;
		            else
		                width = minWidth;
		        } else {
		            if (maxWidth > _dragLastWidth + hMovement)
		                width = _dragLastWidth + hMovement;
		            else
		                width = maxWidth;
		        }
		        if(keepProportion){
		        	var vMovement:Number = (width / _dragLastWidth - 1) * _dragLastHeight;
		        }
		        else{
		        	vMovement = (stage.mouseY - _dragStartVPosition);
		        }
		        
		        if (vMovement <= 0)
		        {
		            if (minHeight < _dragLastHeight + vMovement)
		                height = _dragLastHeight + vMovement;
		            else
		                height = minHeight;
		        } else {
		            if (maxHeight > _dragLastHeight + vMovement)
		                height = _dragLastHeight + vMovement;
		            else
		                height = maxHeight;
		        }
		    }
		}
	}
}