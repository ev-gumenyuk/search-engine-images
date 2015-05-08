package searchengineimages.view.components.ui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class SimpleButton extends Sprite
	{
		private static const MARGIN_TOP 	: int = 2;
		private static const MARGIN_LEFT 	: int = 20;
		private var _labelTF				: TextField;
		
		public function SimpleButton()
		{
			_labelTF = new TextField();
			_labelTF.x = MARGIN_LEFT;
			_labelTF.y = MARGIN_TOP;
			_labelTF.autoSize = TextFieldAutoSize.LEFT;
			_labelTF.mouseEnabled = false;
			
			label= 'Label';
			buttonMode = true;
			
			addChild(_labelTF);
		}
		
		private function drawBackground() : void
		{
			graphics.clear();
			graphics.lineStyle(1, 0x666666);
			graphics.beginFill(0xEEEEEE);
			graphics.drawRect(0, 0, _labelTF.width + MARGIN_LEFT * 2, _labelTF.height + MARGIN_TOP * 2);
			graphics.endFill();
		}

		public function set label(_label : String) : void
		{
			_labelTF.text = _label;
			drawBackground();
		}
	}
}
