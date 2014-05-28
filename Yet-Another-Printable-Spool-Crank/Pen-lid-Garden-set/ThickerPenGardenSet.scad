lidLength=34;
lidThickness=1.5;
lidRim=0.6;
penDiameter=9;
tabDiameter=3;
tabLength=40;
scale=(penDiameter+lidThickness)/penDiameter;

module torus(minorR,majorR,q) {
	rotate_extrude(convexity = 10, $fn = q) translate([majorR, 0, 0]) circle(r = minorR, $fn = q);
}
module bicLid() {
	rotate([0,0,180])union() {
		difference() {
			intersection() {
				translate([0,0,0.01])scale(scale,scale,scale) union() {
					scale([penDiameter,penDiameter,lidLength*2])sphere(0.5,$fn=20);
					torus(lidRim,penDiameter/2,20);
				}
				scale(scale,scale,scale)translate([0,0,lidLength/2])cube([penDiameter+lidRim*6,penDiameter+lidRim*6,lidLength],center=true);
			}
			scale([penDiameter,penDiameter,lidLength*2])sphere(0.5,$fn=20);
		}
		scale(scale,scale,scale)difference() {
			rotate([0,-1,0])translate([penDiameter/2-0.5,0,0]){
				scale([tabDiameter,tabDiameter,tabLength])sphere(0.5,$fn=20);
				torus(lidRim,tabDiameter/2,20);
			}
			rotate([0,-0.05,0])cylinder(tabLength+1,penDiameter/2-0.1,(penDiameter/2)-0.8,center=true,$fn=20);
		}
	}
}
module rakeEnd(z) {
	for(i=[0:10]) {
		translate([9,-25+i*5,z])rotate([0,90,0])cylinder(20,1,1,center=true,$fn=10);
	}
	translate([1.5,0,z])cube([5,50,2],center=true);
	translate([0,0,z-2.5])cube([2,50,5],center=true);
}

module gardenSet() {
rotate([0,11.5,0])rotate([0,180,180])translate([-0.5,25,-10]) union() {
	bicLid();
	rakeEnd(40);
}
translate([0,-50,0]) union() {
bicLid();
translate([-1.5,0,50])cube([2,30,40],center=true);
translate([0,0,30])cube([5,30,1],center=true);
}
bicLid();
difference() {
	translate([-1.5,0,50])cube([2,30,40],center=true);
	translate([-1.5,0,53])cube([2.2,8,40],center=true);	
	translate([-1.5,9.5,53])cube([2.2,8,40],center=true);	
	translate([-1.5,-9.5,53])cube([2.2,8,40],center=true);	
}
translate([0,0,30])cube([5,30,1],center=true);
}
color([0.2,0.2,0.6,1]) translate([25,0,6.7])rotate([0,-93.5,0])gardenSet();
//cube([100,100,0.1],center=true);