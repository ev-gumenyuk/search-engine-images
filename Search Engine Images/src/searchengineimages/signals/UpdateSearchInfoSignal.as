package searchengineimages.signals {
	import org.osflash.signals.Signal;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class UpdateSearchInfoSignal extends Signal 
	{
		public function UpdateSearchInfoSignal() 
		{
			super(String);
		}
	}
}
