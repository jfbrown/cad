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
include <tables/nominalpipesize_table.scad>
include <tables/hexagonnut3_table.scad>
module ANSI_B36_10M(nps="NPS 1/2", sched="40", l=50, part_mode="default"){
	check_parameter_type("ANSI B36.10M","nps",nps,"Table Index");
	check_parameter_type("ANSI B36.10M","sched",sched,"Table Index");
	check_parameter_type("ANSI B36.10M","l",l,"Length (in)");

	measures_0 = nominalpipesize_table_0(nps);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ANSI B36.10M, table 0");
	}
	measures2d_0 = nominalpipesize_table2d_0(nps,sched);
	if(measures2d_0 == "Error"){
		BOLTS_error("Table look-up failed in ANSI B36.10M, table2d 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("",nps," ",sched," Length: ",l,""));
		}
		cube();
	} else {
		pipe_wall(convert_to_default_unit(measures_0[0],"in"), convert_to_default_unit(measures2d_0,"in"), l);
	}
}

function ANSI_B36_10M_dims(nps="NPS 1/2", sched="40", l=50, part_mode="default") = [
	["wall", convert_to_default_unit(nominalpipesize_table2d_0(nps,sched),"in")],
	["od", convert_to_default_unit(nominalpipesize_table_0(nps)[0],"in")],
	["sched", sched],
	["l", l],
	["nps", nps]];

module ANSI_B18_2_2(key="3/8 in", part_mode="default"){
	check_parameter_type("ANSI B18.2.2","key",key,"Table Index");

	measures_0 = hexagonnut3_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ANSI B18.2.2, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon nut ","ANSI B18.2.2"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"in"), convert_to_default_unit(measures_0[1],"in"), convert_to_default_unit(measures_0[2],"in"));
	}
}

function ANSI_B18_2_2_dims(key="3/8 in", part_mode="default") = [
	["s", convert_to_default_unit(hexagonnut3_table_0(key)[1],"in")],
	["d1", convert_to_default_unit(hexagonnut3_table_0(key)[0],"in")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonnut3_table_0(key)[2],"in")]];

