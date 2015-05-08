package searchengineimages.view {
	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.signals.ClearImagesListSignal;
	import searchengineimages.signals.SearchImagesSignal;
	import searchengineimages.signals.UpdateImageSignal;
	import searchengineimages.view.components.ImagesListView;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class ImagesListViewMediator extends Mediator implements IMediator 
	{
		[Inject]
		public var view : ImagesListView;
		
		[Inject]
		public var searchImagesModel : SearchImagesModel;
		
		[Inject]
		public var searchImagesSignal : SearchImagesSignal;
		
		[Inject]
		public var updateImageSignal : UpdateImageSignal;
		
		[Inject]
		public var clearImagesListSignal : ClearImagesListSignal;
		
		override public function onRegister() : void 
		{	
			view.x = 360;
			view.y = 20;
			
			addEventListeners();
		}
		
		private function addEventListeners() : void
		{
			updateImageSignal.add(onUpdateImage);
			clearImagesListSignal.add(onClearImagesList);
			
			view.previousBtn.addEventListener(MouseEvent.CLICK, onClickPrevBtn);
			view.nextBtn.addEventListener(MouseEvent.CLICK, onClickNextBtn);
		}
		
		private function onUpdateImage(imageVO : ImageVO) : void
		{
			view.addImage(imageVO);	
		}
		
		private function onClearImagesList() : void
		{
			view.clear();
		}

		private function onClickPrevBtn(event : MouseEvent) : void
		{
			searchImagesModel.currentPageIndex--;
			searchImagesSignal.dispatch();
		}
		
		private function onClickNextBtn(event : MouseEvent) : void
		{
			searchImagesModel.currentPageIndex++;
			searchImagesSignal.dispatch();
		}
	}
}
