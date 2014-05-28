//translate([0,1,0])import_stl("filament-loop.stl",convexity=10);
rotate([0,0,60]) {
	difference() {
		union() {
			translate([-46,-15,0])cube([87,30,3]);
			translate([-46,-2,0])cube([60,3,15]);
			translate([10,-10,0])cube([3,20,10]);
			translate([-10,-10,0])cube([3,20,10]);
			translate([-30,-10,0])cube([3,20,10]);
			translate([-46,-15,0])cube([3,30,32]);
			translate([41,0,0])cylinder(3,15,15);
		}
		translate([41,0,-0.1])cylinder(3.2,11,11);
		translate([-46.1,10,27])rotate([0,90,0])cylinder(3.3,2,2,$fn=30);
		translate([-46.1,-10,27])rotate([0,90,0])cylinder(3.3,2,2,$fn=30);
		translate([-46.1,10,7])rotate([0,90,0])cylinder(3.3,2,2,$fn=30);
		translate([-46.1,-10,7])rotate([0,90,0])cylinder(3.3,2,2,$fn=30);
		translate([41,-2,-0.1])cube([20,4,3.2]);
	}
}