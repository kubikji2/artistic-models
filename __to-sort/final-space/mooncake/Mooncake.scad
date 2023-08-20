$fn = 100;

module body()
{
    difference()
    {
        translate([5.5,-5,0]) import("Mooncake.stl");
        translate([0,0,33]) eyes();
    }
}

module eyes()
{
    translate([-23,15,0]) sphere(d=14);
    translate([-23,-15,0]) sphere(d=14);
}

body();
//eyes();