use<base.scad>;
use<face.scad>;
use<stain.scad>;

module badge_layer_mm()
{
    scale([0.54,0.54,1])
    difference()
    {
        union()
        {
            scale([1,1,0.4]) base();
            
        }
        translate([0,0,2]) face();
        translate([0,0,1]) stain();
        translate([-85,85,0]) cube([20,20,20], center =true);
        translate([85,-85,0]) cube([20,20,20], center =true);
    }
    
}

//badge_layer_mm();

module badge_mm(clr="red")
{
    if(clr=="yellow")
    {
        scale([0.54,0.54,1])
        difference()
        {
            union()
            {
                scale([1,1,0.4]) base();
                
            }
            //color([0.25,0.25,0.25])
            translate([0,0,2])
                scale([1,1,0.201])
                    face();
            //color("red")
            translate([0,0,2])
                scale([1,1,0.201])
                    stain();
            // blocks in the corners
            translate([-85,85,0]) cube([20,20,20], center =true);
            translate([85,-85,0]) cube([20,20,20], center =true);
        }
    }
    
    if(clr=="black")
    {
        color([0.25,0.25,0.25])
        scale([0.54,0.54,1])
        difference()
        {
            translate([0,0,2])
                scale([1,1,0.2])
                    face();
            translate([0,0,2])
                scale([1,1,0.2])
                    stain();
            translate([-85,85,0]) cube([20,20,20], center =true);
            translate([85,-85,0]) cube([20,20,20], center =true);
        }
        
    }
    
    if(clr=="red")
    {
        color("red")
        scale([0.54,0.54,1])
        difference()
        {
            translate([0,0,2])
                scale([1,1,0.2])
                    stain();
            translate([-85,85,0]) cube([20,20,20], center =true);
            translate([85,-85,0]) cube([20,20,20], center =true);
        }
        
    }
    
    
}

badge_mm();

//$fn = 100;
//%cylinder(h=20,d=95);