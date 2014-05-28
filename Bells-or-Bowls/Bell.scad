bellHeight=20;
bellRadius=10;
bellThickness=2;
bellRatio=1;
bellCenterSectionLength=0;

module belltop(size=10,thickness=1,ratio=1,scalez=1) {
	thicknessRatio=1+((((thickness*scalez)/(size*ratio))-(thickness/(size*ratio)))/2);
	union() {
		intersection() {
			difference() {
				sphere((size*ratio)/2,$fn=quality);
				scale([1,1,thicknessRatio])sphere(((size*ratio)-thickness)/2,$fn=quality);
			}
			translate([0,0,0-size*ratio/4])cube([size*ratio,size*ratio,size*ratio/2+0.01],center=true);
		}
	}
}
module belltube(height=1,radius=10,thickness=1) {
	translate([0,0,0-height/2]) difference() {
		cylinder(height+0.1,radius,radius,center=true,$fn=quality);
		cylinder(height+1,radius-thickness/2,radius-thickness/2,center=true,$fn=quality);
	}
}
module bellend(size=10,thickness=1,ratio=1,scalez=1) {
	thicknessRatio=1+((((thickness*scalez)/size)-(thickness/size))/2)/ratio;
	intersection() {
		difference() {
			rotate_extrude(convexity=10,$fn=quality) translate([size,0,0]) circle(size*ratio/2+thickness/2,$fn=quality);
			scale([1,1,thicknessRatio]) rotate_extrude(convexity=10,$fn=quality) translate([size,0,0]) circle(size*ratio/2,$fn=quality);
		}
		translate([0,0,size*ratio/4+thickness/4])cylinder(size*ratio/2+thickness/2+0.01,size,size,center=true,$fn=quality);
	}
}

quality=48; // as in $fn=quality;

// height - overall height of the bell in mm
// radius - outer radius of bell in mm
// thickness - thickness of bell wall in mm
// ratio - the ratio of top to bottom (between 0.4 and 1.75)
// centersectionlength straight section inserted between the top and bottom in mm
module bell(height=20,radius=10,thickness=2,ratio=1,centersectionlength=0) {
	curvedheight=height-centersectionlength;
	scalez=(curvedheight-(thickness/2))/(radius+(thickness/2));
	translate([0,0,0-thickness/2])intersection() {
		union() {
			scale([1,1,scalez]) rotate([180,0,0]) {
				translate([0,0,0-thickness/2-((radius+(thickness/2))/2)*(2-ratio)]) union() {
					bellend((radius+(thickness/2)),thickness,2-ratio,scalez);
					color([1,1,0.5,1])belltube(centersectionlength/scalez,((radius+(thickness/2))/2)*ratio,thickness);
					translate([0,0,0-centersectionlength/scalez]) belltop((radius+(thickness/2)),thickness,ratio,scalez);
				}
			}
		}
		translate([0,0,thickness/2])cylinder(height+thickness,radius,radius,$fn=quality);
	}
}


module arrayOfBells() {
	translate([-52,0,-11]) {
		for (i=[3:8]) {
			translate([(i-3)*21,0,0])bell(20,10,2,i/5,0);
		}
		for (i=[1:6]) {
			translate([(i-1)*21,0,25])bell(20,10,2,1,i);
		}
		for (i=[1:6]) {
			translate([(i-1)*21,0,-25])bell(20,10,2,(i+2)/5,i);
		}
		for (i=[1:6]) {
			translate([(i-1)*21,0,-50])bell(20,10,2,(i+2)/5,7-i);
		}
		for (i=[1:6]) {
			translate([(i-1)*21,0,50])bell(20,4+i,2,1,0);
		}
	}
}

bell(bellHeight,bellRadius,bellThickness,bellRatio,bellCenterSectionLength);