package org.mymimir.sdk
{
	import flash.display.DisplayObject;
	
	import mx.core.UIComponent;
	
	/**
	 * Interface of the pansophy application object. The application object manages the execution of the program,
	 * the loading of modules, the loading of Wikis and the handling of URLs. 
	 * @author stephansmola
	 * 
	 */	
	public interface IApplication
	{
		/**
		 * Init function. Is called from within the mxml files Window object. 
		 * 
		 */		
		function init():void;
		
		/**
		 * The application window 
		 * @return	The application window 
		 * 
		 */		
		function get appWindow():DisplayObject
		
		/**
		 * Read an xml from a file 
		 * @param file	URL of a file
		 * @return 		The XML, null if the XML is not well formed
		 * 
		 */		
		function readXMLFromFile(file:String):XML;
		
		function get backend():IWikiBackend;
		
		function get wiki():IWiki;
		
		/**
		 * 
		 * 
		 */
		function updateAppSettings():void;
		function loadAppSettings():void;
		function restoreLastState():void;
		function close():void;
		
		function addView(parent:UIComponent, name:String, source:String, description:XML):void
		
		function getConverterFunctionHandler(func:String):IConvFunctionHandler;
		function getViewFunctionHandler(func:String):IViewFunctionHandler;
		
		function getWikiSetting(attribute:String):String;
		function getDefaultWikiSetting(attribute:String):String;
		function getDefaultWikiSettings(name:String, firstPage:String):XML;
		function getWikiConverterSettings(type:String):XML;
		function getViewSettings(name:String):XML;
		function getConverterSettings(type:String):XML;
		function getWikiSyntaxDefinition():XML;
		function getSyntaxDefinition():XML;
		function getPageByURL(url:String):IWikiPage;
		function getCurrentPageName():String;
		function getCurrentWikiName():String;
		function getWikiStyleSheetURL():String;
		function setWikiStyleSheetURL(url:String):void;
		function getSyntaxGlobals():Object;
		function gotoURL(location:String):void;
		function searchWiki(query:String, resultCB:Function, ... args):void;
	}
}