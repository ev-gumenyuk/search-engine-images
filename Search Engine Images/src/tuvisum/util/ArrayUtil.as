package tuvisum.util
{
	/**
	 * @author Evgeniy Gumenyuk
	 */
	public class ArrayUtil
	{
		/**
		 * Method that takes two sorted arrays of integers
		 * (can be of any range, numbers can repeat, sizes of arrays can be different)
		 * and returns array of n + m length which is sorted in the same order
		 */
		public static function concat(a : Array, b : Array) : Array
		{
			var concated : Array = []; 
			var aLength : int = a.length;
			var bLength: int = b.length;
			var i : int = 0;
			var j : int = 0;
			
			for(var k : int = 0; k < aLength + bLength; k++)
			{
				if(i >= aLength)
				{
					concated[k] = b[j];
					j++;
				}
				else if(j >= bLength)
				{
					concated[k] = a[i];
					i++;
				}
				else
				{
					if(a[i] < b[j])
					{
						concated[k] = a[i];
						i++;
					}
					else
					{
						concated[k] = b[j];
						j++;
					}
				}
			}
			return concated;
		}
	}
}
