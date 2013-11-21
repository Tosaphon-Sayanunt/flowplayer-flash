﻿/* * Author: Thomas Dubois, <thomas _at_ flowplayer org> * This file is part of Flowplayer, http://flowplayer.org * * Copyright (c) 2011 Flowplayer Ltd * * Released under the MIT License: * http://www.opensource.org/licenses/mit-license.php */package org.flowplayer.ui.buttons {	    import flash.display.DisplayObjectContainer;	import flash.events.MouseEvent;    import org.flowplayer.view.AnimationEngine;		import org.flowplayer.ui.buttons.TooltipButtonConfig;		import flash.external.*;	/**	 * @author api	 */	public class VolumeTooltipButton extends GenericTooltipButton {		public function VolumeTooltipButton(face:DisplayObjectContainer, config:TooltipButtonConfig, animationEngine:AnimationEngine) {						super(face,config, animationEngine);		}        override protected function onMouseOut(event:MouseEvent = null):void {            super.onMouseOut(event);			ExternalInterface.call("thaitv.thaiTVHideVolume");        }        override protected function onMouseOver(event:MouseEvent):void {            super.onMouseOver(event);            ExternalInterface.call("thaitv.thaiTVShowVolume");        }	}}