include <Brick_single.scad>;

scale(1.5) {
//	orig();
	color([0.1,0.1,0.2,1]) sideDoorWood();
	color([.9,.9,.7])sideDoor();
	color([.9,.9,.7])windows(1);
  	color([.9,.9,.7])windows(2);
	color([.9,.9,.7])windows(3);
	color([.9,.9,.7])windows(4);
	color([.9,.9,.7])roofInner(true);
	color([.9,.9,.7])roofInner(false);
	color([.9,.9,.9])roof();
	color([.9,.9,.7])endBalcony();
	color([0.8,0.4,0.4,1]) walls();
	//translate([ -78.9, -29, 0 ]) wall( 42 , 56, 1,1, 1);
	//translate([ -77.3, -29, 0 ]) rotate([0,0,90])wall( 15 , 56, 1,1, 0);
//	translate([ -79, 29, 0 ]) wall( 42 , 56, 1,1, 1);
//	brickWall();
}
module sideDoorWood() {
	union() {
		translate([-0.5,26,19])cube([7.8,2,23.6],center=true);
		translate([-0.5,25.5,19])cube([9,1,25],center=true);
	}
}
module brickWall() {
	difference() {
		//walls();
		//wall(10,50,1);
//		translate([0,0-(57.6-4.8)/2,75]) rotate([90,0,0]) import(file="BrickWall.stl",convexity=10);
	}
}
module endBalcony() {
	sizea=16;
	sizeb=8;
	color([.9,.9,.7]) //render() 
	translate([84.7,0,36]) {
		difference() {
			union() {
				difference() {
					translate([-4.6,0,22.25])rotate([0,90,0])cylinder(3,8,8,center=true,$fn=30);
					translate([-5,0,14])cube([10,20,26.5],center=true);
					translate([1,0,5.6])scale(0.8) difference() {
						translate([-4.6,0,22.25])rotate([0,90,0])cylinder(3,8,8,center=true,$fn=30);
						translate([-5,0,14.55])cube([10,20,26.5],center=true);
					}
				}
				translate([-7,0,13.1])cube([5,11.8,28.2],center=true);
				cube([8,18,2],center=true);
				translate([-2.7,0,0])cube([10,11,2],center=true);
				translate([-5,0,-1])cube([2,18,4],center=true);
				translate([0,8,-1])cube([8,2,3],center=true);
				translate([0,-8,-1])cube([8,2,3],center=true);
				translate([0,8,-2])cube([8,1,3],center=true);
				translate([0,-8,-2])cube([8,1,3],center=true);
				translate([-5,8,-3.5])cube([2,2,5],center=true);
				translate([-5,-8,-3.5])cube([2,2,5],center=true);
				translate([-3,8,-3])rotate([90,0,0])cylinder(2,2.5,2.5,center=true,$fn=20);
				translate([-3,-8,-3])rotate([90,0,0])cylinder(2,2.5,2.5,center=true,$fn=20);
				translate([ sizeb/2-1, sizea/2,4]) { cube([2,2,6],center=true); translate([0,0,3.5])sphere(1,$fn=20); translate([0,0,4.5])sphere(0.5,$fn=20); }
				translate([ sizeb/2-1,-sizea/2,4]) { cube([2,2,6],center=true); translate([0,0,3.5])sphere(1,$fn=20); translate([0,0,4.5])sphere(0.5,$fn=20); }
				translate([-sizeb/2-1, sizea/2,4]) { cube([2,2,6],center=true); translate([0,0,3.5])sphere(1,$fn=20); translate([0,0,4.5])sphere(0.5,$fn=20); }
				translate([-sizeb/2-1,-sizea/2,4]) { cube([2,2,6],center=true); translate([0,0,3.5])sphere(1,$fn=20); translate([0,0,4.5])sphere(0.5,$fn=20); }
				translate([-1-((sizeb/2)-2),sizea/2,3.5]) for (raila=[0:(sizeb/2)-2]) translate([raila*2,0,0]) cube([1,1,5],center=true);
				translate([-1-((sizeb/2)-2),-sizea/2,3.5]) for (raila=[0:(sizeb/2)-2]) translate([raila*2,0,0]) cube([1,1,5],center=true);
				translate([sizeb/2-1,0-((sizea/2)-2),3.5]) for (raila=[0:(sizea/2)-2]) translate([0,raila*2,0]) cube([1,1,5],center=true);
				translate([ 0, sizea/2,5.5]) cube([sizeb,1.5,1.5],center=true);
				translate([ 0,-sizea/2,5.5]) cube([sizeb,1.5,1.5],center=true);
				translate([ sizeb/2-1, 0,5.5]) cube([1.5,sizea,1.5],center=true);
			}
			translate([-7,0,0])cube([2,30,2],center=true);
			translate([-6,0,0.5])cube([2,30,1],center=true);
			translate([-6.07,0,-0.35])rotate([0,-45,0])cube([2,30,1],center=true);
			translate([1.5,0,-5])rotate([90,0,0])cylinder(30,2.5,2.5,center=true,$fn=20);
			translate([5.5,0,-2])rotate([90,0,0])cylinder(30,2,2,center=true,$fn=20);
			translate([-4,0,13])cube([2,12,24],center=true);
			translate([-5,0,13])cube([2,8,24],center=true);
			for (windrow=[0:8]) {
					translate([-6,-1.2,3+windrow*2.4+((windrow==8)?0.5:0)])cube([8,2,2],center=true);
					translate([-6,1.2,3+windrow*2.4+((windrow==8)?0.5:0)])cube([8,2,2],center=true);
					translate([-6,-3.2,3+windrow*2.4+((windrow==8)?0.5:0)])cube([8,1,2],center=true);
					translate([-6,3.2,3+windrow*2.4+((windrow==8)?0.5:0)])cube([8,1,2],center=true);
			}
		}
		translate([-3.5,0,0])cube([10,11.8,2],center=true);
	}
}
module roof() {
	color([.7,.7,.7])  render()
	translate([0,0,65.25]){
		difference() {
			union() {
				translate([0,0,0])rotate([45,0,0])cube([148,64*0.7071,64*0.7071],center=true);
				for (wr=[0:4]) {
					translate([(150/6)*-2+wr*(150/6),-19,5.25])cube([11,15,13.5],center=true);
					translate([(150/6)*-2+wr*(150/6), 19,5.25])cube([11,15,13.5],center=true);
					translate([(150/6)*-2+wr*(150/6),-18.75,12])rotate([0,45,0])cube([11*0.7071,17,11*0.7071],center=true);
					translate([(150/6)*-2+wr*(150/6), 18.75,12])rotate([0,45,0])cube([11*0.7071,17,11*0.7071],center=true);
				}
			}
			translate([0,0,21])cube([22.6,22.6,42],center=true);
			translate([0,0,0])rotate([45,0,0])cube([150,60*0.7071,60*0.7071],center=true);
			translate([0,0,-32])cube([150,64,64],center=true);
			for (wr=[0:4]) {
				translate([(150/6)*-2+wr*(150/6),-19,5.275])cube([9,15,13.5],center=true);
				translate([(150/6)*-2+wr*(150/6),-21,12])rotate([0,45,0])cube([9*0.7071,17,9*0.7071],center=true);
				translate([(150/6)*-2+wr*(150/6), 19,5.25])cube([9,15,13.5],center=true);
				translate([(150/6)*-2+wr*(150/6), 21,12])rotate([0,45,0])cube([9*0.7071,17,9*0.7071],center=true);
				translate([(150/6)*-2+wr*(150/6), -27.5,9])cube([9,3,6],center=true);
				translate([(150/6)*-2+wr*(150/6), 27.5,9])cube([9,3,6],center=true);
			}
			translate([0,-29.5,8.9])cube([150,6,6],center=true);
			translate([0,29.5,8.9])cube([150,6,6],center=true);
			translate([0,30.7,12])rotate([45,0,0])cube([150,6,6],center=true);
			translate([0,-30.7,12])rotate([45,0,0])cube([150,6,6],center=true);
		}
		translate([72,0,0.5])cube([4,61,1],center=true);
		translate([-72,0,0.5])cube([4,61,1],center=true);
		translate([16,0,0.5])cube([4,61,1],center=true);
		translate([-16,0,0.5])cube([4,61,1],center=true);
	}
}
module balcony(size=22) {
	rotate([0,0,45])cylinder(2,(size/2)*1.414,(size/2+1)*1.414,center=true,$fn=4);

	translate([0-((size/2)-2),size/2,3.5]) for (raila=[0:(size/2)-2]) translate([raila*2,0,0]) cube([1,1,6],center=true);
	translate([0-((size/2)-2),-size/2,3.5]) for (raila=[0:(size/2)-2]) translate([raila*2,0,0]) cube([1,1,6],center=true);
	translate([-size/2,0-((size/2)-2),3.5]) for (raila=[0:(size/2)-2]) translate([0,raila*2,0]) cube([1,1,6],center=true);
	translate([size/2,0-((size/2)-2),3.5]) for (raila=[0:(size/2)-2]) translate([0,raila*2,0]) cube([1,1,6],center=true);

	translate([ size/2, size/2,5]) { cube([2,2,8],center=true); translate([0,0,4.5])sphere(1,$fn=20); translate([0,0,5.5])sphere(0.5,$fn=20); }
	translate([ size/2,-size/2,5]) { cube([2,2,8],center=true); translate([0,0,4.5])sphere(1,$fn=20); translate([0,0,5.5])sphere(0.5,$fn=20); }
	translate([-size/2, size/2,5]) { cube([2,2,8],center=true); translate([0,0,4.5])sphere(1,$fn=20); translate([0,0,5.5])sphere(0.5,$fn=20); }
	translate([-size/2,-size/2,5]) { cube([2,2,8],center=true); translate([0,0,4.5])sphere(1,$fn=20); translate([0,0,5.5])sphere(0.5,$fn=20); }

	translate([ 0, size/2,6.5]) cube([size,1.5,1.5],center=true);
	translate([ 0,-size/2,6.5]) cube([size,1.5,1.5],center=true);
	translate([ size/2, 0,6.5]) cube([1.5,size,1.5],center=true);
	translate([-size/2, 0,6.5]) cube([1.5,size,1.5],center=true);
}
module arch(length,width,height){
	translate([0,0,height-width/2]) {
		rotate([90,0,0])cylinder(length,width/2,width/2,center=true,$fn=30);
		translate([0,0,0-(height-width/2)/2])cube([width,length,height-width/2],center=true);
	}
}
module grandArchWindow() {
	intersection() {
		arch(1,10,18); 
		union() {
			difference() {
				arch(1,10,18); 
				arch(2,9,17.5); 
			}
			translate([4.75,0,0])difference() { arch(1,10,18); arch(2,9,17.5); }
			translate([-4.75,0,0])difference() {	arch(1,10,18); arch(2,9,17.5); }
			translate([0,-0.4,0]) {
				translate([4.75*1.5,0,0])difference() { arch(1,10,18);  arch(2,9.5,17.75); }
				translate([-4.75*1.5,0,0])difference() { arch(1,10,18);  arch(2,9.5,17.75); }
				translate([10-4.75*1.5,0,0])difference() { arch(1,10,18);  arch(2,9.5,17.75); }
				translate([-10+4.75*1.5,0,0])difference() { arch(1,10,18);  arch(2,9.5,17.75); }
				translate([0,0,9])cube([.5,1,18],center=true);
				translate([-2.125,0,9])cube([.4,1,18],center=true);
				translate([2.125,0,9])cube([.4,1,18],center=true);
				translate([4.75/4*3,0,9])cube([.4,1,18],center=true);
				translate([-4.75/4*3,0,9])cube([.4,1,18],center=true);
				for(cb=[0:7]) { translate([0,0,cb*2])cube([10,1,0.5],center=true); }
			}
		}
	}
}
module archWindow() {
	intersection() {
		arch(1,4,8); 
		union() {
			difference() {
				arch(1,4,9); 
				translate([0,0,0.5]) arch(2,3,7.5); 
			}
			translate([0,-0.4,0]) {
				for(cb=[0:4]) { translate([0,0,cb*1.5])cube([4,1,0.5],center=true); }
				translate([0.5,0,4])cube([.5,1,8],center=true);
				translate([-0.5,0,4])cube([.5,1,8],center=true);
			}
		}
	}
}

module roofInner(drawTop=true) {
	color([.9,.9,.7]) render() 
	translate([0,0,63.71]) {
	if (!drawTop) {
		difference() {
			union() {
				difference() {
					union() {
						translate([0,0,1])cube([147,64,1],center=true);
						difference() {
							cube([147,62,1],center=true);
							for (notch=[0:36]) {
								translate([-73.01+notch*4,32,0])cube([2,5,1.1],center=true);
								translate([-73.01+notch*4,-32,0])cube([2,5,1.1],center=true);
							}
						}
					}
					translate([0,-32.5,-1])rotate([45,0,0])cube([150,4,4],center=true);
					translate([0, 32.5,-1])rotate([45,0,0])cube([150,4,4],center=true);
				}
				for (tw=[0:4]) {
					translate([(150/6)*-2+tw*(150/6),-18.9,6.75])cube([9,15,13.5],center=true);
					translate([(150/6)*-2+tw*(150/6),-18.9,13.5])rotate([0,45,0])cube([9*0.7071,15,9*0.7071],center=true);
					translate([(150/6)*-2+tw*(150/6), 18.9,6.75])cube([9,15,13.5],center=true);
					translate([(150/6)*-2+tw*(150/6), 18.9,13.5])rotate([0,45,0])cube([9*0.7071,15,9*0.7071],center=true);
				}
			}
			cube([140,49,40],center=true);
			for (tw=[0:4]) {
				for (topwin=[0:2]) {
					for (topwinrow=[0:3]) {
						translate([(150/6)*-2+tw*(150/6)+topwin*2.4-2.4,0,8.4+topwinrow*1.6])cube([2,80,1],center=true);
					}
				}
				translate([(150/6)*-2+tw*(150/6), 27,10.75])cube([7.5,2,6.5],center=true);
				translate([(150/6)*-2+tw*(150/6), -27,10.75])cube([7.5,2,6.5],center=true);
			}
		}
		cube([30,55,1],center=true);
		translate([0,0,1])cube([19.6,19.6,2],center=true);
	} else {
		translate([0,0,21]) difference() { 
			union() {
				//translate([0,0,-21])cube([30,55,1],center=true);
				cube([22,22,42],center=true);
				translate([0,0,22]) balcony(size=22);
				translate([0,0,31])cube([14,14,24],center=true);
				translate([0,0,44]) balcony(14);
				translate([0,0,53])cube([7,7,17],center=true);
				translate([0,0,61])rotate([0,0,45])cylinder(2,3.5*1.414,4.5*1.414,center=true,$fn=4);
				translate([0,0,62])intersection() { sphere(4,$fn=30); cylinder(4,4,4,$fn=30); }
				translate([0,0,62])cylinder(6,1.5,0.5,$fn=30);
				translate([0,0,68.5])sphere(1,$fn=30); 
				translate([0,0,69.5])sphere(0.5,$fn=30); 
				translate([0,0,6])rotate([90,0,0])cylinder(23,3,3,center=true,$fn=30);
			}
			translate([0,0,-1])cube([20,20,42],center=true); 
			translate([0,0,42-9.5])cube([12,12,23],center=true);
			translate([0,0,42+24-13.25])cube([5,5,15.5],center=true);
			translate([0,0,6]) rotate([90,0,0])cylinder(50,2.5,2.5,center=true,$fn=30);
			translate([0,0,23]){ arch(15,10,18); rotate([0,0,90])arch(15,10,18); }
			translate([0,0,51]){ arch(12,4,8); rotate([0,0,90])arch(12,4,8); }
		}
		translate([0,6.75,44]) grandArchWindow();
		translate([0,-6.75,44]) rotate([0,0,180])grandArchWindow();
		translate([-6.75,0,44]) rotate([0,0,90])grandArchWindow();
		translate([6.75,0,44]) rotate([0,0,-90])grandArchWindow();
		translate([0,3.25,72]) archWindow();
		translate([0,-3.25,72]) rotate([0,0,180])archWindow();
		translate([-3.25,0,72]) rotate([0,0,90])archWindow();
		translate([3.25,0,72]) rotate([0,0,-90])archWindow();
		translate([0,0,27]) {
			difference() {
				union() for (rwin=[0:1]) translate([0,-10.5+21*rwin,0]) {
					rotate([0,0,0])cube([6,0.6,0.6],center=true);
					rotate([0,45,0])cube([6,0.6,0.6],center=true);
					rotate([0,90,0])cube([6,0.6,0.6],center=true);
					rotate([0,135,0])cube([6,0.6,0.6],center=true);
					rotate([90,0,0])cylinder(0.6,1.5,1.5,center=true,$fn=30);
				}
				rotate([90,0,0])cylinder(50,0.9,0.9,center=true,$fn=30);
			}
		}
	}
	}
}
module orig() {
	intersection() {
		import(file="OldStateHouseBlockTC.stl",convexity=10);
		translate([0,0,75])cube([157.2,62.4,150],center=true);
	}
}

module windows(side=1) {
	if (side==1) {
		difference() {
			for (sWin=[0:10]) {
				translate([sWin*12.5-63,27.75,42.6])window(style=1);
				if (sWin!=5) {
					translate([sWin*12.5-63,27.75,15.6])window(style=2);
					translate([sWin*12.5-63,27.75,-3.55])window(style=3);
				}
				if (sWin<10) translate([sWin*12.5-59.5,26.3,2.5]) cube([5.5,1,58]);
			}
			translate([-6.25,24,0])cube([12,8,37.5]);
		}
	} else if (side==2) {
		for (sWin=[0:10]) {
			rotate([0,0,180])translate([sWin*12.5-62,27.75,42.6])window(style=1);
			rotate([0,0,180])translate([sWin*12.5-62,27.75,15.6])window(style=2);
			rotate([0,0,180])translate([sWin*12.5-62,27.75,-3.55])window(style=3);
			if (sWin<10) rotate([0,0,180])translate([sWin*12.5-58.25,26.25,2.5]) cube([5,1,58]);
		}
	} else if (side==3) {
		color([.9,.9,.7])translate([-77.5,-14,0.5]) {
			union() {
				difference() {
					union() {
						for (sWin=[0:2]) {
							rotate([0,0,90])translate([sWin*14,0,41.5])window(style=1);
							rotate([0,0,90])translate([sWin*14,0,15.5])window(style=2);
							rotate([0,0,90])translate([sWin*14,0,-3.6])window(style=3);
							if (sWin<2) rotate([0,0,90])translate([sWin*14+3.5,-1.5,2.5]) cube([7,1,78]);
						}
						rotate([0,0,90])translate([14,0,66.5])window(style=1);
						rotate([0,90,0])translate([-70.4,0,-1])cylinder(2.5,3.3,3.3,$fn=50);
						rotate([0,90,0])translate([-70.4,28,-1])cylinder(2.5,3.3,3.3,$fn=50);
						rotate([0,90,0])translate([-90.4,14,-1])cylinder(2.5,4.3,4.3,$fn=50);
						rotate([0,90,0])translate([-89.3,10.25,0.5]) cube([5,7.5,1]);
						rotate([0,90,0])translate([-73.5,0,0.5]) cube([6.5,7.5,1]);
						rotate([0,90,0])translate([-73.5,20,0.5]) cube([6.5,7.5,1]);
					}
					rotate([0,90,0])translate([-70.4,0,-1.1])cylinder(2.7,2.8,2.8,$fn=50);
					rotate([0,90,0])translate([-70.4,28,-1.1])cylinder(2.7,2.8,2.8,$fn=50);
					rotate([0,90,0])translate([-90.4,14,-1.1])cylinder(2.7,3.8,3.8,$fn=50);
				}
				difference() {
					union() {
						rotate([0,90,0])translate([-70.4,0,0.5])cylinder(1,1.5,1.5,$fn=50);
						rotate([0,90,0])translate([-70.4,28,0.5])cylinder(1,1.5,1.5,$fn=50);
						rotate([0,90,0])translate([-90.4,14,0.5])cylinder(1,2.5,2.5,$fn=50);
						rotate([0,90,0])translate([-90.75,10,0.5])cube([0.5,8.3,1]);
						rotate([0,90,0])translate([-94.3,13.75,0.5])cube([8.3,0.5,1]);
						rotate([0,90,0])translate([-70.75,-3,0.5])cube([0.5,6.6,1]);
						rotate([0,90,0])translate([-73.8,-0.25,0.5])cube([6.6,0.5,1]);
						rotate([0,90,0])translate([-70.75,24.5,0.5])cube([0.5,6.6,1]);
						rotate([0,90,0])translate([-73.8,27.75,0.5])cube([6.6,0.5,1]);
					}
					rotate([0,90,0])translate([-70.4,0,0.0])cylinder(2,1,1,$fn=50);
					rotate([0,90,0])translate([-70.4,28,0.0])cylinder(2,1,1,$fn=50);
					rotate([0,90,0])translate([-90.4,14,0.0])cylinder(2,2,2,$fn=50);
				}
			}
		}
	} else if (side==4) {
		color([.9,.9,.7])rotate([0,0,180])translate([-77.5,-14,0.5]) 
		union() {
			difference() {
				union() {
					difference() {
						union() {
							for (sWin=[0:2]) {
								rotate([0,0,90])translate([sWin*14,0,41.5])window(style=1);
								rotate([0,0,90])translate([sWin*14,0,15.5])window(style=2);
								rotate([0,0,90])translate([sWin*14,0,-3.6])window(style=3);
								if (sWin<2) rotate([0,0,90])translate([sWin*14+3.5,-1.5,2.5]) cube([7,1,78]);
							}
							rotate([0,0,90])translate([14,0,66.5])window(style=1);
							rotate([0,90,0])translate([-70.4,0,-1])cylinder(2.5,3.3,3.3,$fn=50);
							rotate([0,90,0])translate([-70.4,28,-1])cylinder(2.5,3.3,3.3,$fn=50);
							rotate([0,90,0])translate([-90.4,14,-1])cylinder(2.5,4.3,4.3,$fn=50);
							rotate([0,90,0])translate([-89.3,10.25,0.5]) cube([5,7.5,1]);
							rotate([0,90,0])translate([-73.5,0,0.5]) cube([6.5,7.5,1]);
							rotate([0,90,0])translate([-73.5,20,0.5]) cube([6.5,7.5,1]);
						}
						rotate([0,90,0])translate([-70.4,0,-1.1])cylinder(2.7,2.8,2.8,$fn=50);
						rotate([0,90,0])translate([-70.4,28,-1.1])cylinder(2.7,2.8,2.8,$fn=50);
						rotate([0,90,0])translate([-90.4,14,-1.1])cylinder(2,3.8,3.8,$fn=50);
					}
					difference() {
						union() {
							rotate([0,90,0])translate([-70.4,0,0.5])cylinder(1,1.5,1.5,$fn=50);
							rotate([0,90,0])translate([-70.4,28,0.5])cylinder(1,1.5,1.5,$fn=50);
							rotate([0,90,0])translate([-70.75,-3,0.5])cube([0.5,6.6,1]);
							rotate([0,90,0])translate([-73.8,-0.25,0.5])cube([6.6,0.5,1]);
							rotate([0,90,0])translate([-70.75,24.5,0.5])cube([0.5,6.6,1]);
							rotate([0,90,0])translate([-73.8,27.75,0.5])cube([6.6,0.5,1]);
						}
						rotate([0,90,0])translate([-70.4,0,0.0])cylinder(2,1,1,$fn=50);
						rotate([0,90,0])translate([-70.4,28,0.0])cylinder(2,1,1,$fn=50);
						rotate([0,90,0])translate([-90.4,14,0.0])cylinder(2,2,2,$fn=50);
						
					}
				}
				rotate([0,90,0])translate([-31.2,9.25,-10])cube([13,9,20]);
				rotate([0,90,0])translate([-62.9,7.9,-10])cube([28.6,12.2,20]);
//		#		translate([-7,0,13.1])cube([5,11.8,28.2],center=true);
			}
			rotate([0,0,90])translate([14,0,15.4])window(style=4);
		}
	} else {
	}
}
module endWall(south=true) {
	difference() {
		union() {
			translate([0,0,76.14/2]){
				cube([4.8,57.6,76.14],center=true);
				translate([0,0,6-76.14/2])difference() { 
					cube([7,57.6+2.2,12],center=true);
					translate([3.9,0,6])rotate([0,45,0]) cube([2,60,2],center=true); 
					translate([-3.9,0,6])rotate([0,45,0]) cube([2,60,2],center=true); 
					translate([0,30.3,6])rotate([45,0,0]) cube([10,2,2],center=true);
					translate([0,-30.3,6])rotate([45,0,0]) cube([10,2,2],center=true);
				}
				translate([0,0,36-76.14/2])difference() { 
					cube([7,57.6+2.2,2],center=true); 
					translate([3.9,0,-1])rotate([0,45,0]) cube([2,60,2],center=true); 
					translate([-3.9,0,-1])rotate([0,45,0]) cube([2,60,2],center=true); 
					translate([0,30.3,-1])rotate([45,0,0]) cube([10,2,2],center=true);
					translate([0,-30.3,-1])rotate([45,0,0]) cube([10,2,2],center=true);
				}
				translate([0,0,62.21-76.14/2])difference() { 
					cube([7,57.6+2.2,2],center=true); 
					translate([3.9,0,-1])rotate([0,45,0]) cube([2,60,2],center=true);
					translate([-3.9,0,-1])rotate([0,45,0]) cube([2,60,2],center=true); 
					translate([0,30.3,-1])rotate([45,0,0]) cube([10,2,2],center=true);
					translate([0,-30.3,-1])rotate([45,0,0]) cube([10,2,2],center=true);
				}
			}
			translate([0,0,97.7/2]) difference() {
				cube([4.8,38.4,97.7],center=true);
				translate([0,-38.4/2,97.7/2])rotate([30,0,0])cube([5,38.4,20],center=true);
				translate([0,38.4/2,97.7/2])rotate([-30,0,0])cube([5,38.4,20],center=true);
			}
			translate([0,0,100/2])cube([4.8,14.4,100],center=true);
		}
		translate([0,0,76])cube([5,8,18],center=true);
		translate([0,-14,71])rotate([0,90,0])cylinder(8,3.5,3.5,center=true);
		translate([0,14,71])rotate([0,90,0])cylinder(8,3.5,3.5,center=true);
		translate([0,0,91])rotate([0,90,0])cylinder(8,4.5,4.5,center=true);
		for (ew=[0:2]) {
			if ((ew!=1)||(!south)) {
				translate([0,ew*14-14,25])cube([5,8,14],center=true);
				translate([0,ew*14-14,51])cube([5,8,18],center=true);
			} else {
				translate([0,ew*14-14,25])cube([5,10,14],center=true);
				translate([0,ew*14-14,49.25])cube([8,12,28.5],center=true);
			}
			translate([0,ew*14-14,6])cube([7.2,8,6],center=true);
		}
	}
}
module sideWall(east=true) {
	translate([0,0,63.21/2]) difference() {
		union() {
			cube([157.2,4.8,63.21],center=true);
			translate([0,0,6-63.21/2])difference() { 
				cube([157.2,7,12],center=true);
				translate([0,3.9,6])rotate([45,0,0]) cube([160,2,2],center=true);
				translate([0,-3.9,6])rotate([45,0,0]) cube([160,2,2],center=true);
			}
			translate([0,0,36-63.21/2])difference() { 
				cube([157.2,7,2],center=true);
				translate([0,3.9,-1])rotate([45,0,0]) cube([160,2,2],center=true);
				translate([0,-3.9,-1])rotate([45,0,0]) cube([160,2,2],center=true);
			}
			translate([0,0,62.21-63.21/2]) difference() {
				cube([157.2,7,2],center=true);
				translate([0,3.9,-1])rotate([45,0,0]) cube([160,2,2],center=true);
				translate([0,-3.9,-1])rotate([45,0,0]) cube([160,2,2],center=true);
			}
		}
		for (sw=[0:10]) {
			translate([sw*12.5-63,0,20])cube([8,5,18],center=true);
			if ((sw!=5)||(!east)) {
				translate([sw*12.5-63,0,-7])cube([8,5,14],center=true);
				translate([sw*12.5-63,0,-26])cube([8,7.2,6],center=true);
			} else {
				translate([sw*12.5-63,0,-13])cube([12,8,38],center=true);
			}
		}
	}
}
module brickSurface(x,y,tx=4.5,ty=2,mortorThickness=0.5) {
//	cube([x,y,mortorThickness],center=true);
		for(tiley=[0:y/ty]) {
			translate([0,0-y/2+tiley*ty,0])cube([x,mortorThickness,mortorThickness],center=true);
			for(tilex=[0:x/tx]) {
				translate([0-x/2+tilex*tx+(tiley%2==0?tx/2:0),0-y/2+tiley*ty+ty/2,0])cube([mortorThickness,ty,mortorThickness],center=true);
			}
		}
}
module sideDoor() {
	difference() {
		union() {
			difference(){
				translate([-0.5,31.3,26])rotate([90,30,0])cylinder(5,16,16,center=true,$fn=6);
				translate([-0.5,29,17])cube([40,40,40],center=true);
			}
			translate([-0.5,29.5,18.7])cube([11.6,7,37.4],center=true);
			translate([-0.5,26.3,18.7])cube([12,1,37.4],center=true);
			translate([-0.5,31.5,6])cube([14,3,12],center=true);
		}
		translate([-0.5,31.5,20])cube([10,10.1,28],center=true);
		translate([-0.5,33.5,18])cube([10,10.1,28],center=true);
		translate([-0.5,35.5,16])cube([10,10.1,28],center=true);
		translate([-0.5,30,19])cube([8,10,24],center=true);
		translate([-0.5,32,23])cube([14,3,22],center=true);
	}
	translate([-6.5,32,22])cylinder(30,1,1,center=true,$fn=20);
	translate([5.5,32,22])cylinder(30,1,1,center=true,$fn=20);
}
module walls() {
	render() 
	color([0.8,0.4,0.4,1])difference() {
		union() {
			translate([0,0-(57.6-4.8)/2,0])sideWall(false);
			translate([0,(57.6-4.8)/2,0])sideWall();
			translate([0-(157.2-4.8)/2,0,0])endWall(false);
			translate([(157.2-4.8)/2,0,0])endWall();
		}
		difference() {
			translate([0,0,31])cube([154,54,66],center=true);
			translate([-77,0,64])rotate([0,45,0])cube([4,54,4],center=true);
			translate([77,0,64])rotate([0,45,0])cube([4,54,4],center=true);
		}
		difference() {
			translate([0,0,44])cube([154,35,80.5],center=true);
			translate([-77,0,84.5])rotate([0,45,0])cube([4,35,4],center=true);
			translate([77,0,84.5])rotate([0,45,0])cube([4,35,4],center=true);
			translate([0,17.5,84.5])rotate([45,0,0])cube([160,11,11],center=true);
			translate([0,-17.5,84.5])rotate([45,0,0])cube([160,11,11],center=true);
		}
		translate([0,0,44])cube([154,9,92],center=true);
	}
}
module window(style=1) {
	translate([0,0,9])color([.9,.9,.7])
	if (style==1) {
		difference() {
			cube([7.6,3,17.6],center=true);
			translate([0,1.01,4.24])cube([7,1,8.5],center=true);
			translate([0,1.01,-4.24])cube([7,2,8.5],center=true);
			translate([0,2.5,0.5])cube([8.1,3,18],center=true);
			for (py=[0:1]) {
				for (wy=[0:2]) {
					for (wx=[0:3]) {
						translate([-2.5+wx*1.7,0,-1.4-wy*2.7+py*8.5]) cube([1.3,3.1,2.1],center=true);
					}
				}
			}
		}
	} else if (style==2) {
		difference() {
			cube([7.6,3,13.6],center=true);
			translate([0,1.01,3.24])cube([7,1,6.5],center=true);
			translate([0,1.01,-3.24])cube([7,2,6.5],center=true);
			translate([0,2.5,0.5])cube([8.1,3,14],center=true);
			for (py=[0:1]) {
				for (wy=[0:2]) {
					for (wx=[0:3]) {
						translate([-2.5+wx*1.7,0,-1.1-wy*2+py*6.5]) cube([1.3,3.1,1.7],center=true);
					}
				}
			}
		}
	} else if (style==3) {
		difference() {
			translate([0,0.625,0.1])cube([7.6,4.25,5.6],center=true);
			translate([0,3,0.25])cube([7,3,5],center=true);
			translate([0,3.6,0.5])cube([8.1,3,6],center=true);
			for (wy=[0:1]) {
				for (wx=[0:3]) {
					translate([-2.6+wx*1.7,0,1.3-wy*2]) cube([1.3,3.1,1.7],center=true);
				}
			}
		}
	} else if (style==4) {
		difference() {
			cube([9.6,3,13.6],center=true);
			translate([0,1.01,3.24])cube([9,1,6.5],center=true);
			translate([0,1.01,-3.24])cube([9,2,6.5],center=true);
			translate([0,2.5,0.5])cube([10.1,3,14],center=true);
			for (py=[0:1]) {
				for (wy=[0:2]) {
					for (wx=[0:3]) {
						translate([-3.3+wx*1.7+(wx>1?1.2:0),0,-1.1-wy*2+py*6.5]) cube([1.3,3.1,1.7],center=true);
					}
				}
			}
		}
	} else {
	}
}
