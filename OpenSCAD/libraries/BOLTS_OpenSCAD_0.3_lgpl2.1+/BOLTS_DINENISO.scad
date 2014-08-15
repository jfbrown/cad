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
module DINENISO4017(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINENISO4017","key",key,"Table Index");
	check_parameter_type("DINENISO4017","l",l,"Length (mm)");

	measures_0 = hexscrew2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO4017, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head screw ","DINENISO4017"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"), l);
	}
}

function DINENISO4017_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexscrew2_table_0(key)[3],"mm")],
	["h", convert_to_default_unit(hexscrew2_table_0(key)[4],"mm")],
	["k", convert_to_default_unit(hexscrew2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexscrew2_table_0(key)[2],"mm")],
	["key", key],
	["d1", convert_to_default_unit(hexscrew2_table_0(key)[0],"mm")]];

module DINENISO4014(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINENISO4014","key",key,"Table Index");
	check_parameter_type("DINENISO4014","l",l,"Length (mm)");

	measures_0 = hexbolt2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO4014, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head bolt ","DINENISO4014"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), l);
	}
}

function DINENISO4014_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexbolt2_table_0(key)[6],"mm")],
	["key", key],
	["k", convert_to_default_unit(hexbolt2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexbolt2_table_0(key)[2],"mm")],
	["b1", convert_to_default_unit(hexbolt2_table_0(key)[3],"mm")],
	["b2", convert_to_default_unit(hexbolt2_table_0(key)[4],"mm")],
	["b3", convert_to_default_unit(hexbolt2_table_0(key)[5],"mm")],
	["d1", convert_to_default_unit(hexbolt2_table_0(key)[0],"mm")]];

module DINENISO4035(key="M3", part_mode="default"){
	check_parameter_type("DINENISO4035","key",key,"Table Index");

	measures_0 = hexagonthinnut1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO4035, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon thin nut ","DINENISO4035"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINENISO4035_dims(key="M3", part_mode="default") = [
	["e_min", convert_to_default_unit(hexagonthinnut1_table_0(key)[3],"mm")],
	["s", convert_to_default_unit(hexagonthinnut1_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexagonthinnut1_table_0(key)[0],"mm")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm")]];

module DINENISO7089(key="M3", part_mode="default"){
	check_parameter_type("DINENISO7089","key",key,"Table Index");

	measures_0 = plainwasher1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO7089, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINENISO7089"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINENISO7089_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher1_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher1_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher1_table_0(key)[0],"mm")]];

module DINENISO7090(key="M3", part_mode="default"){
	check_parameter_type("DINENISO7090","key",key,"Table Index");

	measures_0 = plainwasherchamfered_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO7090, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer with chamfer ","DINENISO7090"," - ",key,""));
		}
		cube();
	} else {
		washer2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINENISO7090_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherchamfered_table_0(key)[0],"mm")]];

module DINENISO7091(key="M10", part_mode="default"){
	check_parameter_type("DINENISO7091","key",key,"Table Index");

	measures_0 = plainwasher2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO7091, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINENISO7091"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINENISO7091_dims(key="M10", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher2_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher2_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher2_table_0(key)[0],"mm")]];

module DINENISO7092(key="M3", part_mode="default"){
	check_parameter_type("DINENISO7092","key",key,"Table Index");

	measures_0 = plainwasherforcheesehead_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO7092, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DINENISO7092"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DINENISO7092_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[0],"mm")]];

module DINENISO4762(key="M3", l=20, part_mode="default"){
	check_parameter_type("DINENISO4762","key",key,"Table Index");
	check_parameter_type("DINENISO4762","l",l,"Length (mm)");

	measures_0 = hexsocketheadcap_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DINENISO4762, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket head cap screw ","DINENISO4762"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), l);
	}
}

function DINENISO4762_dims(key="M3", l=20, part_mode="default") = [
	["b", convert_to_default_unit(hexsocketheadcap_table_0(key)[2],"mm")],
	["t_min", convert_to_default_unit(hexsocketheadcap_table_0(key)[5],"mm")],
	["k", convert_to_default_unit(hexsocketheadcap_table_0(key)[3],"mm")],
	["l", l],
	["L", convert_to_default_unit(hexsocketheadcap_table_0(key)[6],"mm")],
	["s", convert_to_default_unit(hexsocketheadcap_table_0(key)[4],"mm")],
	["key", key],
	["d2", convert_to_default_unit(hexsocketheadcap_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexsocketheadcap_table_0(key)[0],"mm")]];

