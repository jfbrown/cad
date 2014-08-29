r_rod = 6;
r_zaxes = (81.6 - 2*r_rod)/2;
thickness = 3;
w_spool = 80;
h_mount = 2*r_rod;
r_spool = 220/2;
h_spool = 100;

difference() {
  union() {
    hull() {
      z_rod(r_rod+thickness);
      mirror([0, 1, 0]) {
        z_rod(r_rod+thickness);
      }
    }

    // arms
    arm(x = h_spool/2, w_spool, r = r_rod);
    mirror([1, 0, 0]) {
      arm(w_spool/2, w_spool, r = r_rod);
    }
  }
  translate([0, 0, -thickness]) {
    #z_rod(r_rod);
    #mirror([0, 1, 0]) {
      z_rod(r_rod);
    }
  }
  translate([0, 0, r_spool]) {
    rotate([0, 90, 0]) {
      #cylinder(h = h_spool, r = r_spool, center = true);
    }
  }
}

module z_rod(r) {
  translate([0, r_zaxes, 0])
  cylinder(h = h_mount, r = r, center = true);
}

module arm(x, z, r) {
  hull() {
    translate([x/2, 0, 0]) {
      rotate([0, 90, 0]) {
        cylinder(h = x, r = r, center = true);
      }
    }
    translate([x, 0, 0]) {
      sphere(r);
    }
    translate([w_spool/2, 0, w_spool/2]) {
      cylinder(h = w_spool, r = r_rod, center = true);
    }
  }
}
