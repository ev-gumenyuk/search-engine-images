package searchengineimages.service {
	import be.boulevart.google.ajaxapi.search.GoogleSearchResult;
	import be.boulevart.google.ajaxapi.search.images.GoogleImageSearch;
	import be.boulevart.google.ajaxapi.search.images.data.GoogleImage;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleApiEvent;

	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.signals.ShowAlertSignal;
	import searchengineimages.signals.UpdateSearchInfoSignal;

	import org.robotlegs.mvcs.Actor;
	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class GoogleSearchImagesService extends Actor implements ISearchImagesService 
	{
		private var _googleImageSearch : GoogleImageSearch;
		
		[Inject]
		public var searchImagesModel : SearchImagesModel;
		
		[Inject]
		public var showAlertSignal : ShowAlertSignal;
		
		[Inject]
		public var updateSearchInfoSignal : UpdateSearchInfoSignal;
		
		public function GoogleSearchImagesService() 
		{
			_googleImageSearch = new GoogleImageSearch();
            _googleImageSearch.addEventListener(GoogleApiEvent.IMAGE_SEARCH_RESULT, onImageSearchResults);
			_googleImageSearch.addEventListener(GoogleAPIErrorEvent.API_ERROR, onAPIError);
		}
			
		public function getImages(searchString : String = '') : void 
		{
            _googleImageSearch.search(searchString, searchImagesModel.currentPageIndex * searchImagesModel.totalPages);
		}
		
		private function onImageSearchResults(event : GoogleApiEvent) : void
		{
			var imageVO : ImageVO;
			var images : Vector.<ImageVO> = new Vector.<ImageVO>();
            var googleSearchResult : GoogleSearchResult = event.data as GoogleSearchResult;
			for each (var googleImage : GoogleImage in googleSearchResult.results)
			{
				imageVO = new ImageVO();
				imageVO.description = googleImage.title + '<br>Visit site: <font color="#0F4BE8"><u><a href="' + googleImage.originalContextUrl + '" target="blank">' + googleImage.visibleUrl + '</a></u></font>';
				imageVO.thumbUrl = googleImage.thumbUrl;
				imageVO.url = googleImage.url;
				images.push(imageVO);
			}
			
			updateSearchInfoSignal.dispatch('Search text: ' + searchImagesModel.searchText + '\n' + 
											'Estimated Number of Results: ' + googleSearchResult.estimatedNumResults + '\n' + 
											'Current page index: ' + googleSearchResult.currentPageIndex + '\n' +  
											'Number of pages: ' + googleSearchResult.numPages);
																
			searchImagesModel.totalPages = googleSearchResult.numPages;
			searchImagesModel.images = images;
        }
		
		private function onAPIError(event : GoogleAPIErrorEvent) : void
		{
			showAlertSignal.dispatch('An API error has occured: ' + event.responseDetails + '\nResponse status was: ' + event.responseStatus);
			if(event.responseStatus == 400)
			{
				searchImagesModel.currentPageIndex--;
				getImages(searchImagesModel.searchText);
			}
		}
	}
}
