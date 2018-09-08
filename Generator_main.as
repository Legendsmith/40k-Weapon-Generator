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

	public class Generator_main extends MovieClip {

		// Constants:
		// Public Properties:
		// Private Properties:

		// Initialization:
		public function Generator_main() {
			btn_new_gen.label="Generate New Weapon";
			btn_new_gen.addEventListener(MouseEvent.CLICK, newweapon);
		}

		// Public Methods:
		public function newweapon(e:MouseEvent) {
			txt_class.text=getwepclass();
			txt_strong.text=getstrong();
			txt_manufac.text=getmanufac();
			txt_projectile.text=getprojecti();
			txt_special.text=getspecial();
			txt_attach.text=getattach();
			txt_detail.text=getdetail();
			txt_cons.text=getcons();
			txt_age.text=getage();
			var thisweapon:String="This is a ";
			//var thisweapon:String="This is a " + (getwepclass()+" with "+getstrong()+" and "+getdetail()+", made by "+getmanufac()+". It fires one or more "+getspecial()+" "+getprojecti()+"s with every shot."+"Additionally, is also/has a "+getattach()+". Unfortunately, it "+getcons()+". Its age is "+getage())
			thisweapon=thisweapon.concat(txt_class.text," with ",txt_strong.text," and ",txt_detail.text,", made by ",txt_manufac.text,". It fires one or more ",txt_special.text," ",txt_projectile.text,"s with every shot.","Additionally, is also/has a ",txt_attach.text,". Unfortunately, it ",txt_cons.text,". Its age is ",txt_age.text,".");
			txt_output.text=txt_output.text.concat("\n\n",thisweapon);
			trace(thisweapon);
			scrollbar.update();
			scrollbar.scrollPosition=scrollbar.maxScrollPosition
		}
		public function getwepclass():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(20))+1) {

				case 1 :
					temp="Mechanderite";
					break;
				case 2 :
					temp="Gauntlet/Boot";
					break;
				case 3 :
					temp="Sword/Long Blade";
					break;
				case 4 :
					temp="Mace/Hammer";
					break;
				case 5 :
					temp="Axe";
					break;
				case 6 :
					temp="Staff/Polearm";
					break;
				case 7 :
					temp="Helmet/Optic";
					break;
				case 8 :
					temp="Jewelry";
					break;
				case 9 :
					temp="Pistol";
					break;
				case 10 :
					temp="Automatic Rifle";
					break;
				case 11 :
					temp="Submachinegun";
					break;
				case 12 :
					temp="Shotgun";
					break;
				case 13 :
					temp="Long Barelled Rifle";
					break;
				case 14 :
					temp="Lightmachine Gun";
					break;
				case 15 :
					temp="Launcher";
					break;
				case 16 :
					temp="Heavy Shoulder Mounted";
					break;
				case 17 :
					temp="Heavy Underslung";
					break;
				case 18 :
					temp="Rosarius/Shield Generator";
					break;
				case 19 :
					temp="Instrument?";
					break;
				case 20 :
					temp="RC Drone";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		//strongest trait
		public function getstrong():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(5))+1) {
				case 1 :
					temp="Extreme Firepower";
					break;
				case 2 :
					temp="Long Range";
					break;
				case 3 :
					temp="Fast Firerate";
					break;
				case 4 :
					temp="Huge Magazine/Battery";
					break;
				case 5 :
					temp="Homing Projectiles";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		//Manufac
		public function getmanufac():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp="Imperial Guard";
					break;
				case 2 :
					temp="Space Marines";
					break;
				case 3 :
					temp="Inquisition";
					break;
				case 4 :
					temp="Eldar";
					break;
				case 5 :
					temp="Dark Eldar";
					break;
				case 6 :
					temp="Ork";
					break;
				case 7 :
					temp="Chaos";
					break;
				case 8 :
					temp="Tau";
					break;
				case 9 :
					temp="Necron";
					break;
				case 10 :
					temp="Tyranid";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		public function getprojecti():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp="Bullets/Pellet";
					break;
				case 2 :
					temp="Rocket";
					break;
				case 3 :
					temp="Beam";
					break;
				case 4 :
					temp="Viscous Liquid";
					break;
				case 5 :
					temp="Timed Grenade";
					break;
				case 6 :
					temp="Dart";
					break;
				case 7 :
					temp="Biological";
					break;
				case 8 :
					temp="Sticky Mine";
					break;
				case 9 :
					temp="Blade";
					break;
				case 10 :
					temp="Sorcerous pulse";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		public function getspecial():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp="Radiation";
					break;
				case 2 :
					temp="Incendiary";
					break;
				case 3 :
					temp="Electric";
					break;
				case 4 :
					temp="Acid";
					break;
				case 5 :
					temp="Freeze ";
					break;
				case 6 :
					temp="High Explosive";
					break;
				case 7 :
					temp="HVAP (Armour Piercing)";
					break;
				case 8 :
					temp="Viral";
					break;
				case 9 :
					temp="Psychic";
					break;
				case 10 :
					temp="Anti-Warp";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		public function getattach():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp="Chainblade";
					break;
				case 2 :
					temp="Expanded magazine/battery";
					break;
				case 3 :
					temp="Hi-power scope";
					break;
				case 4 :
					temp="Rapid fire mechanism";
					break;

				case 5 :
					temp="Lightweight";
					break;
				case 6 :
					temp="Grenade Launcher";
					break;
				case 7 :
					temp="Armor Casing";
					break;
				case 8 :
					temp="Collapsible";
					break;
				case 9 :
					temp="Flamethrower attachment";
					break;
				case 10 :
					temp="Revolving chambers";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		public function getdetail():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp="Optical Camoflauge";
					break;
				case 2 :
					temp="Psychic Enhancer";
					break;
				case 3 :
					temp="Machine Spirit";
					break;
				case 4 :
					temp="Power Field";
					break;
				case 5 :
					temp="Spikes and blades";
					break;
				case 6 :
					temp="Possessed";
					break;
				case 7 :
					temp="Sanctified";
					break;
				case 8 :
					temp="Organic Design";
					break;
				case 9 :
					temp="Necrodermis";
					break;
				case 10 :
					temp="Internal Plasma Reactor";
					break;
				default :
					temp="ERROR";

			}
			return temp;
		}
		public function getcons():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(10))+1) {
				case 1 :
					temp=" Tends to Jam";
					break;
				case 2 :
					temp=" Parts need constant service";
					break;
				case 3 :
					temp="has Long reload";
					break;
				case 4 :
					temp=" Tends to misfire";
					break;
				case 5 :
					temp=" is Cumbersome";
					break;
				case 6 :
					temp=" is Overtly complicated";
					break;
				case 7 :
					temp=" has Poor Accuracy";
					break;
				case 8 :
					temp=" Tends to overhea";
					break;
				case 9 :
					temp=" has Extreme Recoil";
					break;
				case 10 :
					temp="is Cursed/Unlucky";
					break;
				default :
					temp="ERROR";

			}
			return temp;
		}
		public function getage():String {
			var temp:String="";
			switch (Math.floor(Math.random()*(5))+1) {
				case 1 :
					temp=" Pre-Heresy";
					break;
				case 2 :
					temp=" Several Milleniums";
					break;
				case 3 :
					temp=" Several Centuries";
					break;
				case 4 :
					temp=" Several Decades";
					break;
				case 5 :
					temp=" Brand New";
					break;
				default :
					temp="ERROR";
			}
			return temp;
		}
		// Protected Methods:
	}

}