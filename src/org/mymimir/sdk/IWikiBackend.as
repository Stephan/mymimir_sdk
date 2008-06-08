package org.mymimir.sdk
{
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	public interface IWikiBackend extends IEventDispatcher
	{
		/**
		 * Set the current wiki to the backend 
		 * @param value	The wiki
		 * 
		 */		
		function set wiki(value:IWiki):void;
		
		/**
		 * Open Wiki. 
		 * @return True if successfull
		 * 
		 */		
		function open():Boolean;
		
		/**
		 * Prompt the user to open a wiki. Could be a directory list or somthing similar. 
		 * @param resultCB	Function to call upon completion of the task
		 * @param args		Any arguments to pass on to that function
		 * 
		 */		
		function promptForOpen(resultCB:Function, ... args):void;
		
		/**
		 * Create wiki 
		 * @return True if successfull
		 * 
		 */		
		function create():Boolean;
		
		/**
		 * Close wiki. True if successfull 
		 * 
		 * 	Callback signature:
		 * 		function resultCB(success:Boolean, ... args);
		 * 
		 * @param resultCB	Callback to invoke upon completion
		 * @param args		Optional arguments to pass through to the callback
		 * 
		 */		
		function close(resultCB:Function = null, ... args):void;
		
		function getWikiSettings(resultCB:Function = null, ... args):void;
		function setWikiSettings(settings:XML, resultCB:Function = null, ... args):void;
		function getWikiSettingsURL():String;
		
		function checkPageExists(name:String):Boolean;
		function getPageText(name:String, resultCB:Function = null, ... args):void;
		function setPageText(name:String, content:String, resultCB:Function = null, ... args):void;
		function renamePage(oldName:String, newName:String, resultCB:Function = null, ... args):void;
		function deletePage(name:String, resultCB:Function = null, ... args):void;
		
		function storePageData(page:IWikiPage, resultCB:Function = null, ... args):void;
		
		function getPages(resultCB:Function = null, ... args):void;
		function getPagesByFilter(filter: String, resultCB:Function = null, ... args):void;
		function getTodos(resultCB:Function = null, ... args):void;
		function getNotLinkedPages(resultCB:Function = null, ... args):void;
		function getPageLinks(name:String, resultCB:Function = null, ... args):void;
		function getAllPageLinks(resultCB:Function = null, ... args):void;
		function getLinkeByPages(name:String, resultCB:Function = null, ... args):void;
		
		
		function searchFullText(query:String, resultCB:Function = null, ... args):void;
		
		function storeArbData(storageName:String, key:Object, data:Object, resultCB:Function = null, ... args):void;
		function getArbData(storageName:String, key:Object, resultCB:Function = null, ... args):void;
		
		function storeFileInData(file:File, resultCB:Function = null, ... args):String;
		function storeBytesAsFileInData(bytes:ByteArray, extension:String, resultCB:Function = null, ... args):String;
		function getDataURLForFilename(filename:String):String;
		function getFilenameFromDataURL(url:String):String;
		function getUniqueFilename(extension:String):String;
		
		function getStylesheetURL():String;
	}
}