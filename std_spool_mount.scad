$fn = 360;

// radius of mount
r_bearing = 11;

// radius of spool
r_spool = 57/2;

// thickness of adapter
t_adapter = 10;

// how much lip to contain spool on adapter, added to adapter thickness
dr_lip = 2;

r_screw_pilot = 1.5;

difference() {
  // hub w/lip
  cylinder(h = t_adapter+dr_lip, r = r_spool+dr_lip, center = true);

  // spool cut-out
  translate([0, 0, dr_lip]) {
    difference() {
      cylinder(h = t_adapter+dr_lip, r = r_spool+dr_lip+1, center = true);
      cylinder(h = 2*t_adapter, r = r_spool, center = true);
    }
  }

  // bearing-stop
  cylinder(h = 2*t_adapter+dr_lip, r = r_bearing-dr_lip, center = true);

  // bearing cut-out
  translate([0, 0, -dr_lip]) {
    cylinder(h = t_adapter+dr_lip, r = r_bearing, center = true);
  }

  screw_hole();
  mirror([1, 0, 0]) {
    screw_hole();
  }
}

module screw_hole() {
  // connector screw holes
  translate([r_spool/2+r_bearing/2, 0, 0]) {
    cylinder(h = 2*t_adapter+dr_lip, r = r_screw_pilot, center = true);
  }
}
