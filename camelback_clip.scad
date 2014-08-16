r_hose = 5;
w_strap = 15;
t_clip = 2;

cube([w_strap, w_strap, t_clip], center = true);
translate([0, 0, r_hose+t_clip/2]) {
	rotate([90, 0, 0]) {
		difference() {
			cylinder(h = w_strap, r = r_hose+t_clip, center = true);
			cylinder(h = w_strap*2, r = r_hose, center = true);
		}
	}
}


