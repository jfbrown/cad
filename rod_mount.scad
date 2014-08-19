// rod radius
r_rod = 4;

// mounting hole radius, 1.5mm for M3 screw
r_clearance = 1.5;
// mounting hole countersink, 3mm for M3 screw
r_countersink = 3;

// width of mount
w_mount = 10;

// thickness of mount material
t_mount = 2;

difference() {
  // main shape
  hull() {
    rotate([90, 0, 0]) {
      difference() {
        cylinder(w_mount, r = r_rod+t_mount, center = true);
      }
    }
    translate([0, 0, -(r_rod+t_mount/2)]) {
      cube([4*r_countersink+2*r_rod+4*t_mount, w_mount, t_mount], center = true);
    }
  }

  // rod cutout
  rotate([90, 0, 0]) {
    cylinder(2*w_mount, r = r_rod, center = true);
  }

  // screw holes
  screw_hole();
  mirror([1, 0, 0]) {
    screw_hole();
  }
}

module screw_hole() {
  x_offset = r_rod+r_countersink+t_mount;
  translate([x_offset, 0, t_mount]) {
    cylinder(2*(r_rod+t_mount), r = r_countersink, center = true, $fn = 12);
  }
  translate([x_offset, 0, 0]) {
    cylinder(3*(r_rod+t_mount), r = r_clearance, center = true, $fn = 12);
  }
}
