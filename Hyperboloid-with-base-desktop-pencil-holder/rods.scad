//======================================================================================
module torus(outerRadius, innerRadius)
  {
  r=(outerRadius-innerRadius)/2;
  rotate_extrude($fn=360) translate([innerRadius+r,0,0]) circle(r,$fn=60);	
  }
//======================================================================================  

rods=72;
radius=30;
angle=35.5;

//build platform for debug  
%color([0.5,0.5,0.5,0.1]) translate([-50,-50,-1.01]) cube([100,100,1]);
  
//======================================================================================
module roundOfRods() {
//	intersection() {
	for(i=[1:rods])  {
	     color([i/rods/2,i/rods,i/rods,1]) {
	      rotate([0,0,i*(360/rods)])  translate([0,radius,-2]) rotate([0,0-angle,angle])  rotate([0,0,3-angle])translate([-1.5,-2,0])cube([3,4,91]); //cylinder(91.7,2,2.1,$fn=4);
		}
	}
//	}
}

difference() {
	intersection() {
		roundOfRods();
		translate([-50,-50,0]) cube([100,100,70]);
	}
	for(i=[1:6])  {
		rotate([0,0,30+i*60])translate([0,50,2])rotate([90,0,0])scale([1,2,1])rotate([0,0,45])cube([6,6,100]);
		rotate([0,0,i*60])translate([0,50,10])rotate([90,0,0])scale([1,2,1])rotate([0,0,45])cube([8,8,100]);
		rotate([0,0,30+i*60])translate([0,50,25])rotate([90,0,0])scale([1.5,3,1])rotate([0,0,45])cube([8,8,100]);
		rotate([0,0,i*60])translate([0,50,40])rotate([90,0,0])scale([1.2,2.4,1])rotate([0,0,45])cube([8,8,100]);
	}
}
 cylinder(3,30,30);

