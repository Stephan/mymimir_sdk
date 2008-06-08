package org.mymimir.sdk
{
	import mx.messaging.AbstractConsumer;

	public class URLHandlerManager extends URLHandler
	{
		protected var _handlers:Array;
		
		
		public function URLHandlerManager()
		{
			super();
			this._handlers = new Array();
		}

		public function clear():void
		{
			this._handlers = new Array();
		}

		
		public function addLocationhandler(handler:IURLHandler):void
		{
			this._handlers.push(handler);
			this._protocols = this._protocols.concat(handler.supportedProtocols);
		}
		
		
		override public function canHandleLocation(location:String):Boolean
		{
			if (getHandlerFor(location)) return true;
			return false;
		}
		
		public function getHandlerFor(location:String):IURLHandler
		{			
			for each (var h:IURLHandler in this._handlers)
				if (h.canHandleLocation(location)) return h;
			return null;
		}


		public function getAllHandlersForLocation(location:String):Array
		{
			var ret:Array = new Array();
			for each (var h:IURLHandler in this._handlers)
				if (h.canHandleLocation(location)) 
					ret.push(h);
			
			if (!ret.length) 
				return null;
			return ret;
			
		}

		override public function handleLocation(location:String):Boolean
		{
			var h:IURLHandler = getHandlerFor(location);
			
			if (!h) return false;
			
			return h.handleLocation(location);
		}
		
		
	}
}