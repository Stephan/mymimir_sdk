package org.mymimir.sdk
{
	import flash.events.EventDispatcher;

	public class URLHandler extends EventDispatcher implements IURLHandler
	{
		private static const RWikiLocation:RegExp = /^wiki:\/\/.+/;
		private static const RAppLocation:RegExp  = /^app:\/.*/;
		private static const RWebLocation:RegExp = /^http:\/\/.+/;
		private static const RSearchLocation:RegExp = /^search:\/\/.+/;
		private static const RFileLocation:RegExp = /^file:\/\/.+/;
		
		protected var _protocols:Array;
		protected var _lastHandledLocation:String;
		
		public function URLHandler()
		{
			this._protocols = new Array();
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
			return (this._protocols.indexOf(protocol) != -1);
		}
		
		public function get supportedProtocols():Array
		{
			return this._protocols;
		}
		

		
		/**
		 * Check if an url points to a wiki. Url has to be of the form wiki://<pagename> 
		 * @param loc	The url
		 * @return 		Check result
		 * 
		 */		
		public static function isWikiLocation(loc:String):Boolean
		{
			if (loc.match(URLHandler.RWikiLocation)) return true;
			return false;
		}
		
		public static function isAppLocation(loc:String):Boolean
		{
			if (!loc) return false;
			if (loc.match(URLHandler.RAppLocation)) return true;
			return false;
		}
		
		public static function isWebLocation(loc:String):Boolean
		{
			if (loc.match(URLHandler.RWebLocation)) return true;
			return false;
		}

		public static function isSearchLocation(loc:String):Boolean
		{
			if (loc.match(URLHandler.RSearchLocation)) return true;
			return false;
		}
		
		public static function isFileURL(loc:String):Boolean
		{
			if (loc.match(URLHandler.RFileLocation)) return true;
			return false;
		}
		
				
	}
}