module base()
{
    
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

height = 2;
width = 1.0;


rect2162_0_points = [[-250.000000,-200.000000],[250.000000,-200.000000],[250.000000,200.000000],[-250.000000,200.000000],[-250.000000,-200.000000]];

module poly_rect2162(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(rect2162_0_points);
  }
}

// The shapes
poly_rect2162(height, width);
}



module right()
{
   

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

height = 4;
width = 1.0;


path3192_0_points = [[80.000000,-200.000000],[24.093750,-93.531250],[31.588654,-97.256080],[39.329082,-100.537912],[47.298468,-103.360211],[55.480249,-105.706443],[63.857857,-107.560072],[72.414729,-108.904564],[81.134298,-109.723385],[90.000000,-110.000000],[97.200874,-109.817720],[104.307617,-109.276758],[111.311411,-108.385933],[118.203437,-107.154062],[124.974878,-105.589966],[131.616914,-103.702461],[138.120728,-101.500366],[144.477500,-98.992500],[150.678413,-96.187681],[156.714648,-93.094727],[162.577388,-89.722456],[168.257812,-86.079688],[173.747104,-82.175239],[179.036445,-78.017930],[184.117017,-73.616577],[188.980000,-68.980000],[193.616577,-64.117017],[198.017930,-59.036445],[202.175239,-53.747104],[206.079687,-48.257812],[209.722456,-42.577388],[213.094727,-36.714648],[216.187681,-30.678413],[218.992500,-24.477500],[221.500366,-18.120728],[223.702461,-11.616914],[225.589966,-4.974878],[227.154063,1.796563],[228.385933,8.688589],[229.276758,15.692383],[229.817720,22.799126],[230.000000,30.000000],[229.817720,37.200874],[229.276758,44.307617],[228.385933,51.311411],[227.154063,58.203437],[225.589966,64.974878],[223.702461,71.616914],[221.500366,78.120728],[218.992500,84.477500],[216.187681,90.678413],[213.094727,96.714648],[209.722456,102.577388],[206.079687,108.257812],[202.175239,113.747104],[198.017930,119.036445],[193.616577,124.117017],[188.980000,128.980000],[184.117017,133.616577],[179.036445,138.017930],[173.747104,142.175239],[168.257812,146.079687],[162.577388,149.722456],[156.714648,153.094727],[150.678413,156.187681],[144.477500,158.992500],[138.120728,161.500366],[131.616914,163.702461],[124.974878,165.589966],[118.203437,167.154063],[111.311411,168.385933],[104.307617,169.276758],[97.200874,169.817720],[90.000000,170.000000],[83.297507,169.842111],[76.676022,169.373180],[70.142643,168.600310],[63.704468,167.530606],[57.368595,166.171172],[51.142121,164.529111],[45.032146,162.611528],[39.045766,160.425527],[33.190080,157.978211],[27.472186,155.276684],[21.899182,152.328051],[16.478166,149.139415],[11.216236,145.717881],[6.120490,142.070551],[1.198025,138.204532],[-3.544059,134.126925],[-8.098665,129.844836],[-12.458695,125.365367],[-16.617051,120.695624],[-20.566635,115.842710],[-24.300350,110.813729],[-27.811096,105.615785],[-31.091776,100.255982],[-34.135291,94.741423],[-36.934545,89.079214],[-39.482439,83.276458],[-41.771874,77.340258],[-43.795754,71.277719],[-45.546979,65.095945],[-47.018452,58.802039],[-48.203075,52.403106],[-49.093750,45.906250],[-130.000000,200.000000],[250.000000,200.000000],[250.000000,-200.000000],[80.000000,-200.000000],[80.000000,-200.000000]];

module poly_path3192(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path3192_0_points);
  }
}

rect817_0_points = [[-250.000000,-200.000000],[-224.532171,-200.000000],[-224.532171,-181.423466],[-250.000000,-181.423466],[-250.000000,-200.000000]];

module poly_rect817(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(rect817_0_points);
  }
}

path3199_0_points = [[-156.130883,-180.000000],[-220.000000,-52.433550],[82.578370,22.409090],[-156.130883,-180.000000],[-156.130883,-180.000000]];

module poly_path3199(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path3199_0_points);
  }
}

// The shapes
poly_path3192(height, width);
poly_rect817(height, width);
poly_path3199(height, width);

}


module left()
{
    

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

}

module logo()
{
    difference()
    {
        union()
        {
            color("gray") base();
            color([0.2,0.2,0.2]) right();
            color("red") left();
        }
        
        translate([-72,47,2]) cube([10,10,10]);
        translate([62,-57,4]) cube([10,10,10]);
        
    }
}

logo();