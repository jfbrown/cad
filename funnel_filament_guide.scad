//$fn = 60;

r_filament = 1.75/2;

r_funnel = 10;
h_funnel = 10;

thickness = 2;


funnel(r_funnel, r_filament, thickness);
mirror([0, 0, 1]) {
  funnel(r_funnel, r_filament, thickness);
}

module funnel(big_r, small_r, thickness) {
  translate([0, 0, big_r/2]) {
    minkowski() {
      difference() {
        cylinder(big_r, small_r+thickness, big_r+thickness, center = true);
        cylinder(big_r+1, small_r, big_r, center = true);
      }
      sphere(r = 1);
    }
  }
}
