
//======================================================================================  
module pencil(withTip) {
	if (withTip) {
		intersection() {
			cylinder(200,4.4,4.4,$fn=6);
			color([1,0.7,0.7,1]) union() {
				translate([0,0,174.9])cylinder(25,6,0.25,$fn=18);
				translate([0,0,0.05])cylinder(175,6,6,$fn=6);
			}
		}
		color([0.4,0.4,0.4,1]) translate([0,0,195.3])cylinder(5,1.3,0.25,$fn=18);
	} else {
		cylinder(200,4.4,4.4,$fn=6);
	}
}

pencils=4;
radius=5;
outangle=6;
roundangle=40;
ranginc=0;
oanginc=10;
radinc=10.5;
reduce=4;
layers=3;
maxcol=(layers*pencils*reduce)/70;
maxcola=maxcol+5;

//build platform for debug  
%color([0.5,0.5,0.5,0.1]) translate([-50,-50,-1.01]) cube([100,100,1]);
  
//======================================================================================
module pencils(withTips) {
	for(j=[1:layers])  {
		for(i=[1:pencils+(j*reduce)])  {
		     color([maxcol/(((j*pencils)+i)%maxcola),maxcol/(((j*pencils)+i*3)%maxcola),maxcol/(((j*pencils)+i*5)%maxcola),1]) {
			      rotate([0,0,i*(360/(pencils+(j*reduce)))])  translate([0,radius+(j*radinc),(j*0.64)+1]) rotate([0,0-(outangle+(oanginc*j)),roundangle+(ranginc*j)])  rotate([0,0,1])pencil(withTips);
		      }
		}
	}
}

module holder() {
	difference() {
		cylinder(10,10.5+(layers*radinc),9.5+(layers*radinc));
		pencils(false);
	}
}

holder();
showPencils=false;
if (showPencils) {
	pencils(true);
}
