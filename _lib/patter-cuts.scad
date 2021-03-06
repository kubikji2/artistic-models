

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
    // extracting parameters
    x = s.x;
    y = s.y;
    z = s.z;
    
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