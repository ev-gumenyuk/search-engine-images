package searchengineimages.controller {
	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.service.ISearchImagesService;
	import searchengineimages.signals.SearchImagesSignal;
	import searchengineimages.signals.ShowAlertSignal;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SearchImagesCommand extends SignalCommand 
	{
		[Inject]
		public var service : ISearchImagesService;
		
		[Inject]
		public var searchImagesModel : SearchImagesModel;
		
		[Inject]
		public var showAlertSignal : ShowAlertSignal;
		
		[Inject]
		public var searchImages : SearchImagesSignal;
		
		override public function execute() : void
		{
			if (searchImagesModel.searchText != '')
				service.getImages(searchImagesModel.searchText);
			else
				showAlertSignal.dispatch('Please fill the correct text in the search box');
		}
	}
}
