
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


path4_0_points = [[-321.600000,-1037.779688],[-337.200000,-948.479687],[-347.975000,-886.992188],[-351.431250,-868.000000],[-352.900000,-860.679688],[-354.376562,-859.725000],[-357.737500,-858.067188],[-362.504688,-855.940625],[-368.200000,-853.579687],[-382.676151,-847.599185],[-397.058423,-841.378247],[-411.343173,-834.919601],[-425.526758,-828.225977],[-439.605533,-821.300101],[-453.575854,-814.144702],[-467.434079,-806.762509],[-481.176563,-799.156250],[-494.799661,-791.328653],[-508.299731,-783.282446],[-521.673129,-775.020358],[-534.916211,-766.545117],[-548.025333,-757.859451],[-560.996851,-748.966089],[-573.827121,-739.867758],[-586.512500,-730.567187],[-599.049344,-721.067105],[-611.434009,-711.370239],[-623.662851,-701.479318],[-635.732227,-691.397070],[-647.638492,-681.126224],[-659.378003,-670.669507],[-670.947116,-660.029648],[-682.342188,-649.209375],[-693.559573,-638.211417],[-704.595630,-627.038501],[-715.446713,-615.693356],[-726.109180,-604.178711],[-736.579385,-592.497293],[-746.853687,-580.651831],[-756.928439,-568.645053],[-766.800000,-556.479687],[-776.815472,-543.710352],[-786.610889,-530.792187],[-796.184747,-517.728711],[-805.535547,-504.523438],[-814.661786,-491.179883],[-823.561963,-477.701563],[-832.234576,-464.091992],[-840.678125,-450.354687],[-848.891107,-436.493164],[-856.872021,-422.510937],[-864.619366,-408.411523],[-872.131641,-394.198437],[-879.407343,-379.875195],[-886.444971,-365.445312],[-893.243024,-350.912305],[-899.800000,-336.279688],[-906.114398,-321.550977],[-912.184717,-306.729687],[-918.009454,-291.819336],[-923.587109,-276.823437],[-928.916180,-261.745508],[-933.995166,-246.589062],[-938.822565,-231.357617],[-943.396875,-216.054688],[-947.716595,-200.683789],[-951.780225,-185.248438],[-955.586261,-169.752148],[-959.133203,-154.198437],[-962.419550,-138.590820],[-965.443799,-122.932812],[-968.204449,-107.227930],[-970.700000,-91.479687],[-972.837500,-78.417187],[-973.723438,-73.887500],[-974.300000,-71.579688],[-975.135742,-68.247461],[-976.110938,-62.228125],[-977.177539,-53.975195],[-978.287500,-43.942188],[-980.445312,-20.350000],[-981.397070,-7.697852],[-982.200000,4.920312],[-982.626563,15.043164],[-982.931250,27.628125],[-983.175000,56.982812],[-982.931250,86.581250],[-982.626563,99.470898],[-982.200000,110.020313],[-981.160938,126.218750],[-979.812500,142.557812],[-978.107813,159.703125],[-976.000000,178.320312],[-973.800000,196.720313],[-977.800000,200.420312],[-1008.200000,228.520313],[-1026.700000,245.520313],[-1078.900000,293.920313],[-1102.500000,315.782812],[-1112.600000,325.420313],[-1112.131641,326.567383],[-1110.578125,329.571875],[-1104.675000,340.332813],[-1084.900000,375.120312],[-923.700000,654.220312],[-872.007812,743.656250],[-829.512500,816.882812],[-800.610938,866.353125],[-792.631836,879.821289],[-789.700000,884.520313],[-784.087500,882.745312],[-772.100000,878.420313],[-728.700000,862.520313],[-640.800000,830.445313],[-623.512500,824.242188],[-618.300000,822.520313],[-617.432812,822.906250],[-615.862500,823.957813],[-611.400000,827.420313],[-603.372656,833.864258],[-593.343750,841.490625],[-581.805469,849.953711],[-569.250000,858.907813],[-556.169531,868.007227],[-543.056250,876.906250],[-530.402344,885.259180],[-518.700000,892.720313],[-509.152759,898.575000],[-499.279883,904.429688],[-489.109644,910.270313],[-478.670313,916.082813],[-457.097461,927.567188],[-434.787500,938.770313],[-411.966602,949.579688],[-388.860938,959.882813],[-377.271997,964.809375],[-365.696680,969.567188],[-354.163257,974.142187],[-342.700000,978.520313],[-329.024017,983.526190],[-315.261279,988.324756],[-301.415851,992.915533],[-287.491797,997.298047],[-273.493182,1001.471820],[-259.424072,1005.436377],[-245.288531,1009.191241],[-231.090625,1012.735937],[-216.834418,1016.069989],[-202.523975,1019.192920],[-188.163361,1022.104254],[-173.756641,1024.803516],[-159.307880,1027.290228],[-144.821143,1029.563916],[-130.300494,1031.624103],[-115.750000,1033.470312],[-101.173724,1035.102069],[-86.575732,1036.518896],[-71.960089,1037.720319],[-57.330859,1038.705859],[-42.692108,1039.475043],[-28.047900,1040.027393],[-13.402301,1040.362433],[1.240625,1040.479687],[15.876813,1040.378680],[30.502197,1040.058936],[45.112714,1039.519977],[59.704297,1038.761328],[74.272882,1037.782513],[88.814404,1036.583057],[103.324799,1035.162482],[117.800000,1033.520313],[133.238232,1031.519336],[148.680859,1029.268750],[164.113525,1026.772070],[179.521875,1024.032812],[194.891553,1021.054492],[210.208203,1017.840625],[225.457471,1014.394727],[240.625000,1010.720312],[255.696436,1006.820898],[270.657422,1002.700000],[285.493604,998.361133],[300.190625,993.807812],[314.734131,989.043555],[329.109766,984.071875],[343.303174,978.896289],[357.300000,973.520313],[370.600000,968.432812],[377.300000,966.120312],[380.519141,965.164844],[385.915625,963.070312],[393.173047,959.982031],[401.975000,956.045312],[422.946875,946.207812],[446.300000,934.720312],[465.254297,924.875195],[483.709375,914.796875],[501.766016,904.420898],[519.525000,893.682812],[537.087109,882.518164],[554.553125,870.862500],[572.023828,858.651367],[589.600000,845.820312],[608.900000,831.520313],[614.100000,833.120312],[622.300000,835.720313],[679.300000,853.420313],[716.462500,864.945313],[746.800000,874.520313],[759.800000,878.520313],[779.600000,884.720313],[786.425000,886.695313],[788.712500,887.223438],[789.800000,887.320312],[793.627344,880.988696],[804.031250,863.231445],[840.800000,799.965625],[951.800000,608.107813],[1062.500000,416.156250],[1098.893750,352.773242],[1112.600000,328.520313],[1108.171875,324.539062],[1092.700000,311.445312],[1012.800000,244.720312],[974.400000,212.520313],[973.809766,211.884766],[973.390625,211.204687],[973.144922,210.294922],[973.075000,208.970312],[973.471875,204.335937],[974.600000,195.820312],[976.566455,181.165942],[978.303516,166.522852],[979.811475,151.883569],[981.090625,137.240625],[982.141260,122.586548],[982.963672,107.913867],[983.558154,93.215112],[983.925000,78.482813],[984.064502,63.709497],[983.976953,48.887695],[983.662646,34.009937],[983.121875,19.068750],[982.354932,4.056665],[981.362109,-11.033789],[980.143701,-26.210083],[978.700000,-41.479687],[976.744345,-59.154285],[974.478198,-76.757324],[971.902786,-94.285803],[969.019336,-111.736719],[965.829074,-129.107068],[962.333228,-146.393848],[958.533023,-163.594055],[954.429688,-180.704687],[950.024448,-197.722742],[945.318530,-214.645215],[940.313162,-231.469104],[935.009570,-248.191406],[929.408981,-264.809119],[923.512622,-281.319238],[917.321719,-297.718762],[910.837500,-314.004688],[904.061191,-330.174011],[896.994019,-346.223730],[889.637210,-362.150842],[881.991992,-377.952344],[874.059592,-393.625232],[865.841235,-409.166504],[857.338150,-424.573157],[848.551563,-439.842188],[839.482700,-454.970593],[830.132788,-469.955371],[820.503055,-484.793518],[810.594727,-499.482031],[800.409030,-514.017908],[789.947192,-528.398145],[779.210440,-542.619739],[768.200000,-556.679688],[753.679272,-574.448022],[738.701367,-591.895117],[723.280200,-609.009106],[707.429688,-625.778125],[691.163745,-642.190308],[674.496289,-658.233789],[657.441235,-673.896704],[640.012500,-689.167188],[622.223999,-704.033374],[604.089648,-718.483398],[585.623364,-732.505396],[566.839062,-746.087500],[547.750659,-759.217847],[528.372070,-771.884570],[508.717212,-784.075806],[488.800000,-795.779688],[475.674414,-803.094922],[461.626562,-810.614063],[446.962305,-818.184766],[431.987500,-825.654688],[417.008008,-832.871484],[402.329687,-839.682812],[388.258398,-845.936328],[375.100000,-851.479687],[371.828125,-852.892188],[369.100000,-854.304688],[367.196875,-855.529687],[366.642578,-856.013281],[366.400000,-856.379688],[360.112500,-883.817188],[345.800000,-947.479687],[325.200000,-1038.779688],[324.854077,-1039.062451],[323.735742,-1039.312109],[317.573437,-1039.720313],[303.496289,-1040.020703],[278.287500,-1040.229687],[181.607813,-1040.439063],[1.800000,-1040.479687],[-321.000000,-1040.479687],[-321.600000,-1037.779688]];

module poly_path4(h, w, res=4)  {
  scale([profile_scale, -profile_scale, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path4_0_points);
  }
}

// The shapes
poly_path4(height, width);