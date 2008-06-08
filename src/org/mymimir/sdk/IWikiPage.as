package org.mymimir.sdk
{
	import flash.events.IEventDispatcher;

	public interface IWikiPage extends IEventDispatcher
	{
		function get name():String;
		function get url():String;
		function update():void;
		function restore():Boolean;
		function get isChanged():Boolean;
		function get text():String;
		function set text(value:String):void;
		function store(dispatch:Boolean = true):void;
		function get links():Array;
		function get todos():Array;
		function rename(newName:String):Boolean;
		function replaceLinks(oldLink:String, newLink:String):void;	
	}
}