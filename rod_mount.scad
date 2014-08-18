// rod radius
r_rod = 4;

// mounting hole radius
r_clearance = 1;

// width of mount
w_mount = 10;

// thickness of mount material
t_mount = 2;

difference() {
  hull() {
    rotate([90, 0, 0]) {
      difference() {
        cylinder(w_mount, r = r_rod+t_mount, center = true);
      }
    }
    translate([0, 0, -(r_rod+t_mount/2)]) {
      cube([6*r_rod, w_mount, t_mount], center = true);
    }
  }
  rotate([90, 0, 0]) {
    cylinder(2*w_mount, r = r_rod, center = true);
  }
  translate([2*r_rod+t_mount, 0, t_mount]) {
    cube([2*r_rod, 2*w_mount, 2*(r_rod+t_mount)], center = true);
  }
  translate([-(2*r_rod+t_mount), 0, t_mount]) {
    cube([2*r_rod, 2*w_mount, 2*(r_rod+t_mount)], center = true);
  }
  translate([-(2*r_rod+t_mount/2), 0, -(r_rod+t_mount/2)]) {
    cylinder(2*t_mount, r = r_clearance, center = true, $fn = 12);
  }
  translate([(2*r_rod+t_mount/2), 0, -(r_rod+t_mount/2)]) {
    cylinder(2*t_mount, r = r_clearance, center = true, $fn = 12);
  }
}
