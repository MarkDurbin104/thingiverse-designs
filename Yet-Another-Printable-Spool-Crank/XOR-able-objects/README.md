XOR-able objects
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

XOR-able objects  by MakeALot , published Sep 20, 2011

![Image](img/Check_display_large.jpg)

Description
--------
Objects to 3D XOR with other objects to make checked/striped/spotted (even gingham - for picnics) items in two colours<br />
<br />
Best utilised when we can get a two colour Candystruder (CandyFab acknowledged). Hey, what about milk and white chocolate...<br />
<br />
And, of course, there's <b>tartan</b> for anyone who thought that I was only joking...

Instructions
--------
Take two STLs, one that you prepared earlier and one XOR stl.<br />
<br />
Then use OpenSCAD to create a positive:<br />
<b>difference() {<br />
   import_stl("stlNumber1.stl",convexity=15);<br />
   import_stl("Check.stl",convexity=15);<br />
}</b><br />
and export STL.<br />
<br />
Create support (or second colour)<br />
<b>intersection() {<br />
   import_stl("stlNumber1.stl",convexity=15);<br />
   import_stl("Check.stl",convexity=15);<br />
}</b><br />
and export STL.<br />
<br />
Now place in a medium temperature twin 3D printer until golden brown.<br />
<br />

Files
--------
[![Image](img/Check_preview_tinycard.jpg)](Check.stl)
 [ Check.stl](Check.stl)  

[![Image](img/QRCode_preview_tinycard.jpg)](QRCode.stl)
 [ QRCode.stl](QRCode.stl)  

[![Image](img/Gears_preview_tinycard.jpg)](Resultant_STLs.rar)
 [ Resultant_STLs.rar](Resultant_STLs.rar)  

[![Image](img/Tubes_preview_tinycard.jpg)](Tubes.stl)
 [ Tubes.stl](Tubes.stl)  

[![Image](img/Spots_preview_tinycard.jpg)](Spots.stl)
 [ Spots.stl](Spots.stl)  

[![Image](img/Gingham_preview_tinycard.jpg)](Gingham.stl)
 [ Gingham.stl](Gingham.stl)  

[![Image](img/mbCandyCane_preview_tinycard.jpg)](mbCandyCane.stl)
 [ mbCandyCane.stl](mbCandyCane.stl)  

[![Image](img/tartan_preview_tinycard.jpg)](tartan.stl)
 [ tartan.stl](tartan.stl)  

[![Image](img/Rods_preview_tinycard.jpg)](Rods.stl)
 [ Rods.stl](Rods.stl)  



Pictures
--------
![Image](img/Spots_display_large.jpg)
![Image](img/Rods_display_large.jpg)
![Image](img/Tubes_display_large.jpg)
![Image](img/cubes_display_large_display_large.jpg)
![Image](img/spots_display_large_display_large.jpg)
![Image](img/rods_display_large_display_large.jpg)
![Image](img/tubes_display_large_display_large.jpg)
![Image](img/QRCode_display_large.jpg)
![Image](img/QRCode2_display_large_display_large.jpg)
![Image](img/Gingham_display_large.jpg)
![Image](img/Gingham_display_large_display_large.jpg)
![Image](img/mbCandyCane_display_large.jpg)
![Image](img/tartan_display_large.jpg)
![Image](img/tartan_display_large_display_large.jpg)
![Image](img/acube_display_large_display_large.jpg)


Tags
--------
checks , dual , gingham , rings , stripes , 2color , candy , candycane , dual extrusion , dual material , dualstrusion , openscad , script , soluble support , spots , tartan , Useful , Useful script  

  

License
--------
XOR-able objects by MakeALot is licensed under the Creative Commons - Attribution license.  



By: Mark Durbin (MakeALot)
--------
<http://NestedCube.com/>