package org.mymimir.sdk
{
	import flash.events.IEventDispatcher;
	
	/**
	 * Interface of an URLHandler. 
	 * @author stephansmola
	 * 
	 */	
	public interface IURLHandler extends IEventDispatcher
	{
		
		
		/**
		 * Check if the handler can handle the url. This is at least a check for the right protocol. 
		 * @param location	The url to handle
		 * @return 			Tru if the handler can handle that url
		 * 
		 */
		function canHandleLocation(location:String):Boolean;
		
		
		/**
		 * Handle the location. Do whatever is necessary to process the url 
		 * @param location	The url to handle
		 * @return 			True if handling the location wnet without error
		 * 
		 */
		function handleLocation(location:String):Boolean;
		
		/**
		 * The supported protocols of this handler, e.g. ["http://", "wiki://"]
		 * @return 	Array of string with the supported protocols.
		 * @see org.mymimir.sdk.Protocols
		 */		
		function get supportedProtocols():Array;
	}
}