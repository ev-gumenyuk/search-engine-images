package searchengineimages.signals {
	import org.osflash.signals.Signal;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class ShowAlertSignal extends Signal 
	{
		public function ShowAlertSignal() 
		{
			super(String);
		}
	}
}
