$h = 15;
$l = 50;
$thick = 50;
$r = 7.5;
$hole_r = 1;
$hole_offset = 2;
$notch_h = 5;
$notch_w = 8;
$standoff_r = 2;

difference() {
	translate([0, $h+$thick, $h]) {
		rotate([180, 0, 0]) {
			intersection() {
				// large cylinder
				union() {
					translate([-$thick*2, $r+$thick+1, -1]) {
						cube([$thick*3, $r, $h+2]);
					}
					translate([-$thick*1.5, $r+$thick, $h/2]) {
						rotate([0, 90, 0]) {
							cylinder(h = $thick*2, r = $r);
						}
					}
				}
				// end piece
				translate([-$thick, $thick, 0]) {
					cube([$thick, $r*2, $h]);
				}
			}
			// pivot hole
			translate([-$thick*1.5, $r+$thick, $h/2]) {
				rotate([0, 90, 0]) {
					//cylinder(h = $thick*2, r = $hole_r);
				}
			}
		}
	}
	translate([-$thick-2, 2, -1]) {
		cube([$thick, $r*2, $h+2]);
	}
	translate([-3, $r, $r]) {
		rotate([0, 90, 0]) {
			cylinder(h = 4, r = 1);
		}
	}
}