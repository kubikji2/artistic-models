use<radiation.scad>
use<biohazard.scad>

$fn = 250;
eps = 0.01;
eps_2 = 0.005;
TOL = 0.25;
TOL_2 = TOL/2;
ROUNDING_D = 2.5;
SH_SIZE = 10;
SH_BORDER = 2;
JOINT_UNIT = SH_SIZE + SH_BORDER;
R_RADIUS = 5;
H_UNIT = 2;
HOLE_DEPTH = 1.5;
DT_SIZE = 1.5*SH_SIZE;
DT_HOLE = SH_SIZE;
ST_LINK_LEN = 20; 


module danger_triangle(diam = ROUNDING_D, a = DT_SIZE, h = HOLE_DEPTH)
{
    _d = diam;
    _a = a;
    _sa= sqrt(_a*_a - (_a*_a)/(4));
    _h = h;
    
    translate([-_a/2,-(_sa)/3,0])
    hull()
    {
        cylinder(d=_d,h=_h);
        translate([_a,0,0]) cylinder(d=_d,h=_h);
        translate([_a/2,_sa,0]) cylinder(d=_d,h=_h);
    }
    
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

module round_rectangle(diam = ROUNDING_D, a = SH_SIZE, b = SH_SIZE, h = HOLE_DEPTH)
{
    _d = diam;
    _a = a-diam;
    _b = b-diam;
    _h = h;
    
    translate([_d/2,_d/2,0])
    hull()
    {
        cylinder(d = _d, h = _h);
        translate([_a,0,0]) cylinder(d = _d, h = _h);
        translate([0,_b,0]) cylinder(d = _d, h = _h);
        translate([_a,_b,0]) cylinder(d = _d, h = _h);
       
    }
    
}


module biohazard_triangle(diam = 2*ROUNDING_D, a = DT_SIZE, h = HOLE_DEPTH)
{
    difference()
    {
        danger_triangle(diam,a,h);
        translate([0,0,-eps_2]) cylinder(d=DT_HOLE,h=0.5*H_UNIT);
    }
    
    translate([0,0,h]) scale([0.25,0.25,1])biohazard_sign(height=1);
    
}

module radiation_triangle(diam = 2*ROUNDING_D, a = DT_SIZE, h = HOLE_DEPTH)
{
    difference()
    {
        danger_triangle(diam,a,h);
        translate([0,0,-eps_2])cylinder(d=DT_HOLE,h=0.5*H_UNIT);
    }
    
    translate([0,0,h])rotate([0,0,90]) radiation(diam = 12, heig = 1, out_rat = 0.75, in_rat = 0.2);
    
}

module anomaly_triangle(diam = 2*ROUNDING_D, a = DT_SIZE, h = HOLE_DEPTH)
{
    color("yellow")
    difference()
    {
        danger_triangle(diam,a,h);
        translate([0,0,-eps_2])cylinder(d=DT_HOLE,h=0.5*H_UNIT);
    }
    
    translate([0,-0.5,h])
        color([0.25,0.25,0.25])
            linear_extrude(1)
                text("\u03A8",font = "Times New Roman:style=Bold", size = 9, halign = "center", valign = "center");   
}

module other_triangle(diam = 2*ROUNDING_D, a = DT_SIZE, h = HOLE_DEPTH)
{
    color("yellow")
    difference()
    {
        danger_triangle(diam,a,h);
        translate([0,0,-eps_2])cylinder(d=DT_HOLE,h=0.5*H_UNIT);
    }
    
    translate([0,1,h])
        color([0.25,0.25,0.25])
            linear_extrude(1)
                text("!", size = 13, font = "Times New Roman:style=Bold", halign = "center", valign = "center");   
}



module connection()
{
    cylinder(d=DT_HOLE-2*TOL,h=HOLE_DEPTH);
}



module ring(inner_diam = 2*R_RADIUS+TOL, outer_diam = 2*(R_RADIUS+SH_BORDER), h = H_UNIT)
{
    d_i = inner_diam;
    d_o = outer_diam;
    _h = h;
    difference()
    {
        cylinder(d=d_o, h=_h);
        translate([0,0,-eps_2]) cylinder(d=d_i, h=_h+eps);
    }
}

module joint(height=2, size=3, left_holes = 2, right_holes = 2)
{
    l = 2*size*JOINT_UNIT + 2*R_RADIUS + 4*SH_BORDER + DT_SIZE + 2*SH_BORDER;
    w = 2*SH_BORDER + SH_SIZE;
    h = height*H_UNIT;
    
    offset = R_RADIUS + 2*SH_BORDER;
    step = SH_SIZE + SH_BORDER;
    
    difference()
    {
        //main cube
        translate([0,-w/2,0]) cube([l,w,h]);
        //begin hole in the main cube
        translate([0,0,-eps_2]) cylinder(h=2*H_UNIT+eps,r=R_RADIUS+TOL);
        //begin cut off in the main cube
        translate([-w/2,-w/2-TOL_2, H_UNIT]) cube([w+TOL,w+TOL,h-H_UNIT+eps]);
        //end hole in the main cube
        translate([l,0,-eps_2]) cylinder(h=2*H_UNIT+eps,r=R_RADIUS+TOL);
        //end cutt of in the main cube
        translate([l-w/2-TOL,-w/2-TOL_2,H_UNIT]) cube([w+TOL,w+TOL,h-H_UNIT+eps]);
              

        for(i=[0:size-1])
        {
            if(i<left_holes){
                translate([offset+i*step,-SH_SIZE/2,-eps_2])
                    round_square(a = SH_SIZE + TOL);
                translate([offset+i*step-SH_BORDER,-w/2-eps_2,(height-1)*H_UNIT+eps_2])
                    cube([w+eps,w+eps,H_UNIT]);
            }
            if(i<right_holes){
                translate([l-offset-SH_SIZE - i*step,-SH_SIZE/2,-eps_2])
                    round_square(a = SH_SIZE + TOL);
                translate([l-offset-i*step-w+SH_BORDER,-w/2-eps_2,(height-1)*H_UNIT+eps_2])
                    cube([w+eps,w+eps,H_UNIT]);
            }
        }

        translate([l/2,0,-eps_2]) cylinder(d=DT_HOLE+2*TOL,h=H_UNIT);

    }
    
    for(i=[0:size-1])
    {
        if(i<left_holes){
                translate([offset+SH_SIZE/2+i*step,0,(height-1)*H_UNIT-eps_2])
                    cylinder(d=SH_SIZE-2*TOL,h=H_UNIT);
            }
            if(i<right_holes){
                translate([l-offset-SH_SIZE/2 - i*step,0,(height-1)*H_UNIT-eps_2])
                    cylinder(d=SH_SIZE-2*TOL,h=H_UNIT);
            }
        
    }
    
    ring();
    translate([l,0,0]) ring();
}

module station(size = 5)
{
    _r = R_RADIUS-TOL;
    _R = _r + SH_BORDER;
    _h = HOLE_DEPTH;
    _H = 5*H_UNIT;
    
    //linkage connection part
    cylinder(r=_R,h=_h);
    cylinder(r=_r,h=_H);

    //connection part
    translate([R_RADIUS-TOL,-SH_SIZE/2,0])
            cube([ST_LINK_LEN-R_RADIUS+2*TOL,SH_SIZE,HOLE_DEPTH]);
    
    l = size*(SH_BORDER+SH_SIZE) + SH_BORDER;
    w = 3*(SH_BORDER+SH_SIZE) + SH_BORDER;
    
    offset = SH_SIZE + SH_BORDER;
    step = SH_SIZE + SH_BORDER;
    name_size = 5*(SH_BORDER+SH_SIZE)-SH_BORDER;
    
    //main part
    translate([ST_LINK_LEN,-w/2,0])
    difference()
    {
        //main body part
        round_rectangle(R_RADIUS,l+TOL,w+TOL,H_UNIT);
        
        for(i=[0:size-1])
        {
            //first row
            translate([SH_BORDER+i*step,SH_BORDER,H_UNIT-HOLE_DEPTH + eps_2])
                    round_square(a = SH_SIZE + TOL);
            //second row
            translate([SH_BORDER+i*step,offset+SH_BORDER,H_UNIT-HOLE_DEPTH + eps_2])
                    round_square(a = SH_SIZE + TOL);
        }
        //name label
        translate([SH_BORDER,2*offset+SH_BORDER,H_UNIT-HOLE_DEPTH + eps_2])
            round_rectangle(R_RADIUS,name_size+TOL,SH_SIZE+TOL,HOLE_DEPTH);
        
    }
    
}

module station_name(name="Prazskaja", font_size = 7)
{
    name_size = 5*(SH_BORDER+SH_SIZE)-SH_BORDER;
    w = SH_SIZE;
    color("blue") round_rectangle(R_RADIUS,name_size,w,HOLE_DEPTH);
    
    color("white")
    translate([name_size/2,w/2,HOLE_DEPTH])
        linear_extrude(HOLE_DEPTH)
            text(name,valign="center", halign="center", size = font_size);
}

module servis_tunel(length=2,width=1)
{
    off = SH_BORDER;
    step = SH_SIZE+SH_BORDER;
    w = width*step + off;
    l = length*step + off;

    
    translate([ST_LINK_LEN,-(off+step)/2,0])
        difference()
        {
            round_rectangle(2*ROUNDING_D,w,l,h=H_UNIT);
            
            for(i=[0:length-1])
            {
                for(j=[0:width-1])
                {
                    translate([off+j*step-0.5*TOL, off+i*step-0.5*TOL,H_UNIT-HOLE_DEPTH+eps_2])
                        round_square(a=SH_SIZE+TOL);
                }
            }
        }
    ring(h = HOLE_DEPTH);
    
    difference(){
        translate([R_RADIUS-TOL,-SH_SIZE/2,0])
            cube([ST_LINK_LEN-R_RADIUS+2*TOL,SH_SIZE,HOLE_DEPTH]);
        cylinder(h=2*H_UNIT,d=2*R_RADIUS+TOL);
    }
    
}

//station_name();
//translate([0,15,0]) station_name("Moskevskaja");

//color([0.3,0.3,0.3])
station(5);

translate([0,45,0]) station(6);
translate([0,90,0]) station(7);
translate([95,0,0]) station(7);
translate([110,45,0]) station(6);
translate([120,90,0]) station(5);


//translate([ST_LINK_LEN+SH_BORDER,SH_SIZE-1.5*SH_BORDER,H_UNIT-HOLE_DEPTH + eps_2]) station_name();

//round_square();

//%joint(2,4,2);
//ring();

/*
translate([0,-30,0])servis_tunel(2,4);
servis_tunel(1,3);
translate([0,1*20,0]) servis_tunel(1,4);
translate([0,2*20,0]) servis_tunel(1,1);
translate([0,3*20,0]) servis_tunel(1,2);
*/

//joint(2,2,1);
//anomaly_triangle();
//radiation_triangle();
//biohazard_triangle();
//anomaly_triangle();
//translate([10,10,0]) biohazard_triangle();

//biohazard_triangle();

/*
translate([0,1*20,0]) joint(2,2,2,1);
translate([0,2*20,0]) joint(2,2,1,2);
translate([0,3*20,0]) joint(3,2,2,1);
translate([0,4*20,0]) joint(3,3,3,2);
translate([0,5*20,0]) joint(3,2,1,0);
*/
/*
for(i=[0:10])
{
    translate([i*10,-20,0]) connection();
    translate([i*10,-30,0]) connection();
}
*/
