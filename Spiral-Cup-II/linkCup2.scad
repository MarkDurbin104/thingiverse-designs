// by MakeALot is licensed under the BSD License license. © 2011 by MakeALot
// http://http://www.thingiverse.com

axisRotation 		= 1	; // the number of times around the top of the torus
radialRotation 		= 12	; // the number of times rotated into the hole in the torus
baseHeight			= 15	; // height of the plinth (0 for no plinth)
numberOfSpheres		= 360	; // number of spheres used to complete the knot
sphereQuality 		= 5	; // the larger the number, the lower the quality see $fs in the OpenSCAD manual
majorRadius			= 480	; // the major radius of the torus
minorRadius			= 40  ; // the minor radius of the torus
sphereSize			= 25  ; // the size of each dot in the knot
cupHeight			= 10	; // number of links high
vStretchFor3dPrint	= 2.5 ; //how much to stretch it up to help with overhang printing
finishedWidth		= ((majorRadius+minorRadius+sphereSize)/vStretchFor3dPrint)*2;
printWidthInMM		= 80; // the width you'd like the finished item to be in millimeters

module knot() {
	scale([1/vStretchFor3dPrint,1/vStretchFor3dPrint,1]) union() {
		for ( i = [0:numberOfSpheres-1] ) {
			rotate( [0, 0, i*axisRotation*(360/numberOfSpheres)]) 
			 translate( [0, majorRadius, minorRadius+sphereSize+((baseHeight>1)?(baseHeight-2):0)] ) {
				rotate( [i*radialRotation*(360/numberOfSpheres), 0,0]) 
				 translate( [0, 0, minorRadius] ) {
					sphere(sphereSize,$fs=sphereQuality);
				 }
			 }
		}
	}
}
module linkCup2() {
	for ( link = [0:cupHeight-1] ) {
		translate([0,0,link*(minorRadius*2-sphereSize)]) rotate([0,0,((link %2)==0)?0:180/radialRotation]) knot();
	}
	if (baseHeight > 0) {
		cylinder(baseHeight,finishedWidth/2,finishedWidth/2);
	}
}

scale ([printWidthInMM/finishedWidth,printWidthInMM/finishedWidth,printWidthInMM/finishedWidth]) linkCup2();

