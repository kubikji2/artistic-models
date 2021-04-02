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

// cube_t increase size in each dimension by provided tol
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
    echo("s, tols");
    _cube_txyz(s.x, s.y, s.z, tols.x, tols.y, tols.z, center);
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