d_small = 6.65;
d_large = 12.45;
t = 2;

l_count = 4;
s_count = 4;
spacing = 10+d_large;

difference() {
  cube([3*spacing, (l_count+1)*spacing, t]);
  for (x=[spacing : spacing : s_count*spacing]) {
    translate([2*spacing, x, -t/2]) switch_hole(d_small/2, 2*t);
  }
  for (x=[spacing : spacing : l_count*spacing]) {
    translate([spacing, x, -t/2]) switch_hole(d_large/2, 2*t);
  }
}

module switch_hole(r_hole, height) {
  d_key = r_hole/5;

  difference() {
    cylinder(r = r_hole, h = height, $fn = 60);
    translate([r_hole, 0, height/2]) cube([d_key, d_key, 2*height], center=true);
  }
}
