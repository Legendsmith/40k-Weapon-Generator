package com.mattsutils.abstract{
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;

	public class ExtendedMaths {

		// Constants:
		// Public Properties:
		// Private Properties:

		// Initialization:
		public function ExtendedMaths() {
			if (getQualifiedClassName(this)=="common.abstract::ExtendedMaths") {
				//CAN'T LET YOU INSTANTIAT THAT, STAR FAWKS
				throw new IllegalOperationError("ExtendedMaths cannot be instantiated directly. It's an Abstract class.");
			}
		}

		// Public Methods:
		public static function negPostest(val:Number) {
			if (val>0) {
				return 1;
			} else if (val<0) {
				return -1;
			} else {
				return 0;
			}
		}
		public static function distanceGetPoint(pointOne:Point, pointTwo:Point):Number {
			var subtracted:Point=pointOne.subtract(pointTwo);
			return subtracted.length;
		}
		public static function makePoint(obj:DisplayObject):Point {
			var thePoint=new Point(obj.x,obj.y);
			return thePoint;
		}
		public static function average(numArray:Array):Number {
			var total:Number=0;
			var _result:Number=0;
			for (var i:int = 0; i <numArray.length; i++) {
				total=total+numArray[i];
			}
			return total/numArray.length;
		}
	}


}