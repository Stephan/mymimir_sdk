package org.mymimir.sdk.Views
{
	
	import org.mymimir.sdk.IApplication;
	import org.mymimir.sdk.IURLHandler;
	import org.mymimir.sdk.IWiki;
	import org.mymimir.sdk.IWikiPage;
	
	public interface IMYMView extends IURLHandler
	{

		function dispose():void;
		function init(app:IApplication, description:XML):void;
		
		function set wiki(wiki:IWiki):void;
		function get title():String;
		function get name():String;
		function get displayed():Boolean;
		
		function get description():XML;
		
		function get wikiPage():IWikiPage;
		function doOnLeave():void;
		function doOnEnter():void;		
		
		function enableViewSetupMode():void;
		function disableViewSetupMode():void;
	}
}