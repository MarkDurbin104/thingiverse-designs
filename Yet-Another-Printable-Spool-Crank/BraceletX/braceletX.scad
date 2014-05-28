module torus(major,minor,quality) { rotate([0,0,0])rotate_extrude(convexity = 10, $fn = quality) translate([major, 0, 0]) circle(r = minor, $fn = quality/2); }
module slotted() {
	difference(){
		translate([0,0,-3])rotate([3,0,0])difference(){
			translate([0,0,6])rotate([-6,0,0]){
				difference() {
					translate([0,0,-3])rotate([3,0,0])difference(){cylinder(15,40,40,$fn =60);translate([0,0,-0.1])cylinder(15.2,37.5,37.5,$fn =60); }
					translate([0,0,-15])cylinder(15,50,50);	
				}
			}
			translate([0,0,15])cylinder(15,50,50);
		}
		translate([0,-50,10.5])rotate([-2.92,0,0])translate([0,43.5,0])cube([50,60,3]);
		translate([-50,-50,1.5])rotate([2.92,0,0])translate([0,44,0])cube([50.01,60,3]);
	}
}
module bracelet() {
	rotate([6,180,0])translate([0,0,-11.5])union() {
		rotate([180,0,0])translate([0,0,-1.25])union() {
			translate([0,0,-9]) rotate([-6,0,0])union() {
				translate([0,0,-3]) rotate([3,0,0])slotted();
				translate([0,-0.7,0])torus(38.75,1.25,60);
			}
			translate([0,-0.2,0])torus(38.75,1.25,60);
		}
		rotate([-6,0,0])for (i=[0:11]) {
			rotate([0,0,9-i*9]) translate([38.71-i*-0.02,0,2.2])cylinder(3.1,1.23,1.23,$fn =30); 
		}
	}
	rotate([-6,0,0])for (i=[0:10]) {
		rotate([0,0,9-i*9]) translate([38.71-i*0.04,0,2.2])cylinder(3.1,1.23,1.23,$fn =30); 
	}
}
translate([-5,0,0]) bracelet();