package org.mymimir.sdk
{
	import org.mymimir.sdk.IConverter;
	
	/**
	 * Factory class to create converters. 
	 * @author stephansmola
	 * 
	 */	
	public class ConverterFactory
	{
		private static var _instance:ConverterFactory;
		
		/**
		 * The converters the factory can create. This is a dictionary name: creatorFunction()
		 */
		private static var _converters:Object = new Object();
		
		/**
		 * The converters the factory already has created. For every type only one converter will be created.
		 * This keeps the instances for further requests. 
		 */		
		private static var _createdConverters:Object = new Object();
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function ConverterFactory()
		{
		}
		
		
		/**
		 * Add a converter to the factory.
		 * @param name		String representing the type of the converter. Already registered converters will be replaced
		 * @param creator	String identifier of the converter.
		 * 
		 */
		public static function addConverterType(name:String, creator:Function):void
		{
			_converters[name] = creator;	
		}
		
		
		/**
		 * Get a converter instance. there's always only one instance of a specific converter
		 * @param name	String identifier of the converter requested
		 * @return 		Converter instance
		 * 
		 */		
		public static function getConverter(name:String):IConverter
		{
			// Check if we already have a converter of this name
			var conv:IConverter = _createdConverters[name];
			if (conv) return conv;
			
			// See if a converter of this name is registered. If so we'll have a creator function for it 
			var cr:Object = _converters[name] as Function;
			if (!cr) return null;
			
			// Create the converter using the registered creator function
			conv = cr();
			
			// If successfully created remember for further reference
			if (conv)
				_createdConverters[name] = conv;
				
			return conv;
		} 
		
		/**
		 * Clears all previously created instances in order to create new ones on request 
		 * 
		 */		
		public static function clear():void
		{
			_createdConverters = new Object();
		}
	}

}