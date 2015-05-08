package unittest {
	import asunit.textui.TestRunner;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class UnitTestRunner extends TestRunner {
		public function UnitTestRunner() {
			start(UnitTests, null, TestRunner.SHOW_TRACE);
		}
	}
}
