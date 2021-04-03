/*********************************************************************************************
* CUBE++ (cubepp)                                                                            *
* '-> by Jiri Kubik (jiri.kub@gmail.com) in 2020-2021                                        *
* '-> simple but essential library which adds two new cube designs.                          *
*     '-> _round_cube creates cube with corners rounded in XY-plane                          *
*     '-> _shpere_cube creates cube with corners rounded in all 3 dimensions                 *
*     '-> _chopped_cube (planned for the future) coppes corners of the cube                  *
* '-> recommended module to be used is cube_{r,s,c} with same interface as the original      *
*     cube, see documentation bellow                                                         *
*********************************************************************************************/

// CURRENT VERSION: 0.0.1
// Change log
// '-> 0.0.1 - modules for cube_r and cube_s finalized
// '-> 0.0.2 - box and box_r added
// planned
// '-> cube_c for cube with corners cut of

$fn = 45;
NAN = acos(2);

// creates cube of given dimensions x,y,z with the corner rounded in the XY plane by diameter d
// '-> x - dimension in x axis
// '-> y - dimension in y axis
// '-> z - dimension in z axis
// '-> d - diameter of corners rounded in XY-plane
// '-> center same as in cube module
module _round_cube(x,y,z,d,center=false)
{
    assert(x >= d && y >= d, str("given diameter(d=",d,") exceed one of sides(x=",x,",y=",y,")! Use round_cube_lazy to automatically choose diameter."));
    
    A = x-d;
    B = y-d;
    C = z;
    
    // solve center transform
    t = center ? [d/2-x/2,d/2-y/2,-z/2] : [d/2,d/2,0];
    
    // hull-less implementation to speed up process
    translate(t)
    {
        // corners
        cylinder(d=d, h=C);
        translate([A,0,0]) cylinder(d=d, h=C);
        translate([A,B,0]) cylinder(d=d, h=C);
        translate([0,B,0]) cylinder(d=d, h=C);
        
        // fill
        translate([-d/2,0,0]) cube([x,y-d,z]);
        translate([0,-d/2,0]) cube([x-d,y,z]);
    }
    
    // hull-based implementation
    /*
    translate([d/2,d/2,0])
    hull()
    {
        cylinder(d=d, h=C);
        translate([A,0,0]) cylinder(d=d, h=C);
        translate([A,B,0]) cylinder(d=d, h=C);
        translate([0,B,0]) cylinder(d=d, h=C);
    } 
    */
}

// wrapper for _round_cube module
module round_cube (x,y,z,d, center=false)
{
    _round_cube(x,y,z,d, center);
}

// wrapper for _round_cube module
// '-> dimensions t=[x,y,z]
// '-> d - diameter of corners rounded in XY-plane
module round_cube (t,d, center=false)
{   
    assert(len(t)==3, str("given size vector has size, ", len(t), " but size 3 is required"));
    _round_cube(t.x,t.y,t.z,d, center);
}

// wrapper for _round_cube module
// '-> same interface and name as cube module
module cube_r(t,d, center=false)
{
    round_cube(t,d, center);
}

// creates cube of given dimenions x,y,z with corners rounded in XYZ by diameter d
// '-> x - dimension in x axis
// '-> y - dimension in y axis
// '-> z - dimension in z axis
// '-> d - rounded corners diameter
// '-> center same as in cube module
module _sphere_cube (x,y,z,d, center=false)
{
    assert(x >= d && y >= d, str("given diameter(d=",d,") exceed one of sides(x=",x,",y=",y,")! Use round_cube_lazy to automatically choose diameter."));
    
    A = x-d;
    B = y-d;
    C = z-d;
    R = d/2;
    
    // solve center transform
    t = center ? [R-x/2,R-y/2,R-z/2] : [R,R,R];
       
    // minkowski implementation
    translate(t)
    minkowski()
    {
        cube([A,B,C]);
        sphere(r=R);
    }
    
}

// _sphere_cube wrapper with same arguments as original function
module sphere_cube(x,y,z,d, center=false)
{
    _sphere_cube(x,y,z,d, center);
}

// wrapper for _sphere_cube module
// '-> dimensions t=[x,y,z]
// '-> d - rounded corners diameter
module sphere_cube(t,d, center=false)
{
    assert(len(t)==3, str("given size vector has size, ", len(t), " but size 3 is required"));
    _sphere_cube(t.x,t.y,t.z,d, center);
}

// wrapper for _sphere_cube module
// '-> same interface and name as cube module
module cube_s (t,d, center=false)
{
    sphere_cube(t,d, center);
}

/********
* BOXES *
********/

// basic box
// '-> x,y,z - outer dimensions
// '-> t - wall thickness
module _box(x,y,z,wt,bt, center=false)
{   
    echo(str(x,y,z,wt,bt,center));
    assert(wt>0, str("given wall thickness wt=",wt," must be greater than zero"));
    if (wt!=bt)
    {
        assert(bt>0, str("given botton thickness bt=",bt," must be greater than zero"));
    }
    // solve center transform
    tf = center ? [-x/2,-y/2,-z/2] : [0,0,0];
    
    translate(tf)
    difference()
    {
        
        // outer shell
        cube([x,y,z]);
        
        // hole
        translate([wt,wt,bt])
            cube([x-2*wt,y-2*wt,z]);
    }
}

// _box wrapper
module box_xyz(x,y,z,wt,bt=NAN, center=false)
{
    _bt = is_num(bt) ? bt : wt;
    _box(x,y,z,wt,_bt, center);
}


// _box wrapper
module box(s,wt,bt=NAN, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _bt = is_num(bt) ? bt : wt;
    _box(s.x,s.y,s.z,wt,_bt, center);
}

// box with corners round in XY plane
// x,y,z - outer dimensions
// d - rounding diameter
// bt - bottom thickness
// wt - wall thickness
module _box_r(x,y,z,d,wt,bt, center=false)
{
    assert(wt>0, str("given wall thickness wt=",wt," must be greater than zero"));
    if (wt!=bt)
    {
        assert(bt>0, str("given botton thickness bt=",bt," must be greater than zero"));
    }
    
    assert(d>=2*wt, str("given diameter d=",d," must be at least twice of wall thickness wt=", wt));  
   
    // solve center transform
    tf = center ? [-x/2,-y/2,z/2] : [0,0,0];
    
    translate(tf)
    difference()
    {
        
        // outer shell
        cube_r([x,y,z],d);
        
        // hole
        translate([wt,wt,bt])
            cube_r([x-2*wt,y-2*wt,z],d-2*wt);
    }
}

// _box_r wrapper
module box_r_xyz(x,y,z,d,wt,bt=NAN, center=false)
{   
    _bt = is_num(bt) ? bt : wt;
    _box_r(x,y,z,d,wt,_bt, center);
}


// _box_r wrapper
module box_r(s,d,wt,bt=NAN, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _bt = is_num(bt) ? bt : wt;
    _box_r(s.x,s.y,s.z,d,wt,_bt, center);
}

module _cover_r(x,y,z,d,wt,bt, center=false)
{
    assert(wt>0, str("given wall thickness wt=",wt," must be greater than zero"));
    if (wt!=bt)
    {
        assert(bt>0, str("given botton thickness bt=",bt," must be greater than zero"));
    }
    
    assert(d>=2*wt, str("given diameter d=",d," must be at least twice of wall thickness wt=", wt));  
   
    // solve center transform
    tf = center ? [-x/2,-y/2,z/2] : [0,0,0];
    
    translate(tf)
    difference()
    {
        
        // outer shell
        cube_r([x,y,z],d);
        
        // hole
        translate([wt,wt,-bt])
            cube_r([x-2*wt,y-2*wt,z],d-2*wt);
    }
}

module cover_r(s,d,wt,bt=NAN, center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _bt = is_num(bt) ? bt : wt;
    _cover_r(s.x, s.y, s.z, d, wt, _bt, center);
}

// sleeve
module _sleeve(x,y,z,wt,center=false)
{
    assert(wt>0, str("given wall thickness wt=",wt," must be greater than zero"));
   
    // solve center transform
    tf = center ? [-x/2,-y/2,z/2] : [0,0,0];
    
    translate(tf)
    difference()
    {
        
        // outer shell
        cube([x,y,z],d);
        
        // hole
        translate([wt,wt,-0.005])
            cube([x-2*wt,y-2*wt,z+2*0.01],d-2*wt);
    }
}

module sleeve(s,wt,center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _sleeve(s.x, s.y, s.z, wt, center);
}

// sleeve with rounded corners
module _sleeve_r(x,y,z,d,wt,center=false)
{
    assert(wt>0, str("given wall thickness wt=",wt," must be greater than zero"));
    assert(d>=2*wt, str("given diameter d=",d," must be at least twice of wall thickness wt=", wt));  
   
    // solve center transform
    tf = center ? [-x/2,-y/2,z/2] : [0,0,0];
    
    translate(tf)
    difference()
    {
        
        // outer shell
        cube_r([x,y,z],d);
        
        // hole
        translate([wt,wt,-0.005])
            cube_r([x-2*wt,y-2*wt,z+2*0.01],d-2*wt);
    }
}

module sleeve_r(s,d,wt,center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _sleeve_r(s.x, s.y, s.z, d, wt, center);
}

////////////////////////////////////////////////////////////////////////////
// trash to be removed

/*
module round_cube_lazy(x=40,y=30,z=2,d=10)
{
    if (x<d || y<d)
    {
        echo("Avoiding dissaster by choosing new diameter.");
    }
    
    _d = min([x,y,d]);
    round_cube(x,y,z,_d);
}


module box (x=82,y=154,z=52,d=20,t=2)
{
    A = x-d;
    B = y-d;
    C = z;
    
    //%translate([-d/2,-d/2,0]) cube([x,y,z]);
    difference()
    {
        hull()
        {
            cylinder(d=d, h=C);
            translate([A,0,0]) cylinder(d=d, h=C);
            translate([A,B,0]) cylinder(d=d, h=C);
            translate([0,B,0]) cylinder(d=d, h=C);
        }
        
        translate([-t/2,-t/2,t])
        hull()
        {
            translate([t,t,0]) cylinder(d=d-t, h=C);
            translate([A,t,0]) cylinder(d=d-t, h=C);
            translate([A,B,0]) cylinder(d=d-t, h=C);
            translate([t,B,0]) cylinder(d=d-t, h=C);
        }
    }
}
*/
