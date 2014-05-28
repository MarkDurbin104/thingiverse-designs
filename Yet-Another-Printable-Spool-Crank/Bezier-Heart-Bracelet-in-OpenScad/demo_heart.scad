include <bezier.scad>

// Borrowed from the tutorial found here:
// http://www.local-guru.net/blog/2010/09/19/pulsating-heart-made-from-bezier-curves-in-processing

//beginShape();
//vertex(150,150);
//bezierVertex( 150,120, 100,120, 100, 150);
//bezierVertex( 100,180, 150,185, 150, 210 );
//bezierVertex( 150,185, 200,180, 200, 150 );  
//bezierVertex( 200,120, 150,120, 150, 150 );  
//endShape();

gDemoSteps = 10;
gDemoHeight = 6;


module DrawHeart() {
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
numHearts=24;
module bracelet() {
	difference() {
		translate([0,0,-15])cylinder(30,44,44,$fn=72);
		for (i=[0:numHearts-1]) {
			rotate([0,(i%2)*180,i*(360/numHearts)])translate([0,43,0])rotate([-90,0,0])scale([0.2,0.2,0.75]) DrawHeart();
		}
		translate([0,0,-16])cylinder(32,40,40,$fn=72);
	}
}
module oneHeart() {
	scale([0.95,0.95,0.95])translate([0,5,1.5]) rotate([90,0,0])translate([0,-43,0]) {
		intersection() {
			rotate([0,0,0])translate([0,43,0])rotate([-90,0,0])scale([0.2,0.2,0.75]) DrawHeart();
			translate([0,0,-15])cylinder(30,44,44,$fn=72);
		}
	}
}
module sixHearts() {
	oneHeart();
	translate([22,0,0]) oneHeart();
	translate([-22,0,0]) oneHeart();
	translate([11,10,0]) rotate([0,0,180]) oneHeart();
	translate([-11,10,0]) rotate([0,0,180]) oneHeart();
	translate([-33,10,0]) rotate([0,0,180]) oneHeart();
}
module allHearts() {
	translate([0,-39,0]) sixHearts();
	translate([0,-13,0]) sixHearts();
	translate([0,13,0]) sixHearts();
	translate([0,39,0]) sixHearts();
}

//bracelet();
allHearts();