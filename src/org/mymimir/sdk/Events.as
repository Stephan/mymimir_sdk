package org.mymimir.sdk
{
	/**
	 * Common events that occur during the execution of pansophy. 
	 * @author stephansmola
	 * 
	 */	
	public class Events
	{
		/**
		 * A new Wiki was created 
		 */		
		[Event] public static const WIKI_NEW:String = "Wiki.New";
		
		/**
		 * A Wiki was loaded 
		 */		
		[Event] public static const WIKI_LOADED:String = "Wiki.Loaded";
		
		/**
		 * The Wiki has been changed. Either page changed or created or deleted. 
		 */
		[Event] public static const WIKI_CHANGED:String = "Wiki.Changed";
		
		/**
		 * A page was loaded by the wiki 
		 */
		[Event] public static const WIKI_PAGE_LOADED:String = "Wiki.PageLoaded";	
		
		/**
		 * The Wiki was closed 
		 */
		[Event] public static const WIKI_CLOSED:String = "Wiki.Closed";
		
		/**
		 * The Wiki page has changed 
		 */
		[Event] public static const WIKIPAGE_CHANGED:String = "WikiPage.Changed";
		
		/**
		 * The Wiki page requests an update 
		 */
		[Event] public static const WIKIPAGE_UPDATE:String = "WikiPage.Update";
		
		/**
		 * The Wiki page was stored 
		 */		
		[Event] public static const WIKIPAGE_STORED:String = "WikiPage.Stored";
		
		/**
		 * The Wiki page requests storage 
		 */
		[Event] public static const WIKIPAGE_STORE_REQUESTED:String = "WikiPage.StoreRequested";
		
		
		/**
		 * The Wiki page was loaded 
		 */
		[Event] public static const WIKIPAGE_LOADED:String = "WikiPage.Loaded";
		
		/**
		 * The Wiki page was created 
		 */
		[Event] public static const WIKIPAGE_CREATED:String = "WikiPage.Created";

		/**
		 * Location has changed. 
		 */
		[Event] public static const VIEW_LOCATION_CHANGE:String = "MYMView.LocationChange";
		
		/**
		 * A view demands to be displayed 
		 */
		[Event] public static const VIEW_DEMAND_DISPLAY:String = "MYMView.DemandDisplay";


		[Event] public static const BACKEND_ERROR_FAILED_TO_OPEN:String = "Backend.FailedToOpen";
		[Event] public static const BACKEND_ERROR_FAILED_TO_CREATE:String = "Backend.FailedToCreate";



		[Event] public static const VIEWSETUP_FINISH:String 	= "Wiki.ViewsetupFinish";
		[Event] public static const VIEWSETUP_CLOSE_VIEW:String = "Wiki.ViewsetupCloseView";
		[Event] public static const VIEWSETUP_MOVE_LEFT:String 	= "Wiki.ViewsetupMoveLeft";
		[Event] public static const VIEWSETUP_MOVE_RIGHT:String = "Wiki.ViewsetupMoveRight";
		[Event] public static const VIEWSETUP_MOVE_UP:String 	= "Wiki.ViewsetupMoveUp";
		[Event] public static const VIEWSETUP_MOVE_DOWN:String 	= "Wiki.ViewsetupMoveDown";


		public function Events()
		{
		}

	}
}