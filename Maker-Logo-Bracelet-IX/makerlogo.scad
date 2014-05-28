module makerLogo() {
	translate([0,-4,0])union() {
		cylinder(1,1,1,$fn=36);
		translate([4,0,0])cylinder(1,1,1,$fn=36);
		translate([-4,0,0])cylinder(1,1,1,$fn=36);
		difference() {
			union() {
				translate([3,7,0])cylinder(1,2,2,$fn=36);
				translate([-3,7,0])cylinder(1,2,2,$fn=36);
			}
			translate([-3,5,-0.1])cube([6,2,1.2]);
		}
		translate([-1,0,0])cube([2,8,1]);
		translate([-5,0,0])cube([2,7,1]);
		translate([3,0,0])cube([2,7,1]);
		translate([-3,7,0])cube([6,2,1]);
	}
}
makerLogo();