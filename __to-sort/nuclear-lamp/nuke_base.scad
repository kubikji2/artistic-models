eps = 0.01;
z_max = 22;
$fn = 90;
tol = 0.5;

// M3 bolt parameters
// bold diameter
m3_bd = 3;
// bold height
m3_bh = 18;
// nut diameter
m3_nd = 6.5;
// nut height
m3_nh = 2.5;
// bolt head diameter
m3_bhd = 5.5;
// bolt head height
m3_bht = 2;

// bulb holder parameters
bh_d = 24;
bh_h = 15;

// bulb holder cable diameters
bhc_d = 6;
bhc_l = 10;
bhc_h = 18;
bhn_l = 17.5;
bhn_d = m3_bd; 

// chocolate hole
chc_x = 14;
chc_y = 18.5;
chn_x = 25;
chn_y = 12;
chs = 8;
ch_z = 6;

module bulb_holder()
{
    // bulb holder 
    translate([0,0,bhc_h-eps]) cylinder(d=bh_d, h=bh_h);
    
    // hole for the cable
    hull()
    {
        translate([-bhc_l/2,0,0]) cylinder(h=bhc_h,d=bhc_d);
        translate([bhc_l/2,0,0]) cylinder(h=bhc_h,d=bhc_d);
    }
    
    // holes for screws
    translate([0,-bhn_l/2,0]) cylinder(h=bhc_h, d= bhn_d);
    translate([0,bhn_l/2,0]) cylinder(h=bhc_h, d= bhn_d);
    
    // holes for nuts
    nh_l = bhc_h - m3_bh/2+m3_nh+m3_bht;
    translate([0,-bhn_l/2,0]) cylinder(h=nh_l, d=m3_nd, $fn=6);
    translate([0,bhn_l/2,0]) cylinder(h=nh_l, d=m3_nd, $fn=6);
    
}
//bulb_holder();

module chocolate_hole(t=5)
{
    dx = (chn_x-chc_x)/2;
    dy = (chc_y-chn_y)/2;
    translate([dx,chs,t]) cube([chc_x,chc_y,ch_z]);
    translate([0,dy+chs,t]) cube([chn_x,chn_y,ch_z]);
    
    // holes for cables
    hdx = (chn_x-chs)/2;
    translate([hdx,0,t]) cube([chs,chs,ch_z]);
    translate([hdx,chs+chc_y,t]) cube([chs,chs,ch_z]);
    
    // lower part
    difference()
    {
        cube([chn_x,chc_y+2*chs, t+tol+eps]);
        translate([-eps,chc_y+chs+eps,-eps])
            cube([chn_x+tol,chs,t/2+tol+eps]);
    }
    
    // bolt holes
    ch_y = chn_x;
    bh_dy = (((ch_y-chs)/2)-m3_bd)/2+m3_bd/2;
    _off = 1;
    //translate([bh_dy,bh_dy,-eps]) cylinder(d=m3_bhd,h=m3_bht+tol);
    translate([bh_dy+_off,bh_dy,-eps]) cylinder(d=m3_bd,h=m3_bh+tol);
    translate([ch_y-bh_dy-_off,bh_dy,-eps]) cylinder(d=m3_bd,h=m3_bh+tol);
    
    // nut holes
    n_o = m3_bh-m3_nh-tol;
    translate([bh_dy+_off,bh_dy,n_o+eps]) rotate([0,0,90])
        cylinder($fn=6, d=m3_nd, h= m3_nh+2*tol);
    translate([ch_y-bh_dy-_off,bh_dy,n_o+eps]) rotate([0,0,90])
        cylinder($fn=6, d=m3_nd, h= m3_nh+2*tol);
    
}

//chocolate_hole();

module chocolate_cover(t=4)
{
    difference()
    {
        translate([tol, tol, 0])
            cube([chn_x-2*tol,chc_y+2*chs-2*tol, t+tol+eps]);
        // back holding
        translate([-eps,chc_y+chs+eps-tol,-eps])
            cube([chn_x+tol,chs+tol,t/2+2*tol+eps]);
        // back holding cut
        translate([-eps, chc_y+1.25*chs+eps, -eps])
            cube([chn_x+tol, chs, tol+t+3*eps]);
        
        // bolt holes
        ch_y = chn_x;
        bh_dy = (((ch_y-chs)/2)-m3_bd)/2+m3_bd/2;
        _off = 1;
        //translate([bh_dy,bh_dy,-eps]) cylinder(d=m3_bhd,h=m3_bht+tol);
        translate([bh_dy+_off,bh_dy,-eps])
            cylinder(d=m3_bd,h=m3_bh+tol);
        translate([ch_y-bh_dy-_off,bh_dy,-eps])
            cylinder(d=m3_bd,h=m3_bh+tol);
        
        // bold head holes
        translate([bh_dy+_off,bh_dy,-eps])
            cylinder(d=m3_bhd,h=m3_bht+2*tol);
        translate([ch_y-bh_dy-_off,bh_dy,-eps])
            cylinder(d=m3_bhd,h=m3_bht+2*tol);
    }    
}

//chocolate_cover();

module lamp_post()
{        
    difference()
    {
        translate([0,0,0.2])import("nuke_base_origin.stl");
        rotate([0,0,90]) bulb_holder();
        chx = chn_x/2;
        chy = -bhc_l/2+2;
        translate([chx,chy+1.5,-eps]) rotate([0,0,180])
            chocolate_hole();
    }
}

lamp_post();