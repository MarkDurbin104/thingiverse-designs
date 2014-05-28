module slots() {
	difference () {
		union() {
			translate([0,0,-0.01])cylinder(1,95,95,$fn=180);
			translate([0,0,0.9])cylinder(50,43,43,$fn=180);
		}
		for (i=[0:15]) {
			rotate([0,0,22.5*i]) translate([-1,0,-0.5])cube([2,100,60]);
			rotate([0,0,11.25+22.5*i]) translate([-1,44.5,-0.5])cube([2,100,60]);
		}
		translate([0,0,-0.5])cylinder(55,27,27,$fn=180);
	}
}
module spoolHalf() {
	color([0.5,0.5,0.5,1]) {
		difference() {
			translate([0,0,0])cylinder(5,45,45,$fn=180);
			translate([0,0,-0.1])cylinder(5.2,43,43,$fn=180);
		}
		difference () {
			union() {
				cylinder(5,100,100,$fn=180);
				translate([0,0,4.9])cylinder(45,45,45,$fn=180);
			}
			translate([0,0,-0.5])cylinder(51,25,25,$fn=180);
			translate([0,0,-0.01])slots();
		}
	}
}
translate([0,0,-75]) difference() {spoolHalf(); translate([0,0,-0.1])color([0.5,0.5,0.5,1]) cylinder(16,43,43,$fn=180); }
rotate([180,0,0])spoolHalf();
