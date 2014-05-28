length=40;
radius=31;
minradius=30;
thickness=4;

module section() {
	difference() {
	scale([1/1.22,1/1.22,2*(1/1.22)]) translate([0,0,((radius+thickness+0.75)*2*0.813)/2])intersection() {
		union() {
			difference() {
				rotate_extrude(convexity = 10, $fn = 100) translate([radius, 0, 0]) circle(r = minradius, $fn = 100); 
				rotate_extrude(convexity = 10, $fn = 100) translate([radius, 0, 0]) circle(r = minradius-thickness, $fn = 100); 
				cube([radius*2.4,thickness+1,radius*2],center=true);
			}
			translate([0,0,radius*0.813])cylinder(thickness+0.1,radius*1.21,radius*1.21);
			translate([0,0,0-(radius*0.813)-(thickness+0.1)])cylinder(thickness+0.1,radius*1.21,radius*1.21);
		}
		cube([200,thickness,(radius+thickness+0.75)*2*0.813],center=true);
	}
	translate([0,0,92])cylinder(6.8,28,31,center=true, $fn = 60);
	translate([0,0,89])cylinder(8,33,30,center=true, $fn = 60);
	}
}

module lidSection() {
	scale([1/1.22,1/1.22,2*(1/1.22)]) translate([radius,0,((radius+thickness+0.75)*2*0.813)/2])intersection() {
		union() {
			difference() {
				rotate_extrude(convexity = 10, $fn = 100) translate([radius, 0, 0]) circle(r = minradius, $fn = 100); 
				rotate_extrude(convexity = 10, $fn = 100) translate([radius, 0, 0]) circle(r = minradius-thickness, $fn = 100); 
				cube([radius*2.4,thickness*2+1,radius*2],center=true);
				translate([radius,0,0])cube([radius*2.4,thickness*2+1,radius*2],center=true);
			}
		}
		cube([200,thickness*2,(radius+thickness+0.75)*2*0.813],center=true);
	}
}

module base() {
	for (i=[0:29]) rotate([0,0,i*6]) section();
}

module lid() {
	intersection() {
		translate([0,0,0])cylinder(6.8,28,31,center=true, $fn = 60);
		translate([0,0,50])cube(100,center=true);
	}
	for (i=[0:11]) rotate([0,0,i*30]) scale(0.5) lidSection();
}

module scene() {
	color([0.5,1,1,1])import_stl("bowl2.stl");
	color([0.5,1,1,1])translate([0,0,92])import_stl("bowl2lid.stl");
	
	color([0.5,0.5,1,1])translate([-120,0,0]) import_stl("bowl2.stl");
	color([0.5,0.5,1,1])translate([-60,60,0]) import_stl("bowl2lid.stl");
	
	color([0.5,1,0.5,1])translate([-60,-100,0]) import_stl("bowl2.stl");
	color([0.5,1,0.5,1])translate([-60,-100,92]) import_stl("bowl2lid.stl");
}