

//hip(23,12.5,80);

module hip(l,w,lung){
   difference(){
            union(){
         //main
         translate([-(lung/2),-10,0]) cube([lung,20,4]);

         //outside edges
         for (i = [[-43,-7,0],[37,-7,0]] ){
         	   translate(i) cube([6,14,4]);
         }

         //rounded corners
         for (i = [[-40,7,0],[-40,-7,0],[40,7,0],[40,-7,0]] ){
            translate(i) cylinder(r=3,h=4,$fn=50);
         }
      }
      
      //servo mount holes
      for (i = [[-11.5,0,-2],[-39.5,0,-2],[11.5,0,-2],[39.5,0,-2]] ){
         translate(i) cylinder(r=1,h=20,$fn=20);
      }
      
      //servo body cutouts
      for (i = [[-25.5,0,2],[25.5,0,2]] ){
         translate(i)  cube([l,w,22], center=true);
      }

   }
}
