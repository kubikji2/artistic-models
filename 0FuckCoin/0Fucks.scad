eps = 0.01;

module buttom(heigh = 2,diam=100,border_rad=5,fn = $fn)
{
   translate([0,0,-heigh]) cylinder(d=diam+2*(border_rad), heigh);
}
module border(heigh = 2,diam=100,border=3,border_offset=2, fn = $fn)
{
    difference()
    {
        cylinder(d=diam+2*(border+border_offset), heigh, $fn = fn);
        translate([0,0,-eps])
            cylinder(d=diam+2*(border_offset), heigh+2*eps, $fn = fn);
    }
}

module coinText(height=2,size=40)
{
    //linear_extrude(height=height) text("0", font = "Consolas:style=Regular", size=size);
    linear_extrude(height=height)
        text("0", size=size, halign="center");
    translate([0,-10,0])
        linear_extrude(height=height)
            text("FUCK", size=0.5*size, halign="center",valign="top");
}


module fuck(radiation_diameter = 95, radiation_height = 3, radiation_ration = 0.75, radiation_inner_ratio = 0.2,  lower_plate_heigh = 2, border_thickness = 3, border_offset = 2, border_heigh = 2, fn = $fn)
{
    
    $fn = fn;
    coinText();
  
    buttom(lower_plate_heigh, radiation_diameter, border_thickness + border_offset,fn);
    border(border_heigh, radiation_diameter, border_thickness, border_offset,fn);
    
}

$fn=90;
fuck();
