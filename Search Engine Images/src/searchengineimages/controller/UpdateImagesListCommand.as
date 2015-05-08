package searchengineimages.controller {
	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.signals.UpdateImageSignal;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class UpdateImagesListCommand extends SignalCommand 
	{
		[Inject]
		public var searchImagesModel : SearchImagesModel;
		
		[Inject]
		public var updateImageSignal : UpdateImageSignal;
		
		override public function execute():void
		{
			var imageVO : ImageVO;
			var i : int = -1;
			var len : int = searchImagesModel.images.length;
			while(++i < len)
			{
				imageVO = searchImagesModel.images[i];
				updateImageSignal.dispatch(imageVO);
			}
		}
	}
}
