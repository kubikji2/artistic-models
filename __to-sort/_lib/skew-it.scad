// this module skew child by provided angles.
// implementation is based on: https://gist.github.com/boredzo/fde487c724a40a26fa9c

// skew takes an array of six angles:
// x along y in angles
// x along z in angles
// y along x in angles
// y along z in angles
// z along x in angles
// z along y in angles

module skew(xy=0, xz=0, yx=0, yz=0, zx=0, zy=0) {
    matrix = 
        [
            [ 1,        tan(xy),    tan(xz),    0 ],
            [ tan(yx),  1,          tan(yz),    0 ],
            [ tan(zx),  tan(zy),    1,          0 ],
            [ 0,        0,          0,          1 ]
        ];
    multmatrix(matrix)
    children();
}

// todo module for computing skew as done manually in cover-names 