module torus(minr,majr,q) {
rotate_extrude(convexity = 10, $fn = q)
translate([majr, 0, 0])
circle(r = minr, $fn = q/2);
}
module pencil() {
	cylinder(180,3.8,6,$fn=18);
}
module aPencil() {
	intersection() {
		cylinder(190,0.2,50,$fn=30);
		cylinder(180,4.2,4.2,$fn=6);
	}
}

module drawit() {
	difference() {
	cylinder(4,44,40,$fn=72);
	translate([0,0,1.5])cylinder(3,30,30,$fn=72);
	}
	difference() {
		cylinder(100,32,32,$fn=72);
		translate([0,0,3])cylinder(121,14,14);
		translate([0,0,50])cylinder(71,6,34);
		for (i=[0:17]) { 
			for (j=[0:3]) {
				translate([0,0,9+j*22]) rotate([0,22,(j%2)*10+i*20]) translate([20,0,0]) pencil();
			}
		}
		translate([0,0,11])scale([1,1,2])torus(4,33.5,72);
	}
}
module loadit() {
	color([1,0.1,0.1,1])import_stl("PencilCone2.stl",convexity=15);
}
difference() {
	loadit();
	rotate([0,0,0])translate([0,0,-0.1])cube([50,50,120]);
}
	for (i=[0:17]) { 
		for (j=[0:3]) {
			color([(j+1)/4,(i+1)/18,(i+1)/18,1])
			translate([0,0,9.1+j*22]) rotate([0,22,(j%2)*10+i*20]) translate([20,0,0]) aPencil();
		}
	}
/*
difference() {
	drawit();
//	rotate([0,0,10])translate([0,0,-0.1])cube([50,50,120]);
}
*/
