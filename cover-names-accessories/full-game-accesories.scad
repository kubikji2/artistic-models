// including parameters
include<cover-names-parameters.scad>
// including skew it module
include<../_lib/skew-it.scad>

// paramters for organizer
_oy = l_by;
_oz = l_bz-2*bt;
_ox = l_bd/2+nts+wt+max(ccs+sqrt(ccy*ccy-_oz*_oz),
                        ls+sqrt(la*la-_oz*_oz))
        +wt+l_bd/2;

_or = l_bd/2;

// TODO paramters for fill


// this modules contain holes for both box and organizer.
module holes(x,y,z,r, box=true)
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

    if(box)
    {
        translate([-eps2,-eps2,bt])
            sleeve_r(s=[x+eps,y+eps,z], d=2*r, wt=wt+tol_l);
    }
}

// this module is placed in the
module organizer()
{

    difference()
    {
        cube_r([_ox, _oy, _oz], d=2*_or);
        holes(_ox, _oy, _oz, _or,true);
    }
}

//organizer();

module box_cover()
{
    difference()
    {
        // main body
        cover_r(s=[_ox,_oy,_oz], d=2*_or, wt=wt, bt=bt);
        

        difference()
        {
            // silhouette
            _sf = 2;
            translate([2*wt,_oy/2,_oz-2.001])
                rotate([0,0,-90])
                    scale([2,2,1.01])
                        import("killer.stl");
        
            // add pattern
            _g = _ox/5;
            _pattern = [
                        "r", "e", "b", "r", "b",
                        "r", "r", "b", "e", "r",
                        "e", "b", "r", "b", "e",
                        "e", "r", "b", "k", "e",
                        "b", "b", "e", "b", "r"
            ];
            translate([2*wt,(_oy-_ox)/2,_oz-bt])
                pattern(_pattern,g=_g);
        }

    }
}

//box_cover();

// TODO use this as template for more advanced patern generator, maybe?
module pattern(pattern,g=25,dist=1)
{
    for(i=[-1:5])
    {
        for(j=[-1:5])
        {
            x_off = dist/2+i*g;
            y_off = dist/2+j*g;
            translate([x_off, y_off, 0])
            difference()
            {
                union()
                {
                    // tile
                    if (i>=0 && i<=4 && j >= 0 && j<=4)
                    {
                        cube_r([g-dist,g-dist,1.5],10);
                    }
                    // background
                    cube([g,g,1]);
                }
                
                // shape
                if (i>=0 && i<=4 && j >= 0 && j<=4)
                {
                    c=pattern[25-(j+5*i)];
                    translate([g/2-dist/2,g/2-dist/2,-eps2])
                    if(c=="r")
                    {   
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                cube_r([g/2.5,g/2.5,2+eps], 5, center=true);
                    }
                    else if(c=="b")
                    {
                        cylinder(d=g/2,h=2+eps);
                    }
                    else if(c=="k")
                    {   
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                cube_r([g/2,g/5,2+eps], 2, center=true);
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                cube_r([g/5,g/2,2+eps], 2, center=true);

                    }
                }
                    
            }

        }
    }

}

