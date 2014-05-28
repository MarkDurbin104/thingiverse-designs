Extending Tube
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Extending Tube  by MakeALot , published Mar 17, 2011

![Image](img/ExtendingTube_display_large.jpg)

Description
--------
An extending tube printed as a single print.<br />
<br />
Extend, twist and push to lock in place.<br />

Instructions
--------
Print, extend, twist and push to lock in place.<br />
<br />
<b><big>If you downloaded the tapered versions don't print them!</big></b><br />
Download a new version (TaperedExtendingTube1), I forgot to taper the center tube so it will be joined to the next tube - sorry about that!<br />
<br />
I wanted to test how closely I could put moving parts as one print and still move them without lots of cutting afterwards. This design worked without any cleaning up, (apart from removing the raft)<br />
<br />
Not too functional as is, but I expect to use the principles from this in other projects.<br />
<br />
In the SCAD file, you'll find one main module:<br />
<b>tube(tubeOuterRadius, tubeHeight, tubeCount, extend); </b><br />
<br />
<b>tubeOuterRadius</b> = either 40,35,30,25 or 20<br />
<b>tubeHeight</b> = the height in mm (between 30 and 90)<br />
<b>tubeCount</b> = the number of tubes (1-6 depending on radius)<br />
<b>extend</b> = 1 to show extended, 0 for printing<br />
<br />
The center tube stays quite mobile during the print due to its inability to cool within the mass of the print, so it may be difficult to print a very small inner tube.<br />
<br />
Hope this proves useful in mashups!<br />
<br />
<b>Update:</b><br />
Added a tapered version as suggested by Zomboe (<b>thanks Zomboe</b>) this simplifies the locking mechanism. I haven't printed this yet.

Files
--------
[![Image](img/ExtendingTube_40x60x4_preview_tinycard.jpg)](ExtendingTube_40x60x4.stl)
 [ ExtendingTube_40x60x4.stl](ExtendingTube_40x60x4.stl)  

[![Image](img/TaperedExtendingTube1_preview_tinycard.jpg)](TaperedExtendingTube1.stl)
 [ TaperedExtendingTube1.stl](TaperedExtendingTube1.stl)  

[![Image](img/ExtendingTube_preview_tinycard.jpg)](ExtendingTube.stl)
 [ ExtendingTube.stl](ExtendingTube.stl)  

[![Image](img/Gears_preview_tinycard.jpg)](TaperedExtendingTube1.scad)
 [ TaperedExtendingTube1.scad](TaperedExtendingTube1.scad)  

[![Image](img/Gears_preview_tinycard.jpg)](extending_tube.scad)
 [ extending_tube.scad](extending_tube.scad)  

[![Image](img/ExtendingTube_25x30x3_preview_tinycard.jpg)](ExtendingTube_25x30x3.stl)
 [ ExtendingTube_25x30x3.stl](ExtendingTube_25x30x3.stl)  



Pictures
--------
![Image](img/ExtendingTube1_display_large_display_large.jpg)
![Image](img/ExtendingTube2_display_large_display_large.jpg)
![Image](img/ExtendingTube_display_large_display_large.jpg)
![Image](img/ExtendingTube3_display_large_display_large.jpg)
![Image](img/ExtendingTube4_display_large_display_large.jpg)
![Image](img/ExtendingTube_40x60x4_display_large.jpg)
![Image](img/ExtendingTube_25x30x3_display_large.jpg)
![Image](img/tapered_display_large_display_large.jpg)
![Image](img/TaperedExtendingTube1_display_large.jpg)


Tags
--------
extending , OpenSCAD , parametric , telescopic , telescoping , tube  

  

License
--------
Extending Tube by MakeALot is licensed under the BSD License license.  



By: Mark Durbin (MakeALot)
--------
<http://NestedCube.com/>