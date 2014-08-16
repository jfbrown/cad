h_bracket = 15;
l_bracket = 50;
r = h_bracket/2;
r_clearance = 1;
r_pilot = r_clearance/2;
r_standoff = r_pilot*4;

dx_standoff = 2;
dz_standoff = 2;

hole_offset = 2;
h_notch = 3;
w_notch = 8;
thickness = 2;

union() {
  difference() {
    hull() {
      cube([l_bracket, r, r*2]);
      translate([0, r, r]) {
        rotate([0, 90, 0]) {
          cylinder(l_bracket, r = r);
        }
      }
    }
    translate([thickness, thickness, thickness]) {
      cube([l_bracket, r*2, r*2]);
    }
    translate([thickness*3, thickness, -r]) {
      cube([l_bracket, r*2, r*2]);
    }
    translate([thickness, thickness*4, -r]) {
      cube([l_bracket, r*2, r*2]);
    }
    translate([-thickness, r, r]) {
      rotate([0, 90, 0]) {
        cylinder(thickness, r = r_clearance, $fn = 12);
      }
    }
    translate([l_bracket/2, thickness/2, h_bracket]) {
      cube([w_notch, thickness*2, h_notch*2], center = true);
    }
    translate([thickness, thickness, -thickness/2]) {
      cube([thickness, thickness*2, thickness*2]);
    }
  }
  translate([dx_standoff, thickness/2, dz_standoff]) {
    standoff();
  }
  translate([l_bracket-dx_standoff, thickness/2, dz_standoff]) {
    standoff();
  }
  translate([dx_standoff, thickness/2, h_bracket-dz_standoff]) {
    standoff();
  }
  translate([l_bracket-dx_standoff, thickness/2, h_bracket-dz_standoff]) {
    standoff();
  }
}

module standoff() {
  rotate([90, 0, 0]) {
    difference() {
      cylinder(1.5*r_standoff+thickness/2, r = r_standoff, $fn = 20);
      translate([0, 0, -1.5*r_standoff]) {
        cylinder(3*r_standoff+thickness/2, r = r_pilot);
      }
    }
  }
}
