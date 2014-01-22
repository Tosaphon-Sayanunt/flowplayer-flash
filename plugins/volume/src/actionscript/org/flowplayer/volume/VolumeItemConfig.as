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
    import org.flowplayer.model.Extendable;
    import org.flowplayer.model.ExtendableHelper;
    import org.flowplayer.model.PluginEventType;
    import org.flowplayer.model.PluginModel;
    import org.flowplayer.ui.buttons.ButtonConfig;
    import org.flowplayer.util.ObjectConverter;

    public class VolumeItemConfig extends ButtonConfig implements Extendable {
        private var _view:VolumeItem;
        private var _extension:ExtendableHelper = new ExtendableHelper();
        private var _height:Number = 30;
        private var _width:Number = 70;
        private var _selectedCallback:Function;

        public function set customProperties(props:Object):void {
            _extension.props = props;
        }

        public function get customProperties():Object {
            return _extension.props;
        }

        public function setCustomProperty(name:String, value:Object):void {
            _extension.setProp(name,  value);
        }

        public function getCustomProperty(name:String):Object {
            return _extension.getProp(name);
        }

        public function deleteCustomProperty(name:String):void {
            _extension.deleteProp(name);
        }

        [Value]
        public function get height():Number {
            return _height;
        }

        public function set height(value:Number):void {
            _height = value;
        }

        [Value]
        public function get width():Number {
            return _width;
        }

        public function set width(value:Number):void {
            _width = value;
        }

        public function get view():VolumeItem {
            return _view;
        }

        public function set view(value:VolumeItem):void {
            _view = value;
        }
    }
}
