module roundedCube(x,y,z,cornerRadius,quality)  {
	x=x-cornerRadius*2;
	y=y-cornerRadius*2;
	z=z-cornerRadius*2;
	translate([cornerRadius+x/2,cornerRadius+y/2,cornerRadius+z/2])  {
		union() {
			translate([x/2,y/2,z/2])sphere(cornerRadius,$fn=quality);
			translate([x/2,y/2,0-z/2])sphere(cornerRadius,$fn=quality);
			translate([0-x/2,y/2,z/2])sphere(cornerRadius,$fn=quality);
			translate([0-x/2,y/2,0-z/2])sphere(cornerRadius,$fn=quality);
			translate([x/2,0-y/2,z/2])sphere(cornerRadius,$fn=quality);
			translate([x/2,0-y/2,0-z/2])sphere(cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,z/2])sphere(cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,0-z/2])sphere(cornerRadius,$fn=quality);
		
			translate([0-x/2,0-y/2,0-z/2])rotate([0,90,0])cylinder(x,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,y/2,0-z/2])rotate([0,90,0])cylinder(x,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,z/2])rotate([0,90,0])cylinder(x,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,y/2,z/2])rotate([0,90,0])cylinder(x,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,0-z/2])rotate([-90,0,0])cylinder(y,cornerRadius,cornerRadius,$fn=quality);
			translate([x/2,0-y/2,0-z/2])rotate([-90,0,0])cylinder(y,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,z/2])rotate([-90,0,0])cylinder(y,cornerRadius,cornerRadius,$fn=quality);
			translate([x/2,0-y/2,z/2])rotate([-90,0,0])cylinder(y,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,0-y/2,0-z/2])rotate([0,0,90])cylinder(z,cornerRadius,cornerRadius,$fn=quality);
			translate([x/2,0-y/2,0-z/2])rotate([0,0,90])cylinder(z,cornerRadius,cornerRadius,$fn=quality);
			translate([0-x/2,y/2,0-z/2])rotate([0,0,90])cylinder(z,cornerRadius,cornerRadius,$fn=quality);
			translate([x/2,y/2,0-z/2])rotate([0,0,90])cylinder(z,cornerRadius,cornerRadius,$fn=quality);
		
			translate([0-cornerRadius-x/2,0-y/2,0-z/2]) cube([x+cornerRadius*2,y,z]);
			translate([0-x/2,0-cornerRadius-y/2,0-z/2]) cube([x,y+cornerRadius*2,z]);
			translate([0-x/2,0-y/2,0-cornerRadius-z/2]) cube([x,y,z+cornerRadius*2]);
		}
	}
}
module ballMaze(x,y,z,cornerRadius,quality,ballSize) {
	translate([0-x/2,0-y/2,0]) 
	difference() {
//		cube([x,y,z]);  // use this cube instead of the roundedCube below to see the item render with F5
		roundedCube(x,y,z,cornerRadius,quality); // use this roundedCube instead of the cube above to see the item render win best quality using F6 and to generate the STL for printing
		for (i=[0:8]) {
			translate([ballSize-2+floor(i/3)*(ballSize-2)*2,ballSize-2+(i%3)*(ballSize-2)*2,ballSize-2])sphere(ballSize-2,$fn=quality);
			translate([ballSize-2+floor(i/3)*(ballSize-2)*2,ballSize-2+(i%3)*(ballSize-2)*2,z-(ballSize-2)])sphere(ballSize-2,$fn=quality);
			translate([ballSize-2+floor(i/3)*(ballSize-2)*2,ballSize-2+(i%3)*(ballSize-2)*2,ballSize-2])cylinder(z-(ballSize-2)*2,ballSize-2,ballSize-2,$fn=quality);
			translate([ballSize-2+floor(i/3)*(ballSize-2)*2,ballSize-2+(i%3)*(ballSize-2)*2,-1])cylinder(z+2,ballSize-6,ballSize-6,$fn=quality);
		}
		translate([ballSize-2+0*(ballSize-2)*2,ballSize-2+0*(ballSize-2)*2,ballSize-2]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+1*(ballSize-2)*2,ballSize-2+0*(ballSize-2)*2,z-(ballSize-2)]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+0*(ballSize-2)*2,ballSize-2+1*(ballSize-2)*2,ballSize-2]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+1*(ballSize-2)*2,ballSize-2+1*(ballSize-2)*2,z-(ballSize-2)]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+0*(ballSize-2)*2,ballSize-2+2*(ballSize-2)*2,ballSize-2]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+1*(ballSize-2)*2,ballSize-2+2*(ballSize-2)*2,z-(ballSize-2)]) rotate([0,90,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+0*(ballSize-2)*2,ballSize-2+2*(ballSize-2)*2,z-(ballSize-2)]) rotate([90,0,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);
		translate([ballSize-2+2*(ballSize-2)*2,ballSize-2+1*(ballSize-2)*2,(ballSize-2)]) rotate([90,0,0])cylinder(2*(ballSize-2),ballSize-4,ballSize-4,$fn=quality);

		for (i=[0:2]) {
			translate([ballSize-2+i*(ballSize-2)*2,-1,ballSize-2]) rotate([-90,0,0]) cylinder(y+2,ballSize-6,ballSize-6,$fn=quality);
			translate([ballSize-2+i*(ballSize-2)*2,-1,z-(ballSize-2)]) rotate([-90,0,0]) cylinder(y+2,ballSize-6,ballSize-6,$fn=quality);
			translate([4+i*(ballSize-2)*2,-1,ballSize-3]) cube([(ballSize-6)*2,y+2,(ballSize-6)*6]);
		}
		translate([x,0,0])rotate([0,0,90]) for (i=[0:2]) {
			translate([ballSize-2+i*(ballSize-2)*2,-1,ballSize-2]) rotate([-90,0,0]) cylinder(y+2,ballSize-6,ballSize-6,$fn=quality);
			translate([ballSize-2+i*(ballSize-2)*2,-1,z-(ballSize-2)]) rotate([-90,0,0]) cylinder(y+2,ballSize-6,ballSize-6,$fn=quality);
			translate([4+i*(ballSize-2)*2,-1,ballSize-3]) cube([(ballSize-6)*2,y+2,(ballSize-6)*6]);
		}
	}
}
ballMaze(78,78,78,2,36,15);
translate([-26,-26,11]) sphere(11);
