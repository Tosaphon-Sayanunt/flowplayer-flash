﻿/* * Author: Anssi Piirainen, api@iki.fi * This file is part of Flowplayer, http://flowplayer.org * * Copyright (c) 2011 Flowplayer Ltd * * Released under the MIT License: * http://www.opensource.org/licenses/mit-license.php */package org.flowplayer.volume.ui {    import flash.display.DisplayObject;    import flash.events.MouseEvent;    import org.flowplayer.model.DisplayPluginModel;    import org.flowplayer.ui.dock.Dock;    import org.flowplayer.ui.buttons.ButtonEvent;    import org.flowplayer.ui.controllers.AbstractButtonController;	import org.flowplayer.view.AnimationEngine;	import org.flowplayer.view.Flowplayer;	import org.flowplayer.model.PlayerEvent;	import org.flowplayer.ui.buttons.VolumeTooltipButton;	import org.flowplayer.ui.buttons.VolumeToggleButton;		import fp.VolumeLowButton;	import fp.VolumeMediumButton;	import fp.VolumeHighButton;	import fp.VolumeMuteButton;		import org.flowplayer.ui.buttons.TooltipButtonConfig;		import flash.external.*;    public class VolumeButtonController extends AbstractButtonController {        private var _volume:Volume;        private var _model:DisplayPluginModel;        private var _currentVolume:Number;		public function VolumeButtonController(player:Flowplayer,  volumeModel:DisplayPluginModel) {            super();            	_player = player;            _volume = volumeModel.getDisplayObject() as Volume;            _model = volumeModel;                        //ExternalInterface.addCallback("sendBitrateType", bitrateSetFromJS);		}				override protected function createWidget():void {						var lowButton:VolumeTooltipButton = new VolumeTooltipButton( 												new lowFaceClass(), 												_config as TooltipButtonConfig, 												_player.animationEngine, _player, _volume);            setAccessible(lowButton, "volume-low");																		var mediumButton:VolumeTooltipButton = new VolumeTooltipButton(												new mediumFaceClass(), 												_config as TooltipButtonConfig, 												_player.animationEngine, _player, _volume);            setAccessible(mediumButton,  "volume-medium");									var highButton:VolumeTooltipButton = new VolumeTooltipButton(												new highFaceClass(), 												_config as TooltipButtonConfig, 												_player.animationEngine, _player, _volume);            setAccessible(highButton,  "volume-high");									var muteButton:VolumeTooltipButton = new VolumeTooltipButton(												new muteFaceClass(), 												_config as TooltipButtonConfig, 												_player.animationEngine, _player, _volume);            setAccessible(muteButton,  "volume-mute");						_widget = new VolumeToggleButton(lowButton, mediumButton,highButton,muteButton);		}				override public function get name():String {			return "volumeSlider";		}		override public function get defaults():Object {			return {				tooltipEnabled: false,				tooltipLabel: "",				visible: true,				enabled: true			};		}		public function get lowFaceClass():Class {			return VolumeLowButton;		}				public function get mediumFaceClass():Class {			return VolumeMediumButton;		}				public function get highFaceClass():Class {			return VolumeHighButton;		}				public function get muteFaceClass():Class {			return VolumeMuteButton;		}		override protected function onButtonClicked(event:ButtonEvent):void {//			var tooltipToggle:VolumeToggleButton = _widget as VolumeToggleButton;//            var show:Boolean = (_volume.alpha == 0 || ! _volume.visible);//            if (show) {//                _volume.updateModelProp("display", "block");//                //                _volume.alpha = 0; // make sure the initial value before fade is sensible//                _player.animationEngine.fadeTo(_volume, 0.7);//                tooltipToggle.hideTooltip();//                tooltipToggle.isOpenVolume = true;//                //                ExternalInterface.call("thaitv.setControlAutohide", false);//            } else {//                //                _volume.alpha = 0.7; // make sure the initial value before fade is sensible//                _player.animationEngine.fadeOut(_volume);//                ExternalInterface.call("thaitv.setControlAutohide", true);//                tooltipToggle.isOpenVolume = false;//            }            //setListeners(show);                        if(_player.volume > 0)            {            		_currentVolume = _player.volume;            		_player.volume = 0;            		_volume.updateVolume(0);            	} else {            		_player.volume = _currentVolume;            		_volume.updateVolume(_currentVolume);
            	}			}        private function setListeners(add:Boolean):void {            //var func:String = add ? "addEventListener" : "removeEventListener";            //_volume[func](MouseEvent.ROLL_OUT, onRollOut);        }        private function onRollOut(event:MouseEvent):void {            log.debug("onRollOut()");            //_menu.startAutoHide();        }				override protected function addWidgetListeners():void {			_widget.addEventListener(ButtonEvent.CLICK, onButtonClicked);		}                public function getVolumeButton():VolumeTooltipButton {        		return (_widget as VolumeToggleButton).activeButton as VolumeTooltipButton;        		
        }                override protected function addPlayerListeners():void {			_player.onVolume(onPlayerVolumeEvent);		}				private function onPlayerVolumeEvent(event:PlayerEvent):void {			var volValue:Number = event.info as Number;			if(volValue == 0) {				(_widget as VolumeToggleButton).volumeType = 0;			} else if(volValue < 31) {				(_widget as VolumeToggleButton).volumeType = 1;			} else if(volValue < 61) {				(_widget as VolumeToggleButton).volumeType = 2;			} else {				(_widget as VolumeToggleButton).volumeType = 3;			}					}	}}