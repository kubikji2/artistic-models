module branch(heig,diam,out_rat,fn=$fn){
    difference(){
    cylinder(h=heig, d=diam,$fn=fn);
    translate([0, -diam,0]) cube([diam,2*diam,2*heig]);
    rotate([0,0,120]) translate([0, -diam,0]) cube([diam,2*diam,2*heig]);
    cylinder(h=2*heig, d=(1-out_rat)*diam, $fn=fn);
    }
}

module radiation(diam = 100, heig = 2, out_rat = 0.25, in_rat = 0.2,fn = $fn){

    branch(heig,diam,out_rat,fn);
    rotate([0,0,120]) branch(heig,diam,out_rat,fn);
    rotate([0,0,240]) branch(heig,diam,out_rat,fn);
    
    cylinder(d = in_rat*diam, heig,$fn=fn);
    
}

module buttom(heigh = 2,diam=100,border_rad=5,fn = $fn){
   translate([0,0,-heigh]) cylinder(d=diam+2*(border_rad), heigh);
}
module border(heigh = 2,diam=100,border=3,border_offset=2, fn = $fn){
        difference(){
            cylinder(d=diam+2*(border+border_offset), heigh, $fn = fn);
            cylinder(d=diam+2*(border_offset), heigh, $fn = fn);
            }
    
}
 /*
radiation();
buttom();
border();

*/

module radiationSign(radiation_diameter = 85, radiation_height = 2, radiation_ration = 0.70, radiation_inner_ratio = 0.2,  lower_plate_heigh = 2, border_thickness = 3, border_offset = 2, border_heigh = 2, fn = $fn){
    
    $fn = fn;
    
    radiation(radiation_diameter, radiation_height, radiation_ration, radiation_inner_ratio, fn);
    
    buttom(lower_plate_heigh, radiation_diameter, border_thickness + border_offset,fn);
    border(border_heigh, radiation_diameter, border_thickness, border_offset,fn);
    
    
}

$fn=250;
radiationSign(radiation_fn=250);
