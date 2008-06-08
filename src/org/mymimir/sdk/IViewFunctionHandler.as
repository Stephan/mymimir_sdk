package org.mymimir.sdk
{
	public interface IViewFunctionHandler
	{
		/**
		 * Get the functions the functionHandler supports 
		 * @return An array of strings returning the function names
		 * 
		 */
		function get viewFunctions():Array;
		
		/**
		 * Process a function and return the result 
		 * @param name		Name of the funciton to process
		 * @param param		Parameter
		 * @return 			The result as a string
		 * 
		 */		
		function processViewFunction(name:String, arguments:Array):Object;

	}
}