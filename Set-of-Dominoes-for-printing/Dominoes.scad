include <libraries/boxes.scad>
module drawDot(x,y,dotSize,dotSpace) {
	translate([x*dotSpace,y*dotSpace,0]) sphere(dotSize,$fn=20);
}
module dots(numbDots,dotSize,dotSpace) {
	if ((numbDots>=1)&&(numbDots<=6)) {
		if ((numbDots==1)||(numbDots==3)||(numbDots==5)) {
			drawDot(0,0,dotSize,dotSpace);
		}
		if (numbDots>1) {
			drawDot(1,1,dotSize,dotSpace);
			drawDot(-1,-1,dotSize,dotSpace);
		}
		if ((numbDots==4)||(numbDots==5)||(numbDots==6)) {
			drawDot(-1,1,dotSize,dotSpace);
			drawDot(1,-1,dotSize,dotSpace);
		}
		if (numbDots==6) {
			drawDot(1,0,dotSize,dotSpace);
			drawDot(-1,0,dotSize,dotSpace);
		}
	}
}
module domino(numDots1,numDots2,dotSize,dotSpace,thickness) {
	difference() {
		roundedBox([dotSpace*3.5,dotSpace*8,thickness],dotSize/2,true);
		translate([0,dotSpace*2,thickness/2]) dots(numDots1,dotSize,dotSpace);
		translate([0,0-dotSpace*2,thickness/2])dots(numDots2,dotSize,dotSpace);
		translate([0,0,thickness/2])cube([dotSpace*3,dotSize/2,dotSize/2],center=true);
	}
}

module set(setIndex,dotSize,dotSpace,thickness) {
	translate([dotSpace*-6,dotSpace*-4.25,thickness/2])for(i=[0:6-setIndex]) {
		translate([(i%4)*dotSpace*4,floor(i/4)*dotSpace*8.5,0])domino(i,6-setIndex,dotSize,dotSpace,thickness);
	}
	if (setIndex>0) {
		translate([dotSpace*-6,dotSpace*-4.25,thickness/2])for(i=[0:setIndex-1]) {
			translate([((6-i)%4)*dotSpace*4,floor((6-i)/4)*dotSpace*8.5,0])domino(i,setIndex-1,dotSize,dotSpace,thickness);
		}
	}
}

// select set number between 0 and 3 
//	0=0|6,1|6,2|6,3|6,4|6,5|6,6|6 
//	1=0|5,1|5,2|5,3|5,4|5,5|5,0|0 
//	2=0|4,1|4,2|4,3|4,4|4,1|1,0|1 
//	3=0|3,1|3,2|3,3|3,2|2,1|2,0|2

setNumber=0;
set(setNumber,2.5,6,4);
