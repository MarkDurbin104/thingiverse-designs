// Parametric Knot by MakeALot is licensed under the BSD License license. © 2011 by MakeALot
// http://http://www.thingiverse.com/thing:6923
// 
// If you imagine an invisible torus (donut) with a string going around it, 
// the axisRotation is the number of times the string goes around the top of the donut, 
// the radialRotation is the number of times the string goes into the hole in the donut and out again.


// the number of times around the top of the torus
axisRotation 		= 7	; 
// the number of times rotated into the hole in the torus
radialRotation 	= 6;
// height of the plinth (0 for no plinth)
baseHeight			= 0	; 
// number of spheres used to complete the knot
numberOfSpheres	= 2880	; 
// the larger the number, the lower the quality see $fs in the OpenSCAD manual
sphereQuality 		= 5	; 
 // the major radius of the torus
majorRadius			= 400	;
 // the minor radius of the torus
minorRadius			= 100  ;
// the size of each dot in the knot
sphereSize			= 20  ; 
//how much to stretch it up to help with overhang printing
vStretchFor3dPrint	= 5 ; 


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

knot();
