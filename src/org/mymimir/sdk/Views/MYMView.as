package org.mymimir.sdk.Views
{
	import flash.events.Event;
	
	import mx.containers.Canvas;
	import mx.core.UIComponent;
	import mx.events.ResizeEvent;
	
	import org.mymimir.sdk.IApplication;
	import org.mymimir.sdk.IWiki;
	import org.mymimir.sdk.IWikiPage;
	import org.mymimir.sdk.Modules.IMYMModule;
	import org.mymimir.sdk.Tools;

	public class MYMView extends Canvas implements IMYMView, IMYMModule
	{				
		protected var aaaaaid:String;
		protected var _displayed:Boolean = false;
		protected var _title:String;
		protected var _protocols:Array;
		protected var _lastHandledLocation:String;
		protected var _description:XML;
		protected var _wiki:IWiki;
		
		public function MYMView(description:XML)
		{
			super();
			this._description = description;
			
			this._protocols = new Array();
			this.percentHeight = this.percentWidth = 100;

			this._title = "Generic View";
			
			if (description)
			{
				this.aaaaaid = org.mymimir.sdk.Tools.getStringFromXMLAttribute(description, "id");
				var title:String = org.mymimir.sdk.Tools.getStringFromXMLAttribute(description, "title");			
				if (title) this._title = title;

				org.mymimir.sdk.Tools.setWidthFromAttribute(this, description, "width");
			}
			
			this.addEventListener(mx.events.ResizeEvent.RESIZE, onResize);
		}
		/**
		 * Clean up. 
		 * 
		 */		
		public function dispose():void
		{
			
		}

		public function init(app:IApplication, description:XML):void
		{
		}
		
		public function get displayed():Boolean
		{
			return _displayed;
		}
		
		public function get title():String
		{
			return _title;
		}
				
		public function get description():XML
		{
			return this._description;
		}
				
		public function set wiki(wiki:IWiki):void
		{
			this._wiki = wiki;
		}
		
		public function get wikiPage():IWikiPage { return null; }
		
		public function doOnLeave():void 
		{
			this._displayed = false;
		}
		
		public function doOnEnter():void 
		{
			this._displayed = true;
		}
		
		
		protected function setWidthHeight(uiComp:UIComponent, width:Number = 100, height:Number = 100):void
		{
			uiComp.percentWidth = width;
			uiComp.percentHeight = height;	
		}
		
		
		protected function setMargins(uiComp:UIComponent, left:String, right:String, top:String, bottom:String):void
		{
			uiComp.setStyle("left", left);
			uiComp.setStyle("right", right);
			uiComp.setStyle("top", top);
			uiComp.setStyle("bottom", bottom);
		}
		


		public function canHandleLocation(location:String):Boolean
		{
			return this.checkProtocol(location);
		}
		
		public function handleLocation(location:String):Boolean
		{
			return false;
		}
		
		
		protected function getProtocol(location:String):String
		{
			var regP:RegExp = /(^\w+:\/\/).+/;
			var protocol:String = location.replace(regP, "$1");
			
			return protocol;
		}
		
		protected function checkProtocol(location:String):Boolean
		{
			var protocol:String = this.getProtocol(location);
			if (this.supportedProtocols.indexOf(protocol) != -1)
				return true;
			return false;
		}
		
		public function get supportedProtocols():Array
		{
			return this._protocols;
		}
		
		protected function onResize(ev:Event):void
		{
			this._description.@width = this.percentWidth.toString() + "%";
			this._description.@height = this.percentHeight.toString() + "%";
		}
		
		public function cleanUp():void
		{
			
		}
		
		public function handlePaste():Boolean
		{
			return false;
		}
		
		public function handleCopy():Boolean
		{
			return false;
		}

		public function handleCut():Boolean
		{
			return false;
		}

		public function handleSelectAll():Boolean
		{
			return false;
		}

		
		
		
		public function enableViewSetupMode():void
		{
			
		}
		
		public function disableViewSetupMode():void
		{
			
		}


		protected function onViewsetupFinish(ev:Event):void
		{
			this.dispatchEvent(ev);
		}
			
	}
}