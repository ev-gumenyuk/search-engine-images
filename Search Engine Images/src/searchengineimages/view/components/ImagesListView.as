package searchengineimages.view.components 
{
	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.view.components.display.ImageItem;
	import searchengineimages.view.components.ui.SimpleButton;

	import uk.co.bigroom.utils.ObjectPool;

	import flash.display.Sprite;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class ImagesListView extends Sprite 
	{
		private var _imagesListHolder	: Sprite;
		private var _previousBtn 		: SimpleButton;
		private var _nextBtn 			: SimpleButton;
		
		public function ImagesListView()
		{
			_imagesListHolder = new Sprite();
			_previousBtn = new SimpleButton();
			_nextBtn = new SimpleButton();
			
			_previousBtn.label = 'Previous';
			_nextBtn.label = 'Next';
			
			addChild(_imagesListHolder);
			addChild(_previousBtn);
			addChild(_nextBtn);
		}
		
		private function alignNaviButtons(y : int) : void
		{
			_previousBtn.y = _nextBtn.y = y;
			_nextBtn.x = _previousBtn.x + _previousBtn.width + 10;
		}
		
		public function addImage(imageVO : ImageVO) : void
		{
			var imageItem : ImageItem = ObjectPool.getObject(ImageItem);
			imageItem.description = imageVO.description;
			imageItem.fullUrl = imageVO.url;
			imageItem.load(imageVO.thumbUrl, _imagesListHolder.numChildren);
			imageItem.y = _imagesListHolder.numChildren * (ImageItem.HEIGHT + 10);
			_imagesListHolder.addChild(imageItem);
			
			alignNaviButtons(imageItem.y + ImageItem.HEIGHT + 30);
		}

		public function clear() : void
		{
			var imageItem : ImageItem;
			while(_imagesListHolder.numChildren > 0)
			{
				imageItem = _imagesListHolder.getChildAt(0) as ImageItem;
				imageItem.destroy();
				_imagesListHolder.removeChild(imageItem);
				ObjectPool.disposeObject(imageItem, ImageItem);
			}
		}

		public function get previousBtn() : SimpleButton
		{
			return _previousBtn;
		}

		public function get nextBtn() : SimpleButton
		{
			return _nextBtn;
		}
		
		public function get imagesCount() : int
		{
			return _imagesListHolder.numChildren;
		}
	}
}
