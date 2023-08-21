
// top base piece
module src_top()
{
    // top piece
    import("src/stack-top.stl");
}

// bottom base piece
module src_bottom()
{
    // bottom piece
    rotate([0,180,0])
        import("src/stack-bottom.stl");
}

// parameters
// central compartement
c_d = 25;
// '-> diameter
c_h = 5;
// '-> height in one hemisphere
clrn = 0.25;

// electronics board -> 'e_'
e_t = 1;
// '-> thickness

// Potentiometer parameters -> 'pm_'
pm_x = 5;
// '-> x dimension
pm_y = 5.5;
// '-> y dimension
pm_z = 2.8;
// '-> z dimension
pm_wt = 1.5;
// '-> maximal possible wall thickness

$fn = $preview ? 30 : 120;

module electronics()
{
    color([0.25,0.25,0.25])
    translate([0,0,-c_h])
    {
        cylinder(d=c_d, h=e_t);
    }
}

module main(is_top=false)
{
    color([0.5, 0.5, 0.5])
    difference()
    {
        // choosing the source piece
        if (is_top)
        {
            src_top();
        }
        else
        {
            src_bottom();
        }

        // inner space
        cylinder(d=c_d+2*clrn, h=2*(c_h+clrn), center=true);

        // cut for switch
        
    }
}

main();

//electronics();