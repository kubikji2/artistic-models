$fn = 250;
eps = 0.01;
eps_2 = 0.005;
ROUNDING_D = 2.5;
SH_SIZE = 10;
HOLE_DEPTH = 1.5;
    
module round_square(diam = ROUNDING_D, a = SH_SIZE, h = HOLE_DEPTH)
{
    _d = diam;
    _a = a-diam;
    _h = h;
    
    translate([_d/2,_d/2,0])
    hull()
    {
        cylinder(d = _d, h = _h);
        translate([_a,0,0]) cylinder(d = _d, h = _h);
        translate([0,_a,0]) cylinder(d = _d, h = _h);
        translate([_a,_a,0]) cylinder(d = _d, h = _h);
       
    }
    
}

module spanner(nut_d = 2, l = 10, h = 1, t = 1)
{
    d = nut_d*1.5;
    difference()
    {
        union()
        {
            cylinder(d=d,h=h);
            translate([0,-t/2,0]) cube([l,t,h]);
            translate([l,0,0]) cylinder(d=d,h=h);    
        }
        translate([[ 11.28, -10.41, -16.17 ]]) cylinder(d=nut_d,h=h, $fn = 6);
        //translate([-nut_d/2,0,0]) cylinder(d=nut_d,h=h, $fn = 6);
    }
    
}

module base()
{
    round_square();
}

//base();
spanner();