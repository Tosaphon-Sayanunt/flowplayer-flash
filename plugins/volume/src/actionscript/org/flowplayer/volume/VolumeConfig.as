/*
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * By: Anssi Piirainen, <api@iki.fi>
 *
 * Copyright (c) 2008-2011 Flowplayer Oy
 *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package org.flowplayer.volume {
    import org.flowplayer.volume.ui.VolumeItem;
    import org.flowplayer.model.DisplayPluginModel;
    import org.flowplayer.util.PropertyBinder;

    public class VolumeConfig {
        private var _button:VolumeButtonConfig = new VolumeButtonConfig();
        private var _defaultItemConfig:Object;
        private var _controlsPlugin:String = "controls";

        public function VolumeConfig() {

            _defaultItemConfig = {
//                color: "rgba(140,142,140,1)",
                color: "rgba(255,255,255,1)",
                overColor: "rgba(1,95,213,1)",
                fontColor: "rgb(0,0,0)",
                disabledColor: "rgba(150,150,150,1)"
            };
        }

        private function setDefaultProps(item:VolumeItemConfig):void {
            new PropertyBinder(item, "customProperties").copyProperties(_defaultItemConfig);
        }
        
        public function get button():VolumeButtonConfig {
            return _button;
        }

        public function setButton(value:Object):void {
            new PropertyBinder(_button).copyProperties(value);
        }

        public function set controlsPlugin(value:String):void {
            _controlsPlugin = value;
        }

        public function get controlsPlugin():String {
            return _controlsPlugin;
        }
    }
}
