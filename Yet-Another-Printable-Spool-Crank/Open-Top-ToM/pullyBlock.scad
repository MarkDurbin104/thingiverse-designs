
platformThickness=5;


beltTightTravel=14;
beltTightOffset=29;
beltTightSprocketHeight=17.45;
beltTightSprocketOD=14;
beltTightSprocketBeltD=9.25;
beltTightSprocketBaseD=9.25;
beltTightSprocketBaseSpace=3.3;
beltTightSprocketRimHeight=1.65;
beltTightSprocketBaseHeight=6.25;
Xbeltheight=5;
beltspace=12;
beltThickness=6.35;

pullBoltLength=22;
pullBoltHoleDia=4;
pullBoltHeadDia=6.5;
pullBoltHeadLength=3;

expoffset=20;

module pullySprocket() {
	
	color([0.3,0.3,0.3,1]) difference() {
		union() {
		
			translate([0,0,0])cylinder(beltTightSprocketBaseHeight,beltTightSprocketBaseD/2,beltTightSprocketBaseD/2,$fn=20);
			translate([0,0,beltTightSprocketBaseHeight])cylinder(beltTightSprocketRimHeight,beltTightSprocketOD/2,beltTightSprocketOD/2,$fn=20);
			translate([0,0,0])cylinder(beltTightSprocketHeight,beltTightSprocketBeltD/2,beltTightSprocketBeltD/2,$fn=20);
			translate([0,0,beltTightSprocketHeight-beltTightSprocketRimHeight])cylinder(beltTightSprocketRimHeight,beltTightSprocketOD/2,beltTightSprocketOD/2,$fn=20);
		}
		translate([0,0,0])
			rotate([0,0,30])cylinder(50,2.5,2.5,center=true,$fn=6);
	}
}

module pullBolt() {
	cylinder(pullBoltLength,pullBoltHoleDia/2,pullBoltHoleDia/2,center=true,$fn=6);
	translate([0,0,((pullBoltLength+pullBoltHeadLength)/2)-0.01])cylinder(pullBoltHeadLength,pullBoltHeadDia/2,pullBoltHeadDia/2,center=true,$fn=10);
	translate([0,0,-2])cylinder(3.5,pullBoltHeadDia/2,pullBoltHeadDia/2,center=true,$fn=6);
}
module pullSprocket() {
	translate([0,0,beltTightSprocketBaseSpace+beltTightSprocketHeight/2]) {
	cylinder(beltTightSprocketHeight,beltTightSprocketBeltD/2,beltTightSprocketBeltD/2,center=true,fn=10);
	translate([0,0,beltTightSprocketHeight/2-0.5])cylinder(1,beltTightSprocketOD/2,beltTightSprocketOD/2,center=true,fn=10);
	translate([0,0,0-(beltTightSprocketHeight/2-0.5)])cylinder(1,beltTightSprocketOD/2,beltTightSprocketOD/2,center=true,fn=10);
	}
}

module mainBlock() {
		union() {
			translate([0-beltTightOffset/2+beltTightSprocketBaseSpace,0,beltTightSprocketHeight/2+beltTightSprocketBaseSpace-0.625])
				cube([beltTightSprocketBaseSpace,
					  beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,
			 	      beltTightSprocketHeight-beltTightSprocketBaseHeight+beltTightSprocketBaseSpace*2],center=true);

			translate([0-beltTightOffset*0.7,0,beltTightSprocketHeight+platformThickness/4-0.05])
				cube([beltTightOffset*0.6,beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,beltTightSprocketBaseSpace],center=true);
			translate([0-beltTightOffset*0.7,0,platformThickness/2+beltTightSprocketBaseSpace/2])
				cube([beltTightOffset*0.6,beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,beltTightSprocketBaseSpace],center=true);
			translate([0-beltTightOffset*0.7,15.05,12]) cube([beltTightOffset*0.6,1.9,13],center=true);
			translate([0-beltTightOffset*0.7,-15.05,12]) cube([beltTightOffset*0.6,1.9,13],center=true);
			translate([0-beltTightOffset+beltTightSprocketOD/2+2.75,0,0])
				cube([beltTightOffset*0.67,beltTightSprocketOD,platformThickness+beltTightSprocketBaseSpace*2],center=true);
		}
}
module beltTightener(withBolts=false,expand=false) {
	color([0.5,0.5,1,1])difference() {
		union() {
			intersection() {
				translate([-10,0,0]) difference() {
					cylinder(50,16.5,16.5,center=true,$fn=72);
					translate([-13,-17,0])cube([16.5,16.5,51],center=true);
					translate([-13,17,0])cube([16.5,16.5,51],center=true);
				}
			
				difference() {
					mainBlock();
					// vertical bolt
					translate([1-beltTightOffset+beltTightSprocketOD/2,0,10])
						rotate([0,0,30])cylinder(50,2.5,2.5,center=true,$fn=6);
					// tigheting bolt 
					translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,beltTightSprocketOD/2+pullBoltHoleDia,beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
						rotate([0,90,0])pullBolt();	
					// tigheting bolt r
					translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,0-(beltTightSprocketOD/2+pullBoltHoleDia),beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
						rotate([0,90,0])pullBolt();


					translate([1-beltTightOffset+beltTightSprocketOD/2-beltTightSprocketBaseD/2,0,beltTightSprocketHeight/2-1.7])
						cube([beltTightSprocketBaseD,beltTightSprocketBaseD+2.4,beltTightSprocketHeight],center=true);
					translate([1-beltTightOffset,0,(beltTightSprocketOD+beltTightSprocketBaseHeight)/2])
						cube([beltTightSprocketOD,beltTightSprocketOD+1,beltTightSprocketHeight-beltTightSprocketBaseHeight+0.5],center=true);
					translate([1-beltTightOffset+beltTightSprocketOD/2,0,6.25])
						cylinder(16,beltTightSprocketBaseD/2+1.4,beltTightSprocketBaseD/2+1,center=true,fn=10);
					translate([1-beltTightOffset+beltTightSprocketOD/2,0,6.75])
						cylinder(5,beltTightSprocketOD/2+0.6,beltTightSprocketOD/2+0.6,center=true,fn=10);
				}
			}

			// limit switch
			// height above rod center = 18.5
			//	translate([-20,17,12]) cube([10,10,0.1],center=true);
			// screw centers 19
			//	translate([-17.35,0,21.25]) cube([7.25,19,18.5],center=true);
/*			difference() {

				union() {
					translate([-11.55,0,23]) cube([4,27,7],center=true);
					translate([-13.55,0,20.8]) cube([8,27,7],center=true);
					translate([-13.55,9.5,23]) cylinder(7,4,4,center=true,$fn=36);//cube([0.1,0.1,19],center=true);
					translate([-13.55,-9.5,23]) cylinder(7,4,4,center=true,$fn=36);//cube([0.1,0.1,19],center=true);
				}
				translate([-13.55,0,21.25]) cube([8.01,11,18.51],center=true);
		
				translate([-17.35+3.625,9.5,21.8]) cylinder(3,3.5,3.5,center=true,$fn=6);//cube([0.1,0.1,19],center=true);
				translate([-17                ,9.5,21.8]) cylinder(3,3.5,3.5,center=true,$fn=6);//cube([0.1,0.1,19],center=true);
				translate([-17.35+3.625,-9.5,21.8]) cylinder(3,3.5,3.5,center=true,$fn=6);//cube([0.1,0.1,19],center=true);
				translate([-17                ,-9.5,21.8]) cylinder(3,3.5,3.5,center=true,$fn=6);//cube([0.1,0.1,19],center=true);
			}*/
		}
//		translate([-17.35+3.625,9.5,21.25]) cylinder(25,2,2,center=true);//cube([0.1,0.1,19],center=true);
//		translate([-17.35+3.625,-9.5,21.25]) cylinder(25,2,2,center=true);//cube([0.1,0.1,19],center=true);
	}
	if (withBolts) {
		color([0.3,0.3,0.3,1]) {
			translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,beltTightSprocketOD/2+pullBoltHoleDia,beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
				rotate([0,90,0])pullBolt();
			translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,0-(beltTightSprocketOD/2+pullBoltHoleDia),beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
				rotate([0,90,0])pullBolt();
				translate([1-beltTightOffset+beltTightSprocketOD/2-(expand?expoffset:0),0,-1])pullySprocket();
//				translate([1-beltTightOffset+beltTightSprocketOD/2,0,-1])pullySprocket();
		}
	}
	eslen=20;
	eswid=17.8;
	eshgt=5.2;
	esthk=3.2;
	// new end stop support
	translate([-12.15,0-(eslen/2)-14.1,beltTightSprocketHeight/2+beltTightSprocketBaseSpace-0.625])
	union() {
		difference() {
			cube([eshgt, eslen,eswid],center=true);
			translate([0,-2,0])rotate([0,90,0])cylinder(eshgt+1,(eswid/2)-esthk,(eswid/2)-esthk,center=true);
			translate([0,2,0])cube([eshgt+1, eslen/2-esthk,eswid-esthk*2],center=true);
			translate([-2,-8,0])cube([1.3,3,26],center=true);
		}
		difference() {
			union() {
				translate([-5+2.6,-11,-4.1])cube([10,3,26],center=true);
				translate([-5+2.6,-14,5.75]) difference() {
					cube([9,3,5],center=true);
					translate([4,-0.5,0])rotate([0,0,35])cube([9,3,7],center=true);
				}
				translate([-5+2.6,-14,5.75-19.25]) difference() {
					cube([9,3,5],center=true);
					translate([4,-0.5,0])rotate([0,0,35])cube([9,3,7],center=true);
				}
			}
			translate([-4.6,-10,5.8])rotate([90,0,0])limitSwitchBolts();
		}
	}
}
module limitSwitchBolts() {
	translate([0,0,0])cylinder(20,1.5,1.5,center=true);
	translate([0,-19.25,0])cylinder(20,1.5,1.5,center=true);
}
module limitSwitch() {
	color([0.3,0.6,0.3,1.2])difference() {
		cube([16.5,40.5,1],center=true);
		translate([-5.25,17.25,0]) { limitSwitchBolts(); }
	}
	color([0.3,0.3,0.3,1])translate([-8.25+5,7.5,3.3])cube([10,13,5.4],center=true);
	color([0.7,0.7,0.7,1])translate([-10,7.5,3.3])rotate([0,0,20])cube([1,13,4],center=true);
	
}

translate([-10.5,0,-9.5])rotate([0,90,0]) beltTightener();
//translate([-10.5,-40,2])rotate([90,90,0])limitSwitch();