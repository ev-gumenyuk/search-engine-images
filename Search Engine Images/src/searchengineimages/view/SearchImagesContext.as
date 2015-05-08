package searchengineimages.view {
	import searchengineimages.controller.SearchImagesCommand;
	import searchengineimages.controller.UpdateImagesListCommand;
	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.service.GoogleSearchImagesService;
	import searchengineimages.service.ISearchImagesService;
	import searchengineimages.signals.ClearImagesListSignal;
	import searchengineimages.signals.SearchImagesSignal;
	import searchengineimages.signals.ShowAlertSignal;
	import searchengineimages.signals.UpdateImageSignal;
	import searchengineimages.signals.UpdateImagesListSignal;
	import searchengineimages.signals.UpdateSearchInfoSignal;
	import searchengineimages.view.components.ImagesListView;
	import searchengineimages.view.components.SearchUIView;

	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;
	
	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SearchImagesContext extends SignalContext
	{
		private const VIEW_PACKAGE : String = 'searchengineimages.view.components';
		
		public function SearchImagesContext(contextView : DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			viewMap.mapPackage(VIEW_PACKAGE);
			
			mediatorMap.mapView(SearchUIView, SearchUIViewMediator);
			mediatorMap.mapView(ImagesListView, ImagesListViewMediator);
			
			injector.mapSingleton(UpdateImageSignal);
			injector.mapSingleton(ClearImagesListSignal);
			injector.mapSingleton(UpdateSearchInfoSignal);
			injector.mapSingleton(ShowAlertSignal);
			
			injector.mapSingleton(SearchImagesModel);
			
			injector.mapSingletonOf(ISearchImagesService, GoogleSearchImagesService);
			
			signalCommandMap.mapSignalClass(SearchImagesSignal, SearchImagesCommand);
			signalCommandMap.mapSignalClass(UpdateImagesListSignal, UpdateImagesListCommand);
			
			contextView.addChild(new ImagesListView());
			contextView.addChild(new SearchUIView());
			
			super.startup();
		}
	}
}