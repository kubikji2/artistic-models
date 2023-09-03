$fn = 180;
eps = 0.01;
tol_xy = 0.5;
tol_z = 0.5;

// 1.8 mm LED
LED_d = 2;
LED_D = 3.4;
LED_H = 2.05+1.75;
LED_h = 1.75;

/*
// 3 mm LED
LED_d = 3;
LED_D = 3.74;
LED_H = 4.59;
LED_h = 1;
*/

/*
// 5 mm LED
LED_d = 5;
LED_D = 5.9;
LED_H = 8.69;
LED_h = 1;
*/

module LED()
{    
    cylinder(h=LED_h,d=LED_D);
    translate([0,0,LED_h]) cylinder(d=LED_d, h=LED_H-LED_h-LED_d/2);
    translate([0,0,LED_H-LED_d/2]) sphere(d=LED_d);
    //cylinder(d=LED_d,h=LED_H);
    
}

module magnet_hole(d,h,b)
{
    difference()
    {
        cylinder(d=d+2*b,h=h);
        translate([0,0,-eps]) cylinder(d=d,h=h+2*eps);
    }
}

// switch parameters
// switch body parameters
sb_x = 8.7;
sb_y = 4;
sb_z = 3.5;
// switch lever parameters
// switch lever length
sl_l = 4.2;
// switch level dimensions
sl_d = 2;
// length of switch levew path
sl_x = 4;
// z dimension of the lever path
sl_z = 1.5;


module switch()
{
    translate([-sb_x/2,0,0]) {
        // switch body
        translate([-tol_xy,-tol_xy,0]) cube([sb_x+2*tol_xy, sb_y+2*tol_xy, sb_z+tol_z/2]);
        
        // lever colision box
        l_x_off = (sb_x-sl_x)/2 - tol_xy;
        l_y_off = -sl_l - tol_xy/2;
        l_z_off = (sb_z-sl_z)/2-tol_z/2;
        translate([l_x_off,l_y_off,l_z_off])
            cube([sl_x+2*tol_xy,sl_l+tol_xy,sl_z+tol_z]);
        //translate([l_x_off,2*l_y_off,l_z_off]) cube([sl_x,2*sl_l,sl_z]);
        
    }
    
}
   
//switch();

// switch holder x dimension
sh_x = 2;
// switch holder back x dimension
shb_x = 3.25;
// switch holder front x offset
shf_x = 1;
// swich holder back y dimension
shb_y = 2;

module switch_holder()
{   
    // left part
    translate([-sb_x/2-sh_x-tol_xy,0,0])
    {
        // front part
        translate([0,-shf_x,0]) cube([sh_x,sb_y+shf_x+tol_xy,sb_z]);
        // back part
        translate([0,sb_y+tol_xy,0]) cube([shb_x,shb_y,sb_z]);
    }
    // right part
    translate([sb_x/2 + tol_xy,0,0])
    {
        // front part
        translate([0,-shf_x,0]) cube([sh_x,sb_y+shf_x+tol_xy,sb_z]);
        //back part
        translate([-shb_x+sh_x,sb_y+tol_xy,0]) cube([shb_x,shb_y,sb_z]);
    }
}
//switch_holder();

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

//trimmer_holder();

// scale factor
sf = 0.8;

// heigh (thickness) of medailon
h=6;
// heigh of useable space for electronics
h_e = 4.25;
// diameter of useable space for electronics and bottom
d_e = sf*46;
// heigh of the buttom cover
h_b = 1;
// diameter of the buttom cover
d_b = d_e + 1.5;

// diameter for the LED holes
led_d = 2.1;
// distance from the center to the LED diods
led_l = sf*20.8;

// distance of the switch from the center of the medailon
swi_l = led_l+0.5;
// angle of the switch from the hook
swi_a = 6*36+2;


// magnets data
// magnet diameter (with additional spacing)
m_d = 3.5;
// magnet height (with additional spacing)
m_h = 1.1;
// magnet offset from center
m_off = 15;
// magnet distance tolerance
m_tol = 0.2;


module necklace_base()
{
   
    difference()
    {

        scale([sf,sf,1]) translate([0,1.3,0]) import("src/yennefer_necklace_base.stl");
        
        // dummy geometry
        //cylinder(h=5,d=42);
    
        for(i=[0:4])
        {
            //rotate([0,0,38+360/5*i]) translate([0,gem_d,0]) LED();
            
            // holes for LED
            rotate([0,0,37.5+360/5*i]) translate([0,led_l,0]) cylinder(h=h,d=led_d);
            // LED visualisation
            %translate([0,0,h_e-LED_h+tol_z]) rotate([0,0,37.5+360/5*i]) translate([0,led_l,0]) LED();
            
        }      
        
        
        // cut space for electronics
        translate([0,0,-eps]) cylinder(d=d_e, h=h_e+2*eps+3*tol_z/2);
        // cut space for the bottom cover
        translate([0,0,-eps]) cylinder(d=d_b, h=h_b+2*eps+tol_z);
        
        // hole of switch
        sw_x_off = 0;
        sw_y_off = swi_l; 
        sw_z_off = h_b+tol_z;
        rotate([0,0,swi_a])
            translate([sw_x_off, sw_y_off, sw_z_off])
            {
                rotate([0,0,180]) switch();
                %rotate([0,0,180]) switch();
            }
        
        // trimmer hole in case if something went wrong
        t_a = 85;
        t_x_off = 0;
        t_y_off = m_off+2*tol_xy;
        // align trimmer with xy plane
        t_z_rev = 0;
        //t_z_off = h_e-trc_z_off-tol_z/2+tol_z;
        t_z_off = t_z_rev+h_b+tol_z/2;
        rotate([0,0,t_a])
        {
            translate([0,t_y_off,t_z_off]) rotate([0,0,0])
                trimmer();            
        }
        
    }
    
    // magnet holes
    for(i=[0:3])
    {
        if (i != 2)
        {
            // offset for that magnet close to trimmer
            off = (i==0 || i==1) ? -15 : 0;
            // magnet hole
            rotate([0,0,2*36+i*360/5+off])
            {
                translate([0,m_off,h_b+m_h+tol_z+m_tol])
                    magnet_hole(d=m_d,h=m_h,b=1);
                z_off = h_e - m_h + tol_z + m_tol;
                h = h_e - h_b - 2*m_h+5*tol_z/4;
                translate([0,m_off,z_off])
                    cylinder(d=m_d+2,h=h);
            }
        } else {
            // hole of switch
            sw_x_off = 0;
            sw_y_off = swi_l; 
            sw_z_off = h_b+3*tol_z/2;
            rotate([0,0,swi_a])
                translate([sw_x_off, sw_y_off, sw_z_off])
                    rotate([0,0,180]) switch_holder();
        }
    }   
        
    // trimmer holder
    t_a = 85;
    t_x_off = 0;
    t_y_off = m_off+2*tol_xy;
    // align trimmer with xy plane
    t_z_rev = trb_z+th_b+tol_z;
    //t_z_off = h_e-trc_z_off-tol_z/2+tol_z;
    t_z_off = t_z_rev+h_b+3*tol_z/2;
    rotate([0,0,t_a])
    {
        translate([0,t_y_off,t_z_off]) rotate([0,180,0])
        {
            trimmer_holder();
        }
    }
    

    
}


// fake diamonds data
fd_z_off = 5.7;
// small fake dimanods
// distance from center to the nearest diamond
fds_l = sf*16.7;
// distance inner small diamonds to outer small diamond
fds_l_off = sf*4.25;
// "y" offset of outer small diamonds
fds_y_off = sf*3.75;
// diamond height
fds_h = 0.75;
// diamond height offset
fsd_h_off = 0.69;
// diameter
fds_d = 2.2;


module necklace()
{
    difference()
    {
        necklace_base();
        
        // HARDCODED fake diamnods
        fds_rots = [92, 91.25, 90.75, 90.5, 91.5];
        fdso_rots = [91.5, 91.25, 90.75, 90.5, 91];
        fds_l_offs = [0,0.1,0,-0.15,-0.25];
        z_off = fd_z_off - fsd_h_off;
        for (i=[0:4]){
            z_rot = fds_rots[i]+i*360/5;
            l_trans = fds_l_offs[i] + fds_l;
            #rotate([0,0,z_rot]) translate([l_trans,0,z_off])
            {
                // inner small diamonds
                cylinder(r1=0.01,r2=fds_d/2,h=fds_h);
            }
            
            z_orot = fdso_rots[i] + i*360/5;
            #rotate([0,0,z_orot]) translate([l_trans,0,z_off])
            {
                // outer small dimanods
                translate([fds_l_off,fds_y_off,0])
                    cylinder(r1=0.01,r2=fds_d/2,h=fds_h);
                translate([fds_l_off,-fds_y_off,0])
                    cylinder(r1=0.01,r2=fds_d/2,h=fds_h);
            }
        
        }
        
        // HARDCODED better opening mechanism
        // hole for opening
        a = -45;
        ho = d_b;
        yo_off = d_b*0.175;
        zo_off = h_b+tol_z;
        difference()
        {
        translate([0,yo_off,0])rotate([a,0,0]) translate([0,0,-d_b/2]) cylinder(h=ho,d=d_b); 
        
        a_ = 4*d_b;
        translate([-a_/2,-a_/2,h_b+tol_z]) cube([a_,a_, d_b]);
        
        translate([-a_/2,0,-a_/2]) cube([a_,a_,a_]);
            
        }
    }
}

//necklace();

//rotate([0,0,180]) %necklace();


// battery data
// battery diameter
bat_d = 20;
// batter heigh
bat_h = 3.3;
// battery holder thickness
bh_t = 1.5;
// battery offset in z axis from the bottom of the cover
bh_off = 0.4;


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
bb_off = bh_off-0.2;



module cover()
{   // STATUS: ready for testing
    
    // cut space for electronics
    //%translate([0,0,-eps]) cylinder(d=d_e, h=h_e+2*eps);
    // cut space for the bottom cover
    //%translate([0,0,-eps]) cylinder(d=d_b, h=h_b+2*eps+tol_z);
    
    // basic platform
    difference()
    {
        // basic shape
        union()
        {
            // main cover
            cylinder(h=h_b, d=d_b-tol_xy);
            // battery border
            //bat_h_h = bb_t+bb_d+bb_t;
            translate([0,0,bh_off]) cylinder(d=bat_d+2*bh_t,h=h_e-bh_off);    
        }
        
        // battery cut
        translate([0,0,bh_off-eps]) cylinder(d=bat_d,h=2*bat_h+2*eps);
        
        // hole for removing battery with screw driver
        rotate([0,0,215]) translate([bat_d/2-0.5,-2,bh_off-eps]) cube([1,4,2*bat_h]);
        
        // cut for anode
        //translate([-ba_w/2,-ba_l,bh_off]) cube([ba_w,ba_l,ba_t]);
        
        // cut for anode holder
        //ah_off = bat_h - bb_h;
        // anode cut y dimension
        ac_y = d_b/2-(d_b/2-led_l)+ba_l_ext;
        ac_y_off = -ac_y+ba_l_ext;
        translate([-ba_w/2,ac_y_off,bb_off])
            cube([ba_w+2*eps,ac_y,bat_h+2*eps]);
        
        // catode cut y dimension
        cc_z_off = h_e - 3*bb_t/2;
        //cc_z_off = bat_h+bh_off-2*bb_t;
        translate([-bc_w/2,-ac_y,cc_z_off])
            cube([bc_w+2*eps,ac_y,bat_h+2*eps]);
        
        // side cut of battery box, so we can inser battery
        translate([-bat_d/2,-eps,h_b+eps]) cube([bat_d,bat_d/2+bh_t+2*eps,h_e-h_b+eps]);
    }
    
    // adding batery holder stuff
    // main block has dimension of catode and two battery box borders
    ch_x = bc_w+2;
    ch_y = 2*bb_h;
    ch_z = h_e-bb_off-bb_t;
    ch_x_off = -ch_x/2;
    ch_y_off = -bat_d/2-ch_y+bb_h;
    ch_z_off = bb_off + bb_t;
    //translate([ch_x_off, ch_y_off, ch_z_off]) cube([ch_x,ch_y,bb_d]);
    // TODO move anode hole up
    // upper holder should be half size of hole
    
    difference()
    {
        translate([ch_x_off, ch_y_off, ch_z_off]) cube([ch_x,ch_y,ch_z]);
        // catode cut y dimension
        cc_y = d_b/2-(d_b/2-led_l);
        // catode cut z offset
        //cc_z_off = bat_h+bh_off-2*bb_t;
        cc_z_off = h_e - 3*bb_t/2;
        translate([-bc_w/2,-cc_y,cc_z_off])
            cube([bc_w+2*eps,cc_y,bb_t+2*eps]);
        // battery area cut
        translate([-bc_w/2-2*bb_t,ch_y_off+bb_h-eps,-bb_t/2])
            cube([bc_w+4*bb_t+2*eps,bb_h+2*eps,h_e]);
        
    }
    
    // adding battery box upper beam
    b_x = bat_d +  bh_t;
    b_y = 2*bb_h;
    b_z = bb_t/2;
    b_z_off = h_e-b_z;
    translate([-b_x/2,-b_y/2,b_z_off]) cube([b_x,b_y,b_z]);
    
    // magnet holes
    for(i=[0:3])
    {
        if (i != 2)
        {
            // offset for that magnet close to trimmer
            off = (i==0 || i==1) ? -15 : 0;
            rotate([0,0,36*7+i*360/5+off]) translate([0,m_off,h_b-eps])
                magnet_hole(d=m_d,h=m_h,b=1);
        }
    }    
    
    // battery remover
    
    
}


cover();

