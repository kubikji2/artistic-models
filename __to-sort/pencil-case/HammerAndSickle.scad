$fn = 180;
module logo()
{
    scale([0.25,0.25,1.25]) import("HammerAndSickle.stl");
}

//% cube([22,22,2]);
difference()
{
    logo(); 
    #translate([3,3,1]) rotate([0,90,-45])  cylinder(d=1, h=5, center=true);
    #translate([18,3,1]) rotate([0,90,45])  cylinder(d=1, h=5, center=true);
    #translate([9,13,1]) rotate([0,90,45])  cylinder(d=1, h=5, center=true);
}