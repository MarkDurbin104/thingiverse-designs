numbsteps=25;
numbRots=9;
totalHeight=104;
difference() {
	cylinder(totalHeight,38.5,7.25,$fn=50);
	for(i=[0:numbsteps*numbRots]) {
		rotate([0,0,(i%numbsteps)*(360/numbsteps)]) {
			translate([41.1-(31/(numbsteps*numbRots))*i,0,(totalHeight/(numbsteps*numbRots))*i])
				rotate([2.3+(5/(numbsteps*numbRots))*i,0,0])cube([8,10,13],center=true);
		}
	}
//	translate([0,0,2])rotate([0,90,0])cylinder(totalHeight+1,2.5,2.5,$fn=50,center=true);
	
	translate([0,-3,85])cube([10,6,20]);
	translate([-25,-25,96])cube([50,50,20]);
//	translate([0,0,-0.5])cylinder(totalHeight+1,34,3,$fn=50);
}
translate([37,0,2.5])cube([5,5,5],center=true);
translate([39,0,8])cube([3,5,16],center=true);
