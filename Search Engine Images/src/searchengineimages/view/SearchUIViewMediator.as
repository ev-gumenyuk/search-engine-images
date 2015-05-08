package searchengineimages.view {
	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.service.ISearchImagesService;
	import searchengineimages.signals.SearchImagesSignal;
	import searchengineimages.signals.ShowAlertSignal;
	import searchengineimages.signals.UpdateSearchInfoSignal;
	import searchengineimages.view.components.SearchUIView;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SearchUIViewMediator extends Mediator implements IMediator 
	{
		[Inject]
		public var view : SearchUIView;
		
		[Inject]
		public var searchImagesModel : SearchImagesModel;
		
		[Inject]
		public var service : ISearchImagesService;
		
		[Inject]
		public var searchImagesSignal : SearchImagesSignal;
		
		[Inject]
		public var updateSearchInfoSignal : UpdateSearchInfoSignal;
		
		[Inject]
		public var showAlertSignal : ShowAlertSignal;

		override public function onRegister() : void 
		{	
			view.x = view.y = 20;
			
			addEventListeners();
			searchImagesRequest();
		}
		
		private function addEventListeners() : void
		{
			updateSearchInfoSignal.add(onUpdateSearchInfo);
			showAlertSignal.add(onShowAlert);
			
			view.searchButton.addEventListener(MouseEvent.CLICK, onClickSearchButton);
			view.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownComponent);
		}
		
		private function searchImagesRequest() : void
		{
			searchImagesModel.searchText = view.searchText;
			searchImagesModel.currentPageIndex = 0;
			searchImagesSignal.dispatch();
		}
		
		private function onClickSearchButton(event : MouseEvent) : void
		{
			searchImagesRequest();
		}
		
		private function onKeyDownComponent(event : KeyboardEvent) : void
		{
			switch (event.keyCode) 
			{
				case Keyboard.ENTER:
					 searchImagesRequest();
					 break;
				case Keyboard.ESCAPE:
					 if(view.contains(view.alert))
					 	view.hideAlert();
					 break;
			}
		}
		
		private function onUpdateSearchInfo(searchInfo : String) : void
		{
			view.updateSearchInfo(searchInfo);
		}
		
		private function onShowAlert(alert : String) : void
		{
			view.showAlert(alert);
		}
	}
}
