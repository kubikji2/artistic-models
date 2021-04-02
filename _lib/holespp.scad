// first draft of holes++ library simplyfing handling tolerances
// roadmap:
//  - cube - done, testing
//  - cylinder 
//  - cube++ ? 

// basic cube with tolerances xyz
module _cube_txyz(x, y, z, tolx, toly, tolz, center=false)
{
    _x = x + 2*tolx;
    _y = y + 2*toly;
    _z = z + 2*tolz;

    // centering is same for center=true,
    // for center true, tolerances are added intuitively
    t = center ? [-_x/2, -_y/2, -_z/2] : [-tolx/2, -toly/2, -tolz/2];
    translate(t)
        cube([_x,_y,_z]);

}

// cube_t increase size in each dimension by provided tol
module cube_t(x, y, z, tol, center=false)
{
    _cube_txyz(x, y, z, tol, tol, tol, center);
}

module cube_t(s, tol, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_txyz(s.x, s.y, s.z, tol, tol, tol, center);

}

// cube_thv increase x and y by tol_h (tolerance horizontal) and z by tol_v (tolerance vertical)
module cube_thv(x, y, z, tol_h, tol_v, center=false)
{
    _cube_txyz(x, y, z, tol_h, tol_h, tol_v, center);
}

module cube_thv(s, tol_h, tol_v, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    _cube_txyz(s.x, s.y, s.z, tol_h, tol_h, tol_v, center);
}


// cube_txyz increase x by tol_x, y by tol_y and z by tol_z
module cube_txyz(x, y, z, tol_x, tol_y, tol_z, center=false)
{
    echo("x, y, z, tolx, toly, tolz");
    _cube_txyz(x, y, z, tol_x, tol_y, tol_z, center);
}

module cube_txyz(s, tol_x, tol_y, tol_z, center=false)
{    
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    echo("s, tolx, toly, tolz");
    _cube_txyz(s.x, s.y, s.z, tol_x, tol_y, tol_z, center);
}

module cube_txyz(s, tols, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required!"));
    assert(len(tols)==3, str("given size vector has size, ", len(tols), " but size 3 is required!"));
    echo("s, tols");
    _cube_txyz(s.x, s.y, s.z, tols.x, tols.y, tols.z, center);
}


