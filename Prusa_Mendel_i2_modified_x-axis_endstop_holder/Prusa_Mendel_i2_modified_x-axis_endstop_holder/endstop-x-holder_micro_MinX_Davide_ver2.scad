// PRUSA Mendel  
// X-Endstop holder
// Used to attach endstop to 8mm X-rods
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// modified version creation Coen Roos 14 dec. 2012
// modified version creation Robert Moro 16 dec. 2012


/**
 * @id X-endstop-holder
 * @name X-Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */

m3_nut_diameter_horizontal = 6.3;
m8_diameter=8.9;
m3_diameter=3.6;
outer_diameter = m8_diameter/2+3.3;
opening_size = m8_diameter-1.5; //openingsize



module endstop()
{

	// Rodclamp)
	rodclamp(0);

	// Rodclamp
 	//rotate(a=180, v=[1,0,0]) translate([0,-61,-10]) rodclamp(1);

	// Bridge between rodclamps
	translate([0,15,0])
	{
			cube([4,42,10]);


		difference()
		{

			translate([-15,0,0]) {
			cube([15,42,5]);
			}
			// Holes for endstop switch
			union()
			{
				translate([-10,4,0])
				{
					cylinder(h =120, r = m3_diameter/2, $fn = 100);
					translate([0,20,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
				}
					//cylinder(h =120, r = m3_diameter/1, $fn = 100);
					translate([-10,5,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,7,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,9,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,11,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,13,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,15,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,17,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,19,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,21,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,23,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,25,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,27,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,29,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,31,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,33,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,35,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
					translate([-10,37,0])cylinder(h =12, r = m3_diameter/2, $fn = 10);
			//cube([-5,32,5]);
			}
		}
	}

}

module rodclamp(switch)
{
 	difference()
	{
		union()
		{
			translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 36);
			translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
			translate([17, 17.5, 5]) rotate([90, 0, 0]) cylinder(h =5, r = 5.77, $fn = 6);
			translate ([0,7,0]) cube([5,10,10]);
		}
		translate([9, outer_diameter-opening_size/2, -1]) cube([18,opening_size,20]);
		translate([outer_diameter, outer_diameter, -1]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
		translate([17, 19.5, 5]) rotate([90, 0, 0]) cylinder(h =5, r = m3_nut_diameter_horizontal/1.9, $fn = 6);
		//Securing hole
		translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
	   }
}

endstop();
//rodclamp(0);