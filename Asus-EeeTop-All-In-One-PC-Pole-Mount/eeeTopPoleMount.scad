rotate([90,0,-45]) 
intersection() {
	difference() {
		union() {
			difference() {
				intersection() {
					union() {
						difference() {
							cube([100,12,18]);
							translate([10,6,-1])cylinder(20,2,2);
							translate([90,6,-1])cylinder(20,2,2);
							translate([13.5,6,-1])cube([73,6.1,120]);
							translate([40,13,3.5])rotate([90,0,0])cylinder(14,2,2);
							translate([60,13,3.5])rotate([90,0,0])cylinder(14,2,2);
							translate([23,13,3.5])rotate([90,0,0])cylinder(14,2,2);
							translate([77,13,3.5])rotate([90,0,0])cylinder(14,2,2);
//							translate([0,-1,14])#cube([100,2,6]);
//							translate([0,11,14])#cube([100,2,6]);
						}
						translate([10,0,-30]) cube([80,12,30]);
						translate([9,0,3])rotate([0,50,0])cube([10,12,5]);
						translate([87,0,6])rotate([0,130,0])cube([10,12,5]);
					}
					translate([50,6,-50]) cylinder(70,0,56,$fn=100);
				}
				translate([10,6,-15])cylinder(20,4,4);
				translate([90,6,-15])cylinder(20,4,4);
			}
			translate([40,0,-54]) cube([20,12,20]);
			translate([50,12,-20])rotate([90,0,0])cylinder(12,25,25);
		}
		translate([25,6,0])cube([50,6.1,12]);
		translate([50,20,-20])rotate([90,0,0])cylinder(30,17.5,17.5);
		translate([40,13,3.5])rotate([90,0,0])cylinder(14,2,2);
		translate([60,13,3.5])rotate([90,0,0])cylinder(14,2,2);
		translate([49,-1,-55]) cube([2,14,22]);
		translate([39,6,-48])rotate([0,90,0])cylinder(22,2.5,2.5);
	}
	translate([50,6,-70]) cylinder(90,40,46,$fn=100);
}