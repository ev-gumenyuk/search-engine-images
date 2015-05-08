package searchengineimages.view.components 
{
	import searchengineimages.view.components.ui.Alert;
	import searchengineimages.view.components.ui.SimpleButton;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SearchUIView extends Sprite 
	{
		private static const DEFAULT_SEARCH_TEXT	: String = 'ukraine maidan';
		
		private var _searchBtn						: SimpleButton;
		private var _searchTF						: TextField;
		private var _alert							: Alert;
		private var _searchInfoTF					: TextField;
		
		public function SearchUIView()
		{
			createSearchTextField();
			createSearchButton();
			createSearchInfoTextField();
			createAlert();
		}

		private function createSearchTextField() : void
		{
			_searchTF = new TextField();
			_searchTF.type = TextFieldType.INPUT;
			_searchTF.border = true;
			_searchTF.width = 150;
			_searchTF.height = 23;
			_searchTF.text = DEFAULT_SEARCH_TEXT;
			addChild(_searchTF);
		}
		
		private function createSearchButton() : void
		{
			_searchBtn = new SimpleButton();
			_searchBtn.x = 165;
			_searchBtn.label = 'Search Images';
			addChild(_searchBtn);
		}
		
		private function createSearchInfoTextField() : void
		{
			_searchInfoTF = new TextField();
			_searchInfoTF.autoSize = TextFieldAutoSize.LEFT;
			_searchInfoTF.y = 50;
			addChild(_searchInfoTF);
		}
		
		private function createAlert() : void
		{
			_alert = new Alert();
		}
		
		public function showAlert(message : String) : void
		{
			_alert.message = message;
			_alert.x = stage.stageWidth - _alert.width >> 1;
			_alert.y = stage.stageHeight - _alert.height >> 1;
			addChild(_alert);
		}
		
		public function updateSearchInfo(info : String) : void
		{
			_searchInfoTF.text = info;
		}
		
		public function hideAlert() : void
		{
			removeChild(_alert);
		}
		
		public function get searchText() : String
		{
			return _searchTF.text;
		}

		public function get searchButton() : SimpleButton
		{
			return _searchBtn;
		}
		
		public function get alert() : Alert
		{
			return _alert;
		}
	}
}
