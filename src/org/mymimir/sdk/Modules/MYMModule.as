package org.mymimir.sdk.Modules
{
	import mx.modules.ModuleBase;
	
	import org.mymimir.sdk.IApplication;
	import org.mymimir.sdk.Modules.IMYMModule;

	public class MYMModule extends ModuleBase implements IMYMModule
	{
		public static const TypeView:String				= "Module.View";
		public static const TypeLocationHandler:String  = "Module.LocationHandler";
		public static const TypeConverter:String 		= "Module.Converter";
		public static const TypeViewFunctionHandler:String  = "Module.ViewFunctionHandler";
		public static const TypeConverterFunctionHandler:String  = "Module.ConvFunctionHandler";
		
		protected var _app:IApplication;
		
		public function MYMModule()
		{
			super();
		}
		
		public function init(app:IApplication, description:XML):void
		{
			this._app = app;
		}
		
		public function cleanUp():void
		{
			
		}
		
		public function handlePaste():Boolean
		{
			return false;
		}

		public function handleCopy():Boolean
		{
			return false;
		}

		public function handleCut():Boolean
		{
			return false;
		}

		public function handleSelectAll():Boolean
		{
			return false;
		}

		
	}
}