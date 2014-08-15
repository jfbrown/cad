$h = 15;
$l = 50;
$thick = 2;
$r = 7.5;
$hole_r = 1;
$hole_offset = 2;
$notch_h = 5;
$notch_w = 8;
$standoff_r = 2;

difference() {
	union() {
		cube([$l, $thick, $h]);
		cube([$thick, $r+$thick, $h]);
		difference() {
			cube([$thick*3, $r+$thick, $thick]);
			cube([$thick*2, $r, $thick]);
		}
		translate([0, $r+$thick, $h/2]) {
			rotate([0, 90, 0]) {
				cylinder(h = $thick, r = $r);
			}
		}
		translate([$hole_offset, 0, $hole_offset]) {
			rotate([90, 0, 0]) {
				cylinder(h = $thick, r = $standoff_r);
			}
		}
		translate([$l-$hole_offset, 0, $h-$hole_offset]) {
			rotate([90, 0, 0]) {
				cylinder(h = $thick, r = $standoff_r);
			}
		}
		translate([$l-$hole_offset, 0, $hole_offset]) {
			rotate([90, 0, 0]) {
				cylinder(h = $thick, r = $standoff_r);
			}
		}
		translate([$hole_offset, 0, $h-$hole_offset]) {
			rotate([90, 0, 0]) {
				cylinder(h = $thick, r = $standoff_r);
			}
		}
	}
	// attachment
	translate([-$thick/2, $r+$thick, $h/2]) {
		rotate([0, 90, 0]) {
			cylinder(h = $thick*2, r = $hole_r);
		}
	}
	//board mount upper right
	translate([$l-$hole_offset, $thick*0.9, $h-$hole_offset]) {
		rotate([90, 0, 0]) {
			cylinder(h = $thick*2, r = $hole_r/2);
		}
	}
	//board mount lower left
	translate([$hole_offset, $thick*0.9, $hole_offset]) {
		rotate([90, 0, 0]) {
			cylinder(h = $thick*2, r = $hole_r/2);
		}
	}
	// top notch
	translate([$l/2-$notch_w/2, 0, $h-$notch_h/2]) {
		cube([$notch_w, $thick, $notch_h]);
	}
}