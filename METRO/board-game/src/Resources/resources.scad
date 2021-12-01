//use <libs/2dgraph.scad>
use <libs/paraboloid.scad>

$fn = 250;

ROUNDING_D = 2.5;
SH_SIZE = 10;

module projectile()
{
    translate([0,0,50]) rotate([0,180,0]) paraboloid(50,1,5,0,60);
}

module bullet(d=5, h=25)
{
    rim_h= 0.02*h;
    groove_d = 0.8*d;
    groove_h = 0.02*h;
    case_h = 0.4*h;
    case_middle_h = 0.1*h;
    case_middle_d = 0.8*d;
    case_top_h = 0.1*h;
    case_top_d = 0.8*d;
    bullet_h = (1-0.4-0.2-0.04)*h;
    bullet_top_d = 0.1*d;
    //sf = 0.05*0.8-0.001;
    sf = 0.105;
    
    //%cylinder(h=h,d=d);
    
    //rim
    cylinder(d=d,h=rim_h);
    translate([0,0,rim_h]) cylinder(d=groove_d,h=groove_h);
    translate([0,0,rim_h+groove_h]) cylinder(d=d,h=case_h);
    translate([0,0,rim_h+groove_h+case_h]) cylinder(d1=d,d2=case_middle_d,h=case_middle_h);
    translate([0,0,rim_h+groove_h+case_h+case_middle_h]) cylinder(d=case_middle_d, h=case_top_h);
    //translate([0,0,rim_h+groove_h+case_h+case_middle_h+case_top_h]) cylinder(d1=case_top_d, d2=bullet_top_d, h=bullet_h);
    translate([0,0,rim_h+groove_h+case_h+case_middle_h+case_top_h-0.01])
        scale([sf,sf,sf]) projectile();
}

module bullets()
{
    unit = 5 - 0.25;
    for(i=[-1:1])
    {
        for(j=[-1:1])
        {
           translate([i*unit,j*unit,0]) bullet(); 
        }
    }
    
}

module 3bullets()
{
    unit = 5 - 0.25;
    //for(i=[-1:1])
    //{
        for(j=[-1:1])
        {
           translate([0,j*unit,0]) bullet(); 
        }
    //}
    
}

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

module can(d=10,h=15)
{
    segments = 8;
    dh = (h/segments);
    bh = dh/2;
    bd = 0.9*d;
    
    //%cylinder(d=d,h=h);
    cylinder(d=d,h=dh);
    for(i=[0:1:segments+3])
    {
        translate([0,0,dh+i*bh])
        if(i%2==0){
            cylinder(d1=d,d2=bd,h=bh);
        } else {
            cylinder(d1=bd,d2=d,h=bh);
        }
    }
    translate([0,0,dh+(segments+4)*bh]) cylinder(d=d,h=dh);
    
}


module mushroom_hat(d=20,h=15)
{
    //top hat
    difference()
    {
        scale([1,1,0.5]) sphere(r=h/2);
        translate([-d,-d,-d]) cube([2*d,2*d,d]);
        
    }
    
    //outer hat
    rotate_extrude(){
        translate([0,-d/8,0]) square([d/4,d/4]);
        translate([d/4, 0, 0]) circle(d = d/4);
    }
}

module mushroom(d=20,h=15)
{
    translate([0,0,(3*d)/8]) mushroom_hat(d=d,h=h);
    
    //leg
    cylinder(d=d/3  ,h=h/2);
}


module filter(h=5,d=15)
{
    eps = 0.01;
    //%cylinder(h=h,d=d);
    element = 0.2*h;
    pin_d = 0.25*d;
    w = 0.5*element;
    l = 0.25*d;
    
    //down part
    color([0.25,0.25,0.25])
    difference()
    {
        cylinder(h=element,d=d);
        for(i = [0:7])
        {
            //echo(i);
            rotate([0,0,45*i])
                translate([0.15*d,-1.5*w,-eps])
                    cube([l,3*w,2*(w+eps)]);
        }
        //translate([0,0,-eps]) cylinder(d=pin_d*0.75,h=2*element);
    }
    //lower green part
    translate([0,0,element]) color("lime") cylinder(d=d,h=element);
    //middle part
    translate([0,0,2*element]) color([0.25,0.25,0.25]) cylinder(d=d,h=1*element);
    //upper green part
    translate([0,0,3*element]) color("lime") cylinder(d=
    d,h=element);
    //upper part
    translate([0,0,4*element])
    color([0.25,0.25,0.25])
    union()
    {
        cylinder(h=element,d=d);
        for(i = [0:7])
        {
            //echo(i);
            rotate([0,0,45*i])
                translate([0.15*d,-w/2,1.5*w])
                    cube([l,w,2*(w+eps)]);
        }
        
        translate([0,0,w])
        difference()
        {
        cylinder(d=pin_d,h=3*element);
        cylinder(d=0.75*pin_d,h=3*(element+eps));
        }
    }
    echo(0.5*element);

}

filter();

//%mushroom();
//3bullets();

//can();
//%cylinder(d=10,h=15);
//bullet();
//projectile();
//%round_square();






