d_vesa = 120;
t_stand = 4;
w_nuc = 35;

w_base = w_nuc*1.25;

difference() {
  union() {
    // vertical
    cube([t_stand, d_vesa, d_vesa], center = true);
    // base
    translate([w_base-w_nuc, 0, -d_vesa/2]) {
      cube([w_base, d_vesa, t_stand], center = true);
    }
  }
}
