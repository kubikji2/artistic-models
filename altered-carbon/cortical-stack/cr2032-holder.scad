include<constants.scad>

// BEWARE LEGACY CODE
// adopted from the yennefer-necklace

// heigh of useable space for electronics
h_e = 4.25;

// scale factor
sf = 0.8;

// distance from the center to the LED diods
led_l = sf*20.8;

// diameter of useable space for electronics and bottom
d_e = sf*46;
// diameter of the buttom cover
d_b = d_e + 1.5;
// heigh of the buttom cover
h_b = 1;


// BATTERY dimensions
// battery diameter
cr2032_d = 20;
// batter heigh
cr2032_h = 3.3;
// battery wall thickness
cr2032_wt = 1.5;


// battery box parameters

// battery box contact thickness
bb_t = 0.8;
// battery box contact holders dimension
bb_h = 2.5;
// distance between catode and anode
bb_d = 2.75;

// battery anode length
ba_l = 13.5;
// battery anode length extention
ba_l_ext = 2;
// battery anode width
ba_w = 3.3;

// battery catode
// battery catode length is not important
//bc_l = 
// battery catode width
bc_w = 11.5;

// offset of battery box in z coordinate
bb_off = -0.2;


// holder for cr2032_ battery
module cr2032_holder(d=cr2032_d+2*cr2032_wt, h=4.5)
{   
    // TODO parameter checking
    _d = d;
    _r = _d/2;
    _h = h;

    // adding batery holder stuff
    // main block has dimension of catode and two battery box borders
    ch_x = bc_w+2;
    ch_y = 2*bb_h;
    ch_z = _h;
    ch_x_off = -ch_x/2;
    ch_y_off = -cr2032_d/2-ch_y+bb_h;
    ch_z_off = 0;

    // anode cut y dimension
    ac_y = d_b/2-(d_b/2-led_l)+ba_l_ext;
    ac_y_off = -ac_y+ba_l_ext;

    // basic platform
    difference()
    {
        union()
        {
            // battery border
            cylinder(d=_d,h=_h);

            // anode and catode holder
            translate([ch_x_off, ch_y_off, ch_z_off])
                cube([ch_x,ch_y,ch_z]);
        }

        // battery cut
        translate([0,0,-eps])
            cylinder(d=cr2032_d,h=2*cr2032_h+2*eps);
        
        // hole for removing battery with screw driver
        rotate([0,0,215])
            translate([cr2032_d/2-0.5,-2,-eps])
                cube([1,4,2*_h]);
               
        // anode cut holder
        translate([-ba_w/2,ac_y_off,-eps])
            cube([ba_w+2*eps,ac_y,bb_t+2*eps]);
        
        // catode cut y dimension
        cc_z_off = cr2032_h;
        translate([-bc_w/2,-ac_y, cc_z_off])
            cube([bc_w+2*eps,ac_y, bb_t]);
        
        // side cut of battery box, so we can inser battery
        translate([-cr2032_d/2,-eps,h_b+eps])
            cube([cr2032_d,_r+2*eps,_h-h_b+eps]);
    }
    
    // adding battery box upper beam
    b_x = cr2032_d + cr2032_wt;
    b_y = 2*bb_h;
    b_z = _h - bb_t - cr2032_h;
    b_z_off = _h-b_z;
    translate([-b_x/2,-b_y/2,b_z_off])
        cube([b_x,b_y,b_z]);
   
}


//cr2032__holder();