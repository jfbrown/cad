$fn = 60;

hole_diameter = 6;
hole_depth = 6.7;

r_sphere = 0.9*hole_diameter;
t_collar = 2;
r_collar = 0.7*hole_diameter;

union() {
  difference() {
    sphere(r = r_sphere);
    translate([0, 0, -r_sphere]) cube([2*r_sphere, 2*r_sphere, r_sphere/2], center=true);
    translate([0, 0, r_sphere]) cube([2*r_sphere, 2*r_sphere, r_sphere/2], center=true);
  }
  translate([0, 0, r_sphere-r_sphere/4-1]) {
    difference() {
      cylinder(r = hole_diameter/2, h = hole_depth+1);
      translate([0, 0, hole_depth+r_sphere]) sphere(r = r_sphere);
    }
  }
}
