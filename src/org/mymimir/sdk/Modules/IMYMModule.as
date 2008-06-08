package org.mymimir.sdk.Modules
{
	import org.mymimir.sdk.IApplication;
	
	public interface IMYMModule
	{

		function init(app:IApplication, description:XML):void;
	
		function cleanUp():void;
		
		function handlePaste():Boolean;
		function handleCopy():Boolean;
		function handleCut():Boolean;
		function handleSelectAll():Boolean;

		
	}
}