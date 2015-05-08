package searchengineimages.signals {
	import searchengineimages.model.vo.ImageVO;

	import org.osflash.signals.Signal;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class UpdateImageSignal extends Signal 
	{
		public function UpdateImageSignal() 
		{
			super(ImageVO);
		}
	}
}
