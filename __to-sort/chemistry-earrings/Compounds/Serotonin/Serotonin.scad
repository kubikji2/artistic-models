$fn=20;

module bond(a=1, length=10){
    hull(){
        cylinder(d=a,h=a,center=true);
        translate([length,0,0]) cylinder(d=a,h=a,center=true);
    }
}

module cyclohexan(a=1,length=10){
    _recursiveBond(a,length,0,6,-60);
}

module _recursiveBond(a,length,counter,iterations,angle){
    if(counter < iterations){
        translate([length,0,0]) rotate([0,0,angle]) _recursiveBond(a,length,counter+1,iterations,angle);
        bond(a,length);
    }
}

module benzen(a=1,length=10){
    cyclohexan(a,length);
    translate([length,0,0]) rotate([0,0,-60]) _recursiveBondEven(a,length,0,3,-60);
}

module _recursiveBondEven(a,length,counter,iterations,angle,const=1.75){
    
    if(counter < iterations){
        translate([length,0,0]) rotate([0,0,angle]) translate([length,0,0]) rotate([0,0,angle]) _recursiveBondEven(a,length,counter+1,iterations,angle);
    }
    translate([length-const*a,0,0]) rotate([0,0,angle]) bond(a,length+const*a);   
}

module cycloPentan(a=1,length=10){
    _recursiveBond(a,length,0,6,-72);
}

module pyrol(a=1,length=10){
    //cycloPentan
    _recursiveBond(a,length,0,6,-72);
    //doubleBond
    translate([length-1.5*a,0,0]) rotate([0,0,-72])bond(a,length+0.75*a);
    //nitrogen
    rotate([0,0,-108]) translate([length,0,0]) rotate([0,0,72]) translate([length,0,0]) cylinder(r=a,h=a,center=true);
    }

module indol(a=1,length=10){
    benzen(a,length);
    rotate([0,0,108]) pyrol(a,length);
}

module nChain(a=1,length=10,carbons){
    _recursiveBond(a,length,0,carbons,-60);
    }

module serotonin(a=1,length=10){
    indol(a,length);
    //nitrogen chain
    // chain
    rotate([0,0,108]) translate([length,0,0]) rotate([0,0,60]) nChain(a,length,3);
    // nitrogen
    rotate([0,0,108]) translate([length,0,0]) rotate([0,0,60]) translate([length,0,0]) rotate([0,0,-60]) translate([length,0,0]) rotate([0,0,-60]) translate([length,0,0]) rotate([0,0,-60])     cylinder(r=a,h=a,center=true);
    // hydroxy
    rotate([0,0,-120]) translate([length,0,0]) rotate([0,0,60]) translate([length,0,0]) rotate([0,0,-60])
        {
        difference(){
            union(){
                bond(a,length);
                translate([length,0,0]) cylinder(r=a,h=a,center=true);
            }
                translate([length,0,0]) cylinder(r=0.5*a,h=2*a,center=true);
            }
        }
    }

//translate([20,0,0])
//pyrol();
serotonin(a=1.5,length=6);
