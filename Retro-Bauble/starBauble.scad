module bauble(twosidesonly) {
	// flatten the sides and bottom of a sphere
	intersection() { 
		rotate([0,0,45]) translate([0,0,-16]) rotate([-54.5,0,0])
			sphere(36,center=true,$fn=100);
		translate([0,0,-12])cube([twosidesonly?72:52,52,76],center=true);
	}
}
module star(lpoint=14,spoint=9,npoints=4,depth=3) {
	// each point is a 4 sided cone
	for (point=[0:npoints-1]) {
		// long point
		rotate([0,(360/npoints)*point,0]) cylinder(lpoint,depth,0,$fn=4);
		// short point
		rotate([0,(180/npoints)+(360/npoints)*point,0]) cylinder(spoint,depth,0,$fn=4);
	}
}
module starBauble(twosidesonly=false) {
	difference() {
		union() {
			// remove stars from bauble
			difference() {
				bauble(twosidesonly);
				for (starp=[0:(twosidesonly?1:3)]) {
					rotate([0,0,(twosidesonly?180:90)*starp])translate([0,-26,-16]) star(25,16,8,5);
				}

				cube([80,4,0.1],center=true);
				cube([4,80,0.1],center=true);
			}
			// add loop on top
			translate([0,-2.5,24])
				rotate([28,0,0])rotate([90,0,0])
					rotate_extrude(convexity = 10, $fn = 100) translate([6, 0, 0]) circle(r = 2, $fn = 100);
		}
		// remove hole for LED
		translate([0,0,0])cylinder(30,3,3);
	}
}
starBauble(true);