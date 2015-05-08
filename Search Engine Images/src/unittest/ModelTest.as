package unittest {
	import asunit.framework.TestCase;

	import searchengineimages.model.SearchImagesModel;
	
	/**
	 * @author Evgeniy Gumenyuk
	 */
    public class ModelTest extends TestCase 
	{
		
		private var _model : SearchImagesModel;
        
        public function ModelTest(methodName:String=null) 
		{
            super(methodName);
        }

        override protected function setUp():void 
		{
            super.setUp();
			_model = new SearchImagesModel();
			_model.currentPageIndex = 0;
        }

        override protected function tearDown():void 
		{
            super.tearDown();
			_model = null;
        }

        public function testInstantiated():void 
		{
           assertTrue('_searchImagesModel is SearchImagesModel', _model is SearchImagesModel);
        }
		
		public function testIncreaseCurrentPageIndex():void 
		{
			_model.currentPageIndex++;
			_model.currentPageIndex++;
			_model.currentPageIndex++;
        	assertEquals(_model.currentPageIndex, 3);
        }
		
		public function testВecreaseCurrentPageIndex():void 
		{
			_model.currentPageIndex--;
			_model.currentPageIndex--;
			_model.currentPageIndex--;
			_model.currentPageIndex--;
			_model.currentPageIndex--;
        	assertEquals(_model.currentPageIndex, 0);
        }
    }
}
