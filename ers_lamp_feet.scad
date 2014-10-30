$fn = 60;

hole_diameter = 6;
hole_depth = 5.3;

include <flange_with_recess.scad>

flange(hole_diameter, 8, hole_diameter/2, hole_depth);
