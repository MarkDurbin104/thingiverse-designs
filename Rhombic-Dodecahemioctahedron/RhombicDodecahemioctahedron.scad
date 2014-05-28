pointA=[0,	0,	2]; // 0
pointB=[1,	1,	1]; // 1
pointC=[1,	-1,	1]; // 2
pointD=[-1,	-1,	1]; // 3
pointE=[-1,	1,	1]; // 4
pointF=[0,	2,	0]; // 5
pointG=[0,	0,	0]; // 6
pointH=[0,	-2,	0]; // 7
pointJ=[1,	1,	-1]; // 8
pointK=[1,	-1,	-1]; // 9
pointL=[-1,	-1,	-1]; // 10
pointM=[-1,	1,	-1]; // 11
pointN=[0,	0,	-2]; // 12
pointO=[0.00001,	0,	0]; // 13 - point 6 moved slightly on the x plane to fix openscad stl error

module RhombicDodecahemioctahedron() {
polyhedron ( 	
	points=[pointA,pointB,pointC,pointD,pointE,pointF,pointG,pointH,pointJ,pointK,pointL,pointM,pointN,pointO],
	triangles=[	[0,2,1],[0,3,2],[2,3,7],[7,9,2],[9,6,2],[2,6,1],[9,8,6],[8,1,6],[9,12,8],[9,10,12],[9,7,10],[7,3,10],
			[8,5,1],[1,5,4],[1,4,0],[5,8,11],[8,12,11],[4,5,11],[0,4,3],[10,11,12],[10,13,11],[10,3,13],[4,13,3],[4,11,13]
			]
);
}

color([0.5,0.5,0.8,0.6]) RhombicDodecahemioctahedron();
translate([0,4,0])color([0.5,0.5,0.8,1]) RhombicDodecahemioctahedron();
