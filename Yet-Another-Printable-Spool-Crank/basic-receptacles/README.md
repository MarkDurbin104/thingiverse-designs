basic receptacles
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

basic receptacles  by MakeALot , published Oct 3, 2011

![Image](img/honeyPot_display_large.jpg)

Description
--------
Some receptacle forms for slicing/hacking.<br />
<br />
Here are 15 basic printable (without support) shapes that can be produced in 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 and 100 sided versions.<br />
That's over 300 basic shapes before scaling, chopping, merging, etc.<br />
I've posted up the 100 sided versions as STLs and some examples of the others so that you can just print them if you don't feel like playing with OpenSCAD. If you can't find the one you want, let me know the shape and how many sides and I'll pop up an STL for you.<br />
<br />
I think that's enough for now - maybe I'll make some lids for them another time.

Instructions
--------
use OpenSCAD to intersect one of these with rotated/translated cubes etc. to make new shapes.<br />
<br />
<b>example: to produce Pot1slotted.stl</b><br />
intersection() {<br />
import_stl("Pot1.stl",convexity=3);<br />
<br />
for (i=[0:17]) {<br />
rotate([0,0,i*10])translate([0,0,50])cube([100,5,100],center=true);<br />
translate([0,0,2.5+i*8])cube([100,100,5],center=true);<br />
}<br />
<br />
}<br />
each of the pots is defined using a different module in OpenSCAD, receptacle0() to receptacle14() each of these modules takes 2 parameters, the number of sides, and the angle to rotate the toroids to line them up with the cylinders (there is a list in the file).<br />
<br />
The examples I've generated below are:<br />
Pot03.stl - receptacle0(3,30);<br />
Pot44.stl - receptacle4(4,0);<br />
Pot85.stl - receptacle8(5,-18);<br />
Pot99.stl - receptacle9(9,-10);<br />
<br />
If you'd like to generate an STL not here e.g. a 7 sided version of receptacle 3, use receptacle3(7,90/7); You can then scale the width,depth and height to suit your needs. Once you have a basic STL, you can re-import as described above to decorate it with slots, impressions, etc.<br />
<br />
<br />
<b> Update:</b><br />
I've added a module drawReceptacle(number=0,sides=3) that takes a receptacle number 0-15 and a number of sides 3-20 (anything else produces the 100 sided version)

Files
--------
[![Image](img/Pot44_preview_tinycard.jpg)](Pot44.stl)
 [ Pot44.stl](Pot44.stl)  

[![Image](img/HexStarPot8_preview_tinycard.jpg)](HexStarPot8.stl)
 [ HexStarPot8.stl](HexStarPot8.stl)  

[![Image](img/Pot13_preview_tinycard.jpg)](Pot13.stl)
 [ Pot13.stl](Pot13.stl)  

[![Image](img/bowlNoSlots_preview_tinycard.jpg)](bowlNoSlots.stl)
 [ bowlNoSlots.stl](bowlNoSlots.stl)  

[![Image](img/Pot030303ra_preview_tinycard.jpg)](Pot030303ra.stl)
 [ Pot030303ra.stl](Pot030303ra.stl)  

[![Image](img/hexbowl_preview_tinycard.jpg)](hexbowl.stl)
 [ hexbowl.stl](hexbowl.stl)  

[![Image](img/Pot10_preview_tinycard.jpg)](Pot10.stl)
 [ Pot10.stl](Pot10.stl)  

[![Image](img/Pot6_preview_tinycard.jpg)](Pot6.stl)
 [ Pot6.stl](Pot6.stl)  

[![Image](img/pumppot_preview_tinycard.jpg)](pumppot.stl)
 [ pumppot.stl](pumppot.stl)  

[![Image](img/HexPentaPot_preview_tinycard.jpg)](HexPentaPot.stl)
 [ HexPentaPot.stl](HexPentaPot.stl)  

[![Image](img/HexiDeciPot_preview_tinycard.jpg)](HexiDeciPot.stl)
 [ HexiDeciPot.stl](HexiDeciPot.stl)  

[![Image](img/longHoneyPot_preview_tinycard.jpg)](longHoneyPot.stl)
 [ longHoneyPot.stl](longHoneyPot.stl)  

[![Image](img/shortHoneyPot_preview_tinycard.jpg)](shortHoneyPot.stl)
 [ shortHoneyPot.stl](shortHoneyPot.stl)  

[![Image](img/Pot1slotted_preview_tinycard.jpg)](Pot1slotted.stl)
 [ Pot1slotted.stl](Pot1slotted.stl)  

[![Image](img/Pot0303_preview_tinycard.jpg)](Pot0303.stl)
 [ Pot0303.stl](Pot0303.stl)  

[![Image](img/Pot14_preview_tinycard.jpg)](Pot14.stl)
 [ Pot14.stl](Pot14.stl)  

[![Image](img/Pot85_preview_tinycard.jpg)](Pot85.stl)
 [ Pot85.stl](Pot85.stl)  

[![Image](img/Pot030303_preview_tinycard.jpg)](Pot030303.stl)
 [ Pot030303.stl](Pot030303.stl)  

[![Image](img/Gears_preview_tinycard.jpg)](receptacle.scad)
 [ receptacle.scad](receptacle.scad)  

[![Image](img/Pot99_preview_tinycard.jpg)](Pot99.stl)
 [ Pot99.stl](Pot99.stl)  

[![Image](img/Pot03slotted_preview_tinycard.jpg)](Pot03slotted.stl)
 [ Pot03slotted.stl](Pot03slotted.stl)  

[![Image](img/Pot2_preview_tinycard.jpg)](Pot2.stl)
 [ Pot2.stl](Pot2.stl)  

[![Image](img/Pot1_preview_tinycard.jpg)](Pot1.stl)
 [ Pot1.stl](Pot1.stl)  

[![Image](img/Pot0303b_preview_tinycard.jpg)](Pot0303b.stl)
 [ Pot0303b.stl](Pot0303b.stl)  

[![Image](img/honeyPot_preview_tinycard.jpg)](honeyPot.stl)
 [ honeyPot.stl](honeyPot.stl)  

[![Image](img/Pot03_preview_tinycard.jpg)](Pot03.stl)
 [ Pot03.stl](Pot03.stl)  

[![Image](img/Pot11_preview_tinycard.jpg)](Pot11.stl)
 [ Pot11.stl](Pot11.stl)  

[![Image](img/Pot12_preview_tinycard.jpg)](Pot12.stl)
 [ Pot12.stl](Pot12.stl)  

[![Image](img/Pot7_preview_tinycard.jpg)](Pot7.stl)
 [ Pot7.stl](Pot7.stl)  

[![Image](img/Pot8_preview_tinycard.jpg)](Pot8.stl)
 [ Pot8.stl](Pot8.stl)  

[![Image](img/CPot_preview_tinycard.jpg)](CPot.stl)
 [ CPot.stl](CPot.stl)  

[![Image](img/Pot9_preview_tinycard.jpg)](Pot9.stl)
 [ Pot9.stl](Pot9.stl)  

[![Image](img/HexiCosPot_preview_tinycard.jpg)](HexiCosPot.stl)
 [ HexiCosPot.stl](HexiCosPot.stl)  



Pictures
--------
![Image](img/bowlNoSlots_display_large.jpg)
![Image](img/Pot1_display_large.jpg)
![Image](img/Pot2_display_large.jpg)
![Image](img/Pot1slotted_display_large.jpg)
![Image](img/longHoneyPot_display_large.jpg)
![Image](img/shortHoneyPot_display_large.jpg)
![Image](img/Pot8_display_large.jpg)
![Image](img/Pot9_display_large.jpg)
![Image](img/Pot7_display_large.jpg)
![Image](img/Pot6_display_large.jpg)
![Image](img/Pot03_display_large.jpg)
![Image](img/Pot85_display_large.jpg)
![Image](img/Pot99_display_large.jpg)
![Image](img/Pot44_display_large.jpg)
![Image](img/PrintedPots_display_large_display_large.jpg)
![Image](img/Pot03slotted_display_large.jpg)
![Image](img/HexPentaPot_display_large.jpg)
![Image](img/HexiDeciPot_display_large.jpg)
![Image](img/HexiCosPot_display_large.jpg)
![Image](img/hexbowl_display_large.jpg)
![Image](img/HexStarPot8_display_large.jpg)
![Image](img/Pot0303_display_large.jpg)
![Image](img/CPot_display_large.jpg)
![Image](img/Pot0303b_display_large.jpg)
![Image](img/Pot030303_display_large.jpg)
![Image](img/Pot030303ra_display_large.jpg)
![Image](img/pots_display_large_display_large.jpg)
![Image](img/pumppot_display_large.jpg)
![Image](img/Pot10_display_large.jpg)
![Image](img/Pot11_display_large.jpg)
![Image](img/Pot12_display_large.jpg)
![Image](img/Pot13_display_large.jpg)
![Image](img/Pot14_display_large.jpg)


Tags
--------
bowl , jar , OpenSCAD , receptacle , featured , honeycomb , pot  

  

License
--------
basic receptacles by MakeALot is licensed under the Creative Commons - Attribution license.  



By: Mark Durbin (MakeALot)
--------
<http://NestedCube.com/>