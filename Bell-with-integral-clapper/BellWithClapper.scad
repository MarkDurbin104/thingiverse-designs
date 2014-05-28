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
					belltube(centersectionlength/scalez,((radius+(thickness/2))/2)*ratio,thickness);
					translate([0,0,0-centersectionlength/scalez]) belltop((radius+(thickness/2)),thickness,ratio,scalez);
				}
			}
		}
		translate([0,0,thickness/2])cylinder(height+thickness,radius,radius,$fn=quality);
	}
}


difference() {
	intersection() {
		union() {
			color([1,0.5,0.5,1])difference() {
				union() {
					translate([0,0,56]) bell(12,5,7,1,0);
					bell(60,30,4,1,15);
					translate([0,0,54])cylinder(6,12,3,center=true,$fn=quality);
				}
				translate([0,0,60])rotate([90,0,90])cylinder(13,2,2,$fn=6,center=true);
				intersection() {
					translate([0,0,52.1])cylinder(4.5,10.5,8,center=true,$fn=quality);
					translate([0,0,51])rotate([90,0,90])cylinder(30,6,6,$fn=6,center=true);
				}
			}
			color([1,0.5,0.5,1])translate([0,0,47])rotate([90,0,0])cylinder(25.8,2.5,2.5,$fn=6,center=true);
			color([1,1,0.8,1])translate([0,0,20.5]) cylinder(40.5,4,4,$fn=quality,center=true);
			color([1,1,0.8,1])scale([1,1,2])sphere(8,$fn=quality,center=true);
		 	color([1,1,1,1])rotate([90,0,90])cylinder(52,0.5,0.5,$fn=quality,center=true);
			color([1,1,0.8,1])translate([0,0,45])scale([1,1,1.3])rotate([90,30,0])rotate_extrude(convexity=10,$fn=6) translate([6,0,0]) rotate([0,0,30])circle(2,$fn=6);
		}
		color([1,0.5,0.5,1])translate([0,0,50])cube([100,100,100],center=true);
	}
	//color([0.2,0.2,0.2,1]) rotate([0,0,35])translate([32,0,12])cylinder(100,25,25,$fn=100);
}