package org.mymimir.sdk
{

	/**
	 * 	Helper class to manage a set of function handler. 
	 * @author stephansmola
	 * 
	 */	
	public class ConvFunctionHandlerManager
	{
		
		/**
		 * This holds a dictionary of all handers. This holds one handler once for each  
		 * function it supports. Therefore it is possible to replace a function handler for one specific
		 * function but still use it for others. 
		 */
		private var _handler:Object;
		
		
		
		/**
		 * Constructor. 
		 * 
		 */		
		public function ConvFunctionHandlerManager()
		{
			this._handler = new Object;
		}
		
		public function clear():void
		{
			this._handler = new Object();
		}

		
		/**
		 * Add a new function handler to the managed set. 
		 * @param handler	The function handler
		 * 
		 */
		public function addHandler(handler:IConvFunctionHandler):void
		{
			var funcs:Array = handler.converterFunctions;
			
			for each (var func:String in funcs)
			{
				this._handler[func] = handler;
			}
		}
		
		/**
		 * Get the function handler for a given function 
		 * @param func	The function name the handler is requested for
		 * @return 		The handler. Null when no handler was found
		 * 
		 */
		public function getHandlerForFunction(func:String):IConvFunctionHandler
		{
			return this._handler[func];
		}
		
		/**
		 * Process a function. This determines the proper handler for the given function and then
		 * uses that handler to process the function. 
		 * @param func		The name of the function to process
		 * @param param		The function parameter
		 * @return 			The result of the function. Null, when no handler was found.
		 * 
		 */
		public function processConverterFunction(func:String, param:String, converter:IConverter):String
		{
			var handler:IConvFunctionHandler = this.getHandlerForFunction(func);
			if (!handler) return null;
			return handler.processConverterFunction(func, param, converter);
		}

	}
}