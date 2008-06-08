package org.mymimir.sdk
{
	import flash.display.DisplayObject;
	
	import org.mymimir.sdk.Components.Dialogs.MYMDialog;
	import org.mymimir.sdk.Components.Dialogs.MYMDialogMessage;
	
	public class MYMMessage
	{		
		public static const YES:int = 1;
		public static const NO:int = 0;
		
		public static var MessagePageExists:String = "A page with the name &0 already exists";
		public static var MessageMultipleRootViews:String = "You have defined &0 root views for this Wiki\n" + 
															"in your wiki settings. This is not supported.\n" + 
															"Only the first view will be displayed.\n\n" + 
															"Consider using a composite view like \n" + 
															"org.mymimir.tripleView to collect multiple views."; 
		
		private var _answer:int;
		
		
		public function MYMMessage()
		{
		}
		
		
		public function get answer():int
		{
			return _answer;
		}

		public static function createMessage(text:String, args:Array):String
		{
			var ret:String = text;
			
			for (var i:int = 0; i < args.length; i++)
			{
				var reg:RegExp = new RegExp("&" + i.toString(), "g");
				ret = ret.replace(reg, args[i]);
			}
			
			return ret;
		}
		
		public static function popUpToInform(parent:DisplayObject, title:String, message:String, ... args):void
		{
			var mess:MYMMessage = new MYMMessage();
			mess.doPopUpToInform(parent, title, MYMMessage.createMessage(message, args));	
		}
		
		
		public static function popUpYesNo(parent:DisplayObject, title:String, message:String, yesCB:Function, noCB:Function, ... args):void
		{
			var mess:MYMMessage = new MYMMessage();
			mess.doPopUpYesNo(parent, title, MYMMessage.createMessage(message, args), yesCB, noCB);	
		}

		public static function popUpYesNoSync(parent:DisplayObject, title:String, message:String, ... args):MYMMessage
		{
			var mess:MYMMessage = new MYMMessage();
			mess.doPopUpYesNo(parent, title, MYMMessage.createMessage(message, args), mess.yesCB, mess.noCB);
			return mess;	
		}
		

		private function yesCB():void
		{
			this._answer = MYMMessage.YES;
		}

		private function noCB():void
		{
			this._answer = MYMMessage.NO;
		}

				
		private function doPopUpYesNo(parent:DisplayObject, title:String, message:String, yesCB:Function, noCB:Function):void
		{
			var md:MYMDialogMessage = new MYMDialogMessage();
			md.init2Btn(title, message, "Yes", "No", yesCB, noCB);	
			md.popUpModal(parent);
		}
		
		
		private function onClickOk(dialog:MYMDialog):void
		{
			dialog.close();
		}
		
		private function doPopUpToInform(parent:DisplayObject, title:String, message:String):void
		{
			var md:MYMDialogMessage = new MYMDialogMessage();
			md.initOk(title, message, this.onClickOk);
			md.popUpModal(parent);
		}


	}
}