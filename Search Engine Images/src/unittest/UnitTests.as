package unittest {
	import asunit.framework.TestSuite;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class UnitTests extends TestSuite 
	{
		public function UnitTests() 
		{
			super();
			addTest(new ViewTest());
			addTest(new ModelTest());
			addTest(new ServiceTest());
		}
	}
}
