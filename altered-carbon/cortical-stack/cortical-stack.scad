include <../../solidpp/solidpp.scad>

include <cr2032-holder.scad>

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

// leds -> 'led_'
led_off = 5;
// '-> led offset

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
module electronics()
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
        
        // add the LEDs

        // add the trimmer
        
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

main();

electronics();