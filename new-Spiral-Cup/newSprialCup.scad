zigSize=40;
tubeSize=10;

module coil(zigCount=5) {
	rotate([0,0,45]) rotate([35,0,0]) rotate([0,-45,0])for (i=[0:zigCount-1]) {
		translate([i*zigSize,i*zigSize,i*zigSize]){
			union() {
				cube([tubeSize,tubeSize,zigSize]);
		 		translate([0,0,zigSize]) cube([tubeSize,zigSize,tubeSize]);
		 		translate([0,zigSize,zigSize]) cube([zigSize,tubeSize,tubeSize]);
			}
		}
	}
}
module twist() {
	coil();
	translate([-25,-25,0])rotate([0,0,180])coil();
}
module wall() {
	intersection() {
		translate([0,197,0])rotate([0,0,-78.5])for (t=[1:4]) {
			translate([t*50,t*-10,0]) {
				twist();
			}
		}
		translate([-40,-50,53]) cube([60,400,282]);
	}
}
module walls() {
	translate([116,-82,-50])union() {
		wall();
		translate([-35,198,0]) rotate([0,0,90])wall();
		translate([-35,198,0]) rotate([0,0,90])translate([-35,198,0]) rotate([0,0,90])wall();
		translate([-35,198,0]) rotate([0,0,90])translate([-35,198,0]) rotate([0,0,90])translate([-35,198,0]) rotate([0,0,90])wall();
	}
}
module pot() {
	translate([0,0,5]) {
		walls();
		cube([222,222,10],center=true);
		translate([0,0,290])difference() {
			cube([222,222,10],center=true);
			cube([180,180,12],center=true);
		}
	}

}
scale([100/255,100/255,100/300]) pot();
