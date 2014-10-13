
include <hip_davide.scad>
//include <arduino.scad>
import("Arduino_nano.stl", convexity=3);


translate([-50, -40, 0]) Arduino(0, 0, 0);

translate([0,75,-4]) hip(23,12.5,80);
translate([0,-75,-4]) hip(23,12.5,80);
translate([0,0,-4]) hip(23,12.5,80);
//translate([50,0,0]) backbone(90,14,8,23,12.5);
//backbone();
backbone(160,18,8,15,12.5);


module backbone(bl = 90,bw = 14,bh = 8,sl = 23,sw = 12.5){
	h_pos = ((bl-20) / 2);	
	
		//nose
		translate([-(bw/2),-85,0]) Torretta(18,10,30);

		//tail
		translate([-(bw/2),85-10,0]) Torretta(18,10,30);

		//dorse
		translate([-(bw/2),0-5,0]) Torretta(18,10,30);

	difference(){
		// main
		translate([-(bw/2),-(bl/2),-(bh/2)]) color("purple") cube([bw,bl,bh]);



		//servo body cutouts
		for (i = [[-16.5,h_pos,0],[16.5,h_pos,0],[-16.5,-h_pos,0],[16.5,-h_pos,0]]){
			translate(i) cube([sl,sw,bh], center=true);
		}		

		//servo mount holes
		for (i = [[2.5,h_pos,-10],[-2.5,h_pos,-10],[-2.5,-h_pos,-10],[2.5,-h_pos,-10]]){
			translate(i) cylinder(r=1,h=20,$fn=20);
		}

		//round side indents
		for (i = [[34,17,-5],[34,-17,-5],[-34,17,-5],[-34,-17,-5]]) {
			translate(i) cylinder(r=30,h=10,$fn=200);
		}

		//round side indents
		for (i = [[34,17,-5],[34,-17,-5],[-34,17,-5],[-34,-17,-5]]) {
			translate(i) cylinder(r=30,h=10,$fn=200);
		}

		//center hole
		translate([0,0,-54]) cylinder(r=3,h=100,$fn=200);




	}
}

module Torretta(x,y,z)
{		
//18,10,30
	function r_from_dia(d) = d / 2;
	
	module rotcy(rot, r, h) {
			rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}


	size = 10;
	hole = 2;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);

	difference(){
		cube([x,y,z]);
		
		//top hole
		for (i = [[4,5,22],[14,5,22]]) {
			translate(i) cylinder(r=1,h=10,$fn=50);
		}
		
		//front hole
		for (i = [[4,5,22],[14,5,22]]) {
			translate(i) rotcy([1, 0, 0], cy_r, cy_h);
		}

	}



}
module ArduinoMini()
{
cube([1,1,1]);
}