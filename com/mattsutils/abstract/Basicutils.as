package com.mattsutils.abstract{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import flash.utils.ByteArray;

	public class Basicutils {

		// Constants:
		// Public Properties:
		// Private Properties:

		// Initialization:
		public function Basicutils() {
			if (getQualifiedClassName(this)=="common.abstract::ExtendedMaths") {
				//CAN'T LET YOU INSTANTIAT THAT, STAR FAWKS
				throw new IllegalOperationError("Utilities cannot be instantiated directly. It's an Abstract class.");
			}
		}
		public static function moveThis($this:DisplayObject, $here:Point):void {
			$this.x=$here.x;
			$this.y = $here.y
			;
		}
		public static function dreplace(descinput, dparams):String {
			var i:int=-1;
			var n:int=dparams.length;
			var pattern:RegExp;
			var doutput:String=descinput;
			while ( ++ i < n ) {
				pattern=new RegExp("%"+i,"sg");
				doutput=doutput.replace(pattern,dparams[i]);
			}
			return doutput;
		}


		public static function clone(source:Object):* {
			var myBA:ByteArray = new ByteArray();
			myBA.writeObject(source);
			myBA.position=0;
			return (myBA.readObject());
		}

		// Public Methods:
		// Protected Methods:
	}

}