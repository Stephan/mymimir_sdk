package org.mymimir.sdk
{
	import mx.core.UIComponent;
	
	/**
	 * Helper class with some static methods that are handy everywhere 
	 * @author stephansmola
	 * 
	 */
	public class Tools
	{
		
		private static const RCDATAStrip:RegExp = /^[\s\r\n\t]*([^\s\n\r\t].*[^\s\n\r\t])[\s\r\n\t]*$/;
		private static const WSStrip:RegExp = /^[\s\t]*([^\s\t].*[^\s\t])[\s\t]*$/;
		private static const PctValue:RegExp = /^\s*(\d+(\.\d+)?)\%\s*$/;
		private static const IntValue:RegExp = /^\s*(\d+)\s*$/;
		
		private static const _weekDaysShort:Array = new Array("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat");
		private static const _weekDays:Array = 		new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
		private static const _monthsShort:Array = 	new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
		private static const _months:Array = 		new Array("January", "February", "March", "April", "May", "June", "July", 
												 			  "August", "September", "October", "November", "December");
												 			  
		private static const _regStrftime:RegExp = /\%[aAbBcCdDegGhHIjmMpSuwyY]/g;
		
		
		public function Tools()
		{
		}
		
		
		public static function CDATAStrip(str:String):String
		{
			return str.replace(Tools.RCDATAStrip, "$1");
		}


		public static function regExpForStringG(str:String):RegExp
		{
			return new RegExp(Tools.replaceMetaCharacters(str), "g");
		}

		public static function stripWhiteSpace(str:String):String
		{
			return str.replace(Tools.WSStrip, "$1");			
		}

		private static function replaceMetaCharacter(str:String, char:String):String
		{
			var re:RegExp = new RegExp("\\" + char, "g");
			return str.replace(re, "\\" + char);
		}

		public static function replaceMetaCharacters(str:String):String
		{
			str = Tools.replaceMetaCharacter(str, "\\");
			str = Tools.replaceMetaCharacter(str, "^");
			str = Tools.replaceMetaCharacter(str, "$");
			str = Tools.replaceMetaCharacter(str, ".");
			str = Tools.replaceMetaCharacter(str, "*");
			str = Tools.replaceMetaCharacter(str, "+");
			str = Tools.replaceMetaCharacter(str, "?");
			str = Tools.replaceMetaCharacter(str, "(");
			str = Tools.replaceMetaCharacter(str, ")");
			str = Tools.replaceMetaCharacter(str, "[");
			str = Tools.replaceMetaCharacter(str, "]");
			str = Tools.replaceMetaCharacter(str, "{");
			str = Tools.replaceMetaCharacter(str, "}");
			str = Tools.replaceMetaCharacter(str, "|");
			
			return str;			
		}
		
		
		
		public static function leading(str:String, lead:String, maxL:Number):String
		{
			var ret:String = int(Math.pow(10, maxL - str.length + 1)).toString();
			ret = ret.replace("0", lead.charAt(0));
			return ret + str;
		}
		
		public static function leadingZero(str:String, maxL:Number):String
		{
			var ret:String = int(Math.pow(10, maxL - str.length)).toString().substr(1);
			return ret + str;
		}
		
		
//aAbBcCdDegGhHIjmMpSuwyY		
		/**
		 * %a: Weekday as short text 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timea(d:Date):String { return Tools._weekDaysShort[d.day]; }	
		
		/**
		 * %A: Weekday as full text. 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeA(d:Date):String { return Tools._weekDays[d.day]; }	
		
		/**
		 * %b: Month as short text 
		 * @param d
		 * @return 
		 * 
		 */
		private static function timeb(d:Date):String { return Tools._monthsShort[d.month]; }	
		
		/**
		 * %B: Month as long text 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeB(d:Date):String { return Tools._months[d.month]; }	
		
		private static function timec(d:Date):String { return ""; }	
		
		/**
		 * %C: Century 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeC(d:Date):String { return int(d.fullYear / 100).toString(); }	
		
		/**
		 * %d: Day of month with leading zero 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timed(d:Date):String { return Tools.leadingZero(int(d.date).toString(), 2); }	
		
		/**
		 *  
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeD(d:Date):String { return ""; }	
		
		/**
		 * %e: Day of month leading spaces 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timee(d:Date):String { return Tools.leading(d.date.toString(), " ", 2); }	
		private static function timeg(d:Date):String { return ""; }	
		private static function timeG(d:Date):String { return ""; }	
		private static function timeh(d:Date):String { return Tools.timeb(d); }	
		
		/**
		 * %H: Hours 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeH(d:Date):String { return Tools.leadingZero(d.hours.toString(), 2); }	
		private static function timeI(d:Date):String { return Tools.leadingZero(int(d.hours % 12).toString(), 2); }	
		private static function timej(d:Date):String { return ""; }	
		
		/**
		 * %m Month 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timem(d:Date):String { return Tools.leadingZero(int(d.month + 1).toString(), 2); }	
		
		/**
		 * %M Minutes 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeM(d:Date):String { return d.minutes.toString(); }	
		private static function timep(d:Date):String { if (d.hours < 12) return "a.m."; return "p.m."; }	
		
		/**
		 * %S Seconds 
		 * @param d
		 * @return 
		 * 
		 */		
		private static function timeS(d:Date):String { return d.seconds.toString(); }	
		private static function timeu(d:Date):String { if (!d.day) return "7"; return d.day.toString(); }	
		private static function timew(d:Date):String { return d.day.toString(); }	
		private static function timey(d:Date):String { return d.fullYear.toString().substr(2); }
		private static function timeY(d:Date):String { return d.fullYear.toString(); }
		
		
		public static function strftime(str:String, time:Number = -1):String
		{
			var strft:String = str;
			var date:Date = new Date();
			var fmtChars:Array = str.match(Tools._regStrftime);
			if (time != -1) date.setTime(time);
			
			for each (var ch:String in fmtChars)
			{
				var cstr:String = Tools["time" + ch.charAt(1)](date);
				strft = strft.replace(ch, cstr);
			}
			
			return strft;
		}
		
		
		private static function getAttrString(xml:XML, attribute:String):String
		{
			var attrXL:XMLList = xml.attribute(attribute);
			if ((!attrXL) || (!attrXL.length())) return null;
			
			return attrXL[0].toString();
			
		}
		
		public static function getBooleanFromXMLAttribute(xml:XML, attribute:String):Boolean
		{
			var attrXL:XMLList = xml.attribute(attribute);
			if ((!attrXL) || (!attrXL.length())) return false;
			
			var attrStr:String = attrXL[0].toString();
			if ((!attrStr) || (attrStr == "") || (attrStr != "true")) return false
			else return true;
			
		}
		
		public static function getIntFromXMLAttribute(xml:XML, attribute:String):int
		{
			var attrStr:String = getAttrString(xml, attribute);
			if (!attrStr) throw new TypeError;
			if (attrStr.match(Tools.IntValue))	return parseInt(attrStr);
			throw new TypeError;
		}

		public static function getStringFromXMLAttribute(xml:XML, attribute:String):String
		{
			return getAttrString(xml, attribute);
		}

		
		public static function getPctValueFromXMLAttribute(xml:XML, attribute:String):int
		{
			var attrStr:String = getAttrString(xml, attribute);
			if (!attrStr) throw new TypeError;
			if (attrStr.match(Tools.PctValue)) 
				return parseInt(attrStr.replace(Tools.PctValue, "$1"));
			throw new TypeError;
		}
		
		public static function setWidthFromAttribute(uiComp:UIComponent, xml:XML, attribute:String):void
		{
			var val:int;
			try
			{
				val = Tools.getPctValueFromXMLAttribute(xml, attribute);
				uiComp.percentWidth = val;
			}
			catch(e:TypeError)
			{
				try
				{
					val = Tools.getIntFromXMLAttribute(xml, attribute);
					uiComp.width = val;
				}
				catch(e:TypeError)
				{}
			}
		}
		
		public static function getUniqueFileName(ext:String):String
		{
			var t:Number = new Date().time;
			
			return t.toString() + "." + ext;
		}

		public static function cdata(data:String):XML
		{
			return new XML("<![CDATA[" + data + "]]>");
		}
	}
}