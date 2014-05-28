module braceletTube() {
	rotate_extrude(convexity = 10, $fn = 72)
	translate([35, 0, 0])
	scale([0.3,1,1]) circle(r = 15, $fn = 36);
}

module hollowBraceletTube() {
	difference() {
		braceletTube();
		scale([1.07,1.07,0.9])braceletTube();
	}
}
difference() {
intersection() {
hollowBraceletTube();
translate([0,0,-20])cylinder(40,36.6,36.6,$fn=72);
}
/*for (i=[0:35]) {
	rotate([0,0,i*10])translate([-1,25,1])rotate([0,120,0])scale([0.5,1,1])cylinder(2,27,27);
}*/
//translate([0,0,-30])cylinder(40,31.2,31.2);
//translate([0,0,-30])cube([40,40,60]);
}