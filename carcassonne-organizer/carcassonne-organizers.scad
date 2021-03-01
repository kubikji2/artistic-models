include<../_lib/cubepp.scad>;

// GENERIC PARAMETERS
eps = 0.01;
$fn = 90;
tol_t = 0.1;    // tight tolerance
tol = 0.25;     // default tolerance
tol_z = 0.5;    // tolerance for bridges

// Carcassone parameters
// '-> cs as prefix
// '-> box parameters
cs_bx = 423;
cs_by = 308;
cs_bz = 90;
// '-> single card parameters
cs_ca = 45.5; // card side
cs_ct = 2.22;  // card thickness
// '-> score board
cs_sbx = 260;
cs_sby = 180;
cs_sbz = 2;

// derived parameters
// carcassonne section parameters
cs_sx = cs_bx/2;
cs_sy = cs_by/2;
//cs_sx = 75;
//cs_sy = 50;
cs_sz = cs_bz;
cs_sd = 15;
cs_swt = 2;
cs_sbt = 2;

// carcassonne section cover
// '-> cs_sc
cs_scx = cs_sx;
cs_scy = cs_sy;
cs_scz = cs_sbt+cs_ca+(cs_bz-cs_ca-cs_sbt)/2;

// board card space
// '-> cs_sp
cs_spx = cs_sx;
cs_spy = cs_sy;
cs_spz = cs_ca/2+tol;

// board card holes parameters
// '-> cs_ch
cs_chx = cs_ca+tol; 
cs_chz = cs_ca+tol;

// computing
cs_chx_cnt = floor(cs_sx/(cs_chx+4*cs_ct));
cs_chx_dist = (cs_sx-2*(cs_swt+tol)-cs_chx_cnt*cs_chx)/(cs_chx_cnt+1);

cs_chy_cnt = floor((cs_sy-4*cs_swt-2*tol)/cs_ct);
cs_chy_dist = cs_sy-4*cs_swt-2*tol-cs_chy_cnt*cs_ct;
cs_chy = cs_chy_cnt*cs_ct;
echo(cs_chy_cnt);
// board card separator
// '-> cs_cd
cs_cd_d = 5;


module main_body()
{
    cube_r([cs_sx,cs_sy,cs_sz],cs_sd);
}

module card_separator()
{
    difference()
    {
        // main body
        main_body();
        
        // box_cover
        translate([0-eps,cs_sy+eps,cs_sz+eps])
            rotate([180,0,0])
                box_r([cs_scx+2*eps, cs_scy+2*eps, cs_scz+2*eps], cs_sd, cs_swt+tol, cs_sbt+tol_z);
        
        // cuting half of the sccae for the cards
        translate([0,0,cs_sz-cs_sbt-cs_spz])
            cube([cs_spx, cs_spy, cs_spz]);
        
        // hole for cards
        for(i=[0:cs_chx_cnt-1])
        {
            off_x = i*(cs_chx_dist+cs_chx)+cs_chx_dist+cs_swt+tol;
            translate([off_x,tol+2*cs_swt,cs_sz-cs_sbt-cs_chz])
                cube([cs_chx, cs_chy, cs_chz]);
            
            // holes for the card separator
            for(j=[0:round(cs_chy_cnt/2)-1])
            {
                off_y = 2*j*cs_ct;
                translate([off_x-3*cs_ct,tol+2*cs_swt+off_y,cs_sz-cs_sbt-cs_spz-cs_cd_d+eps])
                    cube([2*cs_ct,cs_ct,cs_cd_d]);
                translate([off_x+cs_chx+1*cs_ct,tol+2*cs_swt+off_y,cs_sz-cs_sbt-cs_spz-cs_cd_d+eps])
                    cube([2*cs_ct,cs_ct,cs_cd_d]);
            }
        }
        
        // lower hole to decrease material consumption
        translate([2*cs_swt,2*cs_swt,-eps])
            cube_r([cs_sx-4*cs_swt,cs_sy-4*cs_swt,cs_sz-cs_sbt-tol-cs_ca-cs_sbt], cs_sd-2*cs_swt);
        
        
    }
}

card_separator();

module card_separator_cover()
{
    // box_cover
    translate([0-eps,cs_sy+eps,cs_sz+eps])
        rotate([180,0,0])
            box_r([cs_scx+2*eps, cs_scy+2*eps, cs_scz+2*eps-tol], cs_sd, cs_swt, cs_sbt+tol_z);
}

//card_separator_cover();

module test_box()
{
    box([10,10,10],2);
}

//test_box();