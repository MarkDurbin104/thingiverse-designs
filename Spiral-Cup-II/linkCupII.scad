// by MakeALot is licensed under the BSD License license.  2011 by MakeALot
// http://http://www.thingiverse.com


axisRotation 	= 1	; // the number of times around the top of the torus
radialRotation 	= 12	; // the number of times rotated into the hole in the torus
baseHeight		= 40	; // height of the plinth (0 for no plinth)
numberOfSpheres	= 720	; // number of spheres used to complete the knot
sphereQuality 	= 10	; // the larger the number, the lower the quality see $fs in the OpenSCAD manual
majorRadius		= 480	; // the major radius of the torus
minorRadius		= 80  ; // the minor radius of the torus
sphereSize		= 40  ; // the size of each dot in the knot
cupHeight		= 8	; // number of links high
vStretchFor3dPrint	= 1 ; //how much to stretch it up to help with overhang printing
printWidthInMM		= 80; // the width you'd like the finished item to be in millimeters

// don't change the definition of finishedWidth, this is just a constant to improve readability
finishedWidth = ((majorRadius+minorRadius+sphereSize)/vStretchFor3dPrint)*2;

// don't change the definition of runningPassOne, this is a parameter that is passed from the command line
runningPassOne = 0;

module knot() {
	scale([1/vStretchFor3dPrint,1/vStretchFor3dPrint,1]) union() {
		for ( i = [0:(numberOfSpheres/radialRotation)-5] ) {
			rotate( [0, 0, i*axisRotation*(360/numberOfSpheres)]) 
			 translate( [0, majorRadius, minorRadius+sphereSize+((baseHeight>1)?(baseHeight-2):0)] ) {
				rotate( [i*radialRotation*(360/numberOfSpheres), 0,0]) 
				 translate( [0, 0, minorRadius] ) {
					rotate( [-i*radialRotation*(360/numberOfSpheres), 0,0]) 
					scale([0.1+((i%(radialRotation*4))/20),0.1+((i %(radialRotation*4))/20),0.1+((i %(radialRotation*4))/20)]) sphere(sphereSize,$fs=sphereQuality);
				 }
			 }
		}
	}
}

module knotFromSTLs() {
	union() {
	scale([finishedWidth/printWidthInMM,finishedWidth/printWidthInMM,finishedWidth/printWidthInMM]) for ( s = [0:1] ) {
		rotate([0,0,s*180])  {
			import_stl("linkCupII_Half_Simple.stl", convexity = 5);
		}
	}
	}
}
module linkCup2() {
	for ( link = [0:cupHeight-1] ) {
		if (runningPassOne==1) {
			translate([0,0,link*(minorRadius*2-sphereSize)]) rotate([0,0,((link %2)==0)?0:180/radialRotation]) knot();
		} else {
			translate([0,0,(baseHeight-2)+link*((minorRadius*2)--sphereSize*1.5)-10]) rotate([0,0,((link %2)==0)?0:180/radialRotation]) knotFromSTLs();
		}
	}
	if (baseHeight > 0) {
		cylinder(baseHeight,finishedWidth/2,finishedWidth/2);
	}
}

scale ([printWidthInMM/finishedWidth,printWidthInMM/finishedWidth,printWidthInMM/finishedWidth]) linkCup2();
