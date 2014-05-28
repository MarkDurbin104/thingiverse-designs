module braceletTube() {
	rotate_extrude(convexity = 10, $fn = 36)
	translate([35, 0, 0])
	scale([0.3,1,1]) circle(r = 15, $fn = 15);
}

module hollowBraceletTube() {
	difference() {
		braceletTube();
		scale([1.07,1.07,0.9])braceletTube();
	}
}
union() {
	import_stl("plainBracelet_FlatEdges.stl", convexity = 5);
	translate([0,0,13.9])for (i=[0:5]) {
		rotate([0,0,i*72]) translate([32.2,0,0.5]) rotate([90,0,90]) scale([2.2,2.3,2.8]) import_stl("makerLogo.stl", convexity = 5);
	}
	//translate([0,0,-30])cylinder(40,31.2,31.2);
	//translate([0,0,-30])cube([40,40,60]);
}