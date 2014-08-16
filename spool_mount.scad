ri_bearing = 4;
ro_bearing = 6;
w_bearing = 4;

r_adapter = ro_bearing+4;
w_adapter = 50;
w_notch = 2;

union() {
  difference() {
    // outer cyl
    cylinder(h = w_adapter, r = r_adapter, center = true);
    // inner cyl
    cylinder(h = w_adapter*2, r = ri_bearing+1, center = true);

    // end cut-outs
    translate([0, 0, w_adapter/2]) {
      cylinder(h = w_bearing*2, r = ro_bearing, center = true);
    }
    translate([0, 0, -w_adapter/2]) {
      cylinder(h = w_bearing*2, r = ro_bearing, center = true);
    }
  }
  translate([r_adapter, 0, 0]) {
    cube([w_notch*2, w_notch, w_adapter], center = true);
  }
}
