// including parameters
include<cover-names-parameters.scad>
// including skew it module
include<../_lib/skew-it.scad>

// this modules contain holes for both box and organizer.
module holes(x,y,z,r)
{
    // front name tags compartment
    translate([r, r, bt])
        cube_txyz([nts, ntx, z], [tol, tol, tol]);

    // back name tags compartment
    translate([r,y-r-ntx,bt])
        cube_txyz([nts, ntx, z], [tol, tol, tol]);

    // adding skewrd hole for persons
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
}

// this module is placed in the
module organizer()
{
    // ???
    _ox = l_bx;
    _oy = l_by;
    _oz = l_bz-2*bt;
    _or = l_bd/2;

    difference()
    {
        cube_r([_ox, _oy, _oz], d=2*_or);
        holes(_ox, _oy, _oz, _or);
    }
}

organizer();