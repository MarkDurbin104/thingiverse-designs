import_stl("BreTest01_lowpoly.stl",convexity=15);
module part() {
intersection() {
translate([0,0,60])scale([1,1,2])sphere(30);
import_stl("BreTest01_lowpoly.stl",convexity=15);
}
}
translate([0,0,5])rotate([0,30,-5])part();
translate([0,0,5])rotate([0,-30,5])part();