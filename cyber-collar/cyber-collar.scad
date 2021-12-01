eps = 0.01;


b_t = 1;
b_w = 2;
t_t = 1.5;
s_h = 5;
s_w = 11;
s_l = 380/2;

sc = 1;
c_sp = 8;
c_d = 3.5;

brd_i = 7.5;
brd_h = b_t+brd_i+b_t;
brd_y = 6*b_w+3*s_w+2*c_sp;
brd_x = 40;

cl_x = 15;
cl_y = 25;
cl_yo = 5;
cl_t = 4;
cl_wt = 1.75;

module clip()
{
    translate([0,-cl_y,0])
    difference()
    {
        union()
        {
            translate([-cl_x/2,0,0])
                cube([cl_x,cl_y,cl_t+cl_wt+cl_wt]);
            translate([0,0,0])
                cylinder(d=cl_x,h=cl_t+2*cl_wt);
        }
        translate([-eps-cl_x/2,-cl_yo-cl_x,cl_wt])
            cube([cl_x+2*eps,cl_y+cl_x,cl_t]);
        
    }
}

    

module line()
{
    _y = s_w+2*b_w;
    _x = s_l;
    _z = b_t+s_h+t_t;
    translate([0,-_y/2,0])
    difference()
    {
        cube([_x,_y,_z]);
        translate([-eps,b_w,b_t])
            cube([_x+2*eps,s_w,s_h+t_t+eps]);
        translate([-eps,b_w-sc,_z-t_t])
            cube([_x+2*eps,s_w+2*sc,t_t+eps]);
    }
}

module transparent_cover()
{
    _y = s_w+2*b_w;
    _x = s_l;
    _z = b_t+s_h+t_t;
    
    translate([-eps,b_w-sc,_z-t_t])
        cube([_x+2*eps,s_w+2*sc,t_t+eps]);
}

module cover()
{
    translate([-brd_x+b_t,-brd_y/2+b_t,brd_h-t_t])
    {
        cube([brd_x-2*b_t,brd_y-2*b_t,t_t]);
        //translate([b_w-b_t+4,-b_t-eps,-brd_h+b_t+b_t+c_d])
        //    cube([c_d,b_w+2*eps,brd_h-c_d-b_t]);
        // stripe cuts
        _o = brd_h-s_h-b_t-t_t;
        translate([brd_x-b_t,brd_y/2-b_t,0])
        {
        translate([-b_w-eps,c_sp+2*b_w+s_w/2,-_o])
            cube([b_w+2*eps,s_w,_o+t_t]);
        translate([-b_w-eps,-s_w/2,-_o])
            cube([b_w+2*eps,s_w,_o+t_t]);
        translate([-b_w-eps,-(c_sp+2*b_w+3*s_w/2),-_o])
            cube([b_w+2*eps,s_w,_o+t_t]);
        }
    }
}

module half()
{
    translate([0,c_sp+2*b_w+s_w,0])
        line();
    translate([0,0,0])
        line();
    translate([0,-1*(c_sp+2*b_w+s_w),0])
        line();
    
    translate([-brd_x,-brd_y/2,0])
    difference()
    {
        cube([brd_x,brd_y,brd_h]);
        translate([b_w,b_w,b_t])
            cube([brd_x-2*b_w,brd_y-2*b_w,brd_h]);
        translate([sc,sc,brd_h-t_t])
            cube([brd_x-2*sc,brd_y-2*sc,t_t+eps]);
        
        // stripe cuts
        translate([brd_x,brd_y/2,0])
        {
        translate([-b_w-eps,c_sp+2*b_w+s_w/2,b_t])
            cube([b_w+2*eps,s_w,brd_h]);
        translate([-b_w-eps,-s_w/2,b_t])
            cube([b_w+2*eps,s_w,brd_h]);
        translate([-b_w-eps,-(c_sp+2*b_w+3*s_w/2),b_t])
            cube([b_w+2*eps,s_w,brd_h]);
        }
        
        // cable cut
        translate([b_w+4,-eps,b_t])
            cube([c_d,b_w+2*eps,brd_h]);
    }
    
    // clips
    translate([0,-brd_y/2,0])
    {
        translate([-brd_x/2,0,0])
            clip();
        translate([s_l-25,0,0])
            clip();
        translate([s_l/2-25,0,0])
            clip();
    }
    
    
}
//mirror() cover();
//mirror() 
//half();
transparent_cover();
