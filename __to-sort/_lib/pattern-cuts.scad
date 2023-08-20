

module _hexagonal_cut(n_rows, n_cols, d, h, off)
{
    
    // width of the hexagonal pieces
    _w = 2*sqrt((d/2)*(d/2)-(d/4)*(d/4));
    
    for(i=[0:n_rows-1])
    {

        // vertical offset
        v_off = i*(0.75*d+off);
                
        for(j=[0:n_cols-1])
        {
            // transform
            t = i % 2 == 0 ?
                [j*(_w+off)+(_w+off)/2,0,v_off] : 
                [j*(_w+off),0,v_off];
            
            // cylinder
            translate(t)
                rotate([-90,90,0])
                    cylinder($fn=6,d=d,h=h);           
        }
    }
}


module hexagonal_pattern(s, d, t, vertical=true, center=false)
{

    // tesing feasability of provided parameters
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    
    // extracting parameters
    x = s.x;
    y = vertical ? s.z : s.y;
    z = vertical ? s.y : s.z;
    
    // computing number of rows and cols required
    n_rows = ceil(y / (d+t))+2;
    n_cols = ceil(x / (d+t))+3;
    
    // safe area used for cutting out surplus patter
    _safe = 3*(d+t) + t;
    
    // TODO automate t compenstation
    
    // handling roatations and translations
    _r = vertical ? [0,0,0] : [-90,0,0];
    _t = vertical ? [0,0,0] : [0,0,z];
    _c = center ? (vertical ? [-x/2,-z/2,-y/2] : [-x/2,-y/2,-z/2]) : [0,0,0];
    
    translate(_c)
    translate(_t)
    rotate(_r)
    difference()
    {
        // pattern
        _hexagonal_cut(n_rows, n_cols, d, z, t);
        
        // cutting sides
        // '-> left
        translate([-d,-z/2,-d])
            cube([d,2*z,y+_safe]);
        
        // '-> right
        translate([x,-z/2,-d])
            cube([_safe,2*z,y+_safe]);
        
        // '-> lower
        translate([-d,-z/2,-d])
            cube([x+_safe,2*z,d]);
        
        // -> upper
        translate([-d,-z/2,y])
            cube([x+_safe,2*z,_safe]);
        
    }
    
}

//hexagonal_pattern([500,200,10], 50, 10, vertical=false, center=true);

// create hexagonal pattern around sleeve
// '-> x,y,z are dimensions
// '-> off is offset on the sides in XY plane
//     '-> in case of rounded corner module is equal to the rounding radius
//     '-> in other cases it is equal to wall thickness
// '-> wt is wall thickness
// '-> bt is bottom thickness
// '-> pd is hexagonal pattern diameter
// '-> pt is hexagonal pattern distances a.k.a thikness of the grid
module _hexagonal_pattern_sleeve(x,y,z,off,wt,bt,pd,pt)
{
    // patterns
    _eps = 0.01;
    _eps2 = _eps/2;
    // '-> front
    translate([off, -_eps2, bt])
        hexagonal_pattern(s=[x-2*off, wt+eps, z-2*bt], d=pd, t=pt);
    // '-> back
    translate([off, y-wt-_eps2, bt])
        hexagonal_pattern(s=[x-2*off, wt+eps, z-2*bt], d=pd, t=pt);
    // '-> left
    translate([wt+_eps2, off, bt])
        rotate([0,0,90])
            hexagonal_pattern(s=[y-2*off, wt+eps, z-2*bt], d=pd, t=pt);
    // '-> right
    translate([x+_eps2, off, bt])
        rotate([0,0,90])
            hexagonal_pattern(s=[y-2*off, wt+eps, z-2*bt], d=pd, t=pt);
}

// module creating box with rounded cornes in similar manner as cube++ modules does
// '-> x,y,z dimensions
// '-> d is diameter of corners rounding
// '-> wt is wall thickness
// '-> bt is bottom thiskness
// '-> pd is hexagonal pattern diameter
// '-> pt is hexagonal pattern  a.k.a thikness of the grid
module _box_r_hex(x,y,z,d,wt,bt,pd,pt,center=false)
{
    // ok, this code is copied out from the cube++ to not mess up references
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

        // hexagonal patterns
        _hexagonal_pattern_sleeve(x=x,y=y,z=z,off=d/2,wt=wt,bt=bt,pd=pd,pt=pt);
    }
}

// interface
module box_r_hex(s,d,wt,bt,pd,pt,center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _bt = is_num(bt) ? bt : wt;
    _box_r_hex(s.x, s.y, s.z, d, wt, _bt, pd, pt, center);
}

// module creating cover with rounded cornes in similar manner as cube++ modules does
// '-> x,y,z dimensions
// '-> d is diameter of corners rounding
// '-> wt is wall thickness
// '-> bt is bottom thiskness
// '-> pd is hexagonal pattern diameter
// '-> pt is hexagonal pattern  a.k.a thikness of the grid
module _cover_r_hex(x,y,z,d,wt,bt,pd,pt,center=false)
{
    // ok, this code is copied out from the cube++ to not mess up references
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

        // hexagonal pattern
        _hexagonal_pattern_sleeve(x=x,y=y,z=z,off=d/2,wt=wt,bt=bt,pd=pd,pt=pt);

    }
}

// just an interface for _cover_r_hex
module cover_r_hex(s,d,wt,bt=NAN,pd,pt,center=false)
{
    assert(len(s)==3, str("given size vector has size, ", len(s), " but size 3 is required"));
    _bt = is_num(bt) ? bt : wt;
    _cover_r_hex(s.x, s.y, s.z, d, wt, _bt, pd, pt, center);
}
