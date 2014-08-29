r_m3_pilot = 2.367/2;
r_m3_clearance = 1.5;

// rod radius
r_rod = 4;

// mounting hole radius, 1.5mm for M3 screw
r_clearance = r_m3_clearance+0.1;
// mounting hole countersink, 3mm for M3 screw
r_countersink = 3;

// width of mount
w_mount = 10;

// thickness of mount material
t_mount = r_rod/2;

// how thick to make end-cap. -1 for open
t_cap = -2;

// radius of set-screw pilot, currently set to M3.
r_set_screw = r_m3_pilot;

$fn = 120;


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
  translate([0, w_mount/2+t_cap, 0]) {
    rotate([90, 0, 0]) {
      cylinder(2*w_mount, r = r_rod, center = true);
    }
  }

  // screw holes
  screw_hole();
  mirror([1, 0, 0]) {
    screw_hole();
  }

  // top cut-out
  translate([0, 0, r_rod]) {
    rotate([0, 45, 0]) {
      cube([2*r_rod, 2*w_mount, 2*r_rod], center = true);
    }
  }
}

module screw_hole() {
  x_offset = r_rod+r_countersink+t_mount;
  translate([x_offset, 0, t_mount]) {
    cylinder(2*(r_rod+t_mount), r = r_countersink, center = true);
  }
  translate([x_offset, 0, 0]) {
    cylinder(3*(r_rod+t_mount), r = r_clearance, center = true);
  }
}
