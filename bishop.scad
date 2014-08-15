union() {
  // head
  translate([0, 0, 120])
    difference() {
      union() {
        // teardrop shape
        sphere(r = 20);
        translate([0, 0, 20 * sin(30)])
          cylinder(h = 30, r1 = 20 * cos(30), r2 = 0);

        // dollop
        translate([0, 0, 30 + 20 * sin(30)])
          sphere(r = 6);
      }
      //cut out slot
      rotate([45, 0, 0])
        translate([-20, 0, 0])
          cube([40, 5, 40]);
    }
  // neck
  cylinder(h = 120, r1 = 18, r2 = 12);

  // base
  cylinder(h = 20, r1 = 35, r2 = 25);

  // collar
  translate([0, 0, 90])
    intersection() {
      cylinder(h = 20, r1 = 20, r2 = 0);
      translate([0, 0, 7])
        mirror([0, 0, 1])
          cylinder(h = 20, r1 = 20, r2 = 0);
    }
}