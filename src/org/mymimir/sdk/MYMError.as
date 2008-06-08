package org.mymimir.sdk
{
	import flash.geom.Rectangle;
	
	public class MYMError extends Error
	{
		public static var ErrorLoadXML:String = "Error while loading XML file &0";
		public static var ErrorInitConverter:String = "Cannot initialise converter, description is missing";
		public static var ErrorConnectDB:String = "Could not connect to database, file &0 not found";
		public static var ErrorPageUpdate:String = "Could not update the page changes of \"&0\"!";
		public static var ErrorUnknownView:String = "Unknown view &0 in source &1!"; 
		public static var ErrorLoadingModule:String = "Could not load module &0";
		public static var ErrorViewNoParent:String = "View &0 (&1) was created but has no parent";
		
		private var _message:String;
		private var _info:String;
		
				
		public function get info():String
		{
			return _info;
		}
		
		public function MYMError(message:String="", info:String = "", ... args)
		{	
			super(MYMMessage.createMessage(message, args), 0);
			this._info = info;
		}
		
	}
}