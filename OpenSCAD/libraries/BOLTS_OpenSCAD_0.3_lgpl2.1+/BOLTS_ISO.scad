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
include <tables/hexscrew2_table.scad>
include <tables/hexbolt2_table.scad>
include <tables/hexagonthinnut1_table.scad>
include <tables/hexagonnut1_table.scad>
include <tables/plainwasher1_table.scad>
include <tables/plainwasherchamfered_table.scad>
include <tables/hexsocketcountersunk_table.scad>
include <tables/hexsocketheadcap_table.scad>
module ISO4017(key="M3", l=20, part_mode="default"){
	check_parameter_type("ISO4017","key",key,"Table Index");
	check_parameter_type("ISO4017","l",l,"Length (mm)");

	measures_0 = hexscrew2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO4017, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head screw ","ISO4017"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"), l);
	}
}

function ISO4017_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexscrew2_table_0(key)[3],"mm")],
	["h", convert_to_default_unit(hexscrew2_table_0(key)[4],"mm")],
	["k", convert_to_default_unit(hexscrew2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexscrew2_table_0(key)[2],"mm")],
	["key", key],
	["d1", convert_to_default_unit(hexscrew2_table_0(key)[0],"mm")]];

module ISO4014(key="M3", l=20, part_mode="default"){
	check_parameter_type("ISO4014","key",key,"Table Index");
	check_parameter_type("ISO4014","l",l,"Length (mm)");

	measures_0 = hexbolt2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO4014, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head bolt ","ISO4014"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), l);
	}
}

function ISO4014_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexbolt2_table_0(key)[6],"mm")],
	["key", key],
	["k", convert_to_default_unit(hexbolt2_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexbolt2_table_0(key)[2],"mm")],
	["b1", convert_to_default_unit(hexbolt2_table_0(key)[3],"mm")],
	["b2", convert_to_default_unit(hexbolt2_table_0(key)[4],"mm")],
	["b3", convert_to_default_unit(hexbolt2_table_0(key)[5],"mm")],
	["d1", convert_to_default_unit(hexbolt2_table_0(key)[0],"mm")]];

module ISO4035(key="M3", part_mode="default"){
	check_parameter_type("ISO4035","key",key,"Table Index");

	measures_0 = hexagonthinnut1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO4035, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon thin nut ","ISO4035"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO4035_dims(key="M3", part_mode="default") = [
	["e_min", convert_to_default_unit(hexagonthinnut1_table_0(key)[3],"mm")],
	["s", convert_to_default_unit(hexagonthinnut1_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexagonthinnut1_table_0(key)[0],"mm")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm")]];

module ISO4032(key="M3", part_mode="default"){
	check_parameter_type("ISO4032","key",key,"Table Index");

	measures_0 = hexagonnut1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO4032, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon nut ","ISO4032"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO4032_dims(key="M3", part_mode="default") = [
	["e_min", convert_to_default_unit(hexagonnut1_table_0(key)[3],"mm")],
	["s", convert_to_default_unit(hexagonnut1_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexagonnut1_table_0(key)[0],"mm")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonnut1_table_0(key)[2],"mm")]];

module ISO104(key="51200", part_mode="default"){
	check_parameter_type("ISO104","key",key,"Table Index");

	measures_0 = axialthrustbearing_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO104, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Axial thrust bearing ","ISO104"," ",key,""));
		}
		cube();
	} else {
		axialthrustbearing(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"));
	}
}

function ISO104_dims(key="51200", part_mode="default") = [
	["D_w", convert_to_default_unit(axialthrustbearing_table_0(key)[3],"mm")],
	["d_w", convert_to_default_unit(axialthrustbearing_table_0(key)[0],"mm")],
	["r_fillet", convert_to_default_unit(axialthrustbearing_table_0(key)[5],"mm")],
	["D_g", convert_to_default_unit(axialthrustbearing_table_0(key)[2],"mm")],
	["T", convert_to_default_unit(axialthrustbearing_table_0(key)[4],"mm")],
	["key", key],
	["d_g", convert_to_default_unit(axialthrustbearing_table_0(key)[1],"mm")]];

module ISO7089(key="M3", part_mode="default"){
	check_parameter_type("ISO7089","key",key,"Table Index");

	measures_0 = plainwasher1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO7089, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","ISO7089"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO7089_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher1_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher1_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher1_table_0(key)[0],"mm")]];

module ISO7090(key="M3", part_mode="default"){
	check_parameter_type("ISO7090","key",key,"Table Index");

	measures_0 = plainwasherchamfered_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO7090, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer with chamfer ","ISO7090"," - ",key,""));
		}
		cube();
	} else {
		washer2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO7090_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherchamfered_table_0(key)[0],"mm")]];

module ISO7091(key="M10", part_mode="default"){
	check_parameter_type("ISO7091","key",key,"Table Index");

	measures_0 = plainwasher2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO7091, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","ISO7091"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO7091_dims(key="M10", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher2_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher2_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher2_table_0(key)[0],"mm")]];

module ISO7092(key="M3", part_mode="default"){
	check_parameter_type("ISO7092","key",key,"Table Index");

	measures_0 = plainwasherforcheesehead_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO7092, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","ISO7092"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function ISO7092_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[0],"mm")]];

module ISO10642(key="M3", l=20, part_mode="default"){
	check_parameter_type("ISO10642","key",key,"Table Index");
	check_parameter_type("ISO10642","l",l,"Length (mm)");

	measures_0 = hexsocketcountersunk_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO10642, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket countersunk head screw ","ISO10642"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), convert_to_default_unit(measures_0[7],"mm"), convert_to_default_unit(measures_0[9],"mm"), convert_to_default_unit(measures_0[10],"mm"), l);
	}
}

function ISO10642_dims(key="M3", l=20, part_mode="default") = [
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

module ISO4762(key="M3", l=20, part_mode="default"){
	check_parameter_type("ISO4762","key",key,"Table Index");
	check_parameter_type("ISO4762","l",l,"Length (mm)");

	measures_0 = hexsocketheadcap_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ISO4762, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket head cap screw ","ISO4762"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), l);
	}
}

function ISO4762_dims(key="M3", l=20, part_mode="default") = [
	["b", convert_to_default_unit(hexsocketheadcap_table_0(key)[2],"mm")],
	["t_min", convert_to_default_unit(hexsocketheadcap_table_0(key)[5],"mm")],
	["k", convert_to_default_unit(hexsocketheadcap_table_0(key)[3],"mm")],
	["l", l],
	["L", convert_to_default_unit(hexsocketheadcap_table_0(key)[6],"mm")],
	["s", convert_to_default_unit(hexsocketheadcap_table_0(key)[4],"mm")],
	["key", key],
	["d2", convert_to_default_unit(hexsocketheadcap_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexsocketheadcap_table_0(key)[0],"mm")]];

