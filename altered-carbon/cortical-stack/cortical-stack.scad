
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

src_top();

src_bottom();