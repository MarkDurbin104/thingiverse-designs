module cutout() {
difference() {
import_stl("Louvre_Bin_80l50w40h_1.0.STL",convexity=15);
translate([0,0,-53.01])scale([1,1.001,1])import_stl("Louvre_Bin_80l50w40h_1.0.STL",convexity=15);
}
}

module addon() {
union() {
	translate([0,-2,0])import_stl("Louvre_Bin_80l50w40h_1.0.STL",convexity=15);
	rotate([0,180,0])import_stl("Louvre_Bin_Side_80l40h_1.0.STL",convexity=15);
}
}
module back() {
translate([0,-2,-8]) intersection() {
	import_stl("Louvre_Bin_80l50w40h_1.0.STL",convexity=15);
	translate([-25,-55.217,5])cube([15,10,60]);
}
}
//cutout();
module mash() {
union() {
	back();
	addon();
}
}

translate([-80,0,0]) rotate([0,90,0])import_stl("Louvre_Bin_80l50w40h_1.0.STL",convexity=15);
translate([0,0,0]) rotate([0,90,0]) color([0.1,1,0.1,1])mash();
translate([80,0,0]) rotate([0,90,0]) color([0.1,1,0.1,1])mash();
translate([160,0,0]) rotate([0,90,0]) color([0.1,1,0.1,1])mash();
translate([240,0,0]) rotate([0,90,0]) import_stl("Louvre_Bin_Side_80l40h_1.0.STL",convexity=15);
//mash();

