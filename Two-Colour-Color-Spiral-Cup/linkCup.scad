module link() {
	rotate([90,0,90]) scale([0.5,1.8,1]) 
	linear_extrude(height = 160, center = false, convexity = 10, twist = 810, $fn = 20)
	translate([9, 0, 0])
	circle(r = 5, $fn = 12);
}
module side(layer1) {
	for ( i = [0:11] ) {
		if (layer1) {
			rotate( [i*30, 0, 0]) 	translate( [0, 60, 0] ) link();
		} else {
			rotate( [i*30+15, 0, 0]) 	translate( [0, 60, 0] ) rotate([180,0,0])  link();
		}
	}
}
module pencilCup(layer1) {
	scale([0.6,0.6,0.6]) translate([0,0,5])  {
		if (layer1) {
			rotate([0,-90,0]) side(layer1);
			translate([0,0,-5])cylinder(5,68,68, $fn = 72);
		
		} else {
			rotate([0,-90,0]) side(layer1);
			rotate_extrude(convexity = 10, $fn = 72)
			translate([62.5, 160, 0])
			circle(r = 3.5, $fn = 36);
		}
	}
}

/*translate([50,0,0])color([1,0,0,1])pencilCup(true);
translate([-50,0,0])color([0,0,1,1])pencilCup(false);
*/
pencilCup(true);
