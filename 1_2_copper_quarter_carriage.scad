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

difference() {
  cube([32, 32, 40], center = true);
  #translate([0, 0, 8]) {
    rotate([90, 0, 0]) cylinder(h = 64, r1 = 8, r2 = 8, center = true);
  }
  #translate([0, 0, -8]) {
    rotate([0, 90, 0]) cylinder(h = 64, r1 = 8, r2 = 8, center = true);
  }
}

