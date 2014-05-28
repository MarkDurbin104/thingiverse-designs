module link() {
	rotate([90,0,90]) scale([0.6,1.8,1]) 
	linear_extrude(height = 50, center = false, convexity = 10, twist = 270, $fn = 200)
	translate([9, 0, 0])
	circle(r = 5, $fn = 80);
}
module side() {
	difference() {
		for ( i = [0:11] ) {
			rotate( [i*30, 0, 0]) 	translate( [0, 60, 0] ) link();
			rotate( [i*30+15, 0, 0]) 	translate( [0, 60, 0] ) rotate([180,0,0])  link();
		}
		translate([-1,0,0])rotate([0,90,0]) cylinder(17,70,70);
		
	}
}
module linkBracelet() {
	scale([1,1,1.4]) translate([0,0,-12])  rotate([0,-90,0]) side();

	rotate_extrude(convexity = 10, $fn = 300)
	translate([62, 54, 0])
	circle(r = 4, $fn = 50);
	rotate_extrude(convexity = 10, $fn = 300)
	translate([62, 4, 0])
	circle(r = 4, $fn = 50);
}

scale([0.6,0.6,0.6]) linkBracelet();
