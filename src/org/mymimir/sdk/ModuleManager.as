package org.mymimir.sdk
{
	import org.mymimir.sdk.Modules.IMYMModule;
	
	public class ModuleManager
	{
		
		private var _modules:Array;
		
		public function ModuleManager()
		{
			this._modules = new Array();
		}
		
		public function clear():void
		{
			this._modules = new Array();
		}
		
		
		public function addModule(module:IMYMModule):void
		{
			this._modules.push(module);
		}
		
		
		public function cleanUp():void
		{
			for each (var module:IMYMModule in this._modules)
				module.cleanUp();
		}
		
		public function handlePaste():Boolean
		{
			var ret:Boolean = false;
			
			for each (var module:IMYMModule in this._modules)
			{
				ret = ret || module.handlePaste();
			}
			
			return ret;
		}

		public function handleSelectAll():Boolean
		{
			var ret:Boolean = false;
			
			for each (var module:IMYMModule in this._modules)
			{
				ret = ret || module.handleSelectAll();
			}
			
			return ret;
		}


	}
}