use<generated/sgc-logo-cut.scad>;
use<generated/sgc-logo-silhoutte.scad>;

eps = 0.01;

module base()
{
    color([0.25,0.25,0.25])
    difference()
    {
        resize([95,95,4])
            sgc_logo_silhoutte();
        translate([0,0,2])
            resize([92,92,2+eps])
                sgc_logo_cut();
    }
}

//base();

module cut()
{
    color("white")
        translate([0,0,2])
            resize([92,92,2+eps])
                sgc_logo_cut();
}

cut();