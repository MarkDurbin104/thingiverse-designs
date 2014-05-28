module innerTube(radius,height) {
	difference() {
		cylinder(height,radius,radius);
		translate([0,0,-1]) cylinder(height+2,radius-4,radius-4);
		translate([0-(radius-2),-3,3]) cube([radius*2-4,6,height-6]);
		rotate([0,0,8]) translate([0-(radius-2),-3,3]) cube([radius*2-4,6,6]);
		rotate([0,0,13]) translate([0-(radius-2),-3,3]) cube([radius*2-4,6,6]);
		rotate([0,0,19+(20-(radius/2))]) translate([0-(radius-2),-2,3]) cube([radius*2-4,4,12]);

		rotate([0,0,90]) translate([0-(radius-2),-3,3]) cube([radius*2-4,6,height-6]);
		rotate([0,0,98]) translate([0-(radius-2),-3,3]) cube([radius*2-4,6,6]);
		rotate([0,0,103]) translate([0-(radius-2),-3,3]) cube([radius*2-4,6,6]);
		rotate([0,0,109+(20-(radius/2))]) translate([0-(radius-2),-2,3]) cube([radius*2-4,4,12]);
	}
}
module peggedTube(radius,height) {
	union() {
		innerTube(radius,height);
		rotate([0,0,0]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,90]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,-90]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,180]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
	}
}
module centerTube(radius,height) {
	union() {
		difference() {
			cylinder(height,radius,radius);
			translate([0,0,-1]) cylinder(height+2,radius-4,radius-4);
		}
		rotate([0,0,0]) translate([0-(radius+2),-2,height-8]) cube([4,4,4]);
		rotate([0,0,90]) translate([0-(radius+2),-2,height-8]) cube([4,4,4]);
		rotate([0,0,-90]) translate([0-(radius+2),-2,height-8]) cube([4,4,4]);
		rotate([0,0,180]) translate([0-(radius+2),-2,height-8]) cube([4,4,4]);
	}
}
module tube(tubeOuterRadius,tubeHeight,tubeCount,extend) {
	union() {
		innerTube(tubeOuterRadius,tubeHeight);
		if (tubeCount > 2) {
			for (i=[1:tubeCount-2]) {
				translate([0,0,extend*(0-i*(tubeHeight-12))]) rotate([0,0,(i%2)*90]) peggedTube(tubeOuterRadius-i*5,tubeHeight);
			}
		}
		if (tubeCount > 1) {
			translate([0,0,extend*(0-(tubeCount-1)*(tubeHeight-12))])  centerTube(tubeOuterRadius-(tubeCount-1)*5,tubeHeight);
		}
	}
}
//difference() {
	tube(40,90,6,0);
//	translate([0,0,-1]) cube([40,40,92]);
//}

