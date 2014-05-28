platformLength=84;
platformThickness=5;
platformWidth=68;
rodSpacing=49.5;
mountLength=29;
mountWidth=22;
mountHeight=15.5+6;
mountSpan=65;
mountSpacing=87-mountLength;
cableTieWidth=5;
bearingLength=23;
bearingDiameter=16.2;
rodClearance=12;
holeSpan=58.6;
holeSpacing=37.5;
holeDiameter=4;
nutDiameter=6.5;
nutThickness=3;
beltSupportCentreOffset=-11;
beltSupportThickness=5;
beltSupportLength=29;
beltSupportHeight=23+6;
beltheight=14;

module bearingMount() {
	difference() {
		// mount cube
		translate([0,0,mountHeight/2]) cube([mountLength,mountWidth,mountHeight],center=true);
		union() {
			//clearance hole
			translate([0,0,mountHeight-4]) rotate([0,90,0]) cylinder(mountLength+1,rodClearance/2,rodClearance/2,center=true,$fn=36);	
			translate([0,0,mountHeight+1]) rotate([0,90,0]) cube([rodClearance,rodClearance,mountLength+1],center=true);

			// bearing hole
			translate([0,0,mountHeight-4]) rotate([0,90,0]) cylinder(bearingLength,bearingDiameter/2,bearingDiameter/2,center=true,$fn=36);
			translate([0,0,mountHeight+1]) rotate([0,90,0]) cube([bearingDiameter-1,bearingDiameter-1,bearingLength],center=true);
			// cable clip hole
			translate([0,0,mountHeight-0.5]) rotate([0,90,0]) cube([14,mountWidth+1,cableTieWidth],center=true);
			translate([0,0,mountHeight-15.5]) rotate([0,90,0]) cube([cableTieWidth,mountWidth+1,cableTieWidth],center=true);
			translate([0,0,0]) rotate([0,90,0]) cube([12,12,cableTieWidth],center=true);
		}
	}
}
module beltBlock() {
		rotate([0,0,180])difference() {
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
inch=25.4;
rodDiameter=inch*3/8;

yRodSeparation=145;
xRodSeparation=50;
xRodLength=260;
yRodLength=300;

motorSize=42.5;
motorHeight=33;
motorSpindleDiameter=5;
motorSpindleLength=20;
motorMountDiameter=22.5;
motorMountLengthe=20;
boltSpacing=31;
boltSize=4;
sectionwidth=xRodSeparation+5.5+rodDiameter+21.975;
smallSectionwidth=motorSize;//mountLength;
verticalRodSeparation=12;
ToMSize=300;

leftSectionLength=90;
middleSectionLength=80;
rightSectionLength=90;
rightOffset=rightSectionLength/2+middleSectionLength/2;
leftOffset=(0-leftSectionLength/2)-middleSectionLength/2;

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
pullBoltHeadDia=7;
pullBoltHeadLength=3;

module pullySprocket() {
	color([0.3,0.3,0.3,1]) {
		translate([0,0,0])cylinder(beltTightSprocketBaseHeight,beltTightSprocketBaseD/2,beltTightSprocketBaseD/2,$fn=20);
		translate([0,0,beltTightSprocketBaseHeight])cylinder(beltTightSprocketRimHeight,beltTightSprocketOD/2,beltTightSprocketOD/2,$fn=20);
		translate([0,0,0])cylinder(beltTightSprocketHeight,beltTightSprocketBeltD/2,beltTightSprocketBeltD/2,$fn=20);
		translate([0,0,beltTightSprocketHeight-beltTightSprocketRimHeight])cylinder(beltTightSprocketRimHeight,beltTightSprocketOD/2,beltTightSprocketOD/2,$fn=20);
	}
}
module motorSprocket() {
	color([0.3,0.3,0.3,1]){
		translate([0,0,4.5])cylinder(1,8,8,center=true);
		cylinder(8,5,5,center=true);
		translate([0,0,-4.5])cylinder(1,8,8,center=true);
	}
}
module motor(motorMountLength=20) {
	centerX=-41.5;
	centerY=0;
	centerZ=0-platformThickness/2;
	color([0.3,0.3,0.3,1]){
		translate([centerX+(motorSize/2),centerY,centerZ-(motorHeight/2)]) cube([motorSize,motorSize,motorHeight],center=true);
		translate([centerX+(motorSize/2),centerY,centerZ+motorSpindleLength/2]) cylinder(motorSpindleLength,motorSpindleDiameter/2,motorSpindleDiameter/2,center=true);
		translate([centerX+(motorSize/2),centerY,centerZ]) cylinder(motorMountLength,motorMountDiameter/2,motorMountDiameter/2,center=true);
		translate([centerX+(motorSize/2),centerY,centerZ+11]) motorSprocket();
		translate([centerX+(motorSize/2)+boltSpacing/2,centerY+boltSpacing/2,centerZ]) cylinder(motorMountLength,boltSize/2,boltSize/2,center=true);
		translate([centerX+(motorSize/2)-boltSpacing/2,centerY+boltSpacing/2,centerZ]) cylinder(motorMountLength,boltSize/2,boltSize/2,center=true);
		translate([centerX+(motorSize/2)+boltSpacing/2,centerY-boltSpacing/2,centerZ]) cylinder(motorMountLength,boltSize/2,boltSize/2,center=true);
		translate([centerX+(motorSize/2)-boltSpacing/2,centerY-boltSpacing/2,centerZ]) cylinder(motorMountLength,boltSize/2,boltSize/2,center=true);
	}	
}
module floor() {
	color([0.7,0.7,0.7,0.1])translate([0,0,-21]) cube([ToMSize,ToMSize,6],center=true);
}
rodQuality=36;
module Yrods() {
	color([0.7,0.7,0.7,1]) {
		translate([yRodSeparation/2,0,0])rotate([90,0,0])cylinder(yRodLength,rodDiameter/2,rodDiameter/2,center=true,$fn=rodQuality);
		translate([0-yRodSeparation/2,0,0])rotate([90,0,0])cylinder(yRodLength,rodDiameter/2,rodDiameter/2,center=true,$fn=rodQuality);
	}
}
module Xrods() {
	color([0.7,0.7,0.7,1]) {
		translate([0,xRodSeparation/2,verticalRodSeparation])rotate([0,90,0])cylinder(xRodLength,rodDiameter/2,rodDiameter/2,center=true,$fn=rodQuality);
		translate([0,0-xRodSeparation/2,verticalRodSeparation])rotate([0,90,0])cylinder(xRodLength,rodDiameter/2,rodDiameter/2,center=true,$fn=rodQuality);
	}
}
module endSlot() {
	difference() {
		translate([0,0,0]) cube([platformThickness,smallSectionwidth-platformThickness*2,platformThickness],center=true);
		translate([platformThickness*1.21,0.5,platformThickness*0.7071]) rotate([0,-15,0])cube([platformThickness*2,smallSectionwidth+2,platformThickness*2],center=true);
	}
}

catchTagWidth=5;
catchTagLength=20;
catchTagHeight=2;

module catch(front=false) {
	translate([0,0,platformThickness]) {
		difference() {
			cube([platformThickness*4,smallSectionwidth,platformThickness*2],center=true);
			translate([platformThickness*0.499,0,platformThickness*0.51])endSlot();
			translate([platformThickness*-0.499,0,platformThickness*0.51])rotate([0,0,180])endSlot();
			translate([0,front?0-smallSectionwidth/4:smallSectionwidth/4,0])cube([platformThickness*4+1,smallSectionwidth/2+0.1,platformThickness*2+1],center=true);
			translate([0,front?0-smallSectionwidth/4:smallSectionwidth/4,0])cube([platformThickness*4+1,smallSectionwidth/2+0.1,platformThickness*2+1],center=true);
			if (front) {
				translate([0,catchTagLength/4-0.1,-0.01-(catchTagHeight/2)-(platformThickness-catchTagHeight)]) 
					cube([catchTagWidth,catchTagLength/2,catchTagHeight],center=true); 
				translate([0,catchTagLength*0.375,-0.01-platformThickness/2]) 
					cube([catchTagWidth,catchTagLength/4,platformThickness+1],center=true);
			}
		}
		if (!front) {
			translate([0,0,-0.01-(catchTagHeight/2)-(platformThickness-catchTagHeight+0.24)]) cube([catchTagWidth-1,catchTagLength-1,catchTagHeight-0.5],center=true);
			translate([0,catchTagLength*0.4,-0.01-platformThickness/2+0.01]) difference() {
				cube([catchTagWidth-1,catchTagLength/4-0.8,platformThickness],center=true);
				translate([0,0,catchTagHeight+1.3])rotate([-25,0,0])cube([catchTagWidth+1,catchTagLength/2,platformThickness],center=true);
			}
		}
	}
}
module centreBaseSection() {
	color([1,0.5,0.5,1]){
		cube([middleSectionLength,smallSectionwidth,platformThickness],center=true);
		translate([0-middleSectionLength/2+platformThickness/2,0,0-platformThickness]) endSlot();
		translate([middleSectionLength/2-platformThickness/2,0,0-platformThickness])rotate([0,0,180])endSlot();

		translate([0,smallSectionwidth/2-platformThickness/2,0-platformThickness-0.01])cube([middleSectionLength-platformThickness*5,platformThickness/3,platformThickness],center=true);
		translate([0,0,0-platformThickness-0.01])rotate([0,0,35])cube([middleSectionLength-platformThickness*3,platformThickness/3,platformThickness],center=true);
		translate([0,0,0-platformThickness-0.01])rotate([0,0,-35])cube([middleSectionLength-platformThickness*3,platformThickness/3,platformThickness],center=true);
		translate([0,0-(smallSectionwidth/2-platformThickness/2),0-platformThickness-0.01])cube([middleSectionLength-platformThickness*5,platformThickness/3,platformThickness],center=true);

		difference() {
			translate([0-smallSectionwidth/4,smallSectionwidth/2+4-platformThickness/2,-17.5])cube([smallSectionwidth/2,8+platformThickness,platformThickness+35],center=true);
			translate([0-smallSectionwidth/4,smallSectionwidth/2+4-platformThickness/2+9,-15])rotate([15,0,0])cube([smallSectionwidth/2+1,8+platformThickness,platformThickness+35],center=true);
			translate([0-smallSectionwidth/4,smallSectionwidth/2+4-platformThickness/2-7,-21])rotate([15,0,0])cube([smallSectionwidth/2+1,8+platformThickness,platformThickness+35],center=true);
		}
	}
}
module leftBaseSection() {
	color([1,0.5,0.5,1])difference() {
		union() {
			cube([leftSectionLength,smallSectionwidth,platformThickness],center=true);
			translate([(leftSectionLength/2)-platformThickness/2,0,0-platformThickness])rotate([0,0,180])endSlot();
			translate([0-yRodSeparation/2-leftOffset,0,0])cube([mountWidth,sectionwidth,platformThickness],center=true);
			translate([0-yRodSeparation/2-leftOffset,0-(mountSpacing/2),-platformThickness/2])rotate([180,0,90])bearingMount();
			translate([0-yRodSeparation/2-leftOffset,(mountSpacing/2),-platformThickness/2])rotate([180,0,90])bearingMount();
			translate([0-yRodSeparation/2-leftOffset-platformThickness*4.9,(mountWidth+smallSectionwidth)/2-platformThickness/2+0.5,0-platformThickness*2]) rotate([0,0,35]) difference() {
				cube([platformThickness*7.7,platformThickness/2,platformThickness*5],center=true);
				translate([0,0,-19])rotate([-35,30,0])cube([platformThickness*20,platformThickness*5,platformThickness*5],center=true);
			}
			translate([0-yRodSeparation/2-leftOffset-platformThickness*4.9,0-((mountWidth+smallSectionwidth)/2-platformThickness/2+0.5),0-platformThickness*2]) rotate([0,0,-35]) difference() {
				cube([platformThickness*7.7,platformThickness/2,platformThickness*5],center=true);
				translate([0,0,-19])rotate([35,30,0])cube([platformThickness*20,platformThickness*5,platformThickness*5],center=true);
			}
			translate([leftSectionLength/4-5,0,0-platformThickness-0.1])#rotate([0,0,45])cube([leftSectionLength/2-2,platformThickness/2,platformThickness],center=true);
			translate([leftSectionLength/4-5,0,0-platformThickness-0.1])#rotate([0,0,-45])cube([leftSectionLength/2-2,platformThickness/2,platformThickness],center=true);
			translate([leftSectionLength/4-5,leftSectionLength/6,0-platformThickness-0.1])cube([leftSectionLength/2-platformThickness*2.6,platformThickness/2,platformThickness],center=true);
			translate([leftSectionLength/4-5,0-leftSectionLength/6,0-platformThickness-0.1])cube([leftSectionLength/2-platformThickness*2.6,platformThickness/2,platformThickness],center=true);
		}
		motor();
		translate([7.6-leftSectionLength/2,smallSectionwidth/2-5.3,-0-platformThickness/4])cube([15.3,11,platformThickness/2+0.2],center=true);
		translate([7.6-leftSectionLength/2,0-(smallSectionwidth/2-5.3),-0-platformThickness/4])cube([15.3,11,platformThickness/2+0.2],center=true);
	}
}
module rightBaseSection() {
	color([1,0.5,0.5,1])difference() {
		union() {
			cube([rightSectionLength,smallSectionwidth,platformThickness],center=true);
			translate([yRodSeparation/2-rightOffset,0,0])cube([mountWidth,sectionwidth,platformThickness],center=true);
			translate([(0-rightSectionLength/2)+platformThickness/2,0,0-platformThickness])endSlot();//cube([platformThickness,smallSectionwidth,platformThickness],center=true);
			translate([yRodSeparation/2-rightOffset,0-(mountSpacing/2),-platformThickness/2])rotate([180,0,90])bearingMount();
			translate([yRodSeparation/2-rightOffset,(mountSpacing/2),-platformThickness/2])rotate([180,0,90])bearingMount();
			translate([yRodSeparation/2-beltSupportThickness-rightOffset,0,platformThickness/2])rotate([180,0,-90]) beltBlock();
			translate([7.5,-12.01,0-platformThickness*1])rotate([0,-4,0])cube([rightSectionLength-25,platformThickness,platformThickness*2],center=true);
			translate([7.5,12.01,0-platformThickness*1])rotate([0,-4,0])cube([rightSectionLength-25,platformThickness,platformThickness*2],center=true);

			translate([yRodSeparation/2-rightOffset+25,(mountWidth+smallSectionwidth)/2-platformThickness/2+0.5,0-platformThickness*2]) rotate([0,0,145]) difference() {
				cube([platformThickness*7.7,platformThickness/2,platformThickness*5],center=true);
				translate([0,0,-19])rotate([35,30,0])cube([platformThickness*20,platformThickness*5,platformThickness*5],center=true);
			}
			translate([yRodSeparation/2-rightOffset+25,0-((mountWidth+smallSectionwidth)/2-platformThickness/2+0.5),0-platformThickness*2]) rotate([0,0,-145]) difference() {
				cube([platformThickness*7.7,platformThickness/2,platformThickness*5],center=true);
				translate([0,0,-19])rotate([-35,30,0])cube([platformThickness*20,platformThickness*5,platformThickness*5],center=true);
			}

		}
		translate([rightSectionLength/2-beltTightOffset+5,0,0])cube([beltTightTravel*2+beltTightSprocketOD-7,beltTightSprocketOD+0.5,platformThickness+1],center=true);
	}
}
rodSupportThickness=7;
rodSupportBoltSectionLength=15;
module leftRodSupport() {
	color([0.5,0.5,1,1])difference() {
		union() {
			translate([0,0,verticalRodSeparation/2-platformThickness/2-0.5])
				cube([rodSupportThickness,smallSectionwidth+platformThickness*2,verticalRodSeparation+platformThickness*1.5+1],center=true);
			translate([0,xRodSeparation/2,verticalRodSeparation])
				rotate([0,90,0])cylinder(rodSupportThickness,(rodDiameter+platformThickness)/2,(rodDiameter+platformThickness)/2,center=true,$fn=20);
			translate([0,0-xRodSeparation/2,verticalRodSeparation])
				rotate([0,90,0])cylinder(rodSupportThickness,(rodDiameter+platformThickness)/2,(rodDiameter+platformThickness)/2,center=true,$fn=20);
			translate([rodSupportBoltSectionLength/2,0,0-platformThickness*0.25])
				cube([rodSupportBoltSectionLength,smallSectionwidth,platformThickness*0.5],center=true);
		}
		translate([rodSupportThickness/4,xRodSeparation/2,verticalRodSeparation])
			rotate([0,90,0])cylinder(rodSupportThickness/2+0.1,rodDiameter/2+0.3,rodDiameter/2+0.3,center=true,$fn=20);
		translate([rodSupportThickness/4,0-xRodSeparation/2,verticalRodSeparation])
			rotate([0,90,0])cylinder(rodSupportThickness/2+0.1,rodDiameter/2+0.3,rodDiameter/2+0.3,center=true,$fn=20);
		translate([motorSize+2.51,0,0])motor();
		translate([rodSupportBoltSectionLength/4-0.5,0,platformThickness*0.3]) cube([rodSupportBoltSectionLength/2,smallSectionwidth,platformThickness*0.6],center=true);
		translate([rodSupportBoltSectionLength/2,0,0]) cube([rodSupportBoltSectionLength+1,smallSectionwidth/2,platformThickness+1],center=true);
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




module beltTightener(withBolts=false) {
	color([0.5,0.5,1,1])difference() {
	union() {
	intersection() {
		translate([-10,0,0]) cylinder(50,16.5,16.5,center=true,$fn=72);
			
	difference() {
		union() {
			translate([0-beltTightOffset/2+beltTightSprocketBaseSpace,0,beltTightSprocketHeight/2+beltTightSprocketBaseSpace-0.625])
				cube([beltTightSprocketBaseSpace,beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,beltTightSprocketHeight-beltTightSprocketBaseHeight+beltTightSprocketBaseSpace*2],center=true);
			translate([0-beltTightOffset*0.7,0,beltTightSprocketHeight+platformThickness/4-0.05])
				cube([beltTightOffset*0.6,beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,beltTightSprocketBaseSpace],center=true);
			translate([0-beltTightOffset*0.7,0,platformThickness/2+beltTightSprocketBaseSpace/2])
				cube([beltTightOffset*0.6,beltTightSprocketOD+pullBoltHoleDia*2+platformThickness*2,beltTightSprocketBaseSpace],center=true);
			translate([0-beltTightOffset*0.7,15.05,12]) cube([beltTightOffset*0.6,1.9,13],center=true);
			translate([0-beltTightOffset*0.7,-15.05,12]) cube([beltTightOffset*0.6,1.9,13],center=true);
			translate([0-beltTightOffset+beltTightSprocketOD/2+2.75,0,0])
				cube([beltTightOffset*0.67,beltTightSprocketOD,platformThickness+beltTightSprocketBaseSpace*2],center=true);
		}
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
	difference() {

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
	}
}
		translate([-17.35+3.625,9.5,21.25]) cylinder(25,2,2,center=true);//cube([0.1,0.1,19],center=true);
		translate([-17.35+3.625,-9.5,21.25]) cylinder(25,2,2,center=true);//cube([0.1,0.1,19],center=true);
}
	if (withBolts) {
		color([0.3,0.3,0.3,1]) {
		translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,beltTightSprocketOD/2+pullBoltHoleDia,beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
			rotate([0,90,0])pullBolt();
		translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,0-(beltTightSprocketOD/2+pullBoltHoleDia),beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
			rotate([0,90,0])pullBolt();
			translate([0-beltTightOffset+beltTightSprocketOD/2,0,0-platformThickness+beltTightSprocketBaseSpace]) pullySprocket();
		}
	}
}






module rightRodSupport() {
	color([0.5,0.5,1,1])difference() {
		union() {
			translate([0,0,verticalRodSeparation/2])
				cube([rodSupportThickness,smallSectionwidth+platformThickness*2,verticalRodSeparation+platformThickness*2.9],center=true);
			translate([0,xRodSeparation/2,verticalRodSeparation])
				rotate([0,90,0])cylinder(rodSupportThickness,(rodDiameter+platformThickness)/2,(rodDiameter+platformThickness)/2,center=true,$fn=20);
			translate([0,0-xRodSeparation/2,verticalRodSeparation])
				rotate([0,90,0])cylinder(rodSupportThickness,(rodDiameter+platformThickness)/2,(rodDiameter+platformThickness)/2,center=true,$fn=20);
		}
		translate([0-rodSupportThickness/4,xRodSeparation/2,verticalRodSeparation])
			rotate([0,90,0])cylinder(rodSupportThickness/2+0.1,rodDiameter/2+0.3,rodDiameter/2+0.3,center=true,$fn=20);
		translate([0-rodSupportThickness/4,0-xRodSeparation/2,verticalRodSeparation])
			rotate([0,90,0])cylinder(rodSupportThickness/2+0.1,rodDiameter/2+0.3,rodDiameter/2+0.3,center=true,$fn=20);
		translate([0-rodSupportBoltSectionLength/4+0.5,0,0]) cube([rodSupportBoltSectionLength/2,smallSectionwidth,platformThickness+0.5],center=true);
		translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,beltTightSprocketOD/2+pullBoltHoleDia,beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
			rotate([0,90,0])pullBolt();
		translate([(-1.97-pullBoltLength+pullBoltHeadLength)/2,0-(beltTightSprocketOD/2+pullBoltHoleDia),beltTightSprocketHeight/2+beltTightSprocketBaseSpace/2])
			rotate([0,90,0])pullBolt();
	}
}
module bed(withbolts) {
	centreBaseSection();
	translate([leftOffset,0,0]) leftBaseSection();
	translate([rightOffset,0,0]) rightBaseSection();
	translate([leftOffset,0,0]) motor(7);
	translate([0,0,verticalRodSeparation+16.5])rotate([180,0,0])color([0.1,1,0.1,1]) import_stl("LMB6UUX_Base.stl",convexity=15);
	translate([0,0,0])Xrods();
	translate([0-xRodLength/2,0,0]) leftRodSupport();
	translate([xRodLength/2,0,0])rightRodSupport();
	translate([xRodLength/2,0,0])beltTightener(withbolts);
}
module bedCatches() {
	color([0.5,1,0.5,1]) {
		translate([middleSectionLength/2,0,0-platformThickness*2.5])catch(false);
		translate([middleSectionLength/2,0,0-platformThickness*2.5])catch(true);
		translate([0-middleSectionLength/2,0,0-platformThickness*2.5])catch(false);
		translate([0-middleSectionLength/2,0,0-platformThickness*2.5])catch(true);
	}
}
module all(withbolts) {
	Yrods();
	translate([0,0,20]) bed(withbolts);
	translate([0,0,20]) bedCatches();
//	floor();
}
module middle() {
	translate([0,0,platformThickness/2])rotate([0,180,0])centreBaseSection();
}

module left() {
	translate([0,0,platformThickness/2])rotate([0,180,0])leftBaseSection();
}

module right() {
	translate([0,0,platformThickness/2])rotate([0,180,0])rightBaseSection();
}
module leftSupport() {
	translate([0,0,rodSupportThickness/2])rotate([0,-90,0])leftRodSupport();
}
module rightSupport() {
	translate([0,0,rodSupportThickness/2])rotate([0,90,0])rightRodSupport();
}
module supports() {
	translate([0-platformThickness*2,0,rodSupportThickness/2])rotate([0,-90,0])leftRodSupport();
	translate([platformThickness*2,0,rodSupportThickness/2])rotate([0,90,0])rightRodSupport();
}
module supportsAndCatches() {
	translate([0-platformThickness*5,platformThickness*2.5,rodSupportThickness/2])rotate([0,-90,0])leftRodSupport();
	translate([0-platformThickness*1.5,platformThickness*2.5,rodSupportThickness/2])rotate([0,90,0])rightRodSupport();
	translate([platformThickness*5,platformThickness*3.5,0])OneCatch();
	translate([0-platformThickness*4,0-platformThickness*6.5,0])rotate([0,0,90])OneCatch();
	translate([17,-28,-9.5])rotate([0,90,0])beltTightener(false);
}
module tighten() {
	translate([20,0,beltTightSprocketOD/2+pullBoltHoleDia+platformThickness])rotate([90,0,0])beltTightener();
}

module catchesPlate() {
	translate([-11,-6,0])catch(false);
	translate([-11,6,0])catch(true);
	translate([11,-6,0])catch(false);
	translate([11,6,0])catch(true);
}
module OneCatch() {
	translate([0,-6,0])catch(false);
	translate([0,6,0])catch(true);
}
//%translate([0,0,50])cube([100,100,100],center=true);
all(true);
//translate([0,0,-0.01])%cube([100,100,0.01],center=true);
//rightRodSupport();
//rightSupport();
//right();
//translate([0,0,platformThickness/2])rotate([0,180,0]) rightBaseSection();

//supportsAndCatches();
