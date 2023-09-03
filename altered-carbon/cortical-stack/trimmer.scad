include<constants.scad>

// BEWARE LEGACY CODE
// adopted from the yennefer-necklace

// trimmer parameters
// trimmer base parameters
// trimmer x dimension
trb_x = 5.0;
// trimmer y dimension
trb_y = 5.0;
// trimmer z dimension
trb_z = 2.7;
// trimmer contact parameters
// trimmer contact x 
trc_x = 1;
// trimmer contact y 
trc_y = 1;
// trimmer contact z
trc_z = 1;
// trimmer contact x offset
trc_x_off = 0.25;
// trimmer contact z offset
trc_z_off = 0.2;
// trimmer concact y offset from center
trc_y_off = 1.15;

module trimmer()
{
    // base
    translate([-trb_x/2-tol_xy/2,-trb_y/2-tol_xy/2,trc_z_off])
        cube([trb_x+tol_xy,trb_y+tol_xy,trb_z+2*tol_z]);
    
    // contacts on the same side
    c_xs = trb_x/2-trc_x+trc_x_off-tol_xy/2;
    c_yps = trc_y_off-trc_y/2-tol_xy;
    c_yns = -trc_y_off-trc_y/2-tol_xy;
    c_zs = -tol_z;
    translate([c_xs,c_yps,c_zs]) cube([trc_x+2*tol_xy,trc_y+2*tol_xy,trc_z]);
    translate([c_xs,c_yns,c_zs]) cube([trc_x+2*tol_xy,trc_y+2*tol_xy,trc_z]);
    
    // contact on the oposite side
    c_x = -trb_x/2-trc_x/2-trc_x_off-tol_xy/2;
    c_y = -trc_y/2-tol_xy;
    c_z = -tol_z;
    translate([c_x,c_y,c_z]) cube([trc_x+2*tol_xy,trc_y+2*tol_xy,trc_z]);
}

//trimmer();

// trimmer holder parameters
// trimmer holder wall thickness
th_t = 1.5;
// trimmer holder bottom thickness
th_b = 0.5;

module trimmer_holder()
{
    //%trimmer();
    difference()
    {
        // base block
        t_x = -trb_x/2-th_t;
        t_y = -trb_y/2-th_t;
        t_z = 0;
        translate([t_x,t_y,t_z]) cube([trb_x+2*th_t, trb_y+2*th_t, trb_z+th_b+tol_z]);
        
        // trimmer
        translate([0,0,tol_z+th_b+eps]) trimmer();
        
        // improved trimmer box
        translate([-trb_x/2-tol_xy/2,-trb_y/2-tol_xy/2,trc_z_off+tol_z/2])
            cube([trb_x+tol_xy,trb_y+tol_xy,trb_z+2*tol_z]);
        
        // double contact holes
        c_xs = +trb_x/2-trc_x_off-tol_xy/2;
        c_yps = trc_y_off-trc_y/2-tol_xy;
        c_yns = -trc_y_off-trc_y/2-tol_xy; 
        c_z = th_b;
        translate([c_xs,c_yps,c_z]) cube([trb_x,trc_y+2*tol_xy,trc_z+trb_z]);
        translate([c_xs,c_yns,c_z]) cube([trb_x,trc_y+2*tol_xy,trc_z+trb_z]);
        translate([c_xs,-trc_y/2-tol_xy/2,c_z]) cube([trb_x,trc_y+tol_xy,trc_z+trb_z]);
        
        // single contact hole
        c_x = -3*trb_x/2+trc_x_off+tol_xy/2;
        c_y = -trc_y/2-tol_xy;
        translate([c_x,c_y,c_z]) cube([trb_x,trc_y+2*tol_xy,trb_z+tol_z+eps]);
    }
}

trimmer_holder();