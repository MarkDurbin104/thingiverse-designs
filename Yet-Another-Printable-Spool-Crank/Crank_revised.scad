module crank() { 
	rotate([0,0,60])translate([-50,-10,0]) union() {
		difference(){ 
			cube([95,22,15]);
			translate([10,-0.5,-0.05])cube([12.5,23,10]);
			translate([76.5,-0.5,-0.05])cube([12.5,23,10]);
			translate([-0.1,8,-0.05])cube([10.2,6,10]);
			translate([85.1,8,-0.05])cube([10.2,6,10]);
		}
		translate([20,11,14.9])cylinder(30,10,10);
		translate([0,8,0])cube([10,0.5,4]);
		translate([89,13.5,0])cube([6,0.5,4]);
	}
}

crank();