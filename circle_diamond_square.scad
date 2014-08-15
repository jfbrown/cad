$fa = 0.01;

// segment length of circle circumference
$fs = 0.5;

r_square = 50;
r_circle = 45;
r_diamond = 40;
l_height = 3;

translate([0, 0, l_height*0.5]) {
	cube([r_square, r_square, l_height], center = true);
	#linear_extrude(height = l_height*1.5) {
		circle(r = r_circle/2);
	}
	cylinder(r = r_diamond/2, h = l_height*2.5, $fn = 4);
}
