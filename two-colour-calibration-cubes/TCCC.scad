/*
run with batch file:
..\openscad -s cube1_a.stl -D "cubeType = 1" -D "producePartA = 1" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube1_b.stl -D "cubeType = 1" -D "producePartA = 0" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube2_a.stl -D "cubeType = 2" -D "producePartA = 1" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube2_b.stl -D "cubeType = 2" -D "producePartA = 0" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube3_a.stl -D "cubeType = 3" -D "producePartA = 1" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube3_b.stl -D "cubeType = 3" -D "producePartA = 0" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube4_a.stl -D "cubeType = 4" -D "producePartA = 1" -D "inBatchMode = true" TCCC.scad
..\openscad -s cube4_b.stl -D "cubeType = 4" -D "producePartA = 0" -D "inBatchMode = true" TCCC.scad
*/

module calibCube2(thisIsPartA=true) {
	if (thisIsPartA) echo("parta");
	translate([0,0,thisIsPartA?7.5:2.5])cube([20,20,5],center=true);
}
module calibCube3(thisIsPartA=true) {
	translate([0,thisIsPartA?-5:5,5])cube([20,10,10],center=true);
}
module calibCube4(thisIsPartA=true) {
	translate([0,thisIsPartA?-5:5,2.5])cube([20,10.01,5],center=true);
	translate([0,thisIsPartA?5:-5,7.5])cube([20,10.01,5],center=true);
}
module calibCube5(thisIsPartA=true) {
	translate([-5,0,0])scale([0.501,1,1])calibCube4(thisIsPartA);
	translate([5,0,0])scale([0.501,1,1])calibCube4(!thisIsPartA);
}

cubeType=1;
producePartA=1;

module showCube(type,partA) {
	if (type==1) {
		intersection() { translate([0,0,5])cube([20,20,10],center=true); difference() { translate([0,0,5])cube([19.99,19.99,9.99],center=true);calibCube2(partA); }}
	} else if (type==2) {
		intersection() { translate([0,0,5])cube([19.99,19.99,9.99],center=true); difference() { translate([0,0,5])cube([19.99,19.99,9.99],center=true);calibCube3(partA); }}
	} else if (type==3) {
		intersection() { translate([0,0,5])cube([19.99,19.99,9.99],center=true); difference() { translate([0,0,5])cube([19.99,19.99,9.99],center=true);calibCube4(partA); }}
	} else if (type==4) {
		intersection() { translate([0,0,5])cube([19.99,19.99,9.99],center=true); difference() { translate([0,0,5])cube([19.99,19.99,9.99],center=true);calibCube5(partA); }}
	}
}

module twoPart(type) {
	color([0.1,0.1,0.1,1]) showCube(type,true);
	color([0.9,0.9,0.9,1]) showCube(type,false);
}

module all() {
	translate([-37.5,0,0])twoPart(1);
	translate([-12.5,0,0])twoPart(2);
	translate([12.5,0,0])twoPart(3);
	translate([37.5,0,0])twoPart(4);
}
module half(partA) {
	translate([-37.5,0,0])showCube(1,partA);
	translate([-12.5,0,0])showCube(2,partA);
	translate([12.5,0,0])showCube(3,partA);
	translate([37.5,0,0])showCube(4,partA);
}

inBatchMode=false;

if (inBatchMode) {
	showCube(cubeType,producePartA==1);
} else {
//	all();
	half(false);
}
