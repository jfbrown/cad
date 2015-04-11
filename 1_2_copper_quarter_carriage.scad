$fn = 60;

n = 1.02;

rod_dia = 16;
bearing_od = 22;
bearing_h = 7;

clearance = 1;
bearing_clearance = 1;

// m3 shaft width
slot_width = 3;
// m3 head width
slot_clearance = 5;

wall_thickness = 4;

ir = rod_dia/2*n;
or = ir+bearing_od;
// bearing outer radius
bearing_or = bearing_od/2+bearing_clearance;

l = bearing_od;
slot_length = 0.6*or;

intersection() {
  difference() {
    cylinder(l, r = or, center = true);
    cylinder(2*l, r = ir, center = true);

    // bearings
    translate([bearing_or+ir-bearing_clearance, 0, 0]) {
      rotate([90, 0, 0]) cylinder(bearing_h, r = bearing_or, center = true);
    }
    translate([0, bearing_or+ir-bearing_clearance, 0]) {
      rotate([0, 90, 0]) cylinder(bearing_h, r = bearing_or, center = true);
    }

    // bolt slots
    translate([(or-ir)/2+ir, or/2, 0]) {
      rotate([90, 0, 0]) slot(slot_width, slot_length, or);
    }
    translate([or/2, (or-ir)/2+ir, 0]) {
      rotate([90, 0, 90]) slot(slot_width, slot_length, or);
    }

    // bolt head cut-out
    translate([ir+1, ir+1, -slot_clearance/2]) cube([or, or, slot_clearance]);

    // efficiency cut-out top/bottom
    translate([ir+1, ir+1, l/2-slot_clearance/2]) cube([or, or, slot_clearance]);
    mirror([0, 0, 1]) {
      translate([ir+1, ir+1, l/2-slot_clearance/2]) cube([or, or, slot_clearance]);
    }
  }

  // capture only 1/4 of the cylinder
  translate([clearance, clearance, -or]) cube([2*or, 2*or, 2*or]);
}

module slot(width, length, height) {
  r = width/2;

  hull() {
    translate([length/2-r, 0, 0]) cylinder(height, r = r, center = true);
    translate([-(length/2-r), 0, 0]) cylinder(height, r = r, center = true);
  }
}
