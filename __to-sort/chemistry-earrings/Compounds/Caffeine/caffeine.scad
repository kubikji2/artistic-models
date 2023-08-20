$fn=20;
eps = 0.01;

// simple bond of width d, height h and length l
// '-> centered in the middle of its length
module bond(d=1, h=1, l=10){
    hull(){
        translate([l/2,0,0])
            cylinder(d=d,h=h,center=true);
        translate([-l/2,0,0])
            cylinder(d=d,h=h,center=true);
    }
}

// carbon cycle
// '-> a is width and height of the bonds
// '-> l is lenght of the bond
// '-> nc is number of carbons in cycle e.g. number of sizes
// '-> bm is array of bond mulitplicity
//     '-> 0 means no bond
//     '-> 1 is a single bond
//     '-> 2 is a double bond
//     '-> other multiplicity is not considered
module c_cycle(a,l,nc,bm)
{
    _l = l;
    _is_double = bm;
    _inc_a = 360/nc;
    _r = -(_l/2)/tan(_inc_a/2);
    for(i=[0:nc])
    {
        rotate([0,0,-i*_inc_a+90])
        translate([0,_r,0])
        {
            if(_is_double[i]==1)
            {
                bond(d=a,h=a,l=_l);
            } else if(_is_double[i]==2)
            {
                translate([0,-a/3,0])
                    bond(d=a/2,h=a,l=l);
                translate([0,a/3,0])
                    bond(d=a/2,h=a,l=l);
            }
        }       
    }
}


// utility for appending chains or replacing carbons with nitrogen
// '-> same interface as cycle
// '-> a is width and height of the bonds
// '-> l is lenght of the bond
// '-> nc is number of carbons in cycle e.g. number of sizes
// '-> im is array determinig whether there is a modification
//     '-> 0 means no modification
//     '-> 1 is a modification on particular position
//     '-> other multiplicity is not considered
// '-> children object is considered as chain or nitrogem
module c_appender(a,l,nc,im)
{
    _l = l;
    _is_modified = im;
    _inc_a = 360/nc;
    _r = -(_l/2)/tan(_inc_a/2);
    for(i=[0:nc])
    {
        if(_is_modified[i])
        {   
            rotate([0,0,-i*_inc_a+_inc_a/2+90])
                translate([0,_r-a/2,0])
                    children(0);
        }       
        
    }
}

module caffeine()
{

    _a = 1.5;
    _l = 6;
    // left cycle
    c_cycle(a=_a,l=_l,nc=6,bm=[0,1,1,1,1,1]);
    // adding nitrogen with methyl chain
    c_appender(a=_a,l=_l,nc=6,im=[0,0,1,0,1,0]){
        translate([0,0,-_a/2])
        {
            // nitrogen
            cylinder(h=_a,r=_a);
            // methyl radical
            _lo = 5;
            hull()
            {
                cylinder(h=_a,d=_a);
                translate([0,-_lo,0])
                    cylinder(h=_a,d=_a);
            }
            
        }
    };

    // adding oxigen with hole
    c_appender(a=_l,l=_l,nc=6,im=[0,0,0,1,0,1]){
        _lo = 5;
        difference()
        {
        union()
        {
            // double bond
            translate([0,0,0])
                rotate([0,0,90])    
                {
                    translate([0,_a/3,0])    
                        bond(h=_a,d=_a/2,l=_lo);
                    translate([0,-_a/3,0])
                        bond(h=_a,d=_a/2,l=_lo);
                }
            translate([0,-_lo+_a,-_a/2])   
                cylinder(h=_a,r=_a);
        }
                translate([0,-_lo+_a,-_a/2-eps])   
            cylinder(h=_a+2*eps,d=_a);
        }
    };

    // right cycle
    _ro = +(_l/2)/tan((360/6)/2) +(_l/2)/tan((360/5)/2);
    translate([_ro,0,0])
    rotate([0,180,0])
    {
        // main cycle
        c_cycle(a=_a,l=_l,nc=5,bm=[2,1,2,1,1]);
        
        // '-> adding nitrogens
        c_appender(a=_a,l=_l,nc=5,im=[0,0,1,0,1,0])
        {
            translate([0,0,-_a/2]) cylinder(h=_a,r=_a);
        }
        
        // '-> adding methyl radical
        c_appender(a=_a,l=_l,nc=5,im=[0,0,0,0,1,0]){
            _lo = 5;
            translate([0,0,-_a/2])
                hull()
                {
                    cylinder(h=_a,d=_a);
                    translate([0,-_lo,0])
                        cylinder(h=_a,d=_a);
                }
                
            
        };
    }
}

caffeine();
