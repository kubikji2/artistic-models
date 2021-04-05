// this file contains all constants defined by physical properties of the board-game

// includes
include<../_lib/cubepp.scad>;
include<../_lib/holespp.scad>;

// generic parameters
eps = 0.01;
eps2 = eps/2;
$fn = 90;
tol_l = 0.6;
tol_f = 0.4;
tol = 0.25;
tol_t = 0.1;

// defined parameters
wt = 2;
bt = 2;

// legacy eg. full-game parameters, duel paramateres my vary
// box inner dimensions
l_bx = 224;
l_by = 155;
l_bz = 50;
l_bd = 10;

// name tags 
ntx = 68.5;
nty = 45;

// name tags stack 
// '-> there are two stacks in total
nts = 39;

// duel name tags stack size
// '-> there are three stacks in total
nts_d = 27;

// characters parameters
ccx = 73;
ccy = 49;
ccz = 1.5;
ccs = 36;

// duel character parameters
ccs_d = 22;

// contact layout parameters
la = 68;
ls = 11.5;

// contact layout for duet variant
lx_d = 81;
ly_d = 63;
ls_d = 30; 

// hourglass parameters
hgd = 22;
hgh = 95;

