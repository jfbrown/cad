// inner radius of bearing
ri_bearing = 11-4;
// outer radius of bearing
ro_bearing = 11;
// width of bearing
w_bearing = 7;

// outer radius of adapter, should be updated to be something fixed
r_adapter = 15;
// width/length of adapter, along its axis
w_adapter = 16;
// heigh/width of the notch key
w_notch = 2.05;

$fn = 120;

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
  // notch key
  translate([r_adapter, 0, 0]) {
    cube([w_notch*2, w_notch, w_adapter], center = true);
  }
}
