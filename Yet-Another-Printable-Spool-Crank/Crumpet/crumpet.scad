$fn = 100;

seed=99;
numbHoles=300;
random_rot=rands(0,12000,numbHoles,seed); 
random_dist=rands(1,100,numbHoles,seed); 
random_size=rands(0.25,1.25,numbHoles,seed); 

scale([1,1,6])difference() {
	cylinder(3,30,30,fn=60);
	translate([0,0,3])rotate_extrude(convexity = 10 ) translate([30, 0, 0]) circle(r = 3); 
	for(i=[0:numbHoles-1]) {
		rotate([0,0,random_rot[i]])translate([random_dist[i]%25,0,2]) cylinder(20,random_size[i],random_size[i],$fn=10);
	}
}