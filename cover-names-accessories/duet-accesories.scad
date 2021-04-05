// including parameters
include<cover-names-parameters.scad>
// including skew it module
include<../_lib/skew-it.scad>
// including cuts
include<../_lib/pattern-cuts.scad>

// organizer parameters
_oy = l_by;
_oz = l_bz-2*bt;
_or = l_bd/2;
_ox = l_bx;

// skew angle for persons
ccy_t = ccy+ccz+tol_l+1;
sca = _oz/(ccy_t);
cang = 90-asin(sca);
cy = ccs_d/sca;
//echo(str(ccs, " is now ", cx));

// skew angle for layout cards
ly_dt = ly_d+2;
sla = _oz/(ly_dt);
lang = 90-asin(sla);
ly = ls_d/sla;
//echo(str(ls, " is now ", lx));


// this modules contain holes for both box and organizer.
module holes(x,y,z,r, box=true)
{
    // back name tags compartments
    nt_off = (x-2*r-3*nts_d-lx_d-wt)/2;
    for(i=[0:2])
    {
        _off = i*(nts_d+nt_off);
        translate([r+_off,y-r-ntx,bt])
            cube_txyz([nts_d, ntx, z], [tol, tol, tol]);
    }

    // adding finger hole name tags
    translate([0,y-(r+ntx/2),z])
        rotate([0,90,0])
            cylinder_thd(h=(x-2*r-lx_d),d=ntx/2,tol_h=2*eps,tol_d=0);
    
    // adding finger sphere for name tags
    translate([x-r-lx_d-wt,y-(r+ntx/2),z])
        scale([0.5,1,1])
            sphere(d=ntx/2);

    // adding skewed hole for layout
    translate([_ox-r-lx_d,_or,bt])
    {
        hull()
        {
            skew(yz=lang)
                cube([lx_d,ly,z]);
            cube([lx_d,ly,z]);
        }
    }

    // adding finger hole for layout cards
    _ly = _or + ly + sqrt(ly_dt*ly_dt-_oz*_oz);
    translate([_ox-_or-lx_d/2,_ly,z])
        rotate([-lang,0,0])
            scale([1,0.5,1])
                sphere(d=ntx/2);
    
    // adding front finger hole for the layout cards
    translate([x-r-lx_d/2,0,z])
        rotate([-90,0,0])
            cylinder_thd(h=r,d=ntx/2,tol_h=2*eps,tol_d=0);
    
    // adding skewed hole for persons 
    translate([r,r,bt])
    {
        hull()
        {
            skew(yz=cang)
                cube([ccx,cy,z]);
            cube([ccx,cy,z]);
        }
    }

    // finger holes for person cards
    _ccy = ccy+ccz+tol_l+1;
    _cy = _or + cy + sqrt(_ccy*_ccy-_oz*_oz);
    translate([r+ccx/2,_cy,z])
        rotate([-cang,0,0])
            scale([1,0.5,1])
                sphere(d=ntx/2);

    // adding front finger hole for the person cards
    translate([r+ccx/2,0,z])
        rotate([-90,0,0])
            cylinder_thd(h=r,d=ntx/2,tol_h=2*eps,tol_d=0);

    // adding hole for the small persons
    _a = x-2*r-lx_d-ccx-2*wt;
    translate([r+ccx+wt,r,z/2])
        cube([_a,_a,z]);

    // killer silhouette
    _sf = 1;
    translate([x-r-lx_d/2,wt+_ly,_oz-2.001])
        scale([_sf,_sf,1.01])
            import("killer.stl");


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
        cover_r(s=[_ox,_oy,_oz+1], d=2*_or, wt=wt, bt=bt);
        
        translate([0,0,1])
        difference()
        {
            // killer silhouette
            _sf = 3;
            translate([_ox/2,2*wt,_oz-2.001])
                //rotate([0,0,-90])
                    scale([_sf,_sf,1.01])
                        import("killer.stl");
        
            // add pattern
            _gx = _ox/5;
            _gy = _oy/5;
            _pattern = [
                        "-", "-", "s", "-", "-",
                        "-", "e", "k", "s", "-",
                        "-", "s", "s", "e", "-",
                        "-", "e", "s", "k", "-",
                        "e", "k", "e", "s", "e"
            ];
            translate([0, 2*wt,_oz-bt])
                pattern(_pattern,gx=_gx,gy=_gy);
        }

    }
}

box_cover();

// TODO use this as template for more advanced patern generator, maybe?
module pattern(pattern,gx=25,gy=20,dist=1)
{
    g = min(gx,gy);
    G = max(gx,gy);
    for(i=[-1:5])
    {
        for(j=[-1:5])
        {
            x_off = dist/2+i*gx;
            y_off = dist/2+j*gy;
            translate([x_off, y_off, 0])
            difference()
            {
                union()
                {
                    // tile
                    if (i>=0 && i<=4 && j >= 0 && j<=4)
                    {
                        cube_r([gx-dist,gy-dist,1.5],10);
                    }
                    // background
                    cube([gx,gy,1]);
                }
                
                // shape
                if (i>=0 && i<=4 && j >= 0 && j<=4)
                {
                    c=pattern[i+5*(4-j)];
                    translate([gx/2-dist/2,gy/2-dist/2,-eps2])
                    if(c=="s")
                    {   
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                scale([1/5,1/2,1])
                                    rotate([0,0,45])
                                        cube_r([g,g,2+eps], 2, center=true);

                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                scale([1/2,1/5,1])
                                    rotate([0,0,45])
                                        cube_r([g,g,2+eps], 2, center=true);
                    }
                    else if(c=="k")
                    {   
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                cube_r([G/2,g/5,2+eps], 2, center=true);
                        translate([0,0,1+eps/2])
                            rotate([0,0,45])
                                cube_r([g/5,G/2,2+eps], 2, center=true);

                    }
                }
                    
            }

        }
    }

}
