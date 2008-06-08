package org.mymimir.sdk
{
	import flash.events.IEventDispatcher;
	
	public interface IWiki extends IEventDispatcher
	{
		function load():void;
		function create():void;
		function close():void;
		
		function get backend():IWikiBackend;
		/**
		 * load the first page of the wiki. 
		 * 
		 */		
		function loadFirstPage():void;

		function get currentPage():IWikiPage;
		function get url():String;
		function get name():String;
		function set styleSheetURL(url:String):void;
		function get styleSheetURL():String
		function get settings():XML;
		function set settings(value:XML):void;
		function getTodos(resultCB:Function = null):void;
		function get todos():Array;
		
		function get firstPage():String;
		function set firstPage(value:String):void;
		
		function get initialPageText():String;
		function set initialPageText(value:String):void;
		
		function getConverterSettings(type:String):XML;
		function getSyntax():XML;
		function getSetting(attribute:String):String;
		function getViewSettings(name:String):XML;
		function gotoPageByUrl(url:String):Boolean;
		function getPageInstance(name:String):IWikiPage;
		
		function renameCurrenPage(newName:String, replaceReferences:Boolean):void;
		function search(query:String, resultCB:Function):void;
		
		
		function getPagesFiltered(start:String = "", resultCB:Function = null):void;
	}
}