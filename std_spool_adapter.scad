$fn = 360;

// radius of mount
r_mount = 11;

// radius of spool
r_spool = 38/2;

// thickness of adapter
t_adapter = 8;

// how much lip to contain spool on adapter, added to adapter thickness
dr_lip = 2;

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
  translate([0, 0, dr_lip]) {
    cylinder(h = t_adapter+dr_lip, r = r_mount, center = true);
  }

  // center hole
  cylinder(h = 2*t_adapter+dr_lip, r = r_mount-dr_lip, center = true);

  hole();
  mirror([1, 0, 0]) {
    hole();
  }
}

module hole() {
  translate([r_mount/2+r_spool/2, 0, 0]) {
    cylinder(h = 2*r_mount+dr_lip, r = 2, center = true);
  }
}
