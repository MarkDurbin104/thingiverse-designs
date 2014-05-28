numbsteps=25;
numbRots=9;
totalHeight=104;

module BlinkyTree() {
	color([0,0.5,0,1]) {
		difference() {
			cylinder(totalHeight,38.5,7.25,$fn=50);
			for(i=[0:numbsteps*numbRots]) {
				rotate([0,0,(i%numbsteps)*(360/numbsteps)]) {
					translate([41.1-(31/(numbsteps*numbRots))*i,0,(totalHeight/(numbsteps*numbRots))*i])
						rotate([2.3+(5/(numbsteps*numbRots))*i,0,0])cube([8,10,13],center=true);
				}
			}
			translate([0,-3,85])cube([10,6,20]);
			translate([-25,-25,96])cube([50,50,20]);
		}
		translate([37,0,2.5])cube([5,5,5],center=true);
		translate([39,0,8])cube([3,5,16],center=true);
	}
}

module BlinkyDefuser() {
	color([0,0.5,0,1]) difference() {
		cylinder(totalHeight-2,48,17,$fn=50);
		translate([0,0,-0.02])cylinder(totalHeight-1.96,44,13,$fn=50);
		translate([40,-16,9.99])cube([16,40,20],center=true);
	}
}

module BlinkyDefuserCap() {
	difference() {
		union() {
			translate([0,0,totalHeight-2]) cylinder(55,17,0,$fn=50);
			translate([0,0,totalHeight-4]) cylinder(4,12.5,12.5,$fn=50);
		}
		translate([0,0,totalHeight-4.1]) cylinder(50,11,0,$fn=50);
	}
}

module BlinkyStarDefuserCap() {
	difference() {
		union() {
			translate([0,0,4-totalHeight]) BlinkyDefuserCap();
			scale([0.5,1,1])for (sp=[0:4]) translate([0,0,55*0.7071+1.55])rotate([sp*72,0,0])cylinder(50,17,0,$fn=4);
		}
		translate([0,0,-0.1]) cylinder(50,11,0,$fn=50);
	}
}

//BlinkyTree();
//BlinkyDefuser();
translate([0,0,4-totalHeight]) BlinkyDefuserCap();
//BlinkyStarDefuserCap();
