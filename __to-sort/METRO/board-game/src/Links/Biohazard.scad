// ===========================================
// (c) 2018 by Jiri Kubik (jiri.kub@gmail.com)
// ===========================================

// constants from law about biohazzard law:
// https://law.resource.org/pub/us/cfr/ibr/002/ansi.z35.1.1968.html
A = 1;
B = 3.5;
C = 4;
D = 6;
E = 11;
F = 15;
G = 21;
H = 30;

// resolution
$fn=250;
eps = 0.001;
black = [0.25,0.25,0.25];

module body_part(scale=1, height=1){
    difference(){
        translate([scale*E,0,0]) cylinder(d=scale*H,h=height);
        translate([scale*(G+C/2),0,0]) translate([0,-scale*(C/2),0]) cube([scale*C,scale*C,height+eps]);
    }
}

module body_holes(scale=1, height=1)
{
    rotate([0,0,90]) translate([scale*F,0,0]) cylinder(d=scale*G,h=height+eps);
    rotate([0,0,210]) translate([scale*F,0,0]) cylinder(d=scale*G,h=height+eps);
    rotate([0,0,330]) translate([scale*F,0,0]) cylinder(d=scale*G,h=height+eps);
}

module body_core(scale=1,height=1){
    rotate([0,0,90]) body_part(scale,height);
    rotate([0,0,210]) body_part(scale,height);
    rotate([0,0,330]) body_part(scale,height);
}

module body(scale=1,height=1){
    difference(){
        body_core(scale,height);
        body_holes(scale,height);
    }
}

module inner_hole(scale=1,height=1){
    cylinder(d=scale*D,h=height);
    for(i=[90,210,330]){
        rotate([0,0,i-90]) translate([-scale*(A/2),0,0]) cube([scale*A,scale*D,height+2*eps]);
    }
}

module inner_ring(scale=1,height=1){
    outer=scale*(E-A+B);
    inner=scale*(E-A);
    difference(){
        cylinder(r=outer,h=height);
        cylinder(r=inner,h=height+eps);
    }
}

module inner_ring_holes(scale=1,height=1){
    for(i=[90,210,330]){
        rotate([0,0,i]) translate([scale*F,0,0]) cylinder(d=scale*(G-2*A),h=height+eps);
    }
}

module middle_part(scale=1,height=1)
{
    difference()
    {
        inner_ring(scale,height);
        difference()
        {
            inner_ring(scale,height);
            inner_ring_holes(scale, height);
        }
    }
}

module biohazard_sign(scale=1, height=1)
{
    difference()
    {
        body(scale,height);
        inner_hole(scale, height+eps);
    }
    middle_part(scale,height);
}

module border(heigh = 5, diam=95,border=3, fn = $fn)
{
    difference()
    {
        cylinder(d=diam, heigh, $fn = fn);
        cylinder(d=diam-2*(border), heigh+eps, $fn = fn);
    }
    
}

/////////////////
// modify here //
/////////////////
module BIOHAZZARD_LOGO()
{
    color(black) border(heigh=4,diam=95);
    color(black) biohazard_sign(height=4, scale=1.7);
    color("yellow") cylinder(h=2, d=95+eps);
}

BIOHAZZARD_LOGO();