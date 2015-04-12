$fn = 60;

include <tube.scad>

n = 1.03;

bearing_id = 8;
bearing_h = 7;

screw_d = 3;

or = bearing_id/2/n;
ir = scrow_d/2*n;
h = bearing_h+1;

tube(ir, or, h);
