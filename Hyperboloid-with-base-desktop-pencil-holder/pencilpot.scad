//======================================================================================
module torus(outerRadius, innerRadius)
  {
  r=(outerRadius-innerRadius)/2;
  rotate_extrude($fn=90) translate([innerRadius+r,0,0]) circle(r,$fn=20);	
  }
//======================================================================================  
module pencil() {
	cylinder(75,2,2,$fn=6);
	intersection() {
	translate([0,0,74.9])cylinder(15,2,2,$fn=6);
	translate([0,0,74.9])cylinder(15,3,0.25,$fn=36);
	}
}
pencils=36;
rods=20;
radius=30;
angle=35.5;

//build platform for debug  
%color([0.5,0.5,0.5,0.1]) translate([-50,-50,-1.01]) cube([100,100,1]);
  
//======================================================================================
module roundOfPencils() {
	for(i=[1:pencils])  {
	     color([i/pencils/2,i/pencils,i/pencils,1]) {
		      rotate([0,0,i*(360/pencils)])  translate([0,radius,-2]) rotate([0,angle,0-angle])  rotate([0,0,3-angle])pencil();
	      }
	}
}
module roundOfRods() {
	for(i=[1:rods])  {
//	      rotate([0,0,0-i*(360/rods)])  translate([0,radius+5,-2]) rotate([0,0-(angle+2.58),angle])   rotate([0,0,3-angle])translate([-1.5,-2,0])
	    rotate([-3,0,0-i*(360/rods)])  translate([0,radius+4,0]) cube([3,3,58]);
	}
}

intersection() {
	union() {
		translate([0,0,5])roundOfPencils();
		cylinder(3,35,34);
		translate([0,0,1.8]) torus(37.1,33.1);
		translate([0,0,60]) torus(40,36);
		translate([0,0,4])roundOfRods();
		translate([0,0,45.2])difference() {
			cylinder(15,38,39.8,$fn=90);
			translate([0,0,-0.5])cylinder(16,37.5,36.05);
			for (i=[0:rods]) {
				rotate([0,0,7+i*(360/rods)])translate([0-(radius+10),0,1.5])rotate([0,90,0])scale([2.1,0.9,1])cylinder(12,5.5,5.5,$fn=20);
			}
		}
	}
	translate([-50,-50,0]) cube([100,100,80]);
}

