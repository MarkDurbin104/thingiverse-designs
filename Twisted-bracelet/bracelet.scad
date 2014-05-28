
axisRotation 	= 7	;// the number of times around the top of the torus
radialRotation 	= 11	;// the number of times rotated into the hole in the torus
baseHeight		= 0	;// height of the plinth (0 for no plinth)
numberOfSpheres	= 1440	;// number of spheres used to complete the knot
sphereQuality 	= 5	;// the larger the number, the lower the quality see $fs in the OpenSCAD manual
module inner() {
union() {
	for ( i = [0:numberOfSpheres-1] ) {
		rotate( [0, 0, i*axisRotation*(360/numberOfSpheres)]) 
		 translate( [0, 70, 17+((baseHeight>1)?(baseHeight-2):0)] ) {
			rotate( [i*radialRotation*(360/numberOfSpheres), 0,0]) 
			 translate( [0, 0, 7] ) {
				sphere(5,$fs=sphereQuality);
			 }
		 }
	}
	if (baseHeight > 0) {
		cylinder(baseHeight,120,120);
	}
}
}
axisRotation2 	= -1	;// the number of times around the top of the torus
radialRotation2 	= 9	;// the number of times rotated into the hole in the torus
module outer() {
union() {
	for ( i = [0:numberOfSpheres-1] ) {
		rotate( [0, 0, i*axisRotation2*(360/numberOfSpheres)]) 
		 translate( [0, 70, 17+((baseHeight>1)?(baseHeight-2):0)] ) {
			rotate( [i*radialRotation2*(360/numberOfSpheres), 0,0]) 
			 translate( [0, 0, 12] ) {
				sphere(5,$fs=sphereQuality);
			 }
		 }
	}
	if (baseHeight > 0) {
		cylinder(baseHeight,120,120);
	}
}
}
inner();
outer();