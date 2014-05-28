rotate([0,180,0])union() {
	difference() {
		rotate([-7.5,0,0]) scale([1,1,0.6]) sphere(40,$fn=50);
		rotate([-7.5,0,0]) scale([1,1,0.6])sphere(35,$fn=50);
		translate([-40,-40,10]) cube([80,80,20]);
		translate([0,-2,5]) cylinder(10,32,32);
	}
	difference() {
		translate([0,0,-28]) cylinder(10,20,20);
		translate([0,0,-29]) cylinder(12,15,15);
		rotate([-7.5,0,0]) scale([1,1,0.6])sphere(35,$fn=50);
	}
}