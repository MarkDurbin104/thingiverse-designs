$fn = 40;

module tube(length,majR,minR,thickness) {
	difference() {
		cylinder(length,majR,minR,center=true);
		cylinder(length+0.1,majR-thickness/2,minR-thickness/2,center=true);
	}
}
module hollowTorus(majR,minR,thickness) {
	difference() {
		rotate_extrude(convexity = 10) translate([majR, 0, 0]) circle(r = minR);
		rotate_extrude(convexity = 10) translate([majR, 0, 0]) circle(r = minR-thickness);
	}
}
module KleinBottle(expand=false) {
	translate([0,0,expand?-5:0])difference() {
		hollowTorus(10,5,0.5);
		translate([-15,-15,0])cube([30,30,5]);
	}
	translate([10,0,expand?45:40]) difference() {
		rotate([90,0,0])hollowTorus(10,5,0.5);
		translate([-15,-15,-15])cube([15,30,15]);
		translate([0,-15,0])rotate([0,103,0])cube([15,30,15]);
	}
	translate([0,0,20]) tube(40,15,5,0.5);
	difference() {
		translate([9.5,0,18]) rotate([0,27,0])tube(47,5,5,0.5);
		translate([-15,-15,-8.2])cube([30,30,8]);
		translate([15,-15,54.5])rotate([0,103,0])cube([15,30,15]);
	}
}
translate([-20,0,5]) KleinBottle(false);
translate([20,0,10]) KleinBottle(true);