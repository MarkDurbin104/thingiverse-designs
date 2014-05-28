// tool used to cut diamond profile coil from a cylinder to make OneThread.STL
module tool() {
	difference() {
		translate([0,-1,-20]) cube([30,2,60]);
		translate([15,2,7]) scale([0.8,1,1]) rotate([90,45,0]) #cube([4,4,4]);
	}
}
module oneThread() {
	difference() {
		translate([0,0,2]) cylinder(20,20,20);
		for (i=[0:89]) {
			translate([0,0,i/11])rotate([2.5,0,i*4]) tool();
		}
	}
}

// coils are made up of sections of "OneThread.STL" 
module coil(index) {
	translate([0,0,-14+index*11.6])  rotate([0,0,index*-6.2]) scale([1.44,1.44,1.44])  import_stl("OneThread.stl", convexity = 5);
}
module nutCoil(index) {
	for (i=[0:4]) {
		coil(i);
	}	
}
module rodCoil(index) {
	for (i=[0:9]) {
		coil(i);
	}	
}

// basic shapes for the treaded tube and rod
module  rod() {
	cylinder(100,25,25);
}
module  tube() {
	difference() {
		rod();
		translate([0,0,4]) cylinder(100,20,20);
	}
}

//  this is the bolt head
module  bolt() {
	intersection() {
		union() {
			intersection() {
				difference() {
					cylinder(40,40,40);
					translate([0,0,19.8]) cylinder(90,25,25);
					translate([0,0,-0.1]) cylinder(20,21,21,$fn=6);
					for (i=[0:30]) {
						rotate([0,0,12*i])translate([40,0,-0.1]) cylinder(20,2,2);
					}
				}
				translate([0,0,-0.1]) cylinder(100,39,80);
			}	
			nutCoil();
		}
		cylinder(40,40,40);
	}
}

// this is the nut
module  nut() {
	rotate([0,0,30]) intersection() {
		union() {
			intersection() {
				difference() {
					cylinder(46,46,46,$fn=6);
					translate([0,0,-0.1])  cylinder(100,26,26);
				}
				translate([0,0,-59.9]) cylinder(100,120,42,$fa=3);
				translate([0,0,-0.1]) cylinder(100,42,120,$fa=3);
			}	
			scale([1.04,1.04,1.04]) nutCoil();
		}
		cylinder(40,46,46,$fn=6);
	}
}
// a threaded rod (not used oin the pencil case)
module  threadedRod() {
	difference() {
		rod();
		rodCoil();
	}
}
// the threaded tube
module  threadedTube() {
	difference() {
		tube();
		rodCoil();
	}
}
// each of the elements (coil, nut, tube and head) are generated seperatly and saved in individual STL files
// these are then loaded for the various constructions below
module  loadedThreadedRod() {
	import_stl("ThreadedRod.stl", convexity = 5);
}
module  loadedThreadedTube() {
	import_stl("ThreadedTube.stl", convexity = 5);
}
module  loadedNutBlank() {
	import_stl("NutBlank.stl", convexity = 5);
}
module  loadedNut() {
	import_stl("Nut.stl", convexity = 5);
}
module  loadedBoltHead() {
	import_stl("BoltHead.stl", convexity = 5);
}
// scene for thumbnail
module scene() {
	translate([100,0,0]) {
		translate([0,0,20]) color ([0.2,0.2,0.2,1]) loadedThreadedTube();
		translate([0,0,280]) rotate([180,0,0]) color ([0.2,0.2,0.2,1])  loadedThreadedTube();
		color ([0.2,0.2,0.2,1]) loadedBoltHead();
		color ([0.7,0.7,0.8,1]) translate([0,0,160]) loadedNut();
	}
	
	translate([0,0,20]) color ([0.2,0.2,0.2,1]) loadedThreadedTube();
	translate([0,0,221]) rotate([180,0,0]) color ([0.2,0.2,0.2,1])  loadedThreadedTube();
	color ([0.2,0.2,0.2,1]) loadedBoltHead();
	color ([0.7,0.7,0.8,1]) translate([0,0,100]) loadedNut();
	translate([-100,0,0]) {
		 translate([0,0,20]) color ([0.2,0.2,0.2,1]) loadedThreadedTube();
		 translate([-100,0,0]) color ([0.2,0.2,0.2,1])  loadedThreadedTube();
		 color ([0.2,0.2,0.2,1]) loadedBoltHead();
		 color ([0.7,0.7,0.8,1]) translate([-100,0,80]) loadedNut();
	}
	
	translate([-50,0,180]) rotate([-90,0,50]){
		translate([0,0,20]) color ([0.2,0.2,0.2,1]) loadedThreadedTube();
		translate([0,0,221]) rotate([180,0,0]) color ([0.2,0.2,0.2,1])  loadedThreadedTube();
		color ([0.2,0.2,0.2,1]) loadedBoltHead();
		color ([0.7,0.7,0.8,1]) translate([0,0,100]) loadedNut();
	}
}
//bolt();
//nut();
//threadedTube();
scene();
