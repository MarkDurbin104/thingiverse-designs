module torus(minor,major,quality) {
	rotate([0,0,30])
	rotate_extrude(convexity = 10, $fn = quality)
	translate([major, 0, 0])
	circle(minor, $fn = quality/2);
}
module goblet(radius,thickness,showCrosssection) {
	difference() {
		union() {
			translate([0,0,95+thickness]) difference() {
				scale([1,1,95/radius])sphere(radius);
				translate([-1-radius,-1-radius,0])cube([radius*3+2,radius*3+2,radius*3+2]);
			}
			cylinder(thickness,radius/4*3,radius/4*3,$fn=30);
			translate([0,0,thickness-0.01])cylinder(thickness*1.8,radius/1.8,radius/3.3,$fn=30);
			translate([0,0,thickness/2])torus(thickness/2+0.02,radius/4*3,30);
			translate([0,0,95+thickness])torus(thickness/2,radius-thickness/2,30);
			translate([0,0,thickness*2.8])torus(thickness,radius/3.3,30);
		}
		translate([0,0,95-thickness/2]) scale([1,1,95/radius])sphere(radius-thickness);
		if (showCrosssection) {
			translate([-1-radius,-1-radius,-0.1])cube([radius+1,radius+1,100]);
		}
	}
}
module plainGoblet() {
	goblet(35,3,false);
}
translate([0,0,0])plainGoblet();
