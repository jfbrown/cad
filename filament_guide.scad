$fn = 60;

ri_bearing = 2;
ro_bearing = 6;
w_bearing = 4;

r_filament = 1.75/2;

difference() {
  translate([-ro_bearing/2+1, 0, 0]) {
    difference() {
      hull() {
        translate([-ro_bearing+1.5, 0, 0]) {
          cylinder(2*w_bearing, r = ri_bearing, center = true);
        }

        translate([ro_bearing, 0, ro_bearing]) {
          rotate([0, 365/3, 0]) {
          cylinder(2*w_bearing, r = ri_bearing, center = true);
          }
        }

        translate([ro_bearing, 0, -ro_bearing]) {
          rotate([0, -365/3, 0]) {
          cylinder(2*w_bearing, r = ri_bearing, center = true);
          }
        }
      }

      translate([-ro_bearing+1.5, 0, 0]) {
        bearing(ri_bearing, ro_bearing, w_bearing);
      }

      #translate([ro_bearing, 0, ro_bearing]) {
        rotate([0, 365/3, 0]) {
          bearing(ri_bearing, ro_bearing, w_bearing);
        }
      }

      #translate([ro_bearing, 0, -ro_bearing]) {
        rotate([0, -365/3, 0]) {
          bearing(ri_bearing, ro_bearing, w_bearing);
        }
      }
    }
  }
  rotate([90, 0, 0]) {
    cylinder(20, r = 3*r_filament, center = true);
  }
}

module bearing(ri, ro, w) {
  difference() {
    cylinder(w, r = ro, center = true);
    cylinder(2*w, r = ri, center = true);
  }
}
