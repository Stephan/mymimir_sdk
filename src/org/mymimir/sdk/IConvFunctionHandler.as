package org.mymimir.sdk
{
	/**
	 * Interfacce for function handler for functions called by the converter, e.g. {func:pagename}. 
	 * Function handler can add new functions or replace existing ones that the user can use in 
	 * the wiki code, like {func:date} 
	 * @author stephansmola
	 * 
	 */
	public interface IConvFunctionHandler
	{
		/**
		 * Get the functions the functionHandler supports 
		 * @return An array of strings returning the function names
		 * 
		 */
		function get converterFunctions():Array;
		
		/**
		 * Process a function and return the result 
		 * @param name		Name of the funciton to process
		 * @param param		Parameter
		 * @return 			The result as a string
		 * 
		 */		
		function processConverterFunction(name:String, param:String, converter:IConverter):String;
	}
}