// first draft of holes++ library simplyfing handling tolerances
// roadmap:
//  - cube - done, testing
//  - cylinder 
//  - cube++  

include<cubepp.scad>;

// basic cube with tolerances xyz
module _cube_txyz(x, y, z, tolx, toly, tolz, center=false)
{
    _x = x + tolx;
    _y = y + toly;
    _z = z + tolz;

    // centering is same for center=true,
    // for center true, tolerances are added intuitively
    t = center ? [-_x/2, -_y/2, -_z/2] : [-tolx/2, -toly/2, -tolz/2];
    translate(t)
        cube([_x,_y,_z]);

}

// cube_t increase size uniformly in each dimension by provided tol
module cube_t(s, tol, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_txyz(s.x, s.y, s.z, tol, tol, tol, center);

}

// cube_thv increase x and y by tol_h (tolerance horizontal) and z by tol_v (tolerance vertical)
module cube_thv(s, tol_h, tol_v, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_txyz(s.x, s.y, s.z, tol_h, tol_h, tol_v, center);
}


// cube_txyz increase x by tol_x, y by tol_y and z by tol_z
module cube_txyz(s, tols, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    assert(len(tols)==3, str("given size vector has size, ", len(tols), " but size 3 is required!"));
    _cube_txyz(s.x, s.y, s.z, tols.x, tols.y, tols.z, center);
}

// cylinder
module _cylinder_thd(h, d, th, td, center=false)
{
    _h = h + th;
    _d = d + td;

    t = center ? [0,0,0] : [0,0,-th/2];
    translate(t)
        cylinder(d=_d, h=_h, center=center);
}

module cylinder_thd(h, d, tol_h, tol_d, center=false)
{
    _cylinder_thd(h=h, d=d, th=tol_h, td=tol_d, center=center);
}

module cylinder_thr(h, r, tol_h, tol_r, center=false)
{
    _cylinder_thd(h=h, d=2*r, th=tol_h, td=2*tol_r, center);
}

// baseline for the rounded cubes
module _cube_r_txyz(x, y, z, d, tolx, toly, tolz, center=false)
{
    _x = x + tolx;
    _y = y + toly;
    _z = z + tolz;

    // centering is same for center=true,
    // for center true, tolerances are added intuitively
    t = center ? [-_x/2, -_y/2, -_z/2] : [-tolx/2, -toly/2, -tolz/2];
    translate(t)
        // TODO solve how to resize diameter?
        cube_r([_x,_y,_z], d);
}

// cube_r_t increase size uniformly in each dimension by provided tol
module cube_r_t(s, tol, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_r_txyz(s.x, s.y, s.z, tol, tol, tol, center);

}

// cube_thv increase x and y by tol_h (tolerance horizontal) and z by tol_v (tolerance vertical)
module cube_r_thv(s, tol_h, tol_v, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_r_txyz(s.x, s.y, s.z, tol_h, tol_h, tol_v, center);
}


// cube_txyz increase x by tol_x, y by tol_y and z by tol_z
module cube_r_txyz(s, tols, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    assert(len(tols)==3, str("given size vector has size, ", len(tols), " but size 3 is required!"));
    echo("s, tols");
    _cube_r_txyz(s.x, s.y, s.z, tols.x, tols.y, tols.z, center);
}

/*
module _box_r_txyz(x, y, z, d, wt, bt, tolx, toly, tolz, center=false)
{
    _x = x + tol_x;
    _y = y + tol_y;
    _z = z + tol_z;

    t = center ? [-_x/2, -_y/2, _z/2] : [-tol_x/2, -tol_y/2, -_tolz/2];
    translate(t)
        box_r(s=[_x, _y, _z], d=d, wt=wt, bt=bt, center=center);
    
}

module box_r_txyz ()
*/