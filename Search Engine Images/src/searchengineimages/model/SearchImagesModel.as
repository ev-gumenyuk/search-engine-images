package searchengineimages.model {
	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.signals.ClearImagesListSignal;
	import searchengineimages.signals.UpdateImagesListSignal;

	import org.casalib.util.StringUtil;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SearchImagesModel extends Actor 
	{
		private var _searchText			: String;
		private var _currentPageIndex	: int;		
		private var _totalPages			: int;			
		private var _images				: Vector.<ImageVO>;		
		
		[Inject]
		public var updateImagesListSignal : UpdateImagesListSignal;
		
		[Inject]
		public var clearImagesListSignal : ClearImagesListSignal;
		
		public function SearchImagesModel() 
		{
		}
		
		public function get searchText() : String
		{
			return _searchText;
		}
		
		public function set searchText(searchText : String) : void
		{
			_searchText = StringUtil.trim(searchText);
		}
		
		public function get currentPageIndex() : int
		{
			return _currentPageIndex;
		}
		
		public function set currentPageIndex(currentPageIndex : int) : void
		{
			_currentPageIndex = currentPageIndex < 0 ? 0 : currentPageIndex;
		}

		public function get totalPages() : int
		{
			return _totalPages;
		}

		public function set totalPages(totalPages : int) : void
		{
			_totalPages = totalPages;
		}

		public function get images() : Vector.<ImageVO>
		{
			return _images;
		}

		public function set images(images : Vector.<ImageVO>) : void
		{
			_images = images;
			clearImagesListSignal.dispatch();
			updateImagesListSignal.dispatch();
		}
	}
}
