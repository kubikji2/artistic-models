
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


polygon94_0_points = [[22.196120,24.287627],[22.683049,25.258217],[22.913442,25.258217],[23.581744,24.287627],[22.196120,24.287627]];

module poly_polygon94(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon94_0_points);
  }
}

polygon84_0_points = [[16.624214,12.575187],[17.387288,10.604595],[31.148751,10.604595],[29.807246,12.575187],[16.624214,12.575187]];

module poly_polygon84(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon84_0_points);
  }
}

path28_0_points = [[-19.779449,-22.464095],[-23.939587,-24.910178],[-24.277823,-24.872596],[-24.632399,-24.539262],[-24.663445,-24.165078],[-21.828472,-20.401999],[-21.604412,-20.289458],[-21.379125,-20.398731],[-20.537212,-21.306413],[-19.741867,-22.003309],[-19.639947,-22.242893],[-19.779449,-22.464095],[-19.779449,-22.464095]];

module poly_path28(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path28_0_points);
  }
}

polygon86_0_points = [[16.802319,15.303950],[16.037612,14.093164],[16.308854,13.390548],[30.995156,13.390548],[29.629141,15.303950],[16.802319,15.303950]];

module poly_polygon86(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon86_0_points);
  }
}

polygon30_0_points = [[-6.506548,-31.908557],[-6.506548,-29.238617],[-4.952624,-24.776190],[-4.952624,-27.277829],[-6.506548,-31.908557]];

module poly_polygon30(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon30_0_points);
  }
}

polygon88_0_points = [[27.392208,16.120945],[26.091552,18.032714],[18.527813,18.032714],[17.318660,16.120945],[27.392208,16.120945]];

module poly_polygon88(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon88_0_points);
  }
}

path112_0_points = [[17.268006,-35.532747],[17.268006,-29.457572],[19.518011,-32.766401],[21.462459,-31.473915],[15.990226,-24.669981],[14.616041,-25.557238],[16.836633,-28.821950],[14.799047,-28.821950],[14.799047,-28.454302],[14.714897,-28.092577],[14.630746,-28.006589],[12.959175,-26.388938],[12.959175,-24.521288],[17.269640,-24.521288],[17.269640,-23.562136],[25.743512,-28.256589],[26.083382,-28.207569],[28.161818,-26.101356],[28.191229,-25.740244],[22.232068,-17.361144],[21.993914,-17.242067],[21.763113,-17.374216],[20.762549,-18.724274],[19.560086,-20.057023],[17.271274,-22.233702],[17.271274,-20.545790],[18.746841,-19.089034],[20.100911,-17.517981],[21.325653,-15.840272],[22.413237,-14.063548],[23.355829,-12.195447],[24.145598,-10.243611],[24.774713,-8.215679],[25.235342,-6.119293],[30.979633,-5.466718],[37.993535,-4.300662],[37.734084,-6.837140],[37.310544,-9.321546],[36.728479,-11.748340],[35.993455,-14.111980],[35.111037,-16.406926],[34.086790,-18.627636],[32.926278,-20.768569],[31.635068,-22.824185],[30.218723,-24.788942],[28.682808,-26.657299],[27.032890,-28.423715],[25.274532,-30.082649],[23.413299,-31.628561],[21.454758,-33.055908],[19.404472,-34.359150],[17.268006,-35.532747],[17.268006,-35.532747],[23.555600,-28.299073],[17.785981,-24.964099],[17.741863,-25.016387],[21.774551,-29.714108],[22.129127,-29.743520],[23.575208,-28.534367],[23.555600,-28.299073],[23.555600,-28.299073],[24.232072,-18.274544],[28.173256,-23.638933],[28.410184,-23.634031],[29.460840,-22.071937],[29.393846,-21.723897],[24.279457,-18.227158],[24.232072,-18.274544],[24.232072,-18.274544],[24.498412,-15.470617],[23.777822,-16.651992],[31.125876,-21.348079],[32.307250,-19.375853],[24.498412,-15.470617],[24.498412,-15.470617],[25.245145,-14.083360],[33.047448,-17.985328],[34.032744,-15.869311],[25.903643,-12.679762],[25.245145,-14.083360],[25.245145,-14.083360],[26.390572,-11.490218],[34.513137,-14.678132],[35.294184,-12.442834],[26.841554,-10.215705],[26.390572,-11.490218],[26.390572,-11.490218],[27.168352,-9.155246],[35.607910,-11.377472],[36.191245,-8.978775],[27.547437,-7.653609],[27.168352,-9.155246],[27.168352,-9.155246],[36.400395,-7.892172],[36.779481,-5.137265],[28.302341,-6.509816],[36.400395,-7.892172],[36.400395,-7.892172]];
path112_0_paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52],
				[53,54,55,56,57,58,59,60],
				[61,62,63,64,65,66,67,68],
				[69,70,71,72,73,74],
				[75,76,77,78,79,80],
				[81,82,83,84,85,86],
				[87,88,89,90,91,92],
				[93,94,95,96,97]];

module poly_path112(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path112_0_points, path112_0_paths);
  }
}

polygon32_0_points = [[7.496746,-34.857909],[7.496746,-31.908557],[4.968964,-24.776190],[4.968964,-27.380770],[7.496746,-34.857909]];

module poly_polygon32(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon32_0_points);
  }
}

polygon90_0_points = [[26.952665,18.859513],[25.622597,20.771281],[20.071933,20.771281],[18.862781,18.859513],[26.952665,18.859513]];

module poly_polygon90(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon90_0_points);
  }
}

polygon34_0_points = [[-11.281067,40.996809],[-28.503322,40.996809],[-16.746764,33.864443],[-11.281067,40.996809]];

module poly_polygon34(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon34_0_points);
  }
}

path10_0_points = [[41.870994,-0.315360],[41.463974,4.393732],[40.548968,8.939125],[39.154910,13.291771],[37.310732,17.422623],[35.045368,21.302631],[32.387750,24.902748],[29.366812,28.193926],[26.011487,31.147117],[26.983711,32.826859],[30.543562,29.730719],[33.748940,26.273155],[36.568747,22.485359],[38.971887,18.398523],[40.927262,14.043841],[42.403777,9.452504],[43.370333,4.655707],[43.795834,-0.315360],[41.870994,-0.315360],[41.870994,-0.315360]];

module poly_path10(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path10_0_points);
  }
}

polyline36_0_points = [[17.119313,33.864443],[11.653617,40.996809],[28.877505,40.996809]];

module poly_polyline36(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    for (t = [0: len(polyline36_0_points)-2]) {
      hull() {
        translate(polyline36_0_points[t]) 
          cylinder(h=h, r=w/2, $fn=res);
        translate(polyline36_0_points[t + 1]) 
          cylinder(h=h, r=w/2, $fn=res);
      }
    }
  }
}

path4_0_points = [[44.931457,-0.509805],[46.550333,-0.736725],[46.987068,-0.996249],[47.009892,-1.383990],[46.699383,-1.783423],[46.214548,-2.144408],[44.946163,-2.741835],[44.731368,-6.412811],[44.227115,-9.998848],[43.445072,-13.488305],[42.396909,-16.869543],[41.094293,-20.130922],[39.548893,-23.260802],[37.772378,-26.247544],[35.776415,-29.079507],[33.572675,-31.745053],[31.172824,-34.232540],[28.588532,-36.530331],[25.831467,-38.626783],[22.913298,-40.510259],[19.845693,-42.169117],[16.640320,-43.591719],[13.308849,-44.766424],[13.704274,-45.890609],[13.766978,-46.066314],[13.727967,-46.455561],[13.246553,-46.851548],[11.982049,-47.047474],[-0.173203,-47.047474],[-12.328455,-47.047474],[-13.592959,-46.850859],[-14.074373,-46.454948],[-14.113384,-46.066084],[-14.050680,-45.890609],[-13.622575,-44.670019],[-16.925412,-43.480077],[-20.102602,-42.045949],[-23.142662,-40.379078],[-26.034107,-38.490907],[-28.765453,-36.392880],[-31.325216,-34.096441],[-33.701911,-31.613032],[-35.884054,-28.954099],[-37.860162,-26.131083],[-39.618749,-23.155429],[-41.148332,-20.038580],[-42.437427,-16.791979],[-43.474548,-13.427071],[-44.248213,-9.955298],[-44.746937,-6.388104],[-44.959235,-2.736933],[-46.220471,-2.140118],[-46.701655,-1.781049],[-47.009892,-1.383990],[-46.987757,-0.997168],[-46.554622,-0.737951],[-44.946163,-0.509805],[-44.502078,4.549647],[-43.511749,9.432667],[-42.006446,14.108042],[-40.017436,18.544561],[-37.575990,22.711012],[-34.713377,26.576184],[-31.460866,30.108864],[-27.849726,33.277840],[-27.802008,33.984388],[-27.915289,34.515996],[-28.148746,34.967386],[-31.555615,40.568704],[-31.837807,41.154748],[-31.917927,41.584560],[-31.846660,41.882211],[-31.674692,42.071770],[-31.231396,42.222889],[-30.993522,42.230472],[-29.944501,42.230472],[-12.271265,42.230472],[-11.041611,42.380620],[-10.326204,42.674304],[-9.911783,43.089950],[-8.001649,45.890609],[-7.339960,46.630424],[-6.777995,46.965979],[-6.241842,47.047474],[0.004902,47.047474],[0.055556,47.047474],[6.302299,47.047474],[6.838452,46.965979],[7.400417,46.630424],[8.062107,45.890609],[9.967339,43.088316],[10.381760,42.672670],[11.097166,42.378986],[12.326821,42.228838],[30.000056,42.228838],[31.049078,42.228838],[31.286951,42.221255],[31.730248,42.070136],[31.902215,41.880577],[31.973482,41.582926],[31.893363,41.153114],[31.611171,40.567070],[28.204301,34.965752],[27.964922,34.495571],[27.855496,33.942772],[27.921621,33.209213],[31.514564,30.041107],[34.750601,26.512075],[37.598656,22.653041],[40.027649,18.494929],[42.006503,14.068663],[43.504141,9.405170],[44.489485,4.535372],[44.931457,-0.509805],[44.931457,-0.509805]];

module poly_path4(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path4_0_points);
  }
}

polygon38_0_points = [[-7.199360,32.147119],[-4.877460,27.591555],[-7.522890,20.501673],[-9.596423,23.933052],[-7.199360,32.147119]];

module poly_polygon38(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon38_0_points);
  }
}

polygon102_0_points = [[14.367674,7.864394],[15.197741,5.748377],[17.599706,5.748377],[15.884017,10.098058],[13.544143,10.098058],[12.233683,7.864394],[14.367674,7.864394]];

module poly_polygon102(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon102_0_points);
  }
}

path6_0_points = [[-41.751712,-3.434647],[-41.473085,-6.760675],[-40.938751,-10.007678],[-40.158936,-13.165450],[-39.143864,-16.223785],[-37.903762,-19.172476],[-36.448853,-22.001318],[-34.789364,-24.700105],[-32.935519,-27.258630],[-30.897545,-29.666687],[-28.685665,-31.914071],[-26.310105,-33.990576],[-23.781090,-35.885995],[-21.108847,-37.590122],[-18.303599,-39.092751],[-15.375571,-40.383677],[-12.334991,-41.452692],[-12.995122,-43.258251],[-16.193792,-42.124897],[-19.272708,-40.756613],[-22.220956,-39.164293],[-25.027621,-37.358832],[-27.681788,-35.351128],[-30.172544,-33.152074],[-32.488974,-30.772567],[-34.620163,-28.223501],[-36.555197,-25.515772],[-38.283160,-22.660275],[-39.793139,-19.667907],[-41.074219,-16.549561],[-42.115486,-13.316134],[-42.906024,-9.978522],[-43.434920,-6.547618],[-43.691259,-3.034319],[-41.751712,-3.434647],[-41.751712,-3.434647]];

module poly_path6(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path6_0_points);
  }
}

polygon40_0_points = [[7.485308,32.147119],[5.163408,27.591555],[7.808838,20.501673],[9.880738,23.933052],[7.485308,32.147119]];

module poly_polygon40(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon40_0_points);
  }
}

path104_0_points = [[-46.027864,-1.383990],[-18.058857,-1.383990],[-19.828469,-5.444455],[-22.033793,-5.341488],[-27.893843,-4.831504],[-31.838902,-4.329624],[-36.271055,-3.612880],[-41.048107,-2.643569],[-46.027864,-1.383990],[-46.027864,-1.383990]];

module poly_path104(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path104_0_points);
  }
}

polygon98_0_points = [[-14.201007,7.864394],[-15.031074,5.748377],[-17.433039,5.748377],[-15.717350,10.098058],[-13.377476,10.098058],[-12.067016,7.864394],[-14.201007,7.864394]];

module poly_polygon98(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon98_0_points);
  }
}

polygon42_0_points = [[6.356221,32.362806],[-6.080077,32.362806],[-4.325172,29.014760],[4.602950,29.014760],[6.356221,32.362806]];

module poly_polygon42(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon42_0_points);
  }
}

path114_0_points = [[-12.506559,-23.488606],[-16.111141,-23.488606],[-16.111141,-15.274539],[-16.061483,-14.740683],[-15.629319,-13.566202],[-15.137050,-12.938922],[-14.389861,-12.391721],[-13.334651,-12.004676],[-11.918323,-11.857865],[-10.493640,-11.940299],[-9.416404,-12.170826],[-8.638072,-12.524284],[-8.110105,-12.975515],[-7.783961,-13.499355],[-7.611100,-14.070645],[-7.531060,-15.254931],[-7.531060,-23.973901],[-7.530907,-24.235774],[-7.707531,-24.907114],[-8.326558,-25.816506],[-9.653613,-26.792534],[-11.095047,-27.586398],[-11.965709,-28.227994],[-12.393967,-28.963954],[-12.508193,-30.040906],[-12.508193,-35.418367],[-12.429966,-35.858932],[-12.226254,-36.158029],[-11.818650,-36.286016],[-11.412067,-36.134183],[-11.210601,-35.817674],[-11.135642,-35.362812],[-11.135642,-30.022932],[-7.531060,-30.022932],[-7.524524,-36.295820],[-7.560140,-36.747669],[-7.977343,-37.740267],[-8.474520,-38.269214],[-9.241669,-38.729188],[-10.336981,-39.052138],[-11.818650,-39.170008],[-13.300248,-39.040036],[-14.395375,-38.709581],[-15.162262,-38.245776],[-15.659139,-37.715757],[-16.075781,-36.725610],[-16.111141,-36.276212],[-16.111141,-28.882407],[-16.083236,-28.520019],[-15.874417,-27.635264],[-15.297031,-26.531759],[-14.811484,-25.992855],[-14.163425,-25.513120],[-11.911583,-24.310299],[-11.330929,-23.718769],[-11.134008,-22.777821],[-11.134008,-15.758200],[-11.191198,-15.209996],[-11.390442,-14.837242],[-11.817016,-14.676498],[-12.226688,-14.732181],[-12.430170,-14.905053],[-12.506559,-15.813755],[-12.506559,-23.488606],[-12.506559,-23.488606]];

module poly_path114(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path114_0_points);
  }
}

polygon14_0_points = [[0.052288,-45.518059],[0.001634,-45.518059],[-12.526167,-45.518059],[-10.475510,-44.369364],[0.001634,-44.369364],[0.052288,-44.369364],[10.529432,-44.369364],[12.580089,-45.518059],[0.052288,-45.518059]];

module poly_polygon14(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon14_0_points);
  }
}

polygon44_0_points = [[15.531075,32.857905],[6.300665,45.552373],[-5.906874,45.552373],[-15.137283,32.857905],[-10.756556,25.874232],[-8.285963,33.527841],[8.679755,33.527841],[11.150348,25.874232],[15.531075,32.857905]];

module poly_polygon44(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon44_0_points);
  }
}

path12_0_points = [[-41.768052,-0.318628],[-43.696161,-0.318628],[-43.266855,4.679090],[-42.290521,9.500375],[-40.798867,14.113557],[-38.823602,18.486963],[-36.396438,22.588922],[-33.549083,26.387764],[-30.313246,29.851816],[-26.720638,32.949408],[-25.750048,31.272935],[-29.137450,28.318151],[-32.188071,25.020114],[-34.872423,21.408428],[-37.161018,17.512696],[-39.024366,13.362521],[-40.432980,8.987507],[-41.357372,4.417256],[-41.768052,-0.318628],[-41.768052,-0.318628]];

module poly_path12(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path12_0_points);
  }
}

polygon46_0_points = [[6.292495,18.462453],[3.915040,25.557238],[-3.810465,25.557238],[-6.189554,18.462453],[0.052288,8.138904],[6.292495,18.462453]];

module poly_polygon46(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon46_0_points);
  }
}

path8_0_points = [[41.856288,-3.433013],[43.795834,-3.032685],[43.538495,-6.554664],[43.007268,-9.993786],[42.213153,-13.339076],[41.167153,-16.579560],[39.880266,-19.704264],[38.363494,-22.702213],[36.627837,-25.562434],[34.684297,-28.273950],[32.543874,-30.825789],[30.217569,-33.206976],[27.716381,-35.406536],[25.051313,-37.413495],[22.233365,-39.216878],[19.273538,-40.805712],[16.182831,-42.169022],[12.972247,-43.295833],[12.312115,-41.488640],[15.364611,-40.426186],[18.304428,-39.140287],[21.121256,-37.641224],[23.804783,-35.939278],[26.344698,-34.044729],[28.730689,-31.967856],[30.952444,-29.718940],[32.999654,-27.308262],[34.862005,-24.746102],[36.529187,-22.042739],[37.990888,-19.208454],[39.236798,-16.253528],[40.256604,-13.188241],[41.039995,-10.022872],[41.576660,-6.767703],[41.856288,-3.433013],[41.856288,-3.433013]];

module poly_path8(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path8_0_points);
  }
}

polygon48_0_points = [[-0.833335,-8.738579],[-0.833335,6.588248],[-16.091534,31.418360],[-29.009858,39.129159],[-0.833335,-8.738579]];

module poly_polygon48(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon48_0_points);
  }
}

path106_0_points = [[46.125904,-1.383990],[18.156897,-1.383990],[19.926508,-5.444455],[22.131833,-5.341488],[27.991883,-4.831504],[31.936941,-4.329624],[36.369094,-3.612880],[41.146147,-2.643569],[46.125904,-1.383990],[46.125904,-1.383990]];

module poly_path106(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path106_0_points);
  }
}

polyline96_0_points = [[-17.271274,0.035948],[-19.686312,0.035948],[-17.934674,4.478767],[-13.302313,4.478767],[-14.256563,2.145429],[-16.352972,2.109481],[-17.271274,0.035948]];

module poly_polyline96(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polyline96_0_points);
  }
}

polygon50_0_points = [[1.022878,-8.738579],[1.022878,6.588248],[16.281076,31.418360],[29.197767,39.129159],[1.022878,-8.738579]];

module poly_polygon50(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon50_0_points);
  }
}

path108_0_points = [[-17.225523,-22.279454],[-19.531287,-20.092767],[-20.752873,-18.743142],[-21.769649,-17.374216],[-22.001063,-17.242067],[-22.238604,-17.361144],[-28.197765,-25.740244],[-28.168354,-26.101356],[-26.089918,-28.207569],[-25.750048,-28.256589],[-17.225523,-23.534358],[-17.225523,-24.601353],[-14.803949,-24.601353],[-15.384016,-25.018021],[-15.906893,-24.669981],[-21.379125,-31.473915],[-19.434677,-32.766401],[-17.225523,-29.518029],[-17.225523,-35.553988],[-19.363846,-34.383074],[-21.416030,-33.082365],[-23.376514,-31.657407],[-25.239733,-30.113746],[-27.000126,-28.456929],[-28.652130,-26.692500],[-30.190182,-24.826006],[-31.608720,-22.862992],[-32.902181,-20.809005],[-34.065002,-18.669590],[-35.091622,-16.450293],[-35.976477,-14.156660],[-36.714005,-11.794236],[-37.298643,-9.368568],[-37.724829,-6.885201],[-37.987000,-4.349681],[-30.948996,-5.503891],[-25.227172,-6.142168],[-24.763252,-8.242139],[-24.130407,-10.273406],[-23.336486,-12.228232],[-22.389339,-14.098883],[-21.296819,-15.877621],[-20.066776,-17.556712],[-18.707060,-19.128419],[-17.225523,-20.585006],[-17.225523,-22.279454],[-17.225523,-22.279454],[-23.531090,-28.534367],[-22.085009,-29.743520],[-21.730433,-29.714108],[-17.697746,-25.016387],[-17.741863,-24.964099],[-23.511482,-28.299073],[-23.531090,-28.534367],[-23.531090,-28.534367],[-29.416722,-22.071937],[-28.366066,-23.634031],[-28.129138,-23.638933],[-24.187954,-18.274544],[-24.235340,-18.225524],[-29.349728,-21.722263],[-29.416722,-22.071937],[-29.416722,-22.071937],[-36.697781,-5.138899],[-36.318696,-7.893806],[-28.219007,-6.513084],[-36.697781,-5.138899],[-36.697781,-5.138899],[-27.465738,-7.655243],[-36.109545,-8.980409],[-35.526211,-11.379106],[-27.086652,-9.156880],[-27.465738,-7.655243],[-27.465738,-7.655243],[-26.759854,-10.215705],[-35.212485,-12.441200],[-34.431437,-14.676498],[-26.308873,-11.488584],[-26.759854,-10.215705],[-26.759854,-10.215705],[-25.821944,-12.679762],[-33.951044,-15.869311],[-32.965748,-17.985328],[-25.163446,-14.083360],[-25.821944,-12.679762],[-25.821944,-12.679762],[-24.416713,-15.470617],[-32.227185,-19.375853],[-31.045810,-21.348079],[-23.697757,-16.651992],[-24.416713,-15.470617],[-24.416713,-15.470617]];
path108_0_paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46],
				[47,48,49,50,51,52,53,54],
				[55,56,57,58,59,60,61,62],
				[63,64,65,66,67],
				[68,69,70,71,72,73],
				[74,75,76,77,78,79],
				[80,81,82,83,84,85],
				[86,87,88,89,90,91]];

module poly_path108(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path108_0_points, path108_0_paths);
  }
}

polygon52_0_points = [[-16.053952,-7.264720],[-3.062097,-7.264720],[-10.457536,5.116023],[-16.053952,-7.264720]];

module poly_polygon52(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon52_0_points);
  }
}

path110_0_points = [[12.119304,-34.805621],[12.119304,-34.784379],[12.119304,-34.805621],[12.119304,-34.805621]];

module poly_path110(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path110_0_points);
  }
}

polygon54_0_points = [[16.158527,-7.264720],[3.166673,-7.264720],[10.562111,5.116023],[16.158527,-7.264720]];

module poly_polygon54(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon54_0_points);
  }
}

polygon16_0_points = [[-12.187931,-44.565443],[-10.531066,-43.081780],[-9.323547,-39.944520],[-10.588255,-40.225566],[-12.187931,-44.565443]];

module poly_polygon16(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon16_0_points);
  }
}

path116_0_points = [[3.795759,-36.416735],[3.795759,-30.031102],[0.879087,-30.031102],[0.879087,-34.764771],[0.818833,-35.189609],[0.616448,-35.481684],[0.186275,-35.614446],[-0.153595,-35.547657],[-0.387256,-35.295282],[-0.493465,-34.746797],[-0.493465,-16.740228],[-0.429739,-16.193862],[-0.235652,-15.818581],[0.168301,-15.648722],[0.579224,-15.817993],[0.790238,-16.190390],[0.879087,-16.732058],[0.879087,-22.537624],[0.850492,-22.665892],[0.620916,-22.794160],[0.259804,-22.794160],[0.259804,-26.032729],[3.795759,-26.032729],[3.795759,-12.418324],[2.629090,-12.418324],[2.227128,-13.612771],[2.132153,-13.708155],[1.918304,-13.537607],[1.726208,-13.161304],[1.323940,-12.669346],[0.615912,-12.219360],[-0.493465,-11.968977],[-1.757637,-12.097781],[-2.794327,-12.650146],[-3.495539,-13.580882],[-3.753275,-14.844799],[-3.753275,-36.576866],[-3.734254,-36.967747],[-3.387874,-37.827685],[-2.956306,-38.286971],[-2.280156,-38.687624],[-1.305178,-38.971013],[0.022876,-39.078505],[1.349851,-38.963663],[2.324019,-38.661914],[2.999588,-38.235586],[3.430766,-37.747007],[3.776789,-36.832407],[3.795759,-36.416735],[3.795759,-36.416735]];

module poly_path116(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path116_0_points);
  }
}

polygon56_0_points = [[-20.560496,1.573532],[-21.277818,-0.281046],[-38.238634,-0.281046],[-36.977194,1.573532],[-20.560496,1.573532]];

module poly_polygon56(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon56_0_points);
  }
}

polygon18_0_points = [[12.127474,-44.565443],[10.470608,-43.081780],[9.263089,-39.944520],[10.526164,-40.225566],[12.127474,-44.565443]];

module poly_polygon18(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon18_0_points);
  }
}

polygon58_0_points = [[-19.504939,4.300662],[-20.245136,2.388893],[-38.707589,2.388893],[-37.434711,4.300662],[-19.504939,4.300662]];

module poly_polygon58(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon58_0_points);
  }
}

path22_0_points = [[12.509827,-40.124258],[12.794142,-40.119356],[11.952637,-40.385697],[11.856231,-40.101383],[12.509827,-40.124258],[12.509827,-40.124258]];

module poly_path22(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path22_0_points);
  }
}

polygon60_0_points = [[-18.442845,7.049033],[-19.189579,5.116023],[-34.563790,5.116023],[-33.248429,7.049033],[-18.442845,7.049033]];

module poly_polygon60(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon60_0_points);
  }
}

path118_0_points = [[8.601323,-36.625886],[8.601323,-14.209177],[8.650675,-13.867826],[9.056185,-13.116855],[9.513182,-12.715768],[10.204038,-12.365883],[11.177025,-12.118404],[12.480416,-12.024532],[13.774890,-12.116578],[14.724369,-12.359245],[15.381989,-12.702326],[15.800888,-13.095613],[16.135064,-13.831981],[16.151991,-14.166693],[16.151991,-23.408541],[13.235319,-23.408541],[13.235319,-16.323560],[13.174453,-15.995945],[12.981642,-15.770710],[12.576821,-15.668330],[12.160000,-15.782965],[11.940790,-16.035161],[11.841526,-16.401992],[11.841526,-34.777843],[11.939973,-35.197779],[12.151728,-35.486484],[12.550677,-35.617714],[12.945541,-35.490824],[13.148309,-35.211668],[13.233685,-34.805621],[13.233685,-29.933063],[16.150357,-29.933063],[16.150357,-36.625886],[16.130647,-37.008852],[15.794147,-37.851378],[15.377084,-38.301364],[14.724803,-38.693904],[13.785297,-38.971555],[12.506559,-39.076871],[11.216588,-38.971555],[10.247466,-38.693904],[9.553314,-38.301364],[9.088252,-37.851378],[8.661883,-37.008852],[8.601323,-36.625886],[8.601323,-36.625886]];

module poly_path118(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path118_0_points);
  }
}

polygon62_0_points = [[-17.382386,9.787600],[-18.125851,7.864394],[-34.563790,7.864394],[-33.277840,9.787600],[-17.382386,9.787600]];

module poly_polygon62(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon62_0_points);
  }
}

polygon64_0_points = [[-16.305586,12.575187],[-17.067026,10.604595],[-30.828489,10.604595],[-29.486984,12.575187],[-16.305586,12.575187]];

module poly_polygon64(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon64_0_points);
  }
}

path24_0_points = [[16.437939,-38.730465],[16.882334,-38.069056],[17.113186,-37.444106],[17.202647,-36.591572],[17.202647,-36.305624],[19.439904,-35.118361],[21.587657,-33.793361],[23.639965,-32.336540],[25.590888,-30.753811],[27.434484,-29.051089],[29.164813,-27.234289],[30.775934,-25.309325],[32.261907,-23.282111],[33.616790,-21.158562],[34.834643,-18.944592],[35.909526,-16.646116],[36.835496,-14.269047],[37.606614,-11.819302],[38.216939,-9.302793],[38.660530,-6.725436],[38.931446,-4.093145],[40.841580,-3.697719],[40.574122,-6.612610],[40.105027,-9.464578],[39.441567,-12.246380],[38.591014,-14.950779],[37.560639,-17.570532],[36.357714,-20.098399],[34.989509,-22.527141],[33.463298,-24.849516],[31.786351,-27.058284],[29.965940,-29.146204],[28.009337,-31.106037],[25.923813,-32.930541],[23.716640,-34.612476],[21.395088,-36.144602],[18.966431,-37.519679],[16.437939,-38.730465],[16.437939,-38.730465]];

module poly_path24(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path24_0_points);
  }
}

polygon66_0_points = [[-16.482057,15.303950],[-15.717350,14.093164],[-15.988592,13.390548],[-30.676528,13.390548],[-29.308879,15.303950],[-16.482057,15.303950]];

module poly_polygon66(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon66_0_points);
  }
}

polygon68_0_points = [[-27.073580,16.120945],[-25.771290,18.032714],[-18.207551,18.032714],[-16.998398,16.120945],[-27.073580,16.120945]];

module poly_polygon68(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon68_0_points);
  }
}

polygon70_0_points = [[-26.632403,18.859513],[-25.302335,20.771281],[-19.751671,20.771281],[-18.542519,18.859513],[-26.632403,18.859513]];

module poly_polygon70(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon70_0_points);
  }
}

path26_0_points = [[24.268019,-24.872596],[23.929784,-24.910178],[19.769645,-22.464095],[19.630960,-22.242893],[19.733697,-22.003309],[20.529042,-21.305187],[21.370955,-20.398731],[21.596242,-20.289458],[21.820302,-20.401999],[24.655275,-24.165078],[24.624229,-24.539262],[24.268019,-24.872596],[24.268019,-24.872596]];

module poly_path26(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path26_0_points);
  }
}

polygon72_0_points = [[-23.261482,21.596446],[-22.035989,23.509848],[-21.467361,23.509848],[-20.259842,21.596446],[-23.261482,21.596446]];

module poly_polygon72(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon72_0_points);
  }
}

path20_0_points = [[-17.225523,-36.251702],[-17.104607,-37.220862],[-16.815595,-37.956439],[-16.263102,-38.735367],[-16.215717,-38.782753],[-18.754865,-37.576610],[-21.194012,-36.205082],[-23.525832,-34.675467],[-25.743002,-32.995058],[-27.838197,-31.171152],[-29.804092,-29.211043],[-31.633365,-27.122029],[-33.318690,-24.911403],[-34.852743,-22.586462],[-36.228201,-20.154501],[-37.437738,-17.622815],[-38.474031,-14.998701],[-39.329755,-12.289453],[-39.997586,-9.502367],[-40.470200,-6.644738],[-40.740273,-3.723863],[-38.828504,-4.132361],[-38.556542,-6.752869],[-38.113439,-9.318827],[-37.505062,-11.824395],[-36.737278,-14.263737],[-35.815953,-16.631014],[-34.746954,-18.920388],[-33.536147,-21.126022],[-32.189399,-23.242078],[-30.712576,-25.262718],[-29.111546,-27.182103],[-27.392174,-28.994397],[-25.560327,-30.693762],[-23.621872,-32.274359],[-21.582675,-33.730350],[-19.448603,-35.055899],[-17.225523,-36.245166],[-17.225523,-36.251702],[-17.225523,-36.251702]];

module poly_path20(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path20_0_points);
  }
}

polyline100_0_points = [[17.437941,0.035948],[19.852978,0.035948],[18.101341,4.478767],[13.468980,4.478767],[14.424864,2.145429],[16.519639,2.109481],[17.437941,0.035948]];

module poly_polyline100(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polyline100_0_points);
  }
}

polygon74_0_points = [[-21.877492,24.287627],[-22.362787,25.258217],[-22.593180,25.258217],[-23.261482,24.287627],[-21.877492,24.287627]];

module poly_polygon74(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon74_0_points);
  }
}

polygon76_0_points = [[20.880758,1.573532],[21.598080,-0.281046],[38.558896,-0.281046],[37.295822,1.573532],[20.880758,1.573532]];

module poly_polygon76(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon76_0_points);
  }
}

polygon78_0_points = [[19.825201,4.300662],[20.563764,2.388893],[39.027851,2.388893],[37.753339,4.300662],[19.825201,4.300662]];

module poly_polygon78(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon78_0_points);
  }
}

polygon80_0_points = [[18.763107,7.049033],[19.509841,5.116023],[34.884053,5.116023],[33.568691,7.049033],[18.763107,7.049033]];

module poly_polygon80(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon80_0_points);
  }
}

polygon82_0_points = [[17.702648,9.787600],[18.446113,7.864394],[34.884053,7.864394],[33.598102,9.787600],[17.702648,9.787600]];

module poly_polygon82(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon82_0_points);
  }
}

polygon92_0_points = [[23.581744,21.596446],[22.356251,23.509848],[21.787623,23.509848],[20.578470,21.596446],[23.581744,21.596446]];

module poly_polygon92(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(polygon92_0_points);
  }
}

module sgc_logo_silhoutte()
{
    poly_path4(height, width);
}


// The shapes
//poly_polygon94(height, width);
//poly_polygon84(height, width);
//poly_path28(height, width);
//poly_polygon86(height, width);
//poly_polygon30(height, width);
//poly_polygon88(height, width);
//poly_path112(height, width);
//poly_polygon32(height, width);
//poly_polygon90(height, width);
//poly_polygon34(height, width);
//poly_path10(height, width);
//poly_polyline36(height, width);
//poly_polygon38(height, width);
//poly_polygon102(height, width);
//poly_path6(height, width);
//poly_polygon40(height, width);
//poly_path104(height, width);
//poly_polygon98(height, width);
//poly_polygon42(height, width);
//poly_path114(height, width);
//poly_polygon14(height, width);
//poly_polygon44(height, width);
//poly_path12(height, width);
//poly_polygon46(height, width);
//poly_path8(height, width);
//poly_polygon48(height, width);
//poly_path106(height, width);
//poly_polyline96(height, width);
//poly_polygon50(height, width);
//poly_path108(height, width);
//poly_polygon52(height, width);
//poly_path110(height, width);
//poly_polygon54(height, width);
//poly_polygon16(height, width);
//poly_path116(height, width);
//poly_polygon56(height, width);
//poly_polygon18(height, width);
//poly_polygon58(height, width);
//poly_path22(height, width);
//poly_polygon60(height, width);
//poly_path118(height, width);
//poly_polygon62(height, width);
//poly_polygon64(height, width);
//poly_path24(height, width);
//poly_polygon66(height, width);
//poly_polygon68(height, width);
//poly_polygon70(height, width);
//poly_path26(height, width);
//poly_polygon72(height, width);
//poly_path20(height, width);
//poly_polyline100(height, width);
//poly_polygon74(height, width);
//poly_polygon76(height, width);
//poly_polygon78(height, width);
//poly_polygon80(height, width);
//poly_polygon82(height, width);
//poly_polygon92(height, width);
