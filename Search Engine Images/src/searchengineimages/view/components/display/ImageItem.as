package searchengineimages.view.components.display 
{
	import com.greensock.TweenLite;

	import org.casalib.util.RatioUtil;

	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class ImageItem extends Sprite 
	{
		public static const WIDTH  	: int = 140;
		public static const HEIGHT  : int = 70; 
		private var _loader 		: Loader;
		private var _loaderContext 	: LoaderContext;
		private var _fullUrl 		: String;
		private var _imageHolder	: Sprite;
		private var _descriptionTF	: TextField;
		private var _itemNum		: int;
		
		public function ImageItem()
		{
			this.alpha = 0;
			
			_loader = new Loader();
			_loaderContext = new LoaderContext(true);
			
			_descriptionTF = new TextField();
			_descriptionTF.multiline = true;
			_descriptionTF.autoSize = TextFieldAutoSize.LEFT;
			_descriptionTF.x = WIDTH + 10;
			_descriptionTF.y = 10;
			
			_imageHolder = new Sprite();
			_imageHolder.buttonMode = true;
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			_loader.addEventListener(ErrorEvent.ERROR, onError);
		    _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		    _loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_imageHolder.addEventListener(MouseEvent.CLICK, onMouseClick);
			
			addChild(_imageHolder);
			addChild(_descriptionTF);
		}

		private function onLoaderComplete(event : Event) : void
		{
			var image : Bitmap = _loader.content as Bitmap;
			var newSize : Rectangle = RatioUtil.scaleToFit(new Rectangle(0, 0, image.width, image.height), new Rectangle(0, 0, WIDTH, HEIGHT));
			image.width = newSize.width;
			image.height = newSize.height;
			image.x = WIDTH - image.width >> 1;
			image.y = HEIGHT - image.height >> 1;
			image.smoothing = true;
			
			_imageHolder.addChild(image);
			
			TweenLite.to(this, .5, {delay : _itemNum * 0.1, alpha : 1});
		}
		
		private function onError(event : ErrorEvent) : void
		{
			trace('Error event: ' + (event));
		}
		
		private function onMouseClick(event : MouseEvent) : void
		{
			navigateToURL(new URLRequest(_fullUrl));
		}
		
		public function load(thumbUrl : String, itemNum : int) : void
		{
			_itemNum = itemNum;
			if(thumbUrl)
				_loader.load(new URLRequest(thumbUrl), _loaderContext);
		}
		
		public function set description(description : String) : void
		{
			if(description)
				_descriptionTF.htmlText;
		}
		
		public function set fullUrl(fullUrl : String) : void
		{
			_fullUrl = fullUrl;
		}
		
		public function destroy() : void
		{
			if(_imageHolder.numChildren)
			{
				var image : Bitmap = _imageHolder.getChildAt(0) as Bitmap;
				_imageHolder.removeChild(image);
				image.bitmapData.dispose();				
				image = null;
				this.alpha = 0;
			}
		}
	}
}
