package unittest {
	import asunit.framework.TestCase;

	import searchengineimages.model.SearchImagesModel;
	import searchengineimages.service.GoogleSearchImagesService;
	import searchengineimages.signals.ClearImagesListSignal;
	import searchengineimages.signals.UpdateImagesListSignal;
	import searchengineimages.signals.UpdateSearchInfoSignal;
	
	/**
	 * @author Evgeniy Gumenyuk
	 */
    public class ServiceTest extends TestCase 
	{
		private var _model : SearchImagesModel;
		private var _service : GoogleSearchImagesService;
        
        public function ServiceTest(methodName : String = null) 
		{
            super(methodName);
        }

        override protected function setUp() : void 
		{
            super.setUp();
			_model = new SearchImagesModel();
			_model.clearImagesListSignal = new ClearImagesListSignal();
			_model.updateImagesListSignal = new UpdateImagesListSignal();
			_model.currentPageIndex = 0;
			_service = new GoogleSearchImagesService();
			_service.searchImagesModel = _model;
			_service.updateSearchInfoSignal = new UpdateSearchInfoSignal();
			_service.getImages('cars');
        }

        override protected function tearDown() : void 
		{
            super.tearDown();
			_model = null;
			_service = null;
        }

        public function testInstantiated() : void 
		{
           assertTrue('_model is SearchImagesModel', _model is SearchImagesModel);
		   assertTrue('_service is GoogleSearchImagesService', _service is GoogleSearchImagesService);
        }
		
		public function testLoadedImages() : void 
		{
        	var handler : Function = addAsync(testLoadedImagesHandler, 3000);
			_model.updateImagesListSignal.add(handler);
        }
		
		private function testLoadedImagesHandler() : void
		{
			assertTrue('_model.images.length > 0', _model.images.length > 0);
		}
    }
}
