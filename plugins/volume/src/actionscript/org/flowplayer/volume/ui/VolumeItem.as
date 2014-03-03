/*    
 *    Author: Anssi Piirainen, <api@iki.fi>
 *
 *    Copyright (c) 2010 Flowplayer Oy
 *
 *    This file is part of Flowplayer.
 *
 *    Flowplayer is licensed under the GPL v3 license with an
 *    Additional Term, see http://flowplayer.org/license_gpl.html
 */
package org.flowplayer.volume.ui {
	
	import flash.geom.Rectangle;
	import flash.events.Event;
    import flash.display.BlendMode;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.MouseEvent;

	import fp.VolumeBar;
	
    import org.flowplayer.controller.ResourceLoader;
    import org.flowplayer.volume.*;
    import org.flowplayer.ui.buttons.AbstractButton;
    import org.flowplayer.util.Arrange;
    import org.flowplayer.util.GraphicsUtil;
    import org.flowplayer.util.TextUtil;
    import org.flowplayer.view.AnimationEngine;
    import org.flowplayer.view.Flowplayer;
    
    import flash.external.*;

    public class VolumeItem extends AbstractButton {

        private var _player:Flowplayer;
        
        private var _bar:VolumeBar;
        private var _dragging:Boolean=false; 
        private var _sliderHeight:uint=100;
        private var _boundingBox:Rectangle;

        public function VolumeItem(player:Flowplayer, config:VolumeItemConfig, animationEngine:AnimationEngine) {
            _player = player;
            super(config, animationEngine);
        }

        override protected function onClicked(event:MouseEvent):void {
           
        }

        override protected function createFace():DisplayObjectContainer {
            return new VolumeItemFace(itemConfig.color, itemConfig.alpha);
        }

        override protected function childrenCreated():void {
           
            		_bar = new VolumeBar();
	            _bar.x = 5;
	            _bar.y = 12;
	            
	            _boundingBox = new Rectangle(0,0,0,_sliderHeight);  
	  			_bar.mDragger.addEventListener(MouseEvent.MOUSE_DOWN, dragKnob);  
				_bar.mDragger.buttonMode=true;
				
				_bar.addEventListener(MouseEvent.MOUSE_DOWN, clickBar);  
	
	            addChild(_bar);
        }
        
        override protected function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);
            
            stage.addEventListener(MouseEvent.MOUSE_UP, releaseKnob); 
        }
        
        private function clickBar(event:MouseEvent):void {
        		if(!_dragging) {
	        		var newPos:Number = event.localY;
	        		_bar.mFiller.y = _bar.mDragger.y = newPos;
				var myVolume:Number= (newPos - 100) * -1; 
			    updateVolumeBar(myVolume);
		    }
        }
        
        private function dragKnob(myEvent:Event):void { 
		    _bar.mDragger.startDrag(false, _boundingBox); 
		    _dragging = true; 
		    _bar.mDragger.addEventListener(Event.ENTER_FRAME, adjustVolume);    
		}
		
		private function releaseKnob(myEvent:Event):void { 
		    if (_dragging) { 
		        _bar.mDragger.stopDrag(); 
		        _dragging=false; 
		    }   
		}
		
		private function adjustVolume(myEvent:Event):void { 
			if(_dragging) { 
				_bar.mFiller.y = _bar.mDragger.y;
				var myVolume:Number= (_bar.mDragger.y - 100) * -1; 
			    updateVolumeBar(myVolume);
		    }	
		} 
		
		private function updateVolumeBar(newNum:Number):void {
		    _bar.mFiller.height = newNum;
		    _player.volume = newNum;
		}
		
		public function externalUpdateVolume(num:Number):void {
			_bar.mDragger.y = (num == 0) ? 100 : 100 - num;
			_bar.mFiller.height = num;
		    _player.volume = num;
		}

        override protected function onResize():void {
            log.debug("onResize() " + width + " x " + height);
            face.width = width;
            face.height = height;
        }

        override protected function doEnable(enabled:Boolean):void {
            
        }

        override protected function get disabledDisplayObject():DisplayObject {
            return null;
        }

        private function get itemConfig():VolumeItemConfig {return _config as VolumeItemConfig;}

    }
}