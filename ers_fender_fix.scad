$fn = 60;

include <flange_with_recess.scad>

id = 16/2;
od = 23;
h = 29.5/3;
t = 3;
d_bolt = 6.6;
r_bolt_head = 13.4/2;
t_bolt_head = 5;

// r_flange, t_flange, r_shaft, d_shaft, r_hole = 0, r_recess = 0, d_recess = 0, fn_recess = $fn
// flange(od/2, t, id, h, d_bolt/2, r_bolt_head, t_bolt_head, 6);
translate([od, 0, 0]) flange(od/2, t, id, h, d_bolt/2);
