# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IN_C_UNROLL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IO_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IO_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IO_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IO_AXI_USER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "I_AXI_AUSER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "I_AXI_CACHE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "I_AXI_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "I_AXI_PROT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "I_AXI_REQ_QUEUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_AUSER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_CACHE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_PROT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_REQ_QUEUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_AXI_USER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUT_C_UNROLL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "O_AXI_AUSER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "O_AXI_CACHE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "O_AXI_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "O_AXI_PROT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "O_AXI_REQ_QUEUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_AUSER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_CACHE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_PROT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_REQ_QUEUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T_AXI_USER_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to update ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to validate ID
	return true
}

proc update_PARAM_VALUE.IN_C_UNROLL { PARAM_VALUE.IN_C_UNROLL } {
	# Procedure called to update IN_C_UNROLL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IN_C_UNROLL { PARAM_VALUE.IN_C_UNROLL } {
	# Procedure called to validate IN_C_UNROLL
	return true
}

proc update_PARAM_VALUE.IO_AXI_ADDR_WIDTH { PARAM_VALUE.IO_AXI_ADDR_WIDTH } {
	# Procedure called to update IO_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IO_AXI_ADDR_WIDTH { PARAM_VALUE.IO_AXI_ADDR_WIDTH } {
	# Procedure called to validate IO_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.IO_AXI_DATA_WIDTH { PARAM_VALUE.IO_AXI_DATA_WIDTH } {
	# Procedure called to update IO_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IO_AXI_DATA_WIDTH { PARAM_VALUE.IO_AXI_DATA_WIDTH } {
	# Procedure called to validate IO_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.IO_AXI_ID_WIDTH { PARAM_VALUE.IO_AXI_ID_WIDTH } {
	# Procedure called to update IO_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IO_AXI_ID_WIDTH { PARAM_VALUE.IO_AXI_ID_WIDTH } {
	# Procedure called to validate IO_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.IO_AXI_USER_WIDTH { PARAM_VALUE.IO_AXI_USER_WIDTH } {
	# Procedure called to update IO_AXI_USER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IO_AXI_USER_WIDTH { PARAM_VALUE.IO_AXI_USER_WIDTH } {
	# Procedure called to validate IO_AXI_USER_WIDTH
	return true
}

proc update_PARAM_VALUE.I_AXI_AUSER { PARAM_VALUE.I_AXI_AUSER } {
	# Procedure called to update I_AXI_AUSER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_AXI_AUSER { PARAM_VALUE.I_AXI_AUSER } {
	# Procedure called to validate I_AXI_AUSER
	return true
}

proc update_PARAM_VALUE.I_AXI_CACHE { PARAM_VALUE.I_AXI_CACHE } {
	# Procedure called to update I_AXI_CACHE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_AXI_CACHE { PARAM_VALUE.I_AXI_CACHE } {
	# Procedure called to validate I_AXI_CACHE
	return true
}

proc update_PARAM_VALUE.I_AXI_ID { PARAM_VALUE.I_AXI_ID } {
	# Procedure called to update I_AXI_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_AXI_ID { PARAM_VALUE.I_AXI_ID } {
	# Procedure called to validate I_AXI_ID
	return true
}

proc update_PARAM_VALUE.I_AXI_PROT { PARAM_VALUE.I_AXI_PROT } {
	# Procedure called to update I_AXI_PROT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_AXI_PROT { PARAM_VALUE.I_AXI_PROT } {
	# Procedure called to validate I_AXI_PROT
	return true
}

proc update_PARAM_VALUE.I_AXI_REQ_QUEUE { PARAM_VALUE.I_AXI_REQ_QUEUE } {
	# Procedure called to update I_AXI_REQ_QUEUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_AXI_REQ_QUEUE { PARAM_VALUE.I_AXI_REQ_QUEUE } {
	# Procedure called to validate I_AXI_REQ_QUEUE
	return true
}

proc update_PARAM_VALUE.K_AXI_ADDR_WIDTH { PARAM_VALUE.K_AXI_ADDR_WIDTH } {
	# Procedure called to update K_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_ADDR_WIDTH { PARAM_VALUE.K_AXI_ADDR_WIDTH } {
	# Procedure called to validate K_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.K_AXI_AUSER { PARAM_VALUE.K_AXI_AUSER } {
	# Procedure called to update K_AXI_AUSER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_AUSER { PARAM_VALUE.K_AXI_AUSER } {
	# Procedure called to validate K_AXI_AUSER
	return true
}

proc update_PARAM_VALUE.K_AXI_CACHE { PARAM_VALUE.K_AXI_CACHE } {
	# Procedure called to update K_AXI_CACHE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_CACHE { PARAM_VALUE.K_AXI_CACHE } {
	# Procedure called to validate K_AXI_CACHE
	return true
}

proc update_PARAM_VALUE.K_AXI_DATA_WIDTH { PARAM_VALUE.K_AXI_DATA_WIDTH } {
	# Procedure called to update K_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_DATA_WIDTH { PARAM_VALUE.K_AXI_DATA_WIDTH } {
	# Procedure called to validate K_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.K_AXI_ID { PARAM_VALUE.K_AXI_ID } {
	# Procedure called to update K_AXI_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_ID { PARAM_VALUE.K_AXI_ID } {
	# Procedure called to validate K_AXI_ID
	return true
}

proc update_PARAM_VALUE.K_AXI_ID_WIDTH { PARAM_VALUE.K_AXI_ID_WIDTH } {
	# Procedure called to update K_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_ID_WIDTH { PARAM_VALUE.K_AXI_ID_WIDTH } {
	# Procedure called to validate K_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.K_AXI_PROT { PARAM_VALUE.K_AXI_PROT } {
	# Procedure called to update K_AXI_PROT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_PROT { PARAM_VALUE.K_AXI_PROT } {
	# Procedure called to validate K_AXI_PROT
	return true
}

proc update_PARAM_VALUE.K_AXI_REQ_QUEUE { PARAM_VALUE.K_AXI_REQ_QUEUE } {
	# Procedure called to update K_AXI_REQ_QUEUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_REQ_QUEUE { PARAM_VALUE.K_AXI_REQ_QUEUE } {
	# Procedure called to validate K_AXI_REQ_QUEUE
	return true
}

proc update_PARAM_VALUE.K_AXI_USER_WIDTH { PARAM_VALUE.K_AXI_USER_WIDTH } {
	# Procedure called to update K_AXI_USER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_AXI_USER_WIDTH { PARAM_VALUE.K_AXI_USER_WIDTH } {
	# Procedure called to validate K_AXI_USER_WIDTH
	return true
}

proc update_PARAM_VALUE.OUT_C_UNROLL { PARAM_VALUE.OUT_C_UNROLL } {
	# Procedure called to update OUT_C_UNROLL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUT_C_UNROLL { PARAM_VALUE.OUT_C_UNROLL } {
	# Procedure called to validate OUT_C_UNROLL
	return true
}

proc update_PARAM_VALUE.O_AXI_AUSER { PARAM_VALUE.O_AXI_AUSER } {
	# Procedure called to update O_AXI_AUSER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_AXI_AUSER { PARAM_VALUE.O_AXI_AUSER } {
	# Procedure called to validate O_AXI_AUSER
	return true
}

proc update_PARAM_VALUE.O_AXI_CACHE { PARAM_VALUE.O_AXI_CACHE } {
	# Procedure called to update O_AXI_CACHE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_AXI_CACHE { PARAM_VALUE.O_AXI_CACHE } {
	# Procedure called to validate O_AXI_CACHE
	return true
}

proc update_PARAM_VALUE.O_AXI_ID { PARAM_VALUE.O_AXI_ID } {
	# Procedure called to update O_AXI_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_AXI_ID { PARAM_VALUE.O_AXI_ID } {
	# Procedure called to validate O_AXI_ID
	return true
}

proc update_PARAM_VALUE.O_AXI_PROT { PARAM_VALUE.O_AXI_PROT } {
	# Procedure called to update O_AXI_PROT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_AXI_PROT { PARAM_VALUE.O_AXI_PROT } {
	# Procedure called to validate O_AXI_PROT
	return true
}

proc update_PARAM_VALUE.O_AXI_REQ_QUEUE { PARAM_VALUE.O_AXI_REQ_QUEUE } {
	# Procedure called to update O_AXI_REQ_QUEUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_AXI_REQ_QUEUE { PARAM_VALUE.O_AXI_REQ_QUEUE } {
	# Procedure called to validate O_AXI_REQ_QUEUE
	return true
}

proc update_PARAM_VALUE.S_AXI_ADDR_WIDTH { PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to update S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_AXI_ADDR_WIDTH { PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to validate S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.T_AXI_ADDR_WIDTH { PARAM_VALUE.T_AXI_ADDR_WIDTH } {
	# Procedure called to update T_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_ADDR_WIDTH { PARAM_VALUE.T_AXI_ADDR_WIDTH } {
	# Procedure called to validate T_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.T_AXI_AUSER { PARAM_VALUE.T_AXI_AUSER } {
	# Procedure called to update T_AXI_AUSER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_AUSER { PARAM_VALUE.T_AXI_AUSER } {
	# Procedure called to validate T_AXI_AUSER
	return true
}

proc update_PARAM_VALUE.T_AXI_CACHE { PARAM_VALUE.T_AXI_CACHE } {
	# Procedure called to update T_AXI_CACHE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_CACHE { PARAM_VALUE.T_AXI_CACHE } {
	# Procedure called to validate T_AXI_CACHE
	return true
}

proc update_PARAM_VALUE.T_AXI_DATA_WIDTH { PARAM_VALUE.T_AXI_DATA_WIDTH } {
	# Procedure called to update T_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_DATA_WIDTH { PARAM_VALUE.T_AXI_DATA_WIDTH } {
	# Procedure called to validate T_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.T_AXI_ID { PARAM_VALUE.T_AXI_ID } {
	# Procedure called to update T_AXI_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_ID { PARAM_VALUE.T_AXI_ID } {
	# Procedure called to validate T_AXI_ID
	return true
}

proc update_PARAM_VALUE.T_AXI_ID_WIDTH { PARAM_VALUE.T_AXI_ID_WIDTH } {
	# Procedure called to update T_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_ID_WIDTH { PARAM_VALUE.T_AXI_ID_WIDTH } {
	# Procedure called to validate T_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.T_AXI_PROT { PARAM_VALUE.T_AXI_PROT } {
	# Procedure called to update T_AXI_PROT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_PROT { PARAM_VALUE.T_AXI_PROT } {
	# Procedure called to validate T_AXI_PROT
	return true
}

proc update_PARAM_VALUE.T_AXI_REQ_QUEUE { PARAM_VALUE.T_AXI_REQ_QUEUE } {
	# Procedure called to update T_AXI_REQ_QUEUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_REQ_QUEUE { PARAM_VALUE.T_AXI_REQ_QUEUE } {
	# Procedure called to validate T_AXI_REQ_QUEUE
	return true
}

proc update_PARAM_VALUE.T_AXI_USER_WIDTH { PARAM_VALUE.T_AXI_USER_WIDTH } {
	# Procedure called to update T_AXI_USER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T_AXI_USER_WIDTH { PARAM_VALUE.T_AXI_USER_WIDTH } {
	# Procedure called to validate T_AXI_USER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.ID { MODELPARAM_VALUE.ID PARAM_VALUE.ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID}] ${MODELPARAM_VALUE.ID}
}

proc update_MODELPARAM_VALUE.IN_C_UNROLL { MODELPARAM_VALUE.IN_C_UNROLL PARAM_VALUE.IN_C_UNROLL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN_C_UNROLL}] ${MODELPARAM_VALUE.IN_C_UNROLL}
}

proc update_MODELPARAM_VALUE.OUT_C_UNROLL { MODELPARAM_VALUE.OUT_C_UNROLL PARAM_VALUE.OUT_C_UNROLL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUT_C_UNROLL}] ${MODELPARAM_VALUE.OUT_C_UNROLL}
}

proc update_MODELPARAM_VALUE.S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.S_AXI_ADDR_WIDTH PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.IO_AXI_ADDR_WIDTH { MODELPARAM_VALUE.IO_AXI_ADDR_WIDTH PARAM_VALUE.IO_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IO_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.IO_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.IO_AXI_DATA_WIDTH { MODELPARAM_VALUE.IO_AXI_DATA_WIDTH PARAM_VALUE.IO_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IO_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.IO_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.IO_AXI_ID_WIDTH { MODELPARAM_VALUE.IO_AXI_ID_WIDTH PARAM_VALUE.IO_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IO_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.IO_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.IO_AXI_USER_WIDTH { MODELPARAM_VALUE.IO_AXI_USER_WIDTH PARAM_VALUE.IO_AXI_USER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IO_AXI_USER_WIDTH}] ${MODELPARAM_VALUE.IO_AXI_USER_WIDTH}
}

proc update_MODELPARAM_VALUE.I_AXI_ID { MODELPARAM_VALUE.I_AXI_ID PARAM_VALUE.I_AXI_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_AXI_ID}] ${MODELPARAM_VALUE.I_AXI_ID}
}

proc update_MODELPARAM_VALUE.I_AXI_PROT { MODELPARAM_VALUE.I_AXI_PROT PARAM_VALUE.I_AXI_PROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_AXI_PROT}] ${MODELPARAM_VALUE.I_AXI_PROT}
}

proc update_MODELPARAM_VALUE.I_AXI_CACHE { MODELPARAM_VALUE.I_AXI_CACHE PARAM_VALUE.I_AXI_CACHE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_AXI_CACHE}] ${MODELPARAM_VALUE.I_AXI_CACHE}
}

proc update_MODELPARAM_VALUE.I_AXI_AUSER { MODELPARAM_VALUE.I_AXI_AUSER PARAM_VALUE.I_AXI_AUSER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_AXI_AUSER}] ${MODELPARAM_VALUE.I_AXI_AUSER}
}

proc update_MODELPARAM_VALUE.I_AXI_REQ_QUEUE { MODELPARAM_VALUE.I_AXI_REQ_QUEUE PARAM_VALUE.I_AXI_REQ_QUEUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_AXI_REQ_QUEUE}] ${MODELPARAM_VALUE.I_AXI_REQ_QUEUE}
}

proc update_MODELPARAM_VALUE.O_AXI_ID { MODELPARAM_VALUE.O_AXI_ID PARAM_VALUE.O_AXI_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_AXI_ID}] ${MODELPARAM_VALUE.O_AXI_ID}
}

proc update_MODELPARAM_VALUE.O_AXI_PROT { MODELPARAM_VALUE.O_AXI_PROT PARAM_VALUE.O_AXI_PROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_AXI_PROT}] ${MODELPARAM_VALUE.O_AXI_PROT}
}

proc update_MODELPARAM_VALUE.O_AXI_CACHE { MODELPARAM_VALUE.O_AXI_CACHE PARAM_VALUE.O_AXI_CACHE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_AXI_CACHE}] ${MODELPARAM_VALUE.O_AXI_CACHE}
}

proc update_MODELPARAM_VALUE.O_AXI_AUSER { MODELPARAM_VALUE.O_AXI_AUSER PARAM_VALUE.O_AXI_AUSER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_AXI_AUSER}] ${MODELPARAM_VALUE.O_AXI_AUSER}
}

proc update_MODELPARAM_VALUE.O_AXI_REQ_QUEUE { MODELPARAM_VALUE.O_AXI_REQ_QUEUE PARAM_VALUE.O_AXI_REQ_QUEUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_AXI_REQ_QUEUE}] ${MODELPARAM_VALUE.O_AXI_REQ_QUEUE}
}

proc update_MODELPARAM_VALUE.K_AXI_ADDR_WIDTH { MODELPARAM_VALUE.K_AXI_ADDR_WIDTH PARAM_VALUE.K_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.K_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.K_AXI_DATA_WIDTH { MODELPARAM_VALUE.K_AXI_DATA_WIDTH PARAM_VALUE.K_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.K_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.K_AXI_ID_WIDTH { MODELPARAM_VALUE.K_AXI_ID_WIDTH PARAM_VALUE.K_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.K_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.K_AXI_USER_WIDTH { MODELPARAM_VALUE.K_AXI_USER_WIDTH PARAM_VALUE.K_AXI_USER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_USER_WIDTH}] ${MODELPARAM_VALUE.K_AXI_USER_WIDTH}
}

proc update_MODELPARAM_VALUE.K_AXI_ID { MODELPARAM_VALUE.K_AXI_ID PARAM_VALUE.K_AXI_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_ID}] ${MODELPARAM_VALUE.K_AXI_ID}
}

proc update_MODELPARAM_VALUE.K_AXI_PROT { MODELPARAM_VALUE.K_AXI_PROT PARAM_VALUE.K_AXI_PROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_PROT}] ${MODELPARAM_VALUE.K_AXI_PROT}
}

proc update_MODELPARAM_VALUE.K_AXI_CACHE { MODELPARAM_VALUE.K_AXI_CACHE PARAM_VALUE.K_AXI_CACHE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_CACHE}] ${MODELPARAM_VALUE.K_AXI_CACHE}
}

proc update_MODELPARAM_VALUE.K_AXI_AUSER { MODELPARAM_VALUE.K_AXI_AUSER PARAM_VALUE.K_AXI_AUSER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_AUSER}] ${MODELPARAM_VALUE.K_AXI_AUSER}
}

proc update_MODELPARAM_VALUE.K_AXI_REQ_QUEUE { MODELPARAM_VALUE.K_AXI_REQ_QUEUE PARAM_VALUE.K_AXI_REQ_QUEUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_AXI_REQ_QUEUE}] ${MODELPARAM_VALUE.K_AXI_REQ_QUEUE}
}

proc update_MODELPARAM_VALUE.T_AXI_ADDR_WIDTH { MODELPARAM_VALUE.T_AXI_ADDR_WIDTH PARAM_VALUE.T_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.T_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.T_AXI_DATA_WIDTH { MODELPARAM_VALUE.T_AXI_DATA_WIDTH PARAM_VALUE.T_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.T_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.T_AXI_ID_WIDTH { MODELPARAM_VALUE.T_AXI_ID_WIDTH PARAM_VALUE.T_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.T_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.T_AXI_USER_WIDTH { MODELPARAM_VALUE.T_AXI_USER_WIDTH PARAM_VALUE.T_AXI_USER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_USER_WIDTH}] ${MODELPARAM_VALUE.T_AXI_USER_WIDTH}
}

proc update_MODELPARAM_VALUE.T_AXI_ID { MODELPARAM_VALUE.T_AXI_ID PARAM_VALUE.T_AXI_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_ID}] ${MODELPARAM_VALUE.T_AXI_ID}
}

proc update_MODELPARAM_VALUE.T_AXI_PROT { MODELPARAM_VALUE.T_AXI_PROT PARAM_VALUE.T_AXI_PROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_PROT}] ${MODELPARAM_VALUE.T_AXI_PROT}
}

proc update_MODELPARAM_VALUE.T_AXI_CACHE { MODELPARAM_VALUE.T_AXI_CACHE PARAM_VALUE.T_AXI_CACHE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_CACHE}] ${MODELPARAM_VALUE.T_AXI_CACHE}
}

proc update_MODELPARAM_VALUE.T_AXI_AUSER { MODELPARAM_VALUE.T_AXI_AUSER PARAM_VALUE.T_AXI_AUSER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_AUSER}] ${MODELPARAM_VALUE.T_AXI_AUSER}
}

proc update_MODELPARAM_VALUE.T_AXI_REQ_QUEUE { MODELPARAM_VALUE.T_AXI_REQ_QUEUE PARAM_VALUE.T_AXI_REQ_QUEUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T_AXI_REQ_QUEUE}] ${MODELPARAM_VALUE.T_AXI_REQ_QUEUE}
}

