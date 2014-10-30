$fn = 60;

include <flange_with_recess.scad>

r_rod = 10/2;
r_shaft = 20/2;
d_shaft = 10;
r_flange = 25/2;
t_flange = 2;

difference() {
  // r_flange, t_flange, r_shaft, d_shaft, r_hole = 0, r_recess = 0, d_recess = 0, fn_recess = $fn
  flange(r_flange, t_flange, r_shaft, d_shaft, r_rod, r_rod+3, 4);

  translate([0, r_flange/2, d_shaft/2]) {
    cube([r_rod, r_flange, 2*d_shaft+t_flange], center = true);
  }
}
