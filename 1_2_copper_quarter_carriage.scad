n = 1.02;

rod_dia = 16;
wall_thickness = 4;

ir = rod_dia/2*n;
or = ir+4;

l = or*2;

// difference() {
//   translate([4, 4, -8]) cube([32, 32, 16]);
//   #cylinder(h = 30, r1 = 8, r2 = 8, center = true);
//   #translate([11+8, 3.5, 0]) rotate([90, 0, 0]) {
//     cylinder(h = 7, r1 = 11, r2 = 11);
//   }
//   #translate([-3.5, 11+8, 0]) rotate([90, 0, 90]) {
//     cylinder(h = 7, r1 = 11, r2 = 11);
//   }
//   #translate([11+8, 64-3.5, 0]) rotate([90, 0, 0]) {
//     cylinder(h = 2*32, r1 = 3.5, r2 = 3.5);
//   }
//   #translate([-3.5, 11+8, 0]) rotate([90, 0, 90]) {
//     cylinder(h = 2*32, r1 = 3.5, r2 = 3.5);
//   }
//   #translate([0, 0, -16]) cube([32, 32, 32]);
// }

// difference() {
//   cube([32, 32, 40], center = true);
//   #translate([0, 0, 8]) {
//     rotate([90, 0, 0]) cylinder(h = 64, r1 = 8, r2 = 8, center = true);
//   }
//   #translate([0, 0, -8]) {
//     rotate([0, 90, 0]) cylinder(h = 64, r1 = 8, r2 = 8, center = true);
//   }
//   #translate([16, 16, 0]) {
//     rotate(45, 0, 0) tube(10, 20, 32);
//   }
// }

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
