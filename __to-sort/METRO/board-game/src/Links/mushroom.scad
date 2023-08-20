$fn = 250;

module hat()
{
    
}

module leg(w=10, h=15, t=1, s=0.7)
{
    scale([w,h,t])
    difference()
    {
        cylinder();
        #translate([-1,2*0.75-1,-0.5]) cube([2,2,2]);
    }
}

module mushroom()
{
    leg();
    
}
    
mushroom();