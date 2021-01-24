module grid(){}

module rc_triangle(diam = 2.5, height = 1, a = 5){
    //translate([])
        hull(){
            for(i=[0:2]){
                 rotate([0,0,90+i*120]) translate([a-0.5*diam,0,0]) cylinder(d=diam,h=height); 
            }
        }
}

module neck(length = 10, height = 1, neck_width = 4, thickness = 3){

    difference(){
        translate([-neck_width*0.5,0,0]) cube([neck_width,length,height]);
        translate([0,length-0.75,-0.5*height]) cylinder(h=2*height, d=1); 
    }
    
    translate([0,length-0.75,0]){
        // top flask part
        difference(){
            hull(){
                translate([-neck_width*0.5,0,0]) cylinder(h=height, d=thickness);
                translate([neck_width*0.5,0,0]) cylinder(h=height, d=thickness);
            }
            translate([0,0,-0.5*height]) cylinder(h=2*height, d=1);          
        }
    }
}


module flask(a = 9, neck_length = 12, neck_width = 5, thickness = 1.5,  height = 1.5, d_outer = 2.5, d_inner = 1.5){
    translate([0,(sqrt(3)/3)*a,0])
    difference(){
        union(){
            rc_triangle(height=height, diam=d_outer, a=a);
            neck(height=height,length=neck_length, neck_width=neck_width, thickness=2.5);
        }
        union(){
            translate([0,0,-0.5*height])
                rc_triangle(diam=d_inner,a=a-(3/(sqrt(3))*thickness), height=2*height);
            translate([-0.5*(neck_width-2*thickness),0,-0.5])
                cube([neck_width-2*thickness, neck_length-2,2*height]);
       }
    }
    
    translate([4*a,0,0]){
        water(diam=d_inner, a = a-sqrt(3)*thickness, height=height);
    }
    

}

module water(diam=1.5, a=6-sqrt(3), height=1, multiplicator = 0.65){
    
    difference(){
        translate([0,(1/sqrt(3))*a,0]) rc_triangle(diam=diam,a=a, height=height);
        translate([-a,(multiplicator)*((a*sqrt(3))-0.5*diam),-0.5*height]) cube([2*a,2*a,2*height]);
    }
    
}


$fn = 100;

flask() ;

//#cube([5,1,1]);



