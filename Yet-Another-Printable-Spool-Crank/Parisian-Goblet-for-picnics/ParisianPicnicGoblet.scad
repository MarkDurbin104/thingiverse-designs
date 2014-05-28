/*
 *    copy polyScrewThread.scad  by aubenc @ Thingiverse to a "Threads" folder under your model folder 
 *    http://www.thingiverse.com/thing:8796
 */

include <Threads/polyScrewThread.scad> // path to library
PI=3.141592;

// create threadedRod part and save as StemThreadedRod.stl then set loadthread to true to speed up builds

loadthread=false;
module threadedRod() {
	if (loadthread) {
		import_stl("StemThreadedRod.stl",convexity=15);
	} else {
		screw_thread(15,4,55,30,PI/2,2);
	}
}



module torus(major,minor,q) {
	rotate_extrude(convexity = 10, $fn = q)
	translate([major, 0, 0])
	circle(r = minor, $fn = q);
}
quality=40;

module FlatSphere(dia) {
	intersection() {
		sphere(dia/2,$fn=quality);
		cube([dia,dia,dia*0.89],center=true);
	}
}

module FlatHollowSphere() {
	difference() {
		FlatSphere(10);
		FlatSphere(9);
	}
}

module halfcup() {
	union() {
		intersection() {
			FlatHollowSphere();
			translate([0,0,-1.92])cube([10,10,5.25],center=true);
		}
	}
}
module toppart() {
	intersection() {
		difference() {
			torus(10,5.57,quality);
			torus(10,5.065,quality);
		}
		translate([0,0,2.05])cylinder(4.1,10,10,center=true,$fn=quality);
	}
}
module bottompart() {
	translate([0,0,5])cylinder(2,6.9,10,center=true,$fn=quality);
	intersection() {
		scale([1,1,1.2])difference() {
			cylinder(8.5,10,10,center=true,$fn=quality);
			torus(10,4.5,quality);
		}
		translate([0,0,2.05])cylinder(4.1,10,10,center=true,$fn=quality);
	}
}



// create glassTop part and save as ParisianGobletTop.stl then set loadTopfile to true to speed up builds

loadTopfile=false;
module glassTop() {
	if (loadTopfile) {
		import_stl("ParisianGobletTop.stl",convexity=15);
	} else {
		scale([0.9,0.9,0.9])rotate([180,0,0])translate([0,0,-48]) {
			difference() {
				union() {
					translate([0,0,7.05])scale([7,7,10]) toppart();
					scale([7,7,10]) halfcup();
					translate([0,0,-57.955])scale([0.7475,0.7475,0.7475])scale([2.1,2.1,3]) bottompart();
				}
				translate([0,0,-60]) threadedRod();
			}
			translate([0,0,-48])cylinder(2,10,10,center=true,$fn=quality);
		}
	}
}

// create glassBase part and save as ParisianGobletBase.stl then set loadBasefile to true to speed up builds

loadBasefile=false;
module glassBase() {
	if (loadBasefile) {
		import_stl("ParisianGobletBase.stl",convexity=15);
	} else {
		intersection() {
			translate([0,0,0]) union() {
				translate([0,0,62.5]) scale([0.9,0.9,0.9]) threadedRod();
				translate([0,0,43.2])cylinder(80,7.75,7.75,center=true,$fn=quality);
				translate([0,0,1.5])cylinder(6,44,44,center=true,$fn=quality);
				difference(){
					translate([0,0,24])cylinder(40,44,44,center=true,$fn=quality);
					translate([0,0,62]) {scale([1,1,1.5])torus(44,39,quality); }
				}
				translate([0,0,-0.5]) torus(44,5,quality); 
			}
			translate([0,0,50]) cube([100,100,100],center=true);
		}
	}
}
module glass(state=0) {
	if (state<4) {
		glassBase();
	}
	if (state==1) {
		translate([0,0,178.6])rotate([180,0,0])difference() {
			glassTop();
			color([0,0,0,1])translate([0,0,-0.1])cube([100,100,100]);
		}
	} else if (state==2) {
		rotate([0,0,-90])translate([0,0,4.4])difference() {
			glassTop();
			color([0,0,0,1])translate([0,0,-0.1])cube([100,100,100]);
		}
	} else  if (state==3) {
		translate([0,0,178.55]) rotate([180,0,0]) glassTop();
	} else  if (state==4) {
		glassTop();
	}	
}

module scene() {
	rotate([0,0,-45]) {
		translate([50,50,0])color([1,0.4,0.4,1])glass();
		translate([-50,50,0])color([1,0.4,0.4,1])glass(1);
		translate([-50,-50,0])color([1,0.4,0.4,1])glass(2);
		translate([50,-50,0])color([1,0.4,0.4,1])glass(4);
	}
}

glass(3);
