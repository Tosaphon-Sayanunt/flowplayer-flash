package org.flowplayer.relatedvideo {
	
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Graphics;
	import flash.external.ExternalInterface;
	
	
	public class RelatedImageObject extends Sprite {
		
		private var _image:Loader;
		private var _greyBorder:Sprite;
		private var _blueBorder:Sprite;
		private var _imageWidth:Number;
		private var _imageHeight:Number;
		private var _borderThickness:Number;
		
		public function RelatedImageObject(image:Loader, w:Number, h:Number) {
			_image = image;
			_borderThickness = 2;
			_imageWidth = w;
			_imageHeight = h;
			buttonMode = true;
			setupImage();
		}
		
		private function setupImage():void {
			//set position
			_image.x = _borderThickness;
			_image.y = _borderThickness;
			_image.width = _imageWidth - (_borderThickness *2);
			_image.height = _imageHeight - (_borderThickness *2);
						
			//draw grey border
			_greyBorder = new Sprite();
			var gb : Graphics = _greyBorder.graphics;
			//gb.lineStyle( null );
			gb.beginFill( 0x505050, 1 );
			gb.drawRect( 0, 0, _imageWidth, _imageHeight );
			gb.drawRect( _borderThickness, _borderThickness, _imageWidth - (_borderThickness*2), _imageHeight - (_borderThickness*2) );
			gb.endFill( );
			
			//draw blue border and hide
			_blueBorder = new Sprite();
			var bbThickness:Number = _borderThickness+2;
			var bb : Graphics = _blueBorder.graphics;
			//bb.lineStyle( null );
			bb.beginFill( 0x3366FF, 1 );
			bb.drawRect( 0, 0, _imageWidth, _imageHeight );
			bb.drawRect( bbThickness, bbThickness, _imageWidth - (bbThickness*2), _imageHeight - (bbThickness*2) );
			bb.endFill( );
			_blueBorder.alpha = 0;
			
			
			//addChildren
			addChild (_greyBorder);
			addChild (_blueBorder);
			addChild(_image);			
		}
		
		public function showBlueBorder():void {
			_blueBorder.alpha = 1;
			_greyBorder.alpha = 0;
		}
		
		public function hideBlueBorder():void {
			_blueBorder.alpha = 0;
			_greyBorder.alpha = 1;
		}
	}	
}