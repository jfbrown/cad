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
module DINISO7090(key="M3", part_mode="default"){
	check_parameter_type("DINISO7090","key",key,"Table Index");

	measures_0 = plainwasherchamfered_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINISO7090, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer with chamfer ","DINISO7090"," - ",key,""));
		}
		cube();
	} else {
		washer2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINISO7090_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherchamfered_table_0(key)[0],"mm")]];

module DINISO7091(key="M10", part_mode="default"){
	check_parameter_type("DINISO7091","key",key,"Table Index");

	measures_0 = plainwasher2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINISO7091, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINISO7091"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINISO7091_dims(key="M10", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher2_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher2_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher2_table_0(key)[0],"mm")]];

module DINISO7092(key="M3", part_mode="default"){
	check_parameter_type("DINISO7092","key",key,"Table Index");

	measures_0 = plainwasherforcheesehead_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINISO7092, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINISO7092"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINISO7092_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[0],"mm")]];

module DINISO10642(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINISO10642","key",key,"Table Index");
	check_parameter_type("DINISO10642","l",l,"Length (mm)");

	measures_0 = hexsocketcountersunk_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINISO10642, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket countersunk head screw ","DINISO10642"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), convert_to_default_unit(measures_0[7],"mm"), convert_to_default_unit(measures_0[9],"mm"), convert_to_default_unit(measures_0[10],"mm"), l);
	}
}

function DINISO10642_dims(key="M3", l=20, part_mode="default") = [
	["b2", convert_to_default_unit(hexsocketcountersunk_table_0(key)[3],"mm")],
	["h_max", convert_to_default_unit(hexsocketcountersunk_table_0(key)[10],"mm")],
	["l", l],
	["L", convert_to_default_unit(hexsocketcountersunk_table_0(key)[9],"mm")],
	["k_max", convert_to_default_unit(hexsocketcountersunk_table_0(key)[5],"mm")],
	["s", convert_to_default_unit(hexsocketcountersunk_table_0(key)[6],"mm")],
	["t", convert_to_default_unit(hexsocketcountersunk_table_0(key)[7],"mm")],
	["key", key],
	["b3", convert_to_default_unit(hexsocketcountersunk_table_0(key)[4],"mm")],
	["alpha", hexsocketcountersunk_table_0(key)[8]],
	["d1", convert_to_default_unit(hexsocketcountersunk_table_0(key)[0],"mm")],
	["d2", convert_to_default_unit(hexsocketcountersunk_table_0(key)[1],"mm")],
	["b1", convert_to_default_unit(hexsocketcountersunk_table_0(key)[2],"mm")]];

