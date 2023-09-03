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


// battery data
// battery diameter
bat_d = 20;
// batter heigh
bat_h = 3.3;
// battery holder thickness
bh_t = 1.5;


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


// holder for cr2032 battery
module cr2032_holder()
{   

    // anode cut y dimension
    ac_y = d_b/2-(d_b/2-led_l)+ba_l_ext;
    ac_y_off = -ac_y+ba_l_ext;

    // basic platform
    difference()
    {
        // battery border
        cylinder(d=bat_d+2*bh_t,h=h_e);
        
        // battery cut
        translate([0,0,-eps]) cylinder(d=bat_d,h=2*bat_h+2*eps);
        
        // hole for removing battery with screw driver
        rotate([0,0,215])
            translate([bat_d/2-0.5,-2,-eps])
                cube([1,4,2*bat_h]);
               
        // anode cut holder
        translate([-ba_w/2,ac_y_off,-eps])
            cube([ba_w+2*eps,ac_y,bb_t+2*eps]);
        
        // catode cut y dimension
        cc_z_off = h_e - 3*bb_t/2;
        translate([-bc_w/2,-ac_y,cc_z_off])
            cube([bc_w+2*eps,ac_y,bat_h+2*eps]);
        
        // side cut of battery box, so we can inser battery
        translate([-bat_d/2,-eps,h_b+eps])
            cube([bat_d,bat_d/2+bh_t+2*eps,h_e-h_b+eps]);
    }
    
    // adding batery holder stuff
    // main block has dimension of catode and two battery box borders
    ch_x = bc_w+2;
    ch_y = 2*bb_h;
    ch_z = h_e;
    ch_x_off = -ch_x/2;
    ch_y_off = -bat_d/2-ch_y+bb_h;
    ch_z_off = 0;
    //translate([ch_x_off, ch_y_off, ch_z_off]) cube([ch_x,ch_y,bb_d]);
    // TODO move anode hole up
    // upper holder should be half size of hole
    
    difference()
    {
        translate([ch_x_off, ch_y_off, ch_z_off])
            cube([ch_x,ch_y,ch_z]);
        // catode cut y dimension
        cc_y = d_b/2-(d_b/2-led_l);
        // catode cut z offset
        cc_z_off = h_e - 3*bb_t/2;
        translate([-bc_w/2,-cc_y,cc_z_off])
            cube([bc_w+2*eps,cc_y,bb_t+2*eps]);
        // battery area cut
        translate([-bc_w/2-2*bb_t,ch_y_off+bb_h-eps,-bb_t/2])
            cube([bc_w+4*bb_t+2*eps,bb_h+2*eps,h_e]);
        
        // anode cut holder
        translate([-ba_w/2,ac_y_off,-eps])
            cube([ba_w+2*eps,ac_y,bb_t+eps]);
        
    }
    
    // adding battery box upper beam
    b_x = bat_d +  bh_t;
    b_y = 2*bb_h;
    b_z = bb_t/2;
    b_z_off = h_e-b_z;
    translate([-b_x/2,-b_y/2,b_z_off]) cube([b_x,b_y,b_z]);
   
}


//cr2032_holder();