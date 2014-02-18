package org.flowplayer.controls.scrubber
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.*;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.display.BlendMode;
    import flash.filters.GlowFilter;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    	
	import flash.external.*;
	
	public class Thumbnails extends Sprite
	{
		private var _bg:Sprite;
		private var _mask:Shape;
		private var _loader:Loader;
		private var _text:TextField;
		
		public function Thumbnails(imageUrl:String, text:TextField){
			_text = text;
			drawBG();
			
			_loader = new  Loader();
			configureListeners(_loader.contentLoaderInfo);
			_loader.load(new URLRequest(imageUrl));
			
			addChild(_loader);
			
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            dispatcher.addEventListener(Event.INIT, initHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            dispatcher.addEventListener(Event.OPEN, openHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
        }

        private function completeHandler(event:Event):void {
			_loader.x = 5;
			_loader.y = 5;
			
			
			drawMask();
			createTextField();
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
            
        }

        private function initHandler(event:Event):void {
            
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            
        }

        private function openHandler(event:Event):void {
            
        }

        private function progressHandler(event:ProgressEvent):void {
            
        }

        private function unLoadHandler(event:Event):void {
            
        }
		
		private function drawBG():void {
			_bg = new Sprite();
			_bg.graphics.clear();
            _bg.graphics.beginFill(0x000000, 0.4);
            _bg.graphics.drawRoundRect(0, 0, 110, 66, 5, 5);
            _bg.graphics.endFill();
            addChild(_bg);
		}
		
		private function drawMask():void {
			_mask = new Shape();
            _mask.graphics.beginFill(0x000000);
            _mask.graphics.drawRoundRect(0, 0, 100, 56, 5, 5);
            _mask.graphics.endFill();
            _mask.x = 5;
            _mask.y = 5;
            addChild(_mask);
            
            _loader.mask = _mask;
		}
		
		private function createTextField():void {
			
			_text.selectable = false;
            _text.blendMode = BlendMode.LAYER;
            _text.autoSize = TextFieldAutoSize.CENTER;
            _text.wordWrap = true;
            _text.multiline = false;
            _text.antiAliasType = AntiAliasType.ADVANCED;
            _text.condenseWhite = true;
            _text.background	 = true;
            _text.backgroundColor = 0x000000;
            var glow:GlowFilter = new GlowFilter(0, .80, 2, 4, 6);
            _text.filters = [glow];
            
            var format:TextFormat = new TextFormat();
            format.align = TextFormatAlign.CENTER;
             _text.defaultTextFormat = format;
             _text.alpha = 0.6;
            _text.width = 50;
            _text.height = 20;
            _text.y = 50;
            _text.x = 28;
            addChild(_text);
		}
		
		public function setThumbnailsIndex(index:Number):void {
			if(index <= 1) {
				_loader.x = 5;
			} else {
				_loader.x = (index * -100)  + 105;
			}
		}
		
		public function setTimeText(time:String):void {
			if(_text) {
				_text.text = time;
			}	
		}
		
		
	}
}