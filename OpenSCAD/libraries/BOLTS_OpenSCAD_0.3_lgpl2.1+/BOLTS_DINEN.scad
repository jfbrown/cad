include <common/conf.scad>
include <common/local.scad>
include <common/common.scad>
include <common/version.scad>
include <base/nut.scad>
include <base/hex.scad>
include <base/aluminiumProfiles.scad>
include <base/pipe.scad>
include <base/washer.scad>
include <base/hex_socket.scad>
include <base/batteries.scad>
include <base/bearings.scad>
module DINEN24017(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINEN24017","key",key,"Table Index");
	check_parameter_type("DINEN24017","l",l,"Length (mm)");

	measures_0 = hexscrew2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINEN24017, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head screw ","DINEN24017"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"), l);
	}
}

function DINEN24017_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexscrew2_table_0(key)[3],"mm")],
	["h", convert_to_default_unit(hexscrew2_table_0(key)[4],"mm")],
	["k", convert_to_default_unit(hexscrew2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexscrew2_table_0(key)[2],"mm")],
	["key", key],
	["d1", convert_to_default_unit(hexscrew2_table_0(key)[0],"mm")]];

module DINEN24014(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINEN24014","key",key,"Table Index");
	check_parameter_type("DINEN24014","l",l,"Length (mm)");

	measures_0 = hexbolt2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINEN24014, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head bolt ","DINEN24014"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), l);
	}
}

function DINEN24014_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexbolt2_table_0(key)[6],"mm")],
	["key", key],
	["k", convert_to_default_unit(hexbolt2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexbolt2_table_0(key)[2],"mm")],
	["b1", convert_to_default_unit(hexbolt2_table_0(key)[3],"mm")],
	["b2", convert_to_default_unit(hexbolt2_table_0(key)[4],"mm")],
	["b3", convert_to_default_unit(hexbolt2_table_0(key)[5],"mm")],
	["d1", convert_to_default_unit(hexbolt2_table_0(key)[0],"mm")]];

module DINEN27089(key="M3", part_mode="default"){
	check_parameter_type("DINEN27089","key",key,"Table Index");

	measures_0 = plainwasher1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINEN27089, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINEN27089"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINEN27089_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher1_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher1_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher1_table_0(key)[0],"mm")]];

