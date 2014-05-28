Parametric Knot
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Parametric Knot  by MakeALot , published Mar 8, 2011

![Image](img/knot25_display_large_display_large.jpg)

Description
--------
An adjustable printable knot on a plinth<br />
<br />
The first image is a 2,5 knot the other individual one is a 2,3 knot, the other images show some of the knots you can achieve.<br />

Instructions
--------
I've updated the scad file to allow setting more of the internal parameters to help with building on Windows.<br />
<br />
If you imagine an invisible torus (donut) with a string going around it,  the axisRotation is the number of times the string goes around the top and the radialRotation is the number of times the string goes into the hole and out again.<br />
<br />
<b>axisRotation</b> 	= the number of times around the top of the torus<br />
<b>radialRotation</b> 	= the number of times rotated into the hole<br />
<b>baseHeight</b>	= the height of the plinth (0 for no plinth)<br />
<b>numberOfSpheres</b>	= the number of spheres used to complete the knot<br />
<b>sphereQuality</b> 	= larger number = lower the quality see $fs<br />
<br />
if you would like to produce a series of STL files, you can use the command line options to set the parameters and output file e.g.<br />
<br />
openscad -s knot15.stl -D "axisRotation = 1" -D "radialRotation = 5" -D "baseHeight = 5" varKnot.scad<br />
<br />
<b>win32</b> I had to reduce the resolution of the knots to generate STL files under Windows, the otherwise <b>excellent</b> OpenSCAD couldn't quite manage the originals. This now uses 750Mb or RAM and takes about 3 hours <b>:)</b><br />
<br />
I've generated 10 or so STL files so that people without the inclination to use OpenSCAD can still print one.  Obviously, I can't generate every possible combination, so please let me know if you'd like some particular combination and I'll see if I can generate the STL file for you.

Files
--------
[![Image](img/knotNB56_preview_tinycard.jpg)](knotNB56.stl)
 [ knotNB56.stl](knotNB56.stl)  

[![Image](img/knot56_preview_tinycard.jpg)](knot56.stl)
 [ knot56.stl](knot56.stl)  

[![Image](img/knot15_preview_tinycard.jpg)](knot15.stl)
 [ knot15.stl](knot15.stl)  

[![Image](img/knot_2_3_preview_tinycard.jpg)](knot_2_3.stl)
 [ knot_2_3.stl](knot_2_3.stl)  

[![Image](img/knot35_preview_tinycard.jpg)](knot35.stl)
 [ knot35.stl](knot35.stl)  

[![Image](img/knot45_preview_tinycard.jpg)](knot45.stl)
 [ knot45.stl](knot45.stl)  

[![Image](img/knotNB15_preview_tinycard.jpg)](knotNB15.stl)
 [ knotNB15.stl](knotNB15.stl)  

[![Image](img/knot25_preview_tinycard.jpg)](knot25.stl)
 [ knot25.stl](knot25.stl)  

[![Image](img/knotNB25_preview_tinycard.jpg)](knotNB25.stl)
 [ knotNB25.stl](knotNB25.stl)  

[![Image](img/Gears_preview_tinycard.jpg)](varKnot.scad)
 [ varKnot.scad](varKnot.scad)  

[![Image](img/knotNB45_preview_tinycard.jpg)](knotNB45.stl)
 [ knotNB45.stl](knotNB45.stl)  

[![Image](img/knotNB35_preview_tinycard.jpg)](knotNB35.stl)
 [ knotNB35.stl](knotNB35.stl)  



Pictures
--------
![Image](img/knots2_display_large_display_large.jpg)
![Image](img/knots1_display_large_display_large.jpg)
![Image](img/knots3_display_large_display_large.jpg)
![Image](img/knots4_display_large_display_large.jpg)
![Image](img/knot23_display_large_display_large.jpg)
![Image](img/knot_2_3_display_large.jpg)
![Image](img/Knot32_display_large_display_large.jpg)
![Image](img/knot15_display_large.jpg)
![Image](img/knots_nobase_display_large_display_large.jpg)
![Image](img/knot25_display_large.jpg)
![Image](img/knot35_display_large.jpg)
![Image](img/knot45_display_large.jpg)
![Image](img/knot56_display_large.jpg)
![Image](img/knotNB15_display_large.jpg)
![Image](img/knotNB25_display_large.jpg)
![Image](img/knotNB35_display_large.jpg)
![Image](img/knotNB45_display_large.jpg)
![Image](img/knotNB56_display_large.jpg)


Tags
--------
3D , art , Geometry , knot , Knot Theory , openscad , parameter , parametric  

  

License
--------
Parametric Knot by MakeALot is licensed under the BSD License license.  



By: Mark Durbin (MakeALot)
--------
<http://NestedCube.com/>