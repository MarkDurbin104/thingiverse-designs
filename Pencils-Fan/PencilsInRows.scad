


module pencil() intersection() {
	cylinder(180,0,40,$fn=18);
	cylinder(180,4.5,4.5,$fn=6);
}
module pencilHole() {
	difference() {
		translate([0,0,3])intersection() {
			cylinder(180,0,40,$fn=18);
			cylinder(30,4,5,$fn=18);
		}
	}
}

angle=2.5;
numRows=8;
numCols=8;

difference() {
translate([-11.5,-11.5,0]) 
cube([numCols*11,numRows*11,30]);
for(j=[0:numRows-1]) {
	for (i=[0:numCols-1]) { 
		translate([9.5*i,9.5*j,0]) 
			rotate([(numRows/2)*angle-j*angle,0-(numCols/2)*angle+i*angle,0]) 
				pencilHole(); 
	}
}
}