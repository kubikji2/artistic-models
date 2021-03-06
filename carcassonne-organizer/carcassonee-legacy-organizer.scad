include<../_lib/cubepp.scad>;
include<../_lib/pattern-cuts.scad>;

// GENERIC PARAMETERS
eps = 0.01;
$fn = 90;
tol_t = 0.1;    // tight tolerance
tol = 0.25;     // default tolerance
tol_z = 0.5;    // tolerance for bridges
tol_f = 0.4;    // free movement tolerance

// Carcassone parameters
// '-> cs as prefix
// '-> legacy box parameters
cs_bx = 265;
cs_by = 180;
cs_bz = 55;

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
cs_sx = cs_bx;
// in case of legasy version there is no division in y axis
cs_sy = cs_by;
// testing sizes
//cs_sx = 75;
//cs_sy = 50;
cs_sz = cs_bz;  // z coordinate is not devided
cs_sd = 5;     // round diameter
cs_swt = 2;     // wall thickness
cs_sbt = 2;     // bottom (wall) thickness
cs_stt = 4;     // top thickness

// [!] each section is either used or empty frame is added to fill the area
// [!] filled area is devided into compartements:
//     '-> lower card compartement
//     '-> upper figure compartement

// card compartement parameteres
// '-> cs_sp
// '-> fill in whole box sections in XY plane
// '-> z coordinate is defined by card size and the bottom wall thisckness
cs_ccy = cs_sy;
cs_ccz = cs_sbt+cs_ca;

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
cs_csx_cnt = 3;
cs_csx_dist = cs_sd/2;

// card compartement x coordinate computed based on the size of its content
cs_ccx = cs_sd+cs_csx_cnt*cs_csx+cs_swt+2*4*(cs_ct);

// computing number of card stored in the single card storage
// '-> aka card count
cs_csy_cnt = floor((cs_ccy-4*cs_swt-2*tol)/cs_ct);
//echo(cs_csy_cnt);
cs_csy_dist = cs_ccy-4*cs_swt-2*tol-cs_csy_cnt*cs_ct;
cs_csy = cs_csy_cnt*cs_ct;
cs_csy_off = 2*cs_swt+tol;
//echo(cs_ccy);
//echo(cs_csy);

module card_compartement()
{
    difference()
    {
        // main body
        cube_r([cs_ccx,cs_ccy, cs_ccz], cs_sd);
        
        // center cut
        translate([cs_swt,cs_swt,cs_sbt+cs_ca/2])
            cube_r([cs_ccx-2*cs_swt, cs_ccy-2*cs_swt, cs_ccz], cs_sd-2*cs_swt);
                
        // hole for cards
        //echo([cs_csx, cs_csy, cs_csz]);
        for(i=[0:cs_csx_cnt-1])
        {
            is_last = (i == cs_csx_cnt-1);
            off_x = cs_sd/2 + i*(cs_swt+cs_csx) + (is_last ? 4*cs_ct-cs_swt : 0);
            translate([off_x, 2*cs_swt,cs_sbt])
                cube([cs_csx, cs_csy+2*tol, cs_csz]);
            
            if(is_last)
            {
                // holes for the card separator
                for(j=[0:round(cs_csy_cnt/2)-1])
                {
                    off_y = cs_csy_off + 2*j*cs_ct;
                    // left side
                    translate([off_x-3*cs_ct-tol_f/2, off_y-tol_f/2, cs_sbt])
                        cube([2*cs_ct+tol_f,cs_ct+tol_f,cs_ca]);
                    // right side
                    translate([off_x+cs_csx+1*cs_ct-tol_f/2, off_y-tol_f/2, cs_sbt])
                        cube([2*cs_ct+tol_f,cs_ct+tol_f,cs_ca]);
                }
            }
            
            
        }
        
        
        // cutting sides
        translate([cs_sd/2,-eps,cs_ccz+cs_ca/2])
            rotate([-90,0,0])
                cube_r([cs_ccx-cs_sd,cs_ca, cs_sy+2*eps], cs_ca);  
        
        // cutting finger holes
        translate([-eps,cs_sy/3,cs_ccz-cs_ca/4])
            rotate([0,90,0])
                cylinder(d=cs_ca/2-4*cs_sbt,h=cs_ccy+2*eps);

        translate([-eps,2*cs_sy/3,cs_ccz-cs_ca/4])
            rotate([0,90,0])
                cylinder(d=cs_ca/2-4*cs_sbt,h=cs_ccy+2*eps);
        
        
    }
}

//card_compartement();

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
cs_fcx = cs_sx-cs_ccx;
echo(cs_fcx);
cs_fcy = cs_sy;
cs_fcz = cs_ccz;
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
        
        // side cut
        //translate([cs_sd/2,-eps,cs_fcz+cs_ca/2])
        translate([cs_sd/2,-eps,cs_fcz+cs_fcz/2])
            rotate([-90,0,0])
                cube_r([cs_sx-cs_sd, cs_fcz-2*cs_sbt, cs_sy+2*eps], cs_fcz-2*cs_sbt);  
        
        
        // cutting finger holes
        translate([-eps,cs_sy/2, cs_fcz/2+cs_sbt])
            rotate([0,90,0])
                cylinder(d=cs_ca/2-2*cs_sbt,h=cs_sx+2*eps);
        
    }
}

/*
translate([0,0,cs_ccz+tol_z])
    figure_compartement();
*/

// single color figures storage parameters
// '-> cs_fs
cs_fsx = (cs_fcx - 2*tol_f)/2;
cs_fsy = (cs_fcy - 3*tol_f)/3;
cs_fsz = 2*cs_fcz/3 - tol_z;
cs_fsd = cs_sd;

module figure_storage()
{
    // main shape
    box_r([cs_fsx, cs_fsy, cs_fsz], cs_fsd, cs_swt);
}

figure_storage();


// upper compartement parameteres
cs_lsx = 2*cs_fsx;
cs_lsy = 2*cs_fsy;
cs_lsz = cs_fcz/3;
cs_lsd = cs_sd;

module large_storage()
{
    box_r([cs_lsx, cs_lsy, cs_lsz], cs_lsd, cs_swt);
}

//large_storage();

module double_storage()
{
    box_r([2*cs_fsx, cs_fsy, cs_lsz], cs_fsd, cs_swt);
}

//double_storage();


/*
translate([0,0,cs_ccz+2*tol_z+cs_sbt])
for (i=[0:2])
{
    x_off = i*(cs_fsx+tol_f)+tol_f+cs_swt;
    for(j=[0:2])
    {
        y_off = j*(cs_fsy+tol_f)+tol_f+cs_swt;
        translate([x_off, y_off,0])
            figure_storage();
    }
}
*/


module section_filler()
{
    sf_h = 80;
    difference()
    {   
        // main shape
        box_r([cs_sx, cs_sy, sf_h],cs_sd, cs_swt, 3);
        
        _size = cs_sy-10*cs_swt;
        //_size = cs_sx;
        _sf = _size/100;
        _h = 1.5;
        _wt = 2;
        
        // cut ornament
        translate([cs_sx/2,cs_sy/2,0])
        {
            // carcassonne logo
            translate([0,0,+_h-eps])
                rotate([0,180,0])
                    scale([_sf,_sf,_h/10])
                        import("card-back-raw.stl");
            
            // border
            translate([0,0,-_h/2-eps])
                box_r([_size+2*_wt,_size+2*_wt, _h], cs_sd, _wt+0.5, eps, center=true);
        }
        
        // front hexagonal pattern
        _off = 4;
        sx = [cs_sx-cs_sd, sf_h-2*_off, cs_swt+2*eps];
        translate([cs_sd/2,-eps,_off])
            hexagonal_pattern(sx, cs_sd, _off, vertical=true);
        
        // back hexagonal pattern
        translate([cs_sd/2,cs_sy-eps-cs_swt,_off])
            hexagonal_pattern(sx, cs_sd, _off, vertical=true);
        
        // left
        sy = [cs_sy-cs_sd, sf_h-2*_off, cs_swt+2*eps];
        rotate([0,0,90])
            translate([cs_sd/2,-cs_swt-eps,_off])
                hexagonal_pattern(sy, cs_sd, _off, vertical=true);
        
        // right
        rotate([0,0,90])
            translate([cs_sd/2,-cs_sx-eps,_off])
                hexagonal_pattern(sy, cs_sd, _off, vertical=true);
    }
}

// section_filler();