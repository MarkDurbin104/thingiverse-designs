module torus(major,minor,q) {
	rotate_extrude(convexity = 10, $fn = q)
	translate([major, 0, 0])
	circle(r = minor, $fn = q/2);
}

include <oldbezier.scad>

gDemoSteps = 50;
gDemoHeight = 6;
quality=40;

loadHeart=true;
module DrawHeart() {
	if (loadHeart) {
		import_stl("heart.stl",convexity=15);
	} else {
		translate([-150, -190, -2]) {
			BezCubicFilletColored( [[150, 150],[150,120],[100,120],[100,150]], [150,150], 
			gDemoSteps, gDemoHeight, [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[100, 150],[100,180],[150,185],[150,210]], [150,150], 
			gDemoSteps, gDemoHeight, [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[150, 210],[150,185],[200,180],[200,150]], [150,150], 
			gDemoSteps, gDemoHeight,  [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
			
			BezCubicFilletColored( [[200, 150],[200,120],[150,120],[150,150]], [150,150], 
			gDemoSteps, gDemoHeight,  [[1,0,0],[1,0,0],[1,1,1],[1,0,0]]);
		}
	}
}

module makerLogo() {
	translate([0,-4,0])union() {
		cylinder(1,1,1,$fn=quality);
		translate([4,0,0])cylinder(1,1,1,$fn=quality);
		translate([-4,0,0])cylinder(1,1,1,$fn=quality);
		difference() {
			union() {
				translate([3,7,0])cylinder(1,2,2,$fn=quality);
				translate([-3,7,0])cylinder(1,2,2,$fn=quality);
			}
			translate([-3,5,-0.1])cube([6,2,1.2]);
		}
		translate([-1,0,0])cube([2,8,1]);
		translate([-5,0,0])cube([2,7,1]);
		translate([3,0,0])cube([2,7,1]);
		translate([-3,7,0])cube([6,2,1]);
	}
}
module mbRobot() {
	intersection() {
		translate([0.55,0,0])union() {
			color([1.0.8,0.8,1])difference() {
				cube([1.3,1.3,2],center=true);
				translate([0,0,0.2])cube([1.4,0.9,1],center=true);
				translate([0,0,0.2])cube([0.9,1.4,1],center=true);
				translate([0,0,0.2])cube([0.9,0.9,1.2],center=true);
				translate([0,0,1])cube([0.9,0.9,0.2],center=true);
			}
			color([1.0.8,0.8,1])translate([0,0,-0.3])cube([0.6,0.6,0.4],center=true);
			translate([-0.75,0.45,-0.475])rotate([0,-30,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([-1.25,0.45,-0.475])rotate([0,30,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([-1,0.45,0])sphere(0.18,$fn=quality);
			translate([-1.5,0.45,-1])sphere(0.25,$fn=quality);
			
			translate([-0.75,-0.45,-0.475])rotate([0,-30,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([-1.25,-0.45,-0.475])rotate([0,30,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([-1,-0.45,0])sphere(0.18,$fn=quality);
			translate([-1.5,-0.45,-1])sphere(0.25,$fn=quality);
			
			translate([0,0.84,0.43])rotate([30,-10,0])cylinder(0.9,0.18,0.18,center=true,$fn=quality);
			translate([-0.01,1.08,-0.5])rotate([0,10,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([0.075,1.08,0.01])sphere(0.18,$fn=quality);
			translate([-0.065,0.62,0.8])sphere(0.18,$fn=quality);
			translate([-0.1,1.075,-1])sphere(0.18,$fn=quality);
			color([1,0,0,1])translate([-0.5,1.15,-1])rotate([0,0,-100])scale([0.075,0.075,0.075])makerLogo();
			
			translate([0,-0.84,0.43])rotate([-30,-10,0])cylinder(0.9,0.18,0.18,center=true,$fn=quality);
			translate([-0.01,-1.08,-0.5])rotate([0,10,0])cylinder(1,0.18,0.18,center=true,$fn=quality);
			translate([0.075,-1.08,0.01])sphere(0.18,$fn=quality);
			translate([-0.065,-0.62,0.8])sphere(0.18,$fn=quality);
			translate([-0.1,-1.075,-1])sphere(0.18,$fn=quality);
			color([1,0,0,1])translate([-0.5,-1.15,-1])rotate([0,0,-80])scale([0.075,0.075,0.075])makerLogo();
		}
		color([1.0.8,0.8,1])cube([2.5,3.2,2],center=true);
	}
	color([1.0.8,0.8,1])translate([0.57,0,1.1])rotate([0,10,10])cube([0.44,0.9,0.4],center=true);
	translate([0.4,-0.05,0.1])rotate([0,10,10]) union() {
		color([0.5,1,0.5,1])translate([0,0,1.35])rotate([0,90,0])cylinder(0.4,0.5,0.5,center=true,$fn=quality);
		color([0.3,0.3,0.3,1])translate([0.2,0,1.35])rotate([0,90,0])cylinder(0.1,0.6,0.6,center=true,$fn=quality);
		color([0.3,0.3,0.3,1])translate([-0.2,0,1.35])rotate([0,90,0])cylinder(0.1,0.6,0.6,center=true,$fn=quality);
		color([1,0,0,1])translate([-0.2,0,1.35]) sphere(0.1,$fn=quality);
		color([1.0.5,0.5,1])translate([-0.2,0.25,1.6]) sphere(0.17,$fn=quality);
		color([1.0.5,0.5,1])translate([-0.2,-0.25,1.6]) sphere(0.17,$fn=quality);
		intersection() {
			translate([-0.25,0,1.35]) rotate([0,90,0])torus(0.4,0.05,quality);
			translate([-0.25,0,1.1]) cube([1,1,0.5],center=true);
		}
	}

	translate([0.55,0,-0.1])rotate([-90,0,90])scale([0.0075,0.01,0.045]) color([1,0,0,1])DrawHeart();
}

scale([30,30,30])translate([0,0,1]) difference() {
	mbRobot();
	color([1.0.8,0.8,1])translate([0.55,0,0.75])cube([0.9,0.9,0.1],center=true);
}
//translate([0,0,50])%cube([100,100,100],center=true);