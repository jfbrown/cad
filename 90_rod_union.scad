n = 1.02;

rod_dia = 16;
wall_thickness = 2;

ir = rod_dia/2*n;
or = ir+wall_thickness;

l = or*2;

difference() {
  hull() {
    cylinder(l, r = or, center = true);
    translate([ir+or, 0, 0]) rotate([90, 0, 0]) cylinder(l, r = or, center = true);

    // bolt flanges
    translate([-or, 0, 0]) cube([ir, wall_thickness*2, l], center = true);
    translate([ir*3+wall_thickness*2, 0, 0]) rotate([90, 0, 0]) cube([ir, wall_thickness*2, l], center = true);
  }
  // bored holes
  cylinder(l*2, r = ir, center = true);
  translate([ir+or, 0, 0]) rotate([90, 0, 0]) cylinder(l*2, r = ir, center = true);

  // flange cuts
  translate([-or, 0, 0]) cube([ir*2, 1, l*2], center = true);
  translate([ir*3+wall_thickness*2, 0, 0]) rotate([90, 0, 0]) cube([ir*2, 1, l*2], center = true);
}
