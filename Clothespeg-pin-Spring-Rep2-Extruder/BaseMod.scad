translate([0,-2,0]) import(file="Mk8-Upgrade-Base-v2.stl",convexity=10);
for (i=[0:3]) {
translate([0,-(i/2),0]) intersection() {
	difference() {
		import(file="Mk8-Upgrade-Base-v2.stl",convexity=10);
		translate([0,-2,1])cylinder(4,11,11,center=true);
		translate([0,0,1])cylinder(4,11,11,center=true);
	}
	translate([5,-23,0])cube([30,30,30]);
}
}