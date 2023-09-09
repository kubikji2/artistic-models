include <../../solidpp/solidpp.scad>

include <cr2032-holder.scad>
include <trimmer.scad>

// customizable parameters
// used magnet diameter
magnet_diameter = 3;
// used magnet height
magnet_height = 2;


// SOURCE PIECES

// top base piece
module src_top()
{
    // top piece
    import("src/stack-top-no-hole.stl");
}


// bottom base piece
module src_bottom()
{
    // bottom piece
    rotate([0,180,0])
        import("src/stack-bottom-no-hole.stl");
}


// reference top place with holes 
module reference_top()
{
    // top piece
    %import("src/stack-top.stl");
}


// reference bottom place with holes
module reference_bottom()
{
    // bottom piece
    %rotate([0,180,0])
        import("src/stack-bottom.stl");
}

// parameters
// central compartement
c_d = 25;
// '-> diameter
c_h = 5;
// '-> height in one hemisphere
clrn = 0.25;
    
// electronics board -> 'e_'
e_t = 1;
// '-> thickness
et_r_off = 4;
// '-> top radius offset 
et_d = c_d + 2*et_r_off;

// leds -> 'led_'
led_off = 5;
// '-> led offset
led_d = 1.8;
// '-> led diameter
led_x = 3.3;
// '-> led box x dimension
led_y = 2.3;
// '-> led box y dimension
led_z = 1.6;
// '-> led box z dimension
led_count = 5;

// Potentiometer parameters -> 'pm_'
pm_x = 5;
// '-> x dimension
pm_y = 5.5;
// '-> y dimension
pm_z = 2.8;
// '-> z dimension
pm_wt = 1.5;
// '-> maximal possible wall thickness

// selected parameters
$fn = $preview ? 30 : 120;
// '-> resolution
black = [0.25,0.25,0.25];
// '-> black color
gray = [0.5, 0.5, 0.5];
// '-> gray color'


// electronics board
module electronics_bottom()
{
    color(gray)
    translate([0,0,-c_h])
    {
        // adding baseplate
        cylinder(d=c_d, h=e_t);
        
        // adding battery holder
        translate([0,0,e_t])
            difference()
            {
                cr2032_holder(d=c_d, h=led_off);

                // cut the corners off
                tubepp(D=2*c_d, d=c_d+2, h=4*led_off, align="");
            }        
    }
}

module led_hole(M=10)
{
    cylinderpp(d=led_d, h=M, align="z");

    cubepp([led_x,led_y,M], align="Z");
}

module electronics_top()
{
    _d = (c_d - cr2032_d)/2 + cr2032_d;

    // base plate
    translate([0,0,led_off-c_h+e_t])
    {
        difference()
        {
            
            // ring
            tubepp(h=e_t, d=_d, D=et_d, align="z");
            
            // ring bevel
            cylinderpp(d1=_d,d2=c_d,h=e_t+eps);
            
            // add the LED holes
            for(i=[0:led_count-1])
            {
                _a = -90 + i*(360/led_count);
                _l = c_d/2 + et_r_off/2;

                if (i != 0)
                {
                    rotate([0,0,_a])
                        translate([_l,0,e_t/2])
                            led_hole();
                }
            }

        }

        // add the trimmer
        _tr_wt = 1;
        _tr_off = trb_y+ 2*_tr_wt;

        // add support beam
        difference()
        {
            cubepp([c_d,2*bb_h,e_t], align="z");
            
            // trimmer hole
            translate([_tr_off/2,0,0])
                cubepp([_tr_off,_tr_off, _tr_off],align="z");
        }

        // add trimmer holder
        translate([_tr_off/2,0,0])
            rotate([0,0,90])
                trimmer_holder(wt=_tr_wt,bt=e_t);

        // add switch holder
    
    }
}


// holes for both electronic board and the main body
module electronics_hole()
{

}


// main bodies
module main(is_top=false)
{
    // reference piece
    /*
    if (is_top)
    {
        reference_top();
    }
    else
    {
        reference_bottom();
    }
    */
    
    color(black)
    difference()
    {
        // choosing the source piece
        if (is_top)
        {
            src_top();
        }
        else
        {
            src_bottom();
        }

        // inner space
        cylinder(d=c_d+2*clrn, h=2*(c_h+clrn), center=true);

        // cut for switch

        // cut for the magnets
        magnet_position = [ [    0, -20],
                            [ 19.5,  -8],
                            [-19.5,  -8],
                            [   14,  16],
                            [  -14,  16]];
        
        for (pos=magnet_position)
        {
            translate(pos)
                cylinderpp(d=magnet_diameter+2*clrn, h=2*(magnet_height+clrn), center=true);
        }

    }
}

//main(true);

electronics_bottom();

electronics_top();