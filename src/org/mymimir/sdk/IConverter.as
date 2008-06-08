package org.mymimir.sdk
{
	/**
	 * Interface that describes a converter 
	 * @author stephansmola
	 * 
	 */	
	public interface IConverter
	{	
		/**
		 * The name of the converter 
		 * @return 
		 * 
		 */					
		function get name():String;
		
		/**
		 * Convert a text 
		 * @param text			Text to be converted
		 * @param escapeHTML
		 * @return 				Converted text
		 * 
		 */
		function convertText(text:String):String;
		function convertLine(line:String):String;
		
		function get prefix():String;
		function get suffix():String;
		function processFunctions(str:String):String;
	}
}