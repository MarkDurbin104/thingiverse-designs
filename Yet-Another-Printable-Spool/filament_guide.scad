translate([0,0,0])rotate([0,90,0])difference() {
	union() {
		difference() {
			cube([30,20,16.5]);
			translate([-0.01,-0.5,5.5])cube([25,21,5.5]);
			translate([-0.01,-0.5,-0.02])cube([8,21,11]);
		}
		translate([0,0,11])cube([30,5,90]);
		translate([0,0,91])cube([30,20,15]);
	}
	translate([20,0,98.5])scale([1,1,0.5])rotate_extrude(convexity = 10, $fn = 100) translate([20, 0, 0]) circle(r = 6, $fn = 100); 
}