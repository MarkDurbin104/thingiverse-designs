rotate([90,-90,0]) {
//rotate([0,0,-60])import_stl("filament-loop.stl",convexity=10);
rotate([0,180,180])rotate([0,83,0])translate([12,0,-46])scale([0.7,0.7,0.7])import_stl("gangsta.stl",convexity=20);
translate([-46,-6,0])cube([48,10,15]);
	difference() {
		union() {
			translate([-46,-15,0])cube([87,30,3]);
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
