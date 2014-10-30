module tube(ir, or, h, fn=$fn) {
  difference() {
    cylinder(r=or, h=h, $fn=fn);
    cylinder(r=ir, h=2*h, $fn=fn);
  }
}
