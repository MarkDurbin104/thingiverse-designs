numFaces=18;
pencilDiameter=10;

module aPencilBottom(height,radius) {
	difference() {
		translate([0,0,1])cylinder(30,radius+2,radius+2,$fn=numFaces);
		cylinder(height,radius,radius,$fn=numFaces);
	}
}
module drawPencilBottoms(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,4]){
	translate([0,0,-31])for (i=[0:numbRods-1]) color([i/numbRods,1,1,1]){
		rotate([-23.5,-25.8,i*(360/numbRods)])translate([radius*1.12,0,0])aPencilBottom(height,rodRadius);
	}
}
module aPencil(height,radius) {
	rotate([0,0,-32])cylinder(height,radius,radius,$fn=numFaces);
}
module drawPencils(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,4]){
	translate([0,0,-31])for (i=[0:numbRods-1]) color([i/numbRods,1,1,1]){
		rotate([-23.5,-25.8,i*(360/numbRods)])translate([radius*1.12,0,0])aPencil(height,rodRadius);
	}
}
module drawPencils2(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,4]){
	translate([0,0,-19.3])for (i=[0:numbRods-1]) color([i/numbRods,i/numbRods,1,1]){
		rotate([-19.6,-21,i*(360/numbRods)])translate([radius*1.08,0,0])aPencil(height,rodRadius);
	}
}
module drawPencilsm2(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,8]){
	translate([0,0,-19.3])for (i=[0:numbRods-1]) color([i/numbRods,i/numbRods,1,1]){
		rotate([19.6,-21,i*(360/numbRods)])translate([radius*1.08,0,0])aPencil(height,rodRadius);
	}
}
module drawPencils3(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,6]){
	translate([0,0,-11.2])for (i=[0:numbRods-1]) color([i/numbRods,1,i/numbRods,1]){
		rotate([-16,-17,i*(360/numbRods)])translate([radius*1.06,0,0])aPencil(height,rodRadius);
	}
}
module drawPencils4(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,9]){
	translate([0,0,-4.6])for (i=[0:numbRods-1]) color([1,1,i/numbRods,1]){
		rotate([-12,-12,i*(360/numbRods)])translate([radius*1.04,0,0])aPencil(height,rodRadius);
	}
}
module drawPencilsm4(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,14]){
	translate([0,0,-4.6])for (i=[0:numbRods-1]) color([1,i/numbRods,i/numbRods,1]){
		rotate([12,-12,i*(360/numbRods)])translate([radius*1.04,0,0])aPencil(height,rodRadius);
	}
}
module drawPencils5(radius,rodRadius,numbRods,twist,height,border,base) rotate([0,0,19]){
	translate([0,0,-0.4])for (i=[0:numbRods-1]) color([i/numbRods,i/numbRods,i/numbRods,1]){
		rotate([-6,-6,i*(360/numbRods)])translate([radius*1.02,0,0])aPencil(height,rodRadius);
	}
}
module xJoint(x,y,z,cutout) {
	if (cutout) {
		translate([x,y,z+2.115]) union() {
			rotate([0,0,45])cube([10.25,20.25,4.25],center=true);
			rotate([0,0,-45])cube([10.25,20.25,4.25],center=true);
		}
	} else {
		translate([x,y,z+2]) union() {
			rotate([0,0,45])cube([10,20,4],center=true);
			rotate([0,0,-45])cube([10,20,4],center=true);
		}
	}
}
module pencils(elevate) {
	translate([0,0,4.3])rotate([0,0,0]) union() {
		drawPencils(70,pencilDiameter/2,28,90,180,5,8);
		drawPencilsm2(57,pencilDiameter/2,24,90,180,5,8);
		drawPencils3(44,pencilDiameter/2,16,90,180,5,8);
		if (elevate) {
			translate([0,0,130])drawPencilsm4(31,pencilDiameter/2,16,90,180,5,8);
		} else {
			drawPencilsm4(31,pencilDiameter/2,16,90,180,5,8);
		}
		drawPencils5(18,pencilDiameter/2,8,90,180,5,8);
	}
}
module pencilPot(quart) {
	difference() {
		union() {
			intersection() {
				cylinder(13,70+4.2+5,70+4.2+5);
				if (quart) {
					translate([0,0,-1])cube([80,80,80]);
				} else {
					translate([0,0,-1])cube([160,160,80],center=true);
				}
			}
			if (quart) {
				xJoint(0,25,0,false);
				xJoint(0,55,0,false);
			}
		}
		if (quart) {
			xJoint(25,0,0,true);
			xJoint(55,0,0,true);
		}
		pencils();
//		rotate([0,0,275])cube(100,100,100);
	}
}
module pencilBottom(quart) {
	intersection() {
		union() {
		difference() {
			translate([0,0,6])cylinder(28,76,63);
			translate([0,0,5])cylinder(32,64,51);
			rotate([0,0,10.1])drawPencils(70,pencilDiameter/2,28,90,180,5,8);
		}
		difference() {
			translate([0,0,4])cylinder(2,76,76);
			translate([0,0,3])cylinder(4,64,63.5);
		}
		}
		if (quart) {
			translate([0,0,-1])cube([80,80,80]);
		} else {
			translate([0,0,-1])cube([160,160,80],center=true);
		}
	}
}


module pencilTop(quart) {
	difference() {
		union() {
			intersection() {
				translate([0,0,140]) difference() {
					cylinder(13,68,74);
//					translate([0,0,-1])cylinder(15,58,63);
					translate([0,0,-1])cylinder(15,48,53);
				}
				if (quart) {
					translate([0,0,99])cube([80,80,200]);
				} else {
					translate([0,0,99])cube([160,160,200],center=true);
				}
			}
		}
		rotate([0,0,-104.6]) pencils();
	}
}
module pencilMid(quart) {
	difference() {
		union() {
			intersection() {
				translate([0,0,140]) difference() {
					cylinder(13,43,47);
					translate([0,0,-1])cylinder(15,29,26);
				}
				if (quart) {
					translate([0,0,99])cube([80,80,200]);
				} else {
					translate([0,0,99])cube([160,160,200],center=true);
				}
			}
		}
		rotate([0,0,-104.6]) pencils(true);
//		rotate([0,0,275])cube(100,100,300);
	}
}
module pencilCtr(quart) {
	difference() {
		union() {
			intersection() {
				translate([0,0,140]) difference() {
					cylinder(13,32,35);
					translate([0,0,-1])cylinder(15,12,14);
				}
				if (quart) {
					translate([0,0,99])cube([80,80,200]);
				} else {
					translate([0,0,99])cube([160,160,200],center=true);
				}
			}
		}
		rotate([0,0,-104.6]) pencils();
//		rotate([0,0,275])cube(100,100,300);
	}
}


/*
translate([-200,150,0]) pencilPot(false);
translate([-200,150,0]) pencils();

rotate([0,0,-20])translate([100,0,0]) drawPencils(70,pencilDiameter/2,28,90,180,5,8);
rotate([0,0,80])translate([100,0,0]) drawPencilsm2(57,pencilDiameter/2,24,90,180,5,8);
rotate([0,0,160])translate([100,0,0]) drawPencils3(44,pencilDiameter/2,16,90,180,5,8);
rotate([0,0,220])translate([100,0,0]) drawPencilsm4(31,pencilDiameter/2,16,90,180,5,8);
rotate([0,0,268])translate([100,0,0]) drawPencils5(18,pencilDiameter/2,8,90,180,5,8);

translate([200,150,0]) pencilPot(false);

translate([15,265,0]) import_stl("pencilHolderQ.stl",convexity=15);
translate([0,265,0]) rotate([0,0,90]) import_stl("pencilHolderQ.stl",convexity=15);
translate([0,250,0]) rotate([0,0,180]) import_stl("pencilHolderQ.stl",convexity=15);
translate([15,250,0]) rotate([0,0,270]) import_stl("pencilHolderQ.stl",convexity=15);
*/
//pencils(false);
//pencilPot(false);
//pencilTop(false);
translate([0,0,-140]) pencilMid(false);
//drawPencilBottoms(70,pencilDiameter/2,30,90,180,5,8);
//drawPencils(70,pencilDiameter/2,30,90,180,5,8);
//pencilBottom(true);
//translate([15,15,0])pencilBottom(true);
//translate([30,30,0])pencilBottom(true);
//translate([45,45,0])pencilBottom(true);
