################################################################
# Check if script is running in correct Vivado version.
################################################################
array set available_vivado_version_list {"2018.3"   "ok"}
set available_vivado_version [array names available_vivado_version_list]
set current_vivado_version   [version -short]

if { [string first [lindex [array get available_vivado_version_list $current_vivado_version] 1] "ok"] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$available_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$available_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} ne "" && ${cur_design} eq ${design_name} } {

   # Checks if design is empty or not
   if { $list_cells ne "" } {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 1
   } else {
      puts "INFO: Constructing design in IPI design <$design_name>..."
   }
} elseif { ${cur_design} ne "" && ${cur_design} ne ${design_name} } {

   if { $list_cells eq "" } {
      puts "INFO: You have an empty design <${cur_design}>. Will go ahead and create design..."
   } else {
      set errMsg "ERROR: Design <${cur_design}> is not empty! Please do not source this script on non-empty designs."
      set nRet 1
   }
} else {

   if { [get_files -quiet ${design_name}.bd] eq "" } {
      puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

      create_bd_design $design_name

      puts "INFO: Making design <$design_name> as current_bd_design."
      current_bd_design $design_name

   } else {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 3
   }

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create ports
  set LED [ create_bd_port -dir O -from 3 -to 0 LED ]

  # Create instance: LED4_AXI_0, and set properties
  set LED4_AXI_0 [ create_bd_cell -type ip -vlnv ikwzm:pipework:LED4_AXI:1.0 LED4_AXI_0 ]

  # Create instance: QCONV_STRIP_AXI3_0, and set properties
  set QCONV_STRIP_AXI3_0 [ create_bd_cell -type ip -vlnv ikwzm:QCONV:QCONV_STRIP_AXI3:2.0 QCONV_STRIP_AXI3_0 ]
  set_property -dict [ list \
   CONFIG.IO_AXI_ID_WIDTH {1} \
   CONFIG.IO_AXI_USER_WIDTH {5} \
   CONFIG.I_AXI_AUSER {1} \
   CONFIG.I_AXI_CACHE {15} \
   CONFIG.I_AXI_PROT {0} \
   CONFIG.O_AXI_AUSER {1} \
   CONFIG.O_AXI_CACHE {15} \
   CONFIG.O_AXI_PROT {0} \
   CONFIG.K_AXI_ID_WIDTH {1} \
   CONFIG.K_AXI_USER_WIDTH {5} \
   CONFIG.K_AXI_AUSER {1} \
   CONFIG.K_AXI_CACHE {15} \
   CONFIG.K_AXI_PROT {0} \
   CONFIG.T_AXI_ID_WIDTH {1} \
   CONFIG.T_AXI_USER_WIDTH {5} \
   CONFIG.T_AXI_AUSER {1} \
   CONFIG.T_AXI_CACHE {15} \
   CONFIG.T_AXI_PROT {0} \
   CONFIG.S_AXI_ADDR_WIDTH {12} \
 ] $QCONV_STRIP_AXI3_0

  # Create instance: axi_interconnect_csr, and set properties
  set axi_interconnect_csr [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_csr ]

  # Create instance: axi_interconnect_acp, and set properties
  set axi_interconnect_acp [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_acp ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {3} \
   CONFIG.M00_HAS_DATA_FIFO {2} \
   CONFIG.M00_HAS_REGSLICE {1}  \
   CONFIG.S00_HAS_REGSLICE {1}  \
   CONFIG.S01_HAS_REGSLICE {1}  \
   CONFIG.S02_HAS_REGSLICE {1}  \
  ] $axi_interconnect_acp

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  if { [string equal [get_property "board_part" [current_project]] ""] == 0 } {
     apply_bd_automation -rule "xilinx.com:bd_rule:processing_system7" -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" } $processing_system7_0
  } else {
     set import_board_preset [file join [file dirname [info script]] "zybo_z7_preset.tcl"]
     if { [file exists $import_board_preset] == 0 } {
        puts "ERROR: Can not Read board preset file = $import_board_preset."
        return 1
     } else {
        source $import_board_preset
        set_property -dict [ apply_preset $processing_system7_0 ] $processing_system7_0
     }
     set DDR      [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
     set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  }
  set_property -dict [ list CONFIG.PCW_IRQ_F2P_INTR {1} CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_USE_S_AXI_ACP {1} CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.0} ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net QCONV_STRIP_AXI3_0_IO_AXI [get_bd_intf_pins QCONV_STRIP_AXI3_0/IO_AXI] [get_bd_intf_pins axi_interconnect_acp/S00_AXI]
  connect_bd_intf_net -intf_net QCONV_STRIP_AXI3_0_K_AXI [get_bd_intf_pins QCONV_STRIP_AXI3_0/K_AXI] [get_bd_intf_pins axi_interconnect_acp/S01_AXI]
  connect_bd_intf_net -intf_net QCONV_STRIP_AXI3_0_T_AXI [get_bd_intf_pins QCONV_STRIP_AXI3_0/T_AXI] [get_bd_intf_pins axi_interconnect_acp/S02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_csr_M00_AXI [get_bd_intf_pins LED4_AXI_0/CSR] [get_bd_intf_pins axi_interconnect_csr/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_csr_M01_AXI [get_bd_intf_pins QCONV_STRIP_AXI3_0/S_AXI] [get_bd_intf_pins axi_interconnect_csr/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_acp_M00_AXI [get_bd_intf_pins axi_interconnect_acp/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_ACP]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_csr/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net LED4_AXI_0_LED [get_bd_ports LED] [get_bd_pins LED4_AXI_0/LED]
  connect_bd_net -net QCONV_STRIP_AXI3_0_IRQ [get_bd_pins QCONV_STRIP_AXI3_0/IRQ] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_csr/ARESETN] [get_bd_pins axi_interconnect_csr/M00_ARESETN] [get_bd_pins axi_interconnect_csr/M01_ARESETN] [get_bd_pins axi_interconnect_csr/S00_ARESETN] [get_bd_pins axi_interconnect_acp/ARESETN] [get_bd_pins axi_interconnect_acp/M00_ARESETN] [get_bd_pins axi_interconnect_acp/S00_ARESETN] [get_bd_pins axi_interconnect_acp/S01_ARESETN] [get_bd_pins axi_interconnect_acp/S02_ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins LED4_AXI_0/ARESETn] [get_bd_pins QCONV_STRIP_AXI3_0/ARESETn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins LED4_AXI_0/ACLOCK] [get_bd_pins QCONV_STRIP_AXI3_0/ACLK] [get_bd_pins axi_interconnect_csr/ACLK] [get_bd_pins axi_interconnect_csr/M00_ACLK] [get_bd_pins axi_interconnect_csr/M01_ACLK] [get_bd_pins axi_interconnect_csr/S00_ACLK] [get_bd_pins axi_interconnect_acp/ACLK] [get_bd_pins axi_interconnect_acp/M00_ACLK] [get_bd_pins axi_interconnect_acp/S00_ACLK] [get_bd_pins axi_interconnect_acp/S01_ACLK] [get_bd_pins axi_interconnect_acp/S02_ACLK] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_ACP_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/IO_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/K_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/T_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x00400000 -offset 0xE0000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/IO_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_IOP] SEG_processing_system7_0_ACP_IOP
  create_bd_addr_seg -range 0x00400000 -offset 0xE0000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/K_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_IOP] SEG_processing_system7_0_ACP_IOP
  create_bd_addr_seg -range 0x00400000 -offset 0xE0000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/T_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_IOP] SEG_processing_system7_0_ACP_IOP
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/IO_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_M_AXI_GP0] SEG_processing_system7_0_ACP_M_AXI_GP0
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/K_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_M_AXI_GP0] SEG_processing_system7_0_ACP_M_AXI_GP0
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/T_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_M_AXI_GP0] SEG_processing_system7_0_ACP_M_AXI_GP0
  create_bd_addr_seg -range 0x01000000 -offset 0xFC000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/IO_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_QSPI_LINEAR] SEG_processing_system7_0_ACP_QSPI_LINEAR
  create_bd_addr_seg -range 0x01000000 -offset 0xFC000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/K_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_QSPI_LINEAR] SEG_processing_system7_0_ACP_QSPI_LINEAR
  create_bd_addr_seg -range 0x01000000 -offset 0xFC000000 [get_bd_addr_spaces QCONV_STRIP_AXI3_0/T_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_QSPI_LINEAR] SEG_processing_system7_0_ACP_QSPI_LINEAR
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs LED4_AXI_0/CSR/CSR] SEG_LED4_AXI_0_CSR
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs QCONV_STRIP_AXI3_0/S_AXI/reg0] SEG_QCONV_STRIP_AXI3_0_reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


