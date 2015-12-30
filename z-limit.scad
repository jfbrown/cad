$fn = 60;

difference() {
  translate([-19/2, -40, 0]) cube([19,40,3]);
  translate([3.2,-6,0]) cylinder(r = 1.2, h = 20);
  mirror() translate([3.2,-6,0]) cylinder(r = 1.2, h = 20);
  #translate([0, -20, 0]) cylinder(r = 2, h = 20);
  #translate([0, -30, 0]) cylinder(r = 2, h = 20);
}

