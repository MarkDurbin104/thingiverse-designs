module ear() {
	scale([1,2,1])  union() {
		cylinder(5,1,1,$fa=5, $fs=0.1); 
		translate([0,0,5]) sphere(1,$fa=5, $fs=0.1); 
	}
}
module eye() {
	scale([1,1.6,1])  sphere(1.2,$fa=5, $fs=0.1);
}
module wing() {
	scale([1,0.5,1]) union() {
		translate([0,0,0])  cylinder(8,3,3,$fa=5, $fs=0.1);
		translate([0,0,0])  sphere(3,$fa=5, $fs=0.1);
		translate([0,0,8])  sphere(3,$fa=5, $fs=0.1);
	}
}
module mainWing() {
	scale([1,0.4,1.42]) union() {
		translate([0,0,0])  cylinder(8,4,4,$fa=5, $fs=0.1);
		translate([0,0,0])  sphere(4,$fa=5, $fs=0.1);
		translate([0,0,8])  sphere(4,$fa=5, $fs=0.1);
	}
}
module torus() {
	rotate_extrude(convexity = 10, $fs=0.1)
	translate([1, 0, 0])
	circle(r = 1.01,$fs=0.1);
}
module sting() {
	difference() {
		translate([0,4,0])  rotate([90,0,0]) cylinder(3,2,2,$fa=5, $fs=0.1);
		scale([2,4,2]) rotate([90,0,0]) torus();
	}
}
// supports for wings (comment out the next 4 lines to remove support )
//color([1,1,1,1]) rotate([0,0,0]) translate([23,33,0]) cube([5,2,37]);
//color([1,1,1,1]) rotate([0,0,0]) translate([14,28,0]) cube([5,2,23]);
//color([1,1,1,1]) rotate([0,0,0]) translate([-42,-36,0]) cube([2,5,37]);
//color([1,1,1,1]) rotate([0,0,0]) translate([-36.5,-26.5,0]) cube([2,5,23]);

module honeyComb() {
	difference() {
		union() {
			scale ([1,0.5,1]) union() {
				// outer body tube
				translate([0,0,6]) cylinder(20,10,10,$fa=5, $fs=0.1);
				// innerbody tube
				translate([0,0,8]) cylinder(20,9.3,9.3,$fa=5, $fs=0.1);
				// dome head
				translate([0,0,24.5]) difference() {
					sphere(10,$fa=5, $fs=0.1);
					translate([0,0,-10]) cylinder(12,12,12,$fa=5, $fs=0.1);
				}
				// thorax
				scale([1,3.1,0.7])translate([0,0,9]) difference() {
					sphere(10,$fa=5, $fs=0.1);
					translate([0,12,0]) rotate([90,0,0]) cylinder(12,11,11,$fa=5, $fs=0.1);
				}
				// sting
				translate([0,-47,6.1]) scale([1.7,4.6,1.7]) sting();
	
				// ears
				translate([4,0,31])  rotate([0,25,0]) ear();
				translate([-4,0,31])  rotate([0,-25,0]) ear();
	
	
				// eyes
				translate([-4,-5.45,32]) eye();
				translate([4,-5.45,32])  eye();
	
				// left wing
				translate([8,2.5,22])  rotate([0,0,-60]) rotate([0,90,0]) mainWing();
				translate([8,-1,22])  rotate([0,0,-60])  rotate([0,135,0]) wing();
	
				// left wing
				translate([-8,2.5,22])  rotate([0,0,60]) rotate([0,-90,0]) mainWing();
				translate([-8,-1,22])  rotate([0,0,60])  rotate([0,-135,0]) wing();
			}
	
		}
		// remove base below ground level
		translate([0,0,-0.7]) cylinder(6.7,25,25,$fa=5, $fs=0.1);
		// remove device cutout
		rotate([-14,0,0]) translate([-30,-15.35,4.2]) cube([60,4,30]);
	}
}
scale([3,3,3])translate([-6.5,4,-6]) rotate([0,0,45]) honeyComb();