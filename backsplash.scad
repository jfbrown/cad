$fn = 180;

h_bs = 50;
d_bs = 120;
l_bs = 140;
t_support = 4;
spacing = 23;

h_sink = 5.5;

union() {
  difference() {
    intersection() {
      difference() {
        union() {
          // outer cylinder
          scale([1, 1, h_bs/d_bs]) {
            translate([0, 0, d_bs]) {
              rotate([0, 90, 0]) cylinder(h = l_bs, r = d_bs);
            }
          }
          // support
          //translate([]) cube([t_support, d_bs, h_bs]);
        }
        // inner cylinder
        scale([1, 1, h_bs/d_bs]) translate([t_support/2, 0, d_bs]) {
          rotate([0, 90, 0]) cylinder(h = l_bs-t_support, r = d_bs-t_support);
        }
      }
      translate([-l_bs/2, 0, 0]) cube([2*l_bs, d_bs, h_bs]);
    }
  }
  translate([0, 0, h_bs-t_support]) {
    grid(l_x = l_bs, l_y = d_bs, l_z = h_bs+h_sink, spacing = spacing, width = t_support);
  }
}

module grid(l_x, l_y, l_z, spacing, width) {
  d = width+spacing;

  union() {
    for (x=[d/2 : d : l_x]) {
      translate([x, 0, 0]) cube([width, l_y, width]);
    }
    for (y=[d/2 : d : l_y]) {
      translate([0, y, 0]) cube([l_x, width, width]);
    }
    for (x=[d/2 : d : l_x]) {
      for (y=[d/2 : d : l_y]) {
        translate([x, y, -(l_z-width)]) cube([width, width, l_z]);
      }
    }
  }
}

