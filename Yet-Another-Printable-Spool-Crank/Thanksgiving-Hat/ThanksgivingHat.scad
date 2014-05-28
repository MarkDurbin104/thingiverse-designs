difference() {
	union() {
		intersection() {
			translate([0,0,-190])rotate([0,90,0])cylinder(200,200,200,$fn=100,center=true);
			cylinder(10,60,60,$fn=100);
		}
		cylinder(100,40,25,$fn=100);
		color([0.4,0.4,0.4,1])cylinder(30,42,38,$fn=100);
	
		color([0.9,0.9,0.6,1])translate([0,34,18])rotate([10,0,0]) difference() {
			cube([35,14,30],center=true); 
			cube([25,15,20],center=true); 
		}
	}
	translate([0,0,-0.1])cylinder(90,35,20,$fn=100);
}