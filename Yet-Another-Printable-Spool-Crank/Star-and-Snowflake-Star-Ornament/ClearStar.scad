module star(lpoint=14,spoint=9,npoints=4,depth=3,miniSize=0) {
	// each point is a 4 sided cone
	for (point=[0:npoints-1]) {
		// long point
		rotate([0,(360/npoints)*point,0]) cylinder(lpoint,depth,0,$fn=4);
		// short point
		rotate([0,(180/npoints)+(360/npoints)*point,0]) cylinder(spoint,depth,0,$fn=4);
		if (miniSize > 0) {
			rotate([0,((180/npoints)+(90/npoints))+(360/npoints)*point,0]) cylinder(miniSize,depth,0,$fn=4);
			rotate([0,((180/npoints)-(90/npoints))+(360/npoints)*point,0]) cylinder(miniSize,depth,0,$fn=4);
		}
	}
}
module mainstar() {
	intersection() {
		union() {
			rotate([90,0,0])star(50,35,4,6,22);
			// add loop on top
			translate([0,-45,0])
				rotate([90,0,0])rotate([90,0,0])
					rotate_extrude(convexity = 10, $fn = 100) 
						translate([4, 0, 0]) circle(r = 1, $fn = 4);
			
		}
		translate([0,0,50])cube([150,150,100],center=true);
	}
}
rotate([0,0,45]) mainstar();