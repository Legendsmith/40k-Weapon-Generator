package {
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.display.MovieClip;
	import fl.controls.Button;
	import flash.events.MouseEvent;
	import flash.geom.Transform;
	import flash.ui.Mouse;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.geom.Point;

	import flash.utils.ByteArray;

	//net stuff
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLLoaderDataFormat;
	import com.mattsutils.abstract.Basicutils;

	public class V2_main extends MovieClip {

		// Constants:
		// Public Properties:
		public var jsonLoader:URLLoader;
		public var loadphase:int;
		public var jsonRequest:URLRequest;
		public var classRequest:URLRequest;
		public var typeRequest:URLRequest;
		public var defobj:Object;
		public var classobj:Object;
		public var typeobj:Object;
		public var factionobj:Object;
		public var descobj:Object;
		public var detailobj:Object;
		// Private Properties:
		//dice function
		function dice(max:int):int {
			return (Math.floor(Math.random()*(max)));
		}
		// Initialization:
		public function V2_main() {

			jsonRequest=new URLRequest("https://dl.dropboxusercontent.com/u/29574227/40kweapongen/definitions.json");
			jsonLoader=new URLLoader  ;
			jsonLoader.dataFormat=URLLoaderDataFormat.TEXT;// default
			jsonLoader.addEventListener(Event.COMPLETE, jsonLoader_complete);
			jsonLoader.load(jsonRequest);
			loadphase=0;
			btn_newwep.label="Loading";
			btn_refresh.label="";
			btn_refresh.addEventListener(MouseEvent.CLICK, dorefresh);
		}
		//
		public function dorefresh(e:MouseEvent) {
			jsonRequest=new URLRequest("http://dl.dropbox.com/u/29574227/40kweapongen/definitions.json");
			jsonLoader.load(jsonRequest);
			loadphase=0;
		}
		//
		public function jsonLoader_complete(evt:Event):void {
			switch (loadphase) {
				case 0 ://loading definition file
					trace(loadphase);
					defobj=JSON.parse(jsonLoader.data);
					jsonRequest=new URLRequest(defobj.classURL);
					jsonLoader.load(jsonRequest);
					loadphase++;
					trace(defobj.classURL);
					break;
				case 1 ://loading weapon classes file
					trace(loadphase);
					classobj=JSON.parse(jsonLoader.data);
					jsonRequest=new URLRequest(defobj.typeURL);
					jsonLoader.load(jsonRequest);
					trace(defobj.typeURL);
					loadphase++;
					break;
				case 2 ://loading munition types file
					trace(loadphase);
					typeobj=JSON.parse(jsonLoader.data);
					loadphase++;
					jsonRequest=new URLRequest(defobj.factionURL);
					jsonLoader.load(jsonRequest);
					break;
				case 3 :
					trace(loadphase);
					factionobj=JSON.parse(jsonLoader.data);
					loadphase++;
					jsonRequest=new URLRequest(defobj.descURL);
					jsonLoader.load(jsonRequest);

					break;
				case 4 :
					trace(loadphase);
					descobj=JSON.parse(jsonLoader.data);
					loadphase++;
					jsonRequest=new URLRequest(defobj.detailURL);
					jsonLoader.load(jsonRequest);
					break;
				case 5 :
					trace(loadphase);
					detailobj=JSON.parse(jsonLoader.data);
					btn_newwep.label="Generate Weapon";
					btn_refresh.label="Refresh";
					btn_newwep.addEventListener(MouseEvent.CLICK, newwep);

					break;
			}

		}

		//actually make the damn thing
		public function newwep(e:MouseEvent):void {
			//faction
			/*var tempArray = new Array[dice(defobj.faction.length),dice(defobj.wepclass.length),dice(defobj.weptype.length),dice(defobj.subtype.length)]
			trace(tempArray);
			var newfac:String=defobj.faction[tempArray[0]];
			var newclass:String=defobj.wepclass[tempArray[1]];
			var newtype:String=defobj.weptype[tempArray[2]];
			var newsubtype:String=defobj.subtype[tempArray[3]];
			
			
			var nfac=dice(defobj.faction.length);
			var nclass=dice(defobj.wepclass.length);
			var ntype=dice(defobj.weptype.length);
			var nsubtype=dice(defobj.subtype.length);
			trace(nfac);
			trace(nclass);
			trace(ntype);
			trace(nsubtype);
			var newfac:String=defobj.faction[nfac];
			var newclass:String=defobj.wepclass[nclass];
			var newtype:String=defobj.weptype[ntype];
			var newsubtype:String=defobj.subtype[nsubtype];
			*/
			var newfac:String=defobj.faction[dice(defobj.faction.length)];
			var newclass:String=defobj.wepclass[dice(defobj.wepclass.length)];
			var newtype:String=defobj.weptype[dice(defobj.weptype.length)];
			var newsubtype:String=defobj.subtype[dice(defobj.subtype.length)];
			var newenemy:String=defobj.faction[dice(defobj.faction.length)];
			var wepname=classobj[newclass][newfac];
			var weptype=typeobj[newtype][newsubtype];

			var newattach:String=detailobj.attach[dice(detailobj.attach.length)];
			var newdetail:String=detailobj.detail[dice(detailobj.detail.length)];
			var newcons:String=detailobj.cons[dice(detailobj.cons.length)];
			var newage:String=detailobj.age[dice(detailobj.age.length)];
			//do description
			var newdescnum:int=dice(descobj.length);
			var paramArray:Array = new Array();
			paramArray=Basicutils.clone(descobj[newdescnum].params);
			var descstring:String=descobj[newdescnum].descString;
			for (var i:Number = 0; i < paramArray.length; i++) {
				if (paramArray[i]=="*solider*") {
					paramArray[i]=factionobj.faction[newfac][dice(factionobj.faction[newfac].length)];
				}
				if (paramArray[i]=="*enemy*") {
					paramArray[i]=factionobj.faction[newenemy][dice(factionobj.faction[newenemy].length)];
				}
				if (paramArray[i]=="*ammo*") {
					paramArray[i]=weptype;
				}
				if (paramArray[i]=="*weapon*") {
					trace(wepname);
					paramArray[i]=wepname;
				}
			}
			var descs:String=Basicutils.dreplace(descstring,paramArray);


			//end doing description

			var finalwep="You have generated a ";
			finalwep=finalwep.concat(newfac," ",wepname,". It ",newdetail," and a",newattach,". It fires ",weptype,"s.\n","Unfortunately it",newcons,". Its age is ",newage,"\n",descs,"\n ________\n");
			txt_output.text=txt_output.text.concat(finalwep);
			scrollbar.update();
			scrollbar.scrollPosition=scrollbar.maxScrollPosition;
		}
	}
}