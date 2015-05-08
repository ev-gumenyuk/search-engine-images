package searchengineimages.view.components.ui
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class Alert extends Sprite
	{
		private static const MARGIN_TOP 		: int = 20;
		private static const MARGIN_LEFT 		: int = 60;
		private var _okButton 					: SimpleButton;
		private var _messageTF					: TextField;
		
		public function Alert()
		{
			createTextField();
			createOkButton();
		}
		
		private function createOkButton() : void
		{
			_okButton = new SimpleButton();
			_okButton.label = 'Ok';
			_okButton.addEventListener(MouseEvent.CLICK, onClickOkBtn);
			addChild(_okButton);
		}
		
		private function createTextField() : void
		{
			_messageTF = new TextField();
			_messageTF.textColor = 0xffffff;
			_messageTF.autoSize = TextFieldAutoSize.LEFT;
			_messageTF.x = MARGIN_LEFT;
			_messageTF.y = MARGIN_TOP;
			addChild(_messageTF);
		}

		private function drawBackground() : void
		{
			graphics.clear();
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(0x666666);
			graphics.drawRect(0, 0, _messageTF.width + MARGIN_LEFT * 2, _messageTF.height + MARGIN_TOP * 2 + 30);
			graphics.endFill();
		}
		
		private function alignOkButton() : void
		{
			_okButton.x = _okButton.y = 0;
			_okButton.x = width - _okButton.width >> 1;
			_okButton.y = height - _okButton.height - 10;
		}
		
		private function onClickOkBtn(event : MouseEvent) : void
		{
			parent.removeChild(this);
		}
		
		public function set message(_message : String) : void
		{
			_messageTF.text = _message;
			drawBackground();
			alignOkButton();
		}
	}
}
