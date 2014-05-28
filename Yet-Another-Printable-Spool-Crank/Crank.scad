module crank() { 
	rotate([0,0,60])translate([-50,-10,0]) union() {
		difference(){ 
			cube([95,22,10]);
			translate([10,-0.5,-0.05])cube([12.5,23,5]);
			translate([76.5,-0.5,-0.05])cube([12.5,23,5]);
			translate([-0.1,8,-0.05])cube([10.2,6,5]);
			translate([85.1,8,-0.05])cube([10.2,6,5]);
		}
		translate([20,11,9.9])cylinder(30,10,10);
	}
}


//color([0.5,0.5,0.5,1])rotate([0,0,30])translate([1.2,0,72])import_stl("crank.stl",convexity=10);
//color([0.5,0.5,0.5,1])rotate([0,0,30])translate([1.2,0,72]) 
crank();