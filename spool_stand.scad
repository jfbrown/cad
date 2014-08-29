

r_rod = 4+0.5;

spool_width = 75;
r_spool = 100;

t_stand = 10;

vertical(w = r_spool, h = r_spool, t = t_stand);

module vertical(w, h, t) {
  difference() {
    // outer fram
    hull() {
      translate([0, 0, t/2]) cube([t, w, t], center = true);
      translate([0, 0, h]) rotate([0, 90, 0]) cylinder(h = t, r = t, center = true);
    }

    // inner cutout
    #translate([0, 0, h/6]) scale([2, 0.6, 0.6]) hull() {
      translate([0, 0, t/2]) cube([t, w, t], center = true);
      translate([0, 0, h]) rotate([0, 90, 0]) cylinder(h = t, r = t, center = true);
    }

    // rod hole
    #translate([0, 0, h]) rotate([0, 90, 0]) cylinder(h = 2*t, r = r_rod, center = true);
  }
}
