/*
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * By: Anssi Piirainen, <support@flowplayer.org>
 *Copyright (c) 2008-2011 Flowplayer Oy *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */

package org.flowplayer.controls.volume {
	
	import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;
	import flash.display.Sprite;
	import org.flowplayer.view.Flowplayer;
	import org.flowplayer.controls.SkinClasses;
	import org.flowplayer.controls.controllers.VolumeButtonController;

	/**
	 * @author api
	 */
	public class VolumeThaiTVSlider extends Sprite {

		private var _volumeBar:Sprite;
		private var _volumeDragger:DisplayObjectContainer;
		private var _volumeNumber:Number;
		private var _bg:Sprite;
		
		private var _player:Flowplayer;
		private var _controller:VolumeButtonController;
		
		public function VolumeThaiTVSlider(player:Flowplayer, volumeController:VolumeButtonController) {
			
			_player = player;
			_controller = volumeController;
			
			_volumeNumber = 50; //initial volume value
			
			drawBackground();
			
			//createDragger();
			//createBars();
            
		}
		
		private function createBars():void {
			_volumeBar = new Sprite();
			addChild(_volumeBar);
			swapChildren(_volumeDragger, _volumeBar);
		}
		
		private function createDragger():void {
 			_volumeDragger = SkinClasses.getDisplayObject("fp.VolumeDragger");
			addChild(_volumeDragger);
		}
		
		private function drawBackground():void {
			_bg = new Sprite();
			_bg.graphics.beginFill(0x000000, 0.7); //Last arg is the alpha
			_bg.graphics.drawRoundRect(0, 0, 27, 120, 25, 25);
			_bg.graphics.endFill();
			
			addChild(_bg);
		}
	
	}
}
