$fn = 180;
module logo()
{
    scale([0.25, 0.25, 0.55]) translate([0,0,-2])
    import("Vault-Tec_logo.stl");
}

module logo_holed()
{
    d=1.25;
    difference()
    {
        logo();
        
        translate([0,0,1]) rotate([90,0,40])
                cylinder(h=25,d=d,center=true);
        translate([0,0,1]) rotate([90,0,-40])
                cylinder(h=25,d=d,center=true);
        
        translate([20,0,1]) rotate([90,0,0])
                cylinder(h=10,d=d,center=true);
        translate([22,0,1]) rotate([90,0,0])
                cylinder(h=10,d=d,center=true);

        translate([-20,0,1]) rotate([90,0,0])
                cylinder(h=10,d=d,center=true);
        translate([-22,0,1]) rotate([90,0,0])
                cylinder(h=10,d=d,center=true);        
        
    }
}

logo_holed();