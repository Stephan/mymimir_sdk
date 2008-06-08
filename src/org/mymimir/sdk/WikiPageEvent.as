package org.mymimir.sdk
{
	import flash.events.Event;

	public class WikiPageEvent extends Event
	{
		private var _page:IWikiPage;
		
		
		/**
		 * Constructor 
		 * @param type			Event type
		 * @param page			Page that sent the event
		 * @param bubbles		Bubbles
		 * @param cancelable	Cancelable
		 * 
		 */		
		public function WikiPageEvent(type:String, page:IWikiPage, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._page = page;
		}
		
				
		public function get page():IWikiPage
		{
			return _page;
		}
	
		
	}
}