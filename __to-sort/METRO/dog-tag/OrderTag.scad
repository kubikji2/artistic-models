// =========================================== //
// (c) 2018 by Jiri Kubik (jiri.kub@gmail.com) //
// =========================================== //

use<generated_source/order_logo.scad>;

$fn = 250;
eps = 0.01;

black = [0.25,0.25,0.25];

// module for creating tag shape
// aa is major axis
// bb is minor axis
module tag_shape(aa=27,bb=15,h=2,length=35)
{
    hull(){
        resize([aa,bb,h]) cylinder(d=10);
        translate([0,length,0]) resize([aa,bb,h]) cylinder(d=10);
    }
}

// module for round corner cube
module roundCornerSquare(d=2, h=1.5, x_width=19, y_width=8)
{
    x=x_width/2.0-d/2;
    y=y_width/2.0-d/2;

    hull()
    {
        translate([x,y,0]) cylinder(d=d,h=h,center = true);
        translate([-x,y,0])cylinder(d=d,h=h,center = true);
        translate([x,-y,0])cylinder(d=d,h=h,center = true);
        translate([-x,-y,0])cylinder(d=d,h=h,center = true);
    }
}

// choosing logo used for tag
module logo(h=1,skull = false){
    if (skull)
    {
       resize([20,19,h]) logo_with_skull();            
    }
    else
    {
        translate([0,1.15,0]) resize([20,17,h]) logo_no_skull();
             
    }
}

module logo_border(D=23,d=21,h=1)
{
    difference()
    {
        cylinder(d=D,h=h);
        translate([0,0,-eps]) cylinder(d=d,h=h+2*eps);    
    }
}


// main module
// w is width in x axis without borders
// c is curvature on the y ends without borders
// l is distance between curvature centers
// b is border width
// h is height
module dog_tag_additive_no_text(w = 26, c = 13, l = 35, b = 1, h = 2)
{
    _aa = w + 2* b;
    _bb = c + 2* b;
    
    // base shape
    color(black) 
        difference()
        {
            tag_shape(aa=_aa,bb=_bb,length=l,h=h/2);
            // chain hole
            translate([0,37,-eps])
                cylinder(h=h+2*eps,d=3.25);
        }
    
    // logo with border
    translate([0,29,h/2-eps])
    {
        color("silver")
            logo_border();
        color("red")
            translate([0,0,-h/4+eps])
                logo();
    }
    
    // adding border
    translate([0,0,1-eps])
        color("silver")
            difference()
            {
                tag_shape(aa=_aa,bb=_bb,length=l,h=h/2+eps);
                translate([0,0,-eps])
                    tag_shape(aa=w,bb=c,length=l,h=h/2+3*eps);
            }
    // adding Order name and background
    translate([0,12,0])
    {
        color("Silver") order(h=h);
        translate([0,0.25,0.75]) color("red") roundCornerSquare();
    }
          
    //Order quote
    color("Silver") translate([0,0,h/2]) quote();
    
}

dog_tag_additive_no_text();


// main module in multicolor version
module dog_tag_multicolor(w = 26, c = 13, l = 35, b = 1, h = 2, clr="black")
{
    _aa = w + 2* b;
    _bb = c + 2* b;
    _tmp_off = eps;
    
    // base shape
    if (clr == "black")
    {
        color(black)
        difference()
        {
            // main shape
            tag_shape(aa=_aa,bb=_bb,length=l,h=h);
            
            // chain hole
            translate([0,37,-eps]) cylinder(h=h+2*eps,d=3.25);
            
            // border cut
            translate([0,0,1])
            //color("silver")
                difference()
                {
                    tag_shape(aa=_aa+2*eps,bb=_bb+2*eps,length=l,h=h/2+eps);
                    translate([-eps,-eps,-eps])
                        tag_shape(aa=w,bb=c,length=l,h=h/2+3*eps);
                }
            
            // logo with border
            translate([0,29,h/2])
            {
                logo_border(h=h/2+eps);
                logo(h=h/2+eps);
            }    
            
            // hole for name
            translate([0,12.25,3*h/4])
                roundCornerSquare(d=2,h=h/2+eps);
                  
            //Order quote
            translate([0,0,h/2]) quote(h=h/2+eps);
        }
    }
    
    
    // logo with border
    translate([0,29,h/2+_tmp_off])
    {
        if (clr=="silver")
        {
            color("silver")
                logo_border();
        }
        if (clr=="red")
        {
            color("red")
                translate([0,0,-eps])
                    logo();
        }
        
    }
    
    // adding border
    if (clr=="silver")
    {
        translate([0,0,1+_tmp_off])
            color("silver")
                difference()
                {
                    tag_shape(aa=_aa,bb=_bb,length=l,h=h/2);
                    translate([0,0,-eps])
                        tag_shape(aa=w,bb=c,length=l,h=h/2+2*eps);
                }
    }
    
    
    // hole for name
    if (clr == "red")
    {
        translate([0,12,0])
            color("red")
                difference()
                {
                    translate([0,0.25,3*h/4])
                        roundCornerSquare(d=2,h=h/2);
                    translate([0,0,h/2-eps])
                        order(h=h/2+2*eps);
                }
    }
    
            
            
    if (clr=="silver")
    {
        // name
        translate([0,12,h/2])
            color("silver")
                order(h=h/2);
        // quote
        translate([0,0,h/2])
            color("silver")
                quote(h=h/2);
    }   
}

//dog_tag_multicolor();


// quote in the lower part of dogtag
module quote(h=1){
    
    //Если не я, то кто
    linear_extrude(height = h)
    {
        translate([0,2.5,0]) text(text="Если не я,", size=3.75, halign = "center", language="ru",       font="Arial:style=Narrow Bold");
        translate([0,-2.5,0])text(text="то кто?", size=3.75, halign = "center", language="ru",          font="Arial:style=Narrow Bold");
    }
    
    /*    
    //Если не мы, то кто
    linear_extrude(height = h)
    {
        translate([0,2.5,0]) text(text="Если не мы,", size=3.75, halign = "center", language="ru",       font="Arial:style=Narrow Bold");
        translate([0,-2.5,0])text(text="то кто?", size=3.75, halign = "center", language="ru",          font="Arial:style=Narrow Bold");
    }
    */
    
    /*   
    //If not we, then who?	
    linear_extrude(height = h)
    {
        translate([0,2.5,0]) text(text="If not we,", size=3.5, halign = "center", language="ru",       font="Arial:style=Bold");
        translate([0,-2.5,0])text(text="then who?", size=3.5, halign = "center", language="ru",          font="Arial:style=Bold");
    }
    */
 
    
}

module name(h=1){
    
    ////Квант Квантович Квантов
    linear_extrude(height = h)
    {
        fs = 4;
        offset = fs +1;
        translate([0,offset,0]) text(text="Квант", size=fs, halign = "center", language="ru",       font="Arial:style=Narrow Bold");
        translate([0,0,0])text(text="Квантович", size=fs, halign = "center", language="ru",          font="Arial:style=Narrow Bold");
                translate([0,-offset,0])text(text="Квантов", size=fs, halign = "center", language="ru",          font="Arial:style=Narrow Bold");
    }
}

module order(h=1)
{

    // Квант
    linear_extrude(height = h)
    {
        text(text="Квант", size=5, halign = "center", valign="center", language="ru", font="Arial:style=Narrow Bold");
       
    }    
    
    /*
    //Орден
    linear_extrude(height = h)
    {
        text(text="Орден", size=5, halign = "center", valign="center", language="ru", font="Arial:style=Narrow Bold");
       
    }
    */
    
    
    /*
    //Cпарта
    linear_extrude(height = h)
    {
        text(text="Cпарта", size=4.5, halign = "center", valign="center", language="ru",font="Arial:style=Narrow Bold");
       
    } 
    */
   
    /*
    linear_extrude(height = h)
    {
        text(text="Sparta", size=5, halign = "center", valign="center", language="ru",font="Arial:style=Narrow Bold");
       
    } 
    */
    
}
