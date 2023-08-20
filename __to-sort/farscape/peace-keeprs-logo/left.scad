
// Module names are of the form poly_<inkscape-path-id>().
// As a result you can associate a polygon in this OpenSCAD program with the
//  corresponding SVG element in the Inkscape document by looking for 
//  the XML element with the attribute id="inkscape-path-id".

// Paths have their own variables so they can be imported and used 
//  in polygon(points) structures in other programs.
// The NN_points is the list of all polygon XY vertices. 
// There may be an NN_paths variable as well. If it exists then it 
//  defines the nested paths. Both must be used in the 
//  polygon(points, paths) variant of the command.

profile_scale = 25.4/90; //made in inkscape in mm

// helper functions to determine the X,Y dimensions of the profiles
function min_x(shape_points) = min([ for (x = shape_points) min(x[0])]);
function max_x(shape_points) = max([ for (x = shape_points) max(x[0])]);
function min_y(shape_points) = min([ for (x = shape_points) min(x[1])]);
function max_y(shape_points) = max([ for (x = shape_points) max(x[1])]);

height = 6;
width = 1.0;


path3199_0_points = [[-156.130890,-180.000000],[-220.000007,-52.433550],[82.578363,22.409089],[-156.130890,-180.000000],[-156.130890,-180.000000]];

module poly_path3199(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path3199_0_points);
  }
}

rect819_0_points = [[230.892543,185.917790],[250.000007,185.917790],[250.000007,200.000000],[230.892543,200.000000],[230.892543,185.917790]];

module poly_rect819(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(rect819_0_points);
  }
}

rect817_0_points = [[-250.000007,-200.000000],[-224.532178,-200.000000],[-224.532178,-181.423466],[-250.000007,-181.423466],[-250.000007,-200.000000]];

module poly_rect817(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(rect817_0_points);
  }
}

// The shapes
poly_path3199(height, width);
poly_rect819(height, width);
poly_rect817(height, width);
