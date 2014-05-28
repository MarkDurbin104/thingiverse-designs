el = 20; // edge length at max radius
ft = 2; // flake thickness
cmt = el / 5; // crystal max thickness
xw = 0.4; // extrude width
nc = 12; // number of crystals
bw = 1; // backbone width

make_2d = false; // set to true for 2d output (e.g. DXF)



cit = xw; // crystal min thickness
th = sqrt(3) * el/2; // triangle height


// the idea on how to do this is loosely based on origami snowflakes as at:
// http://www.marthastewart.com/276331/how-to-make-paper-snowflakes
// combined with Wilson Bentley's observations of snowflakes
// http://en.wikipedia.org/wiki/Wilson_Bentley

module flake_part(rv){
	rotate([0,0,30]) translate([0,-el/2,0])
		square([bw,el], center = true);
	for(i = [0:nc-1]){
		assign(yr = sqrt(rv[i*4]),
		   xr = rv[i*4+1] * sqrt(rv[i*4]),
		   rt = (rv[i*4+2]<(1/3))?0:(rv[i*4+2]<(2/3))?60:120,
		   sl = rv[i*4+3],
		   ct = (rv[i*4+4])*(rv[i*4+4])){
			if(((rt != 120) || (yr + sl/2 < 1)) && (sl*el/2 > xw)){
				translate([xr*el/2, -yr*th,0]) rotate(rt)
					square([sl*el/2, cit + max(0,cmt*ct/2-cit)], 
					   center = true, $fa = 60);
			}
		}
	}
}
module drawFlake() {
	// rs = 1314159; // Uncomment to get a consistent snowflake
	 rs = floor(rands(0,pow(10,6),1)[0]); // random number seed.
	echo("Random number seed: ", rs);
	//random vector (x, y, length, direction, thickness)
	rv = rands(0,1,nc*5, seed_value = rs);
	if(make_2d){
		for(ri = [0:60:300]){
			rotate([0,0,ri]) flake_part(rv);
			rotate([0,180,ri]) flake_part(rv);
		}
	} else {
		linear_extrude(height=ft){
			for(ri = [0:60:300]){
				rotate([0,0,ri]) flake_part(rv);
				rotate([0,180,ri]) flake_part(rv);
			}
		}
	}
}
module halfSnowBall() {
	translate([0,0,26.7]) union() {
		drawFlake();
		for (flat=[0:3]) 
			rotate([0,0,flat*120]) 
				translate([0,26.9,-17.1])
					rotate([109,0,0])
						drawFlake();
	}
}
module doubleSpike() {
	difference() {
		union() {
			rotate([54.5,0,0])rotate([0,0,45])translate([0,0,-0.01])cylinder(47,48,0,center=false,$fn=4);
			rotate([180+54.5,0,0])rotate([0,0,45])translate([0,0,-0.01])cylinder(47,48,0,center=false,$fn=4);
		}
		halfSnowBall();
		rotate([0,180,60]) halfSnowBall();
	}
}
module bauble() {
	intersection() {
		rotate([0,0,45]) translate([0,0,-16]) rotate([-54.5,0,0])doubleSpike();
		translate([0,0,-12])cube([67.8,67.8,76],center=true);
	}
}
module snowBauble() {
	difference() {
		union() {
			difference() {
				bauble();
				for (starp=[0:3]) {
					rotate([0,0,90*starp])translate([0,-34,-16])for (point=[0:3]) {
						rotate([0,90*point,0]) cylinder(14,3,0,$fn=4);
						rotate([0,45+90*point,0]) cylinder(9,3,0,$fn=4);
					}
				}
			}
			translate([0,-2.5,29])rotate([28,0,0])rotate([90,0,0])rotate_extrude(convexity = 10, $fn = 100) translate([6, 0, 0]) circle(r = 2, $fn = 100);
		}
		translate([0,0,0])cylinder(30,3,3);
	}
}
snowBauble();