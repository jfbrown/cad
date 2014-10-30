$fn = 60;

module flange(r_flange, t_flange, r_shaft, d_shaft, r_hole = 0, r_recess = 0, d_recess = 0, fn_recess = $fn) {
  difference() {

    // outer flange/cylinder
    cylinder(h = d_shaft+t_flange, r = r_flange);

    // bolt hole
    translate([0, 0, -t_flange]) cylinder(h = 2*d_shaft+t_flange, r = r_hole);

    // donut cutter
    translate([0, 0, t_flange]) {
      difference() {
        cylinder(h = d_shaft+t_flange, r = 2*r_flange);
        cylinder(h = 2*d_shaft+t_flange, r = r_shaft);
      }
    }

    // recess
    translate([0, 0, -d_recess]) cylinder(h = 2*d_recess, r = r_recess, $fn = fn_recess);
  }
}
