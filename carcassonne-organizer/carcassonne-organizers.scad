include<../_lib/cubepp.scad>;

// GENERIC PARAMETERS
eps = 0.01;
$fn = 90;
tol_t = 0.1;    // tight tolerance
tol = 0.25;     // default tolerance
tol_z = 0.5;    // tolerance for bridges
tol_f = 0.4;    // free movement tolerance

// Carcassone parameters
// '-> cs as prefix
// '-> box parameters
cs_bx = 423;
cs_by = 308;
cs_bz = 90;
// '-> card parameters
cs_ca = 45.5;   // card side
cs_ct = 2.22;   // card thickness
// '-> score board parameters
cs_sbx = 260;
cs_sby = 180;
cs_sbz = 2;

// derived parameters
// carcassonne section parameters
// '-> whole carcassone box must be devided into four sections
//     '-> box is too big for print area of common printers
cs_sx = cs_bx/2;
cs_sy = cs_by/2;
// testing sizes
//cs_sx = 75;
//cs_sy = 50;
cs_sz = cs_bz;  // z coordinate is not devided
cs_sd = 15;     // round diameter
cs_swt = 2;     // wall thickness
cs_sbt = 2;     // bottom (wall) thickness
cs_stt = 4;     // top thickness

// carcassonne section cover
// '-> cs_sc
// '-> cover for box section, obsolete
/*
cs_scx = cs_sx;
cs_scy = cs_sy;
cs_scz = cs_sbt+cs_ca+(cs_bz-cs_ca-cs_sbt)/2;
*/

// [!] each section is either used or empty frame is added to fill the area
// [!] filled area is devided into compartements:
//     '-> lower card compartement
//     '-> upper figure compartement

// card compartement parameteres
// '-> cs_sp
// '-> fill in whole box sections in XY plane
// '-> z coordinate is defined by card size and the bottom wall thisckness
cs_ccx = cs_sx;
cs_ccy = cs_sy;
cs_ccz = cs_sbt+cs_ca+tol_z+cs_stt;

// card storage separator parameters
// '-> cs_css
cs_cssx = 2*cs_ct;
cs_cssy = cs_ct;
cs_cssz = cs_ca;
cs_cssdist = cs_ct;

// card storage parameters
// '-> cs_ch
cs_csx = cs_ca+tol;
cs_csz = cs_ca+tol;

// computing distance between card storages and number of card storage
// '-> from x dimentison subrstract rounding diameters
// '-> devide this useful dimension by the x size of the storage with separator rails
cs_csx_cnt = floor((cs_sx-cs_sd)/(cs_csx+cs_cssdist+cs_cssx+cs_cssdist));
echo(cs_csx_cnt);
cs_csx_dist = (cs_sx-2*(cs_swt+tol)-cs_csx_cnt*cs_csx)/(cs_csx_cnt+1);

// computing number of card stored in the single card storage
// '-> aka card count
cs_csy_cnt = floor((cs_sy-4*cs_swt-2*tol)/cs_ct);
echo(cs_csy_cnt);
cs_csy_dist = cs_sy-4*cs_swt-2*tol-cs_csy_cnt*cs_ct;
cs_csy = cs_csy_cnt*cs_ct;

module card_compartement()
{
    difference()
    {
        // main body
        cube_r([cs_ccx,cs_ccy, cs_ccz], cs_sd);
        
        // center cut
        translate([cs_swt,cs_swt,cs_sbt+cs_ca/2])
            cube_r([cs_ccx-2*cs_swt, cs_ccy-2*cs_swt, cs_ccz], cs_sd-2*cs_swt)
                
        // hole for cards
        echo([cs_csx, cs_csy, cs_csz]);
        for(i=[0:cs_csx_cnt-1])
        {
            off_x = i*(cs_csx_dist+cs_csx)+cs_csx_dist+cs_swt+tol;
            translate([off_x,tol+2*cs_swt,cs_sbt])
                cube([cs_csx, cs_csy, cs_csz]);
            
            
            // holes for the card separator
            for(j=[0:round(cs_csy_cnt/2)-1])
            {
                off_y = 2*j*cs_ct;
                // left side
                translate([off_x-3*cs_ct, tol+2*cs_swt+off_y, cs_sbt])
                    cube([2*cs_ct,cs_ct,cs_ca]);
                // right side
                translate([off_x+cs_csx+1*cs_ct, tol+2*cs_swt+off_y, cs_sbt])
                    cube([2*cs_ct,cs_ct,cs_ca]);
            }
            
        }
        
        // cutting sides
        translate([cs_sd/2,-eps,cs_ccz+cs_ca/2])
            rotate([-90,0,0])
                cube_r([cs_sx-cs_sd,cs_ca+tol_z+cs_stt, cs_sy+2*eps], cs_ca);  
        
        // cutting finger holes
        translate([-eps,cs_sy/2,cs_ccz-cs_stt-cs_ca/4])
            rotate([0,90,0])
                cylinder(d=cs_ca/2-2*cs_sbt,h=cs_sx+2*eps);
        
        
    }
}

card_compartement();

// cart separator thickness
cs_cst = 2;

module card_separator()
{
    difference()
    {
        union()
        {            
            // main shape
            cube_r([cs_ca-2*tol,cs_ca-2*tol,2*cs_cst],4);
                
            // upper connector
            translate([-3*cs_ct,cs_ca/2+tol,0])
                cube_r([cs_ca-2*tol+6*cs_ct,cs_ca/2-3*tol,cs_cst], 4);
            
                // left wing
            translate([0-cs_ct-tol-2*cs_cst-(cs_ct-cs_cst),0,0])
                cube_r([2*cs_cst, cs_ca-2*tol, cs_cst],4);
            //%translate([0-cs_ct-tol-(cs_ct-cs_cst),0,0])
            //    cube([cs_ct+tol+(cs_ct-cs_cst), cs_ca-2*tol, cs_cst]);
            //right wing
            translate([cs_ca-2*tol+cs_ct+tol+(cs_ct-cs_cst),0,0])
                cube_r([2*cs_cst, cs_ca-2*tol, cs_cst],4);
            //%translate([cs_ca-2*tol,0,0])
            //    cube([cs_ct+tol+(cs_ct-cs_cst), cs_ca-2*tol, cs_cst]);
            
        }
        
        // cut for easier access
        translate([cs_ca/2-2*tol,cs_ca-2*tol,-eps])
            cylinder(d=0.75*cs_ca-2*tol,h=2*cs_cst+2*eps);
    }  
}

//card_separator();

// figures compartement parameters
// '-> cs_fc
cs_fcx = cs_sx;
cs_fcy = cs_sy;
cs_fcz = cs_sz - cs_ccz - tol_z - tol_z;
echo(cs_fcz);

module figure_compartement()
{
    difference()
    {
        union()
        {
            // main shape
            box_r([cs_fcx, cs_fcy, cs_fcz], cs_sd, cs_swt, cs_sbt);
            
            // interface
            translate([cs_swt+tol_f, cs_swt+tol_f, -cs_stt])
                cube_r([cs_fcx-2*cs_swt-2*tol_f,cs_fcy-2*cs_swt-2*tol_f,cs_stt],cs_sd-2*cs_swt-2*tol_f);
        }
    }
}


translate([0,0,cs_ccz+tol_z])
    figure_compartement();

