// all units in mm

$h = 20;
$rod_r = 6.1;
$thickness = 2;

union() {
	difference() {
		cylinder(h = $h+$rod_r*2, r = $rod_r+$thickness);
		cylinder(h = $h, r = $rod_r);
	}
	translate([0, 0, $h+$rod_r]) {
		rotate([90, 0, 0]) {
			cylinder(h = $h, r = $rod_r);
		}
	}
}