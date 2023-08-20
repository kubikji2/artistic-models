$fn = 90;
eps = 0.01;

//import("Serenity.stl");
//cylinder(r=35,h=4.2);

module base()
{
    difference()
    {
        //scale([25.4, 25.4, 25.4])
        import("Serenity.stl");
        _a = 250;
        translate([-_a/2,-_a/2,2])
            cube([_a,_a,_a]);
    }
}

module middle()
{
    //translate([0,0,2-3.2])    
    scale([1,1,2/(4.8-3.2)])
    translate([0,0,-3.2])
    difference()
    {
        //scale([25.4, 25.4, 25.4])
        import("Serenity.stl");
        _a = 250;
        translate([-_a/2,-_a/2,-_a+3.2])
            cube([_a,_a,_a]);
        translate([-_a/2,-_a/2,4.8])
            cube([_a,_a,_a]);
    }
}

module top()
{
    difference()
    {
        //scale([25.4, 25.4, 25.4])
        import("Serenity.stl");
        _a = 250;
        translate([-_a/2,-_a/2,-_a+4.8])
            cube([_a,_a,_a]);
    }
}


module logo()
{
    base();
    translate([0,0,2]) middle();
    cylinder(r=35,h=4);
    translate([0,0,4]) middle();
    translate([0,0,6-4.8]) top();
    
    // inner ring
    translate([2.5,-0.1,0])
    difference()
    {
        cylinder(r=38.5,h=6);
        translate([0,0,-eps])
            cylinder(r=23.5,h=6+2*eps);
    }
}

logo();

