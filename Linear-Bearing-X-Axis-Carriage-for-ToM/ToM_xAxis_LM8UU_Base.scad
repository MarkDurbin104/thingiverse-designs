buildForABP=false; // change this to true for Automatic Build Platform

platformLength=buildForABP?97.9:84;
platformThickness=5;
platformWidth=68;
rodSpacing=49.5;
mountLength=29;
mountWidth=22;
mountHeight=15.5;
mountSpan=65;
mountSpacing=65-mountLength;
cableTieWidth=5;
bearingLength=23;
bearingDiameter=16;
rodClearance=12;
holeSpan=58.6;
holeSpacing=37.5;
holeDiameter=4;
nutDiameter=6.5;
nutThickness=3;
beltSupportCentreOffset=11.5;
beltSupportThickness=5;
beltSupportLength=31;
beltSupportHeight=23;
beltheight=14;

ABPEndHeight=23;
ABPEndWidth=nutDiameter+3;
ABPEndThickness=platformThickness;
ABPEndBoltSpace=17.7;

module bearingMount() {
	difference() {
		// mount cube
		translate([0,0,mountHeight/2]) cube([mountLength,mountWidth,mountHeight],center=true);
		union() {
			//clearance hole
			translate([0,0,11.5]) rotate([0,90,0]) cylinder(mountLength+1,rodClearance/2,rodClearance/2,center=true,$fn=36);	
			translate([0,0,16.5]) rotate([0,90,0]) cube([rodClearance,rodClearance,mountLength+1],center=true);

			// bearing hole
			translate([0,0,11.5]) rotate([0,90,0]) cylinder(bearingLength,bearingDiameter/2,bearingDiameter/2,center=true,$fn=36);
			translate([0,0,16.5]) rotate([0,90,0]) cube([bearingDiameter-1,bearingDiameter-1,bearingLength],center=true);
			// cable clip hole
			translate([0,0,15]) rotate([0,90,0]) cube([14,mountWidth+1,cableTieWidth],center=true);
			translate([0,0,0]) rotate([0,90,0]) cube([7,mountWidth+1,cableTieWidth],center=true);
			translate([0,0,0]) rotate([0,90,0]) cube([12,12,cableTieWidth],center=true);
		}
	}
}

module ABPEnd() {
	difference() {
		cube([ABPEndWidth,ABPEndThickness,ABPEndHeight],center=true);
		translate([0,0,ABPEndBoltSpace-ABPEndHeight/2])rotate([90,0,0]) cylinder(12,holeDiameter/2,holeDiameter/2,center=true);
		translate([0,ABPEndThickness/2-(nutThickness-3),ABPEndBoltSpace-ABPEndHeight/2])rotate([90,0,0]) cylinder(nutThickness+2,nutDiameter/2,nutDiameter/2,center=true,$fn=6);	
	}
}
translate([0,0,platformThickness/2]) difference() {
	union() {
		// platform
		cube([platformWidth,platformLength,platformThickness+0.1],center=true);
		if (buildForABP) {
			translate([holeSpan/2,platformLength/2-ABPEndThickness/2,ABPEndHeight/2+platformThickness/2]) rotate([0,0,180])ABPEnd();
			translate([0-holeSpan/2,platformLength/2-ABPEndThickness/2,ABPEndHeight/2+platformThickness/2]) rotate([0,0,180])ABPEnd();
			translate([holeSpan/2,0-(platformLength/2-ABPEndThickness/2),ABPEndHeight/2+platformThickness/2]) ABPEnd();
			translate([0-holeSpan/2,0-(platformLength/2-ABPEndThickness/2),ABPEndHeight/2+platformThickness/2]) ABPEnd();
		}

		translate([0-(mountSpacing/2),rodSpacing/2,platformThickness/2])bearingMount();
		translate([mountSpacing/2,rodSpacing/2,platformThickness/2])bearingMount();
		translate([0,0-(rodSpacing/2),platformThickness/2])bearingMount();

		difference() {
			union() {
				// belt block
				difference() {
					translate([0,beltSupportCentreOffset-3.7,platformThickness/2+beltSupportHeight/2]) 	
						cube([beltSupportLength,beltSupportThickness,beltSupportHeight],center=true);
					// 1mm notches
					for (i=[0:beltSupportLength/2]) {
						translate([0.5+i*2-beltSupportLength/2,beltSupportCentreOffset+0.49-2,(beltSupportHeight-beltheight*1.32)+beltheight])
							cube([1.01,1.01,beltheight],center=true);
					}
				}
				translate([0,beltSupportThickness/2+beltSupportCentreOffset,platformThickness/2+beltSupportHeight/2]) 
					cube([beltSupportLength,beltSupportThickness,beltSupportHeight],center=true);
				translate([0,beltSupportCentreOffset,platformThickness/2+beltSupportHeight/6]) 	
					cube([beltSupportLength,beltSupportThickness,beltSupportHeight/3],center=true);
			}
			translate([0,11,17])rotate([90,0,0]) cylinder(12,holeDiameter/2,holeDiameter/2,center=true);
			translate([0,5,17])rotate([90,0,0]) cylinder(nutThickness+2,nutDiameter/2,nutDiameter/2,center=true,$fn=6);	
			translate([0,16.5,17])rotate([90,0,0]) cylinder(nutThickness+2,nutDiameter/2,nutDiameter/2,center=true,$fn=12);	
		}
	}
	for (i=[0:5]) {
		translate([(0-holeSpan/2)+((i%2)*holeSpan),0-holeSpacing+holeSpacing*floor(i/2),0]) 
			cylinder(platformThickness+1,holeDiameter/2,holeDiameter/2,center=true);	
		translate([(0-holeSpan/2)+((i%2)*holeSpan),0-holeSpacing+holeSpacing*floor(i/2),platformThickness-nutThickness+1]) 
			cylinder(nutThickness+2,nutDiameter/2,nutDiameter/2,center=true,$fn=6);	

	}
}
