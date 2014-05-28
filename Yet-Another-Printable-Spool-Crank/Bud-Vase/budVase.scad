module torus(majRad,minRad,majQ=100,minQ=100) {
	rotate_extrude(convexity = 10, $fn = majQ) translate([majRad, 0, 0]) circle(r = minRad, $fn = minQ);
}
q=100;
module solid() {
	translate([0,0,11.4])difference() {
		union() {
			translate([0,0,-5])sphere(10,$fn=q);
			translate([0,0,0])cylinder(34,10,10,$fn=q,center=false);
		}
		translate([0,0,20])scale([1,1,2])torus(15.28,12,q,q);
	}
}
module hollow() {
	difference() {
		solid();
		translate([0,0,0.2])scale([0.75,0.75,1])solid();
		translate([0,0,6.1])sphere(9,$fn=q);
	}
	cylinder(1,8.2,8.2,$fn=q,center=false);
}
intersection() {
	scale(2.2) hollow();
	translate([0,0,50])cube(100,center=true);
//	cube(100);
}
	translate([0,0,100.4])torus(10.59,1.671,q,q);
