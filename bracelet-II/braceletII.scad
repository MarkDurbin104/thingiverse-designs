module torus(minorRad,majorRad,minorQuality,majorQuality) {
	rotate_extrude(convexity = 10, $fn = majorQuality)
	translate([majorRad, 0, 0])
	circle(r = minorRad, $fn = minorQuality);	
}
module bracelet() {
	union() {
		for (i=[0:18]) {
		 	rotate([0,0,i*20])translate([30,0,0])rotate([0,90,0])torus(2,10.5,6,12);
		}
		translate([0,0,10.7]) rotate([0,0,10])torus(2,29.8,6,18);
		translate([0,0,-10.7]) rotate([0,0,10])torus(2,29.8,6,18);
	}
}
translate([0,0,12.5]) bracelet();