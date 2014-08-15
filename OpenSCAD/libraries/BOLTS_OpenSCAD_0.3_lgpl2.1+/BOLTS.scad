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
include <tables/hexscrew1_table.scad>
include <tables/hexscrew2_table.scad>
include <tables/hexbolt1_table.scad>
include <tables/hexbolt2_table.scad>
include <tables/genericpipe_table.scad>
include <tables/din11850range2_table.scad>
include <tables/nominalpipesize_table.scad>
include <tables/tslot20x20_table.scad>
include <tables/tslot20x20-1s_table.scad>
include <tables/tslot20x20-2s_table.scad>
include <tables/tslot20x20-2sa_table.scad>
include <tables/tslot20x20-3s_table.scad>
include <tables/roundBattery_table.scad>
include <tables/hexagonthinnut1_table.scad>
include <tables/hexagonthinnut2_table.scad>
include <tables/hexagonnut1_table.scad>
include <tables/hexagonnut2_table.scad>
include <tables/hexagonnut3_table.scad>
include <tables/singlerowradialbearing_table.scad>
include <tables/singlerowradialbearingimperial_table.scad>
include <tables/axialthrustbearing_table.scad>
include <tables/plainwasher1_table.scad>
include <tables/plainwasherchamfered_table.scad>
include <tables/plainwasher2_table.scad>
include <tables/plainwasherforcheesehead_table.scad>
include <tables/heavydutyplainwasher_table.scad>
include <tables/hexsocketcountersunk_table.scad>
include <tables/hexsocketheadcap_table.scad>


module DIN933(key="M3", l=20, thread_type="coarse", part_mode="default"){
	BOLTS_warning("The standard DIN933 is withdrawn.
Although withdrawn standards are often still in use,
it might be better to use its successor None instead");
	check_parameter_type("DIN933","key",key,"Table Index");
	check_parameter_type("DIN933","l",l,"Length (mm)");
	check_parameter_type("DIN933","thread_type",thread_type,"Table Index");

	measures_0 = hexscrew1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN933, table 0");
	}
	measures2d_0 = hexscrew1_table2d_0(key,thread_type);
	if(measures2d_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN933, table2d 0");
	}
	measures2d_1 = hexscrew1_table2d_1(key,thread_type);
	if(measures2d_1 == "Error"){
		BOLTS_error("Table look-up failed in DIN933, table2d 1");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head screw ","DIN933"," - ",key,"",measures2d_1," ",l,""));
		}
		cube();
	} else {
		hex1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"), l);
	}
}

function DIN933_dims(key="M3", l=20, thread_type="coarse", part_mode="default") = [
	["e", convert_to_default_unit(hexscrew1_table_0(key)[3],"mm")],
	["h", convert_to_default_unit(hexscrew1_table_0(key)[4],"mm")],
	["k", convert_to_default_unit(hexscrew1_table_0(key)[1],"mm")],
	["thread_type", thread_type],
	["l", l],
	["s", convert_to_default_unit(hexscrew1_table_0(key)[2],"mm")],
	["key", key],
	["pitch", convert_to_default_unit(hexscrew1_table2d_0(key,thread_type),"mm")],
	["pitch_name", hexscrew1_table2d_1(key,thread_type)],
	["d1", convert_to_default_unit(hexscrew1_table_0(key)[0],"mm")]];

function DIN933_conn(location,key="M3", l=20, thread_type="coarse", part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexscrew1_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexscrew1_table_0(key)[1],"mm"), l, location)[1]);

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

function ISO4017_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[1]);

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

function DINENISO4017_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[1]);

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

function DINEN24017_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexscrew2_table_0(key)[1],"mm"), l, location)[1]);

module DIN931(key="M3", l=20, part_mode="default"){
	BOLTS_warning("The standard DIN931 is withdrawn.
Although withdrawn standards are often still in use,
it might be better to use its successor DINEN24014 instead");
	check_parameter_type("DIN931","key",key,"Table Index");
	check_parameter_type("DIN931","l",l,"Length (mm)");

	measures_0 = hexbolt1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN931, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon head bolt ","DIN931"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), l);
	}
}

function DIN931_dims(key="M3", l=20, part_mode="default") = [
	["e", convert_to_default_unit(hexbolt1_table_0(key)[6],"mm")],
	["key", key],
	["k", convert_to_default_unit(hexbolt1_table_0(key)[1],"mm")],
	["l", l],
	["s", convert_to_default_unit(hexbolt1_table_0(key)[2],"mm")],
	["b1", convert_to_default_unit(hexbolt1_table_0(key)[3],"mm")],
	["b2", convert_to_default_unit(hexbolt1_table_0(key)[4],"mm")],
	["b3", convert_to_default_unit(hexbolt1_table_0(key)[5],"mm")],
	["d1", convert_to_default_unit(hexbolt1_table_0(key)[0],"mm")]];

function DIN931_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexbolt1_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexbolt1_table_0(key)[1],"mm"), l, location)[1]);

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

function ISO4014_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[1]);

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

function DINENISO4014_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[1]);

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

function DINEN24014_conn(location,key="M3", l=20, part_mode="default") = new_cs(
	origin=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[0],
	axes=hexConn(convert_to_default_unit(hexbolt2_table_0(key)[1],"mm"), l, location)[1]);

module genericpipe(od=13, id=10, l=1000, part_mode="default"){
	check_parameter_type("genericpipe","od",od,"Length (mm)");
	check_parameter_type("genericpipe","id",id,"Length (mm)");
	check_parameter_type("genericpipe","l",l,"Length (mm)");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Pipe OD ",od," ID ",id," length ",l,""));
		}
		cube();
	} else {
		pipe(id, od, l);
	}
}

function genericpipe_dims(od=13, id=10, l=1000, part_mode="default") = [
	["od", od],
	["id", id],
	["l", l]];

function genericpipe_conn(location,od=13, id=10, l=1000, part_mode="default") = new_cs(
	origin=pipeConn(l, location)[0],
	axes=pipeConn(l, location)[1]);

module DIN11850_Range_2(dn="10", l=1000, part_mode="default"){
	check_parameter_type("DIN11850 Range 2","dn",dn,"Table Index");
	check_parameter_type("DIN11850 Range 2","l",l,"Length (mm)");

	measures_0 = din11850range2_table_0(dn);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN11850 Range 2, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("DIN11850 Range 2 DN ",dn," length ",l,""));
		}
		cube();
	} else {
		pipe(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), l);
	}
}

function DIN11850_Range_2_dims(dn="10", l=1000, part_mode="default") = [
	["dn", dn],
	["od", convert_to_default_unit(din11850range2_table_0(dn)[1],"mm")],
	["l", l],
	["id", convert_to_default_unit(din11850range2_table_0(dn)[0],"mm")]];

function DIN11850_Range_2_conn(location,dn="10", l=1000, part_mode="default") = new_cs(
	origin=pipeConn(l, location)[0],
	axes=pipeConn(l, location)[1]);

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

function ANSI_B36_10M_conn(location,nps="NPS 1/2", sched="40", l=50, part_mode="default") = new_cs(
	origin=pipeConn(l, location)[0],
	axes=pipeConn(l, location)[1]);

module ASME_B36_10M(nps="NPS 1/2", sched="40", l=50, part_mode="default"){
	check_parameter_type("ASME B36.10M","nps",nps,"Table Index");
	check_parameter_type("ASME B36.10M","sched",sched,"Table Index");
	check_parameter_type("ASME B36.10M","l",l,"Length (in)");

	measures_0 = nominalpipesize_table_0(nps);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ASME B36.10M, table 0");
	}
	measures2d_0 = nominalpipesize_table2d_0(nps,sched);
	if(measures2d_0 == "Error"){
		BOLTS_error("Table look-up failed in ASME B36.10M, table2d 0");
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

function ASME_B36_10M_dims(nps="NPS 1/2", sched="40", l=50, part_mode="default") = [
	["wall", convert_to_default_unit(nominalpipesize_table2d_0(nps,sched),"in")],
	["od", convert_to_default_unit(nominalpipesize_table_0(nps)[0],"in")],
	["sched", sched],
	["l", l],
	["nps", nps]];

function ASME_B36_10M_conn(location,nps="NPS 1/2", sched="40", l=50, part_mode="default") = new_cs(
	origin=pipeConn(l, location)[0],
	axes=pipeConn(l, location)[1]);

module API_5L(nps="NPS 1/2", sched="40", l=50, part_mode="default"){
	check_parameter_type("API 5L","nps",nps,"Table Index");
	check_parameter_type("API 5L","sched",sched,"Table Index");
	check_parameter_type("API 5L","l",l,"Length (in)");

	measures_0 = nominalpipesize_table_0(nps);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in API 5L, table 0");
	}
	measures2d_0 = nominalpipesize_table2d_0(nps,sched);
	if(measures2d_0 == "Error"){
		BOLTS_error("Table look-up failed in API 5L, table2d 0");
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

function API_5L_dims(nps="NPS 1/2", sched="40", l=50, part_mode="default") = [
	["wall", convert_to_default_unit(nominalpipesize_table2d_0(nps,sched),"in")],
	["od", convert_to_default_unit(nominalpipesize_table_0(nps)[0],"in")],
	["sched", sched],
	["l", l],
	["nps", nps]];

function API_5L_conn(location,nps="NPS 1/2", sched="40", l=50, part_mode="default") = new_cs(
	origin=pipeConn(l, location)[0],
	axes=pipeConn(l, location)[1]);

module tslot20x20(l=100, detailed=false, part_mode="default"){
	check_parameter_type("tslot20x20","l",l,"Length (mm)");
	check_parameter_type("tslot20x20","detailed",detailed,"Bool");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion 20x20x",l,""));
		}
		cube();
	} else {
		tslot_20x20_base(l, detailed);
	}
}

function tslot20x20_dims(l=100, detailed=false, part_mode="default") = [
	["l", l]];

module tslot20x20_1s(l=100, detailed=false, part_mode="default"){
	check_parameter_type("tslot20x20-1s","l",l,"Length (mm)");
	check_parameter_type("tslot20x20-1s","detailed",detailed,"Bool");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion one slot 20x20x",l,""));
		}
		cube();
	} else {
		tslot_20x20_1s_base(l, detailed);
	}
}

function tslot20x20_1s_dims(l=100, detailed=false, part_mode="default") = [
	["l", l]];

module tslot20x20_2s(l=100, detailed=false, part_mode="default"){
	check_parameter_type("tslot20x20-2s","l",l,"Length (mm)");
	check_parameter_type("tslot20x20-2s","detailed",detailed,"Bool");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion two slots (opp.) 20x20x",l,""));
		}
		cube();
	} else {
		tslot_20x20_2s_base(l, detailed);
	}
}

function tslot20x20_2s_dims(l=100, detailed=false, part_mode="default") = [
	["l", l]];

module tslot20x20_2sa(l=100, detailed=false, part_mode="default"){
	check_parameter_type("tslot20x20-2sa","l",l,"Length (mm)");
	check_parameter_type("tslot20x20-2sa","detailed",detailed,"Bool");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion two slots 20x20x",l,""));
		}
		cube();
	} else {
		tslot_20x20_2sa_base(l);
	}
}

function tslot20x20_2sa_dims(l=100, detailed=false, part_mode="default") = [
	["l", l]];

module tslot20x20_3s(l=100, detailed=false, part_mode="default"){
	check_parameter_type("tslot20x20-3s","l",l,"Length (mm)");
	check_parameter_type("tslot20x20-3s","detailed",detailed,"Bool");

	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion three slots 20x20x",l,""));
		}
		cube();
	} else {
		tslot_20x20_3s_base(l, detailed);
	}
}

function tslot20x20_3s_dims(l=100, detailed=false, part_mode="default") = [
	["l", l]];

module roundBattery(T="AAA", part_mode="default"){
	check_parameter_type("roundBattery","T",T,"Table Index");

	measures_0 = roundBattery_table_0(T);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in roundBattery, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("",T," Battery"));
		}
		cube();
	} else {
		roundBatteryBase(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"));
	}
}

function roundBattery_dims(T="AAA", part_mode="default") = [
	["h", convert_to_default_unit(roundBattery_table_0(T)[0],"mm")],
	["T", T],
	["d", convert_to_default_unit(roundBattery_table_0(T)[1],"mm")]];

function roundBattery_conn(location,T="AAA", part_mode="default") = new_cs(
	origin=roundBatteryConn(convert_to_default_unit(roundBattery_table_0(T)[0],"mm"), location)[0],
	axes=roundBatteryConn(convert_to_default_unit(roundBattery_table_0(T)[0],"mm"), location)[1]);

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

function ISO4035_conn(location,key="M3", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm"), location)[1]);

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

function DINENISO4035_conn(location,key="M3", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonthinnut1_table_0(key)[2],"mm"), location)[1]);

module DIN439B(key="M3", part_mode="default"){
	BOLTS_warning("The standard DIN439B is withdrawn.
Although withdrawn standards are often still in use,
it might be better to use its successor DINENISO4035 instead");
	check_parameter_type("DIN439B","key",key,"Table Index");

	measures_0 = hexagonthinnut2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN439B, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon thin nut ","DIN439B"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN439B_dims(key="M3", part_mode="default") = [
	["e_min", convert_to_default_unit(hexagonthinnut2_table_0(key)[3],"mm")],
	["s", convert_to_default_unit(hexagonthinnut2_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexagonthinnut2_table_0(key)[0],"mm")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonthinnut2_table_0(key)[2],"mm")]];

function DIN439B_conn(location,key="M3", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonthinnut2_table_0(key)[2],"mm"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonthinnut2_table_0(key)[2],"mm"), location)[1]);

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

function ISO4032_conn(location,key="M3", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonnut1_table_0(key)[2],"mm"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonnut1_table_0(key)[2],"mm"), location)[1]);

module DIN934(key="M3", part_mode="default"){
	BOLTS_warning("The standard DIN934 is withdrawn.
Although withdrawn standards are often still in use,
it might be better to use its successor ISO4032 instead");
	check_parameter_type("DIN934","key",key,"Table Index");

	measures_0 = hexagonnut2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN934, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon nut ","DIN934"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN934_dims(key="M3", part_mode="default") = [
	["e_min", convert_to_default_unit(hexagonnut2_table_0(key)[3],"mm")],
	["s", convert_to_default_unit(hexagonnut2_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexagonnut2_table_0(key)[0],"mm")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonnut2_table_0(key)[2],"mm")]];

function DIN934_conn(location,key="M3", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonnut2_table_0(key)[2],"mm"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonnut2_table_0(key)[2],"mm"), location)[1]);

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

function ANSI_B18_2_2_conn(location,key="3/8 in", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonnut3_table_0(key)[2],"in"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonnut3_table_0(key)[2],"in"), location)[1]);

module ASME_B18_2_2(key="3/8 in", part_mode="default"){
	check_parameter_type("ASME B18.2.2","key",key,"Table Index");

	measures_0 = hexagonnut3_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in ASME B18.2.2, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Hexagon nut ","ASME B18.2.2"," - ",key,""));
		}
		cube();
	} else {
		nut1(convert_to_default_unit(measures_0[0],"in"), convert_to_default_unit(measures_0[1],"in"), convert_to_default_unit(measures_0[2],"in"));
	}
}

function ASME_B18_2_2_dims(key="3/8 in", part_mode="default") = [
	["s", convert_to_default_unit(hexagonnut3_table_0(key)[1],"in")],
	["d1", convert_to_default_unit(hexagonnut3_table_0(key)[0],"in")],
	["key", key],
	["m_max", convert_to_default_unit(hexagonnut3_table_0(key)[2],"in")]];

function ASME_B18_2_2_conn(location,key="3/8 in", part_mode="default") = new_cs(
	origin=nutConn(convert_to_default_unit(hexagonnut3_table_0(key)[2],"in"), location)[0],
	axes=nutConn(convert_to_default_unit(hexagonnut3_table_0(key)[2],"in"), location)[1]);

module DIN625_1(key="608", type="open", part_mode="default"){
	check_parameter_type("DIN625-1","key",key,"Table Index");
	check_parameter_type("DIN625-1","type",type,"Table Index");

	measures_0 = singlerowradialbearing_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN625-1, table 0");
	}
	measures_1 = singlerowradialbearing_table_1(type);
	if(measures_1 == "Error"){
		BOLTS_error("Table look-up failed in DIN625-1, table 1");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Ball bearing ","DIN625-1"," ",key,"",measures_1[0],""));
		}
		cube();
	} else {
		singlerowradialbearing(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN625_1_dims(key="608", type="open", part_mode="default") = [
	["B", convert_to_default_unit(singlerowradialbearing_table_0(key)[2],"mm")],
	["postfix", singlerowradialbearing_table_1(type)[0]],
	["type", type],
	["r_fillet", convert_to_default_unit(singlerowradialbearing_table_0(key)[3],"mm")],
	["key", key],
	["d2", convert_to_default_unit(singlerowradialbearing_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(singlerowradialbearing_table_0(key)[0],"mm")]];

module singlerowradialbearingimperial(key="RLS8", part_mode="default"){
	check_parameter_type("singlerowradialbearingimperial","key",key,"Table Index");

	measures_0 = singlerowradialbearingimperial_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in singlerowradialbearingimperial, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Ball bearing ",key,""));
		}
		cube();
	} else {
		singlerowradialbearing(convert_to_default_unit(measures_0[0],"in"), convert_to_default_unit(measures_0[1],"in"), convert_to_default_unit(measures_0[2],"in"));
	}
}

function singlerowradialbearingimperial_dims(key="RLS8", part_mode="default") = [
	["B", convert_to_default_unit(singlerowradialbearingimperial_table_0(key)[2],"in")],
	["type", open],
	["r_fillet", convert_to_default_unit(singlerowradialbearingimperial_table_0(key)[3],"in")],
	["key", key],
	["d2", convert_to_default_unit(singlerowradialbearingimperial_table_0(key)[1],"in")],
	["d1", convert_to_default_unit(singlerowradialbearingimperial_table_0(key)[0],"in")]];

module DIN711(key="51200", part_mode="default"){
	check_parameter_type("DIN711","key",key,"Table Index");

	measures_0 = axialthrustbearing_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN711, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Axial thrust bearing ","DIN711"," ",key,""));
		}
		cube();
	} else {
		axialthrustbearing(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[4],"mm"));
	}
}

function DIN711_dims(key="51200", part_mode="default") = [
	["D_w", convert_to_default_unit(axialthrustbearing_table_0(key)[3],"mm")],
	["d_w", convert_to_default_unit(axialthrustbearing_table_0(key)[0],"mm")],
	["r_fillet", convert_to_default_unit(axialthrustbearing_table_0(key)[5],"mm")],
	["D_g", convert_to_default_unit(axialthrustbearing_table_0(key)[2],"mm")],
	["T", convert_to_default_unit(axialthrustbearing_table_0(key)[4],"mm")],
	["key", key],
	["d_g", convert_to_default_unit(axialthrustbearing_table_0(key)[1],"mm")]];

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

function ISO7089_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[1]);

module EN7089(key="M3", part_mode="default"){
	check_parameter_type("EN7089","key",key,"Table Index");

	measures_0 = plainwasher1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in EN7089, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","EN7089"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function EN7089_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher1_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher1_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher1_table_0(key)[0],"mm")]];

function EN7089_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[1]);

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

function DINENISO7089_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[1]);

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

function DINEN27089_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[1]);

module DIN125A(key="M3", part_mode="default"){
	check_parameter_type("DIN125A","key",key,"Table Index");

	measures_0 = plainwasher1_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN125A, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DIN125A"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN125A_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher1_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher1_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher1_table_0(key)[0],"mm")]];

function DIN125A_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher1_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher1_table_0(key)[2],"mm"), location)[1]);

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

function ISO7090_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[1]);

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

function DINISO7090_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[1]);

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

function DINENISO7090_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[1]);

module DIN125B(key="M3", part_mode="default"){
	check_parameter_type("DIN125B","key",key,"Table Index");

	measures_0 = plainwasherchamfered_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN125B, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer with chamfer ","DIN125B"," - ",key,""));
		}
		cube();
	} else {
		washer2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN125B_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherchamfered_table_0(key)[0],"mm")]];

function DIN125B_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherchamfered_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherchamfered_table_0(key)[2],"mm"), location)[1]);

module DIN126(key="M10", part_mode="default"){
	check_parameter_type("DIN126","key",key,"Table Index");

	measures_0 = plainwasher2_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN126, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DIN126"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN126_dims(key="M10", part_mode="default") = [
	["s", convert_to_default_unit(plainwasher2_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasher2_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasher2_table_0(key)[0],"mm")]];

function DIN126_conn(location,key="M10", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[1]);

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

function DINISO7091_conn(location,key="M10", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[1]);

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

function DINENISO7091_conn(location,key="M10", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[1]);

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

function ISO7091_conn(location,key="M10", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasher2_table_0(key)[1],"mm"), convert_to_default_unit(plainwasher2_table_0(key)[2],"mm"), location)[1]);

module DIN433(key="M3", part_mode="default"){
	check_parameter_type("DIN433","key",key,"Table Index");

	measures_0 = plainwasherforcheesehead_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN433, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Plain washer ","DIN433"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN433_dims(key="M3", part_mode="default") = [
	["s", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(plainwasherforcheesehead_table_0(key)[0],"mm")]];

function DIN433_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[1]);

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

function ISO7092_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[1]);

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

function DINISO7092_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[1]);

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

function DINENISO7092_conn(location,key="M3", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(plainwasherforcheesehead_table_0(key)[1],"mm"), convert_to_default_unit(plainwasherforcheesehead_table_0(key)[2],"mm"), location)[1]);

module DIN7349(key="M10", part_mode="default"){
	check_parameter_type("DIN7349","key",key,"Table Index");

	measures_0 = heavydutyplainwasher_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN7349, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("Heavy duty plain washer ","DIN7349"," - ",key,""));
		}
		cube();
	} else {
		washer1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"));
	}
}

function DIN7349_dims(key="M10", part_mode="default") = [
	["s", convert_to_default_unit(heavydutyplainwasher_table_0(key)[2],"mm")],
	["d2", convert_to_default_unit(heavydutyplainwasher_table_0(key)[1],"mm")],
	["key", key],
	["d1", convert_to_default_unit(heavydutyplainwasher_table_0(key)[0],"mm")]];

function DIN7349_conn(location,key="M10", part_mode="default") = new_cs(
	origin=washerConn(convert_to_default_unit(heavydutyplainwasher_table_0(key)[1],"mm"), convert_to_default_unit(heavydutyplainwasher_table_0(key)[2],"mm"), location)[0],
	axes=washerConn(convert_to_default_unit(heavydutyplainwasher_table_0(key)[1],"mm"), convert_to_default_unit(heavydutyplainwasher_table_0(key)[2],"mm"), location)[1]);

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

module DIN7991(key="M3", l=20, part_mode="default"){
	check_parameter_type("DIN7991","key",key,"Table Index");
	check_parameter_type("DIN7991","l",l,"Length (mm)");

	measures_0 = hexsocketcountersunk_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN7991, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket countersunk head screw ","DIN7991"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket1(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), convert_to_default_unit(measures_0[7],"mm"), convert_to_default_unit(measures_0[9],"mm"), convert_to_default_unit(measures_0[10],"mm"), l);
	}
}

function DIN7991_dims(key="M3", l=20, part_mode="default") = [
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

module DIN912(key="M3", l=20, part_mode="default"){
	check_parameter_type("DIN912","key",key,"Table Index");
	check_parameter_type("DIN912","l",l,"Length (mm)");

	measures_0 = hexsocketheadcap_table_0(key);
	if(measures_0 == "Error"){
		BOLTS_error("Table look-up failed in DIN912, table 0");
	}
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("hex socket head cap screw ","DIN912"," - ",key," ",l,""));
		}
		cube();
	} else {
		hex_socket2(convert_to_default_unit(measures_0[0],"mm"), convert_to_default_unit(measures_0[1],"mm"), convert_to_default_unit(measures_0[2],"mm"), convert_to_default_unit(measures_0[3],"mm"), convert_to_default_unit(measures_0[4],"mm"), convert_to_default_unit(measures_0[5],"mm"), convert_to_default_unit(measures_0[6],"mm"), l);
	}
}

function DIN912_dims(key="M3", l=20, part_mode="default") = [
	["b", convert_to_default_unit(hexsocketheadcap_table_0(key)[2],"mm")],
	["t_min", convert_to_default_unit(hexsocketheadcap_table_0(key)[5],"mm")],
	["k", convert_to_default_unit(hexsocketheadcap_table_0(key)[3],"mm")],
	["l", l],
	["L", convert_to_default_unit(hexsocketheadcap_table_0(key)[6],"mm")],
	["s", convert_to_default_unit(hexsocketheadcap_table_0(key)[4],"mm")],
	["key", key],
	["d2", convert_to_default_unit(hexsocketheadcap_table_0(key)[1],"mm")],
	["d1", convert_to_default_unit(hexsocketheadcap_table_0(key)[0],"mm")]];

