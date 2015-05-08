package unittest {
	import asunit.framework.TestCase;

	import searchengineimages.model.vo.ImageVO;
	import searchengineimages.view.components.ImagesListView;
	
	/**
	 * @author Evgeniy Gumenyuk
	 */
    public class ViewTest extends TestCase 
	{
		private var _view : ImagesListView;
        
        public function ViewTest(methodName : String=null) 
		{
            super(methodName);
        }

        override protected function setUp():void 
		{
            super.setUp();
			_view = new ImagesListView();
			
			var imageVO : ImageVO = new ImageVO();
			_view.addImage(imageVO);
			_view.addImage(imageVO);
			_view.addImage(imageVO);
        }

        override protected function tearDown():void 
		{
            super.tearDown();
			_view = null;
        }

        public function testInstantiated():void 
		{
           assertTrue('_imagesListView is ImagesListView', _view is ImagesListView);
        }
		
		public function testAddedImagesCount():void 
		{
         	assertEquals(_view.imagesCount, 3);
        }
		
		public function testRemovedImagesCount():void 
		{
			_view.clear();
         	assertEquals(_view.imagesCount, 0);
        }
    }
}
