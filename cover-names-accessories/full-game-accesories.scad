// including parameters
include<cover-names-parameters.scad>
// including skew it module
include<../_lib/skew-it.scad>

// this modules contain holes for both box and organizer.
module holes(x,y,z,r,, box=true)
{
    // front name tags compartment
    translate([r, r, bt])
        cube_txyz([nts, ntx, z], [tol, tol, tol]);

    // back name tags compartment
    translate([r,y-r-ntx,bt])
        cube_txyz([nts, ntx, z], [tol, tol, tol]);

    // adding skewed hole for persons
    ap = 90-asin(z/(ccy+2));
    translate([r+nts+wt,r,bt])
    {
        hull()
        {
            skew(xz=ap)
                cube([ccs,ccx,z]);
            cube([ccs,ccx,z]);
        }
    }

    // adding hole for layut
    al = 90-asin(z/(la+1));
    translate([r+nts+wt,y-r-la,bt])
    {
        hull()
        {
            skew(xz=al)
                cube([ls,la,z]);
            cube([ls,la,z]);
        }
    }

    // add hole for the sand-clock
    translate([x-hgd/2-2*wt,y/2,bt+hgd/2])
    {
        // hour glass cut
        rotate([90,-30,0])
        {
            cylinder(h=hgh, d=hgd+tol_l, center=true);
            translate([hgd,0,0])
                cube([2*hgd, hgd+tol_l,hgh], center=true);
            
        };

        // finger hole
        translate([hgd,0,0])
            cube([2*hgd,hgd,hgd], center=true);
        
    }

    // finger holes for the card
    // '-> front hole
    translate([0,r+ntx/2,z])
        rotate([0,90,0])
            cylinder_thd(h=r+nts+wt,d=ntx/2,tol_h=2*eps,tol_d=0);
    // '-> back hole
    translate([0,y-(r+ntx/2),z])
        rotate([0,90,0])
            cylinder_thd(h=r+nts+wt,d=ntx/2,tol_h=2*eps,tol_d=0);

}

// this module is placed in the
module organizer()
{
    _oy = l_by;
    _oz = l_bz-2*bt;
    _ox = l_bd/2+nts+wt+max(ccs+sqrt(ccy*ccy-_oz*_oz),
                            ls+sqrt(la*la-_oz*_oz))
            +wt+l_bd/2;

    _or = l_bd/2;

    difference()
    {
        cube_r([_ox, _oy, _oz], d=2*_or);
        holes(_ox, _oy, _oz, _or);
    }
}

organizer();