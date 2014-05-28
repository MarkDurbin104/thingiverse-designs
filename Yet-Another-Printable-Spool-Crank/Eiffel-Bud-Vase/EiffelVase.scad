scale([150/90.5,150/90.5,150/90.5]) union() {
	translate([0,0,19])rotate([0,0,45])cylinder(3,14,16,center=true,$fn=4);
	translate([0,0,22])rotate([0,0,45])cylinder(3,16,10,center=true,$fn=4);
	translate([0,0,20])cube([14,14,30],center=true);

	translate([0,0,37])rotate([0,0,45])cylinder(2,8,10,center=true,$fn=4);
	translate([0,0,40])rotate([0,0,45])cylinder(4,10,5.5,center=true,$fn=4);
	translate([0,0,41])cube([8.1,8.1,30],center=true);

	translate([0,0,89])rotate([0,0,45])cylinder(1,3,4,center=true,$fn=4);
	translate([0,0,90])rotate([0,0,45])cylinder(1,4,3,center=true,$fn=4);

	difference() {
		translate([0,0,45])cube([40,40,90],center=true);
		for (rot=[0:3]) {
			rotate([0,0,90*rot]){
				translate([23,0,100])scale([1,1,200/42])rotate([90,0,0])cylinder(42,21,21,center=true,$fn=200);
				translate([18,0,0])rotate([0,90,0])cylinder(11,12,12,center=true,$fn=200);
				translate([9,0,26])rotate([0,0,45])cylinder(14,8,3,center=true,$fn=4);
				translate([4.4,0,48])rotate([0,0,45])cylinder(20,3,0.2,center=true,$fn=4);
			}
		}
	}
}
