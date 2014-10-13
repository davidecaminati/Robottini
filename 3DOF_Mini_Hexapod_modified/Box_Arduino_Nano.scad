module Box_Arduino_micro(l,w,h,spessore,torretta)
{
	//hole
	function r_from_dia(d) = d / 2;
	
	module rotcy(rot, r, h) {
			rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}
	size = 10;
	hole = 4;
	centro = l/2;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);

	//Tower
	difference()
	{
		translate([l/2,w,(25)/2]) cube([30,spessore*2,25], center = true);
		//front hole
		for (i = [[centro+7.5,w,torretta-10],[centro - 7.5,w,torretta-10]]) {
			translate(i) rotcy([1, 0, 0], cy_r, cy_h);
		}
	}	

	difference()
	{
		cube([l,w,h]);
		translate([spessore,spessore,-1])cube([l-(spessore*2),w-(spessore*2),30]);
	
	};
	//block
	for (i = [[spessore,w/2,(h+2)/2],[l-spessore,w/2,(h+2)/2]]) {
	translate(i) cube([spessore*2,w/3,h-2], center =true);
	}
	//reinforce
	translate([0,w,0]) cube([l,spessore,h]);
}

Box_Arduino_micro(49,24,10,3,30);