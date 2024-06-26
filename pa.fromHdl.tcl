
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ULA_FINAL -dir "/home/sd/ULA_FINAL/planAhead_run_3" -part xc3s700anfgg484-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "MAQUINA_DE_ESTADOS.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {MUX_8ENTRADAS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_SOMAR4BITS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_NOT.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_SOMAR1BIT.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OR.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_XOR.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_SUBTRAIR4BITS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_DESLOCAR4BITS_ESQUERDA.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OPERACAO_COMPARADOR4BITS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {AND.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ULA.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {CLOCK.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MAQUINA_DE_ESTADOS.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top MAQUINA_DE_ESTADOS $srcset
add_files [list {MAQUINA_DE_ESTADOS.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s700anfgg484-4
