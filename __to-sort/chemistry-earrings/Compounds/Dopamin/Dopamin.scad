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

module _recursiveBondEven(a,length,counter,iterations,angle,const=1.5){
    if(counter < iterations){
        translate([length,0,0])
            rotate([0,0,angle])
                translate([length,0,0])
                    rotate([0,0,angle])
                        _recursiveBondEven(a,length,counter+1,iterations,angle);
    }
    
    translate([length-const*a,0,0]) rotate([0,0,angle]) bond(a,length+const*a);   
}

module nChain(a=1,length=10,carbons){
    _recursiveChain(a,length,0,carbons,-60) {children(0); children(1);};
}

module _recursiveChain(a,length,counter,iterations,angle) {
    if(counter < iterations){
        translate([length,0,0]) rotate([0,0,pow(-1,counter)*angle]) _recursiveChain(a,length,counter+1,iterations,angle) {children(0);children(1);};
        if(counter==(iterations-1)){
            difference(){
                bond(a,length);
                translate([length,0,0]) children(0);
                }
            translate([length,0,0]) children(1);
        } else {
            bond(a,length);
        }
    }
}

module dopamine(a=1,length=10){
    benzen(a,length);
    rotate([0,0,120]) bond(a,length);
    rotate([0,0,120]) translate([length,0,0]) cylinder(r=a,h=a,center=true);
    translate([length,0,0]) rotate([0,0,60]) bond(a,length);
    translate([length,0,0]) rotate([0,0,60]) translate([length,0,0]) cylinder(r=a,h=a,center=true);
    translate([length,0,0]) rotate([0,0,-60]) translate([length,0,0]) rotate([0,0,-60]) translate([length,0,0]) rotate([0,0,60])
    nChain(a,length,3){
        cylinder(d=1.75*a,h=a,center=true);
        difference(){
            cylinder(r=a,h=a,center=true);
            cylinder(d=a,h=2*a,center=true);
        };
    }
}


dopamine(a=1.5,length=6);
