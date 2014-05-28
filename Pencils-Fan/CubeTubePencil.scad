tLen=20;
bSize=7;
thickness=1.4;
spacing=0.3;
withGaps=false;
module oneSleve() {
	translate([0,0,tLen*2])rotate([0,180,-45]){ 
		difference() {
			translate([0,0,0])cylinder(tLen*3,bSize-3.1,bSize+1,$fn=4);
			translate([0,0,-0.01])cylinder(tLen*3+2,bSize-3-thickness,bSize+1-thickness,$fn=4);
//			rotate([0,0,45])cube([bSize*2,bSize*2,tLen*3]);
		}
//		translate([0,0,tLen-0.01])cylinder(20,3.5,4.5,$fn=100);
	}
}

rows=5;
cols=5;
intersection() {
translate([0,0,61+tLen*2-rows*1.2]) {
for (i=[0:rows-1]) {
	for (j=[0:cols-1]) {
		rotate([5.52*(i-(rows-1)/2),5.52*(j-(cols-1)/2),0])translate([0,0,0-(49+tLen*2)])oneSleve();
	}
}
}
translate([0,0,tLen*0.75])cube([cols*bSize*2,rows*bSize*2,tLen*1.5],center=true);

}