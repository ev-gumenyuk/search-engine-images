package searchengineimages {
	import searchengineimages.view.SearchImagesContext;

	import tuvisum.util.ArrayUtil;

	import unittest.UnitTestRunner;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class Main extends Sprite 
	{
		private var _context : SearchImagesContext;

		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event : Event) : void
		{
			_context = new SearchImagesContext(this);
			
			new UnitTestRunner();
			
			var concatedArray : Array = ArrayUtil.concat([1, 1, 3, 6, 89, 2, 106], [152, 4, 4, 3, 560]);
			trace('concatedArray: ' + (concatedArray));
		}
	}
}
