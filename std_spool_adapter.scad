$fn = 360;

// radius of mount
r_mount = 15.1;

// radius of spool
r_spool = 56/2;

// thickness of adapter
t_adapter = 10;

// how much lip to contain spool on adapter, added to adapter thickness
dr_lip = 2;

// x-y of notch
w_notch = 2;

difference() {
  // hub
  cylinder(h = t_adapter+dr_lip, r = r_spool+dr_lip, center = true);
  // spool cyl
  translate([0, 0, dr_lip]) {
    difference() {
      cylinder(h = t_adapter+dr_lip, r = r_spool+dr_lip+1, center = true);
      cylinder(h = 2*t_adapter, r = r_spool, center = true);
    }
  }
  // mount cyl
  cylinder(h = 2*t_adapter+dr_lip, r = r_mount, center = true);
  // notch
  translate([r_mount, 0, 0]) {
    cube([w_notch*2, w_notch, 2*t_adapter+dr_lip], center = true);
  }
}
