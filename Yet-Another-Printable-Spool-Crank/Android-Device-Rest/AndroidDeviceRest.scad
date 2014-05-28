scale ([4,4,4]) difference() {
	union() {
		scale ([1,0.5,1]) union() {
			translate([0,0,6]) cylinder(20,10,10,$fa=10, $fs=0.2);
			translate([0,0,8]) cylinder(20,9.3,9.3,$fa=10, $fs=0.2);
			translate([0,0,24.5]) difference() {
				sphere(10,$fa=10, $fs=0.2);
				cylinder(2,11,11,$fa=10, $fs=0.2);
			}
			translate([7,0,29])  cylinder(5,1,1,$fa=10, $fs=0.2);
			translate([7,0,34])  sphere(1,$fa=10, $fs=0.2);
			translate([-7,0,29])  cylinder(5,1,1,$fa=10, $fs=0.2);
			translate([-7,0,34])  sphere(1,$fa=10, $fs=0.2);
	
			translate([-4,-5.5,32])  sphere(1,$fa=10, $fs=0.2);
			translate([4,-5.5,32])  sphere(1,$fa=10, $fs=0.2);
			translate([11,0,8])  cylinder(14,3,3,$fa=10, $fs=0.2);
			translate([11,0,8])  sphere(3,$fa=10, $fs=0.2);
			translate([11,0,22])  sphere(3,$fa=10, $fs=0.2);
		
			translate([-11,0,8])  cylinder(14,3,3,$fa=10, $fs=0.2);
			translate([-11,0,8])  sphere(3,$fa=10, $fs=0.2);
			translate([-11,0,22])  sphere(3,$fa=10, $fs=0.2);
		}
		translate([5,0,6]) rotate([90,0,0]) cylinder(16,4,4,$fa=10, $fs=0.2);
		translate([5,-15.5,6])  sphere(4,$fa=10, $fs=0.2);
		translate([-5,0,6]) rotate([90,0,0]) cylinder(16,4,4,$fa=10, $fs=0.2);
		translate([-5,-15.5,6])  sphere(4,$fa=10, $fs=0.2);
	}
	translate([0,0,-0.5]) cylinder(6.5,25,25,$fa=10, $fs=0.2);
	rotate([-15,0,0]) translate([-30,-16.82,4.5])# cube([60,5,30]);
}