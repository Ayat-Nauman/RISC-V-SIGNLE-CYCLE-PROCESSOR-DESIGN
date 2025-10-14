##Switches
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports a[0] ];
#IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports a[1] ];
#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports a[2]];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports a[3]];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports a[4]];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports a[5]];

set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports b[0]];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports b[1]];
set_property -dict { PACKAGE_PIN T8 IOSTANDARD LVCMOS33 } [get_ports b[2]];
set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [get_ports b[3]];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports b[4]];
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports b[5]];

set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS33 } [get_ports ALUcontrol[0]];
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports ALUcontrol[1]];
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports ALUcontrol[2]];
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports ALUcontrol[3]]; 

#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[2]
## LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports result[0]];
#IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports result[1]];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports result[2]];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports result[3]];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports result[4]];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports result[5]];

set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports zero];
#set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports s_flag];
#set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports z_flag];
#set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports ov_flag];
#IO_L18P_T2_A24_15 Sch=led[1]