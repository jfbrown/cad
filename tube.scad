module tube(ir, or, h, fn=$fn) {
  difference() {
    cylinder(r=or, h=h, $fn=fn);
    translate([0, 0, -h/2]) cylinder(r=ir, h=2*h, $fn=fn);
  }
}
