//for (i=[0:29]) translate([round(i/5-0.49)*18-45,(i%5)*13-31.5,0]) griper();
//for (i=[0:5]) translate([round(i/3-0.49)*60-30,(i%3)*60-60,0]) star2();

//star2();
//griper();
starbase();

module grip() {
	translate([-5,0,5])cube([4,10,10],center=true);
	translate([0,0,5])cube([10,4,10],center=true);
	translate([5,0,5])cube([4,10,10],center=true);
}
module griper() {
	translate([-5.2,0,2.5])scale(0.9) cube([4,10,4],center=true);
	translate([0,0,2.5]) scale(0.9) cube([10,4,4],center=true);
	translate([5.2,0,2.5]) scale(0.9) cube([4,10,4],center=true);
}
module griperEnd() {
	translate([-2,0,2]) scale(0.9) cube([4,4,4],center=true);
}
module star() {
	difference() {
		rotate([0,0,18])translate([-24,-24,10])import(file="ChrsistmasStarPiece_thin_v4.stl",layer="",convexity=15);
		translate([0,0,12.5])cylinder(25,2.5,2.5,center=true,$fn=10);
	}
}
module star2() {
	difference() {
		star();
		union() { for (i=[0:5]) rotate([0,0,i*72]) translate([15,0,-5]) rotate([0,30,0])grip(); }
	}
}
module starbase() {
	difference() {
		union() {
			star();
			union() { for (i=[0:5]) rotate([0,0,i*72]) translate([19,0,-1]) rotate([0,30,0])griperEnd(); }
		}
		translate([0,0,0])rotate([0,0,18.75])translate([0,19.5,0])rotate([-38,0,0])cylinder(40,2.5,2.5,center=true,$fn=20);
		translate([0,0,-50]) cube([100,100,100],center=true);
	}
}
