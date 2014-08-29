$fn = 60;

w = 17.5;
h = 7.5;

x_post = 8.3;
y_post = 7.7;
r_post = 9.2/2;

w_flange = 2.75;
w_flange_cutout = 0.8;

// distance from bottom edge of cap to catch extrusions
catch_offset = 1.75;

difference() {
  union() {
    difference() {
      keycap();
      translate([0, 0.15, -0.8]) {
        scale([0.95, 0.95, 0.95]) keycap();
      }
    }

    translate([0, -1, h/2-6.5]) {
      // post ring
      difference() {
        post();
        scale([0.8, 0.8, 1.5]) post();
        flange_cutout();
        mirror([1, 0, 0]) flange_cutout();
        translate([0, 0, -h]) {
          cube([w_flange+w_flange_cutout, 2*r_post, 2*catch_offset], center = true);
        }
      }
    }

    *translate([0, -0.8, 0]) {
      catch_extrusion();
      mirror([0, 1, 0]) catch_extrusion();
    }
  }
  top_cutout();

  // temp top flatcut
  translate([0, 0, h]) cube([2*w, 2*w, h], center = true);
}

module catch_extrusion() {
  translate([0, y_post/2-0.2, -(h-catch_offset+1)]) {
    rotate([45, 0, 0]) {
      cube([w_flange-0.2, 1, 1], center = true);
    }
  }
}

module flange_cutout() {
  translate([w_flange/2+w_flange_cutout/2, 0, -h/2])
    cube([w_flange_cutout, w, 8], center = true);
}

module post() {
  intersection() {
    cylinder(h = 2*h, r = r_post, center = true);
    cube([x_post, y_post, 2*h], center = true);
  }
}

module keycap() {
  difference() {
    cube([w, w, h], center = true);
    side_cutout();
    mirror(y =1) side_cutout();
    front_cutout();
    back_cutout();
    top_cutout();
  }
}

module side_cutout() {
  translate([w/2+0.4, -w, -h/2-1]) {
    rotate([0, -20, 0]) {
      cube([2*w, 2*w, 2*w]);
    }
  }
}

module front_cutout() {
  translate([-w, w/2+0.4, -h/2-1]) {
    rotate([30, 0, 0]) {
      cube([2*w, 2*w, 2*w]);
    }
  }
}

module back_cutout() {
  translate([-w, -(w/2+0.1+2*w), -h/2-1]) {
    rotate([-5, 0, 0]) {
      cube([2*w, 2*w, 2*w]);
    }
  }
}

module top_cutout() {
  translate([0, 0, 2*w+h/2-1]) {
    rotate([95, 0, 0]) {
      //cylinder(h = 2*w, r = 2*w, center = true);
    }
  }
}
