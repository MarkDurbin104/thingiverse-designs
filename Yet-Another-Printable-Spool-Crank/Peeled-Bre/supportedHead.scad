module part() {
	translate([0,1.5,55]) scale([0.75,0.75,0.75]) translate([0,0,-50])intersection() {
		import_stl("BreTest01_lowpoly.stl",convexity=15);
		translate([-40,-40,40])cube([100,100,60],centre=true);
	}
}
module link() {
	rotate([0,0,90]) 
	linear_extrude(height = 45, center = false, convexity = 10, twist = 2000, $fn = 20)
	translate([9, 0, 0])
	circle(r = 5, $fn = 12);
}
module support() {
	intersection() {
		import_stl("BreTest01_lowpoly.stl",convexity=15);
		union() {
			part();
			translate([0,4,48])scale([1.6,1.8,1])  link();
			translate([0,4,48])scale([0.75,0.9,1])  link();
			translate([0,4,48.5])scale([1.6,1.8,1])  link();
			translate([0,4,48.5])scale([0.75,0.9,1])  link();
			translate([0,4,49])scale([1.6,1.8,1])  link();
			translate([0,4,49])scale([0.75,0.9,1])  link();
			translate([0,4,49.5])scale([1.6,1.8,1])  link();
			translate([0,4,49.5])scale([0.75,0.9,1])  link();
		}
	}
}
module model() {
	difference() {
		import_stl("BreTest01_lowpoly.stl",convexity=15);
		part();
		translate([0,4,48])scale([1.6,1.8,1])  link();
		translate([0,4,48])scale([0.75,0.9,1])  link();
		translate([0,4,48.5])scale([1.6,1.8,1])  link();
		translate([0,4,48.5])scale([0.75,0.9,1])  link();
		translate([0,4,49])scale([1.6,1.8,1])  link();
		translate([0,4,49])scale([0.75,0.9,1])  link();
		translate([0,4,49.5])scale([1.6,1.8,1])  link();
		translate([0,4,49.5])scale([0.75,0.9,1])  link();
	}
}

color([0,1,0,1])translate([-0,0,0])support();
color([1,1,0,1])translate([-50,0,0])import_stl("BreTest01_lowpoly.stl",convexity=15); 
color([1,0.2,0.2,1])translate([50,0,0])model();