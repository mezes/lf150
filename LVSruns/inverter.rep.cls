##############################################################################################################
#####  
#####                                         PVS LVS COMPARISON
#####  
#####  Version                       :   14.14-s507
#####  NVN Run Start                 :   Thu Apr 14 15:01:17 2016
#####  ERC Summary File              :   inverter.sum
#####  Extraction Report File        :   inverter.rep
#####  Comparison Report File        :   inverter.rep.cls
#####  Top Cell                      :   inverter  <vs>  inverter
#####  
#####  Run Result                    :   MATCH
#####  
#####  Run Summary                   :   [INFO]  ERC Results: Empty
#####                                :   [INFO]  Extraction Clean
#####  
#####  Layout Design                 :   cdnlive2016 inverter layout
#####  Schematic File                :   /home/pancha/ProjGe3D/lf150/LVSruns/inverter.cdl (cdl)
#####  Rules File                    :   .technology.rul
#####  Pin Swap File                 :   inverter.rep.cps
#####  
#####  Extraction CPU Time           :   0h 0m 0s - (0s)
#####  Extraction Exec Time          :   0h 0m 0s - (0s)
#####  Extraction Peak Memory Usage  :   15.00MB
#####  NVN CPU Time                  :   0h 0m 0s - (0s)                 
#####  NVN Exec Time                 :   0h 0m 0s - (0s)                 
#####  NVN Peak Memory Usage         :   211.27MB
#####  LVS Total CPU Time            :   0h 0m 0s - (0s)                 
#####  LVS Total Exec Time           :   0h 0m 0s - (0s)                 
#####  LVS Total Peak Memory Usage   :   211.27MB
#####  
##############################################################################################################


##############################################################################################################
#
#                                            CELL MATCH STATISTICS                                            
#
##############################################################################################################

Cell Statistic Descriptions                  | Count
---------------------------------------------+----------
Cells matched                                |         1
Cells expanded                               |         0
Cells not run                                |         0
Cells which mismatch                         |         0
---------------------------------------------+----------
Total                                        |         1


Cell Statistic Detail                        | Count
---------------------------------------------+----------
Cells with parameter mismatches              |         0
Cells with mismatched instance subtypes      |         0
Cells that have been blackboxed              |         0


##############################################################################################################
#
#                                             CELL MATCH SUMMARY                                              
#
##############################################################################################################

             |     Initial Pins     |     Compare Pins     |            | 
Cell         |   lay    :    sch    |   lay    :    sch    | Status     | Detail
-------------+----------+-----------+----------+-----------+------------+-----------
inverter     |        4 :         4 |        4 :         4 | match      | 


##############################################################################################################
#
#                                                  LVS RULES                                                  
#
##############################################################################################################

Command Line LVS Rule Values
----------------------------

    layout_primary                          inverter {-top_cell inverter}
    schematic_primary                       inverter {-source_top_cell inverter}

LVS Rules Given in the Rules File
---------------------------------

    lvs_abort                               -softchk no  
    layout_path                             /home/pancha/ProjGe3D/lf150/LVSruns/inverter.gds
    layout_format                           gdsii
    schematic_path                          /home/pancha/ProjGe3D/lf150/LVSruns/inverter.cdl
    schematic_format                        cdl
                                             
    lvs_ignore_ports                        no  
    lvs_compare_port_names                  no  
    lvs_find_shorts                         no  
    lvs_break_ambig_max                     32
                                             
    lvs_filter_device                       ind3n60_1n80a2g4_CT
                                             
    lvs_recognize_gates                     -all
                                             
    lvs_check_property                      MN ( nmos_hs ) w w -tolerance 3
    lvs_check_property                      MN ( nmos_hs ) l l -tolerance 3
    lvs_check_property                      MN ( nmos_hs_top ) W W -tolerance 3
    lvs_check_property                      MN ( nmos_hs_top ) L L -tolerance 3
    lvs_check_property                      MP ( pmos_hs ) w w -tolerance 3
    lvs_check_property                      MP ( pmos_hs ) l l -tolerance 3
    lvs_check_property                      MP ( pmos_hs_4_top ) w w -tolerance 3
    lvs_check_property                      MP ( pmos_hs_4_top ) l l -tolerance 3
    lvs_check_property                      R ( resistor ) w w -tolerance 3
    lvs_check_property                      R ( resistor ) l l -tolerance 3
    lvs_check_property                      R ( resistor ) r r -tolerance 3
    lvs_check_property                      R ( resistor ) W W -tolerance 3
    lvs_check_property                      R ( resistor ) L L -tolerance 3
    lvs_check_property                      R ( resistor ) r r -tolerance 3
    lvs_check_property                      C ( capacitor ) c c -tolerance 1
    lvs_report_file                         inverter.rep
    lvs_report_max                          50 -mismatched_net_limit 100 
    unit                                    -length u
    input_scale                             1000
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    virtual_connect                         -report no
    virtual_connect                         -depth -primary
                                             

Default LVS Rule Values
-----------------------

    layout_case_sensitive                   no
    // layout_cpf_file                       
    // schematic_cpf_file                    
    schematic_case_sensitive                no
    // hcell_file                            
    // hcell                                 
    // lvs_exclude_hcell                     
    lvs_push_devices                        yes
    lvs_push_devices_properties             no
    lvs_netlist                             yes -substrate_comment
    lvs_netlist                             yes -box_contents
    lvs_netlist                             yes -unnamed_box_pins
    lvs_netlist                             no -allow_inconsistent_model
    // lvs_write_netlist                     
    // lvs_write_netlist_reduced             
    // lvs_delete_cell_pin                   
    // lvs_black_box                         
    lvs_spice                               yes -allow_floating_pins
    lvs_spice                               yes -allow_duplicate_subcircuit_names
    lvs_spice                               no  -conditional_ldd
    lvs_spice                               no  -prefer_pins
    lvs_spice                               no  -override_globals
    lvs_spice                               no  -redefine_param
    lvs_spice                               no  -replicate_devices
    lvs_spice                               yes -slash_is_space
    lvs_spice                               yes -keep_back_slash
    lvs_spice                               no  -allow_unquoted_strings
    lvs_spice                               no  -allow_inline_parameters
    lvs_spice                               no  -calculate_mos_area
    lvs_spice                               no  -strict_wl
    lvs_spice                               no  -cull_primitive_subcircuits
    lvs_spice                               no  -ignore_option_scale
    lvs_spice                               no  -show_neg_param_warning
    lvs_spice                               no  -scale_x_parameters
    // lvs_spice_option                      
    lvs_reverse_wl                          no
    // lvs_spice_multiplier_name             
                                             
    lvs_compare_case                        no
    lvs_cname                               no  -cell
    lvs_cname                               yes -pin
    lvs_cname                               yes -net
    lvs_cname                               no  -instance
    lvs_non_user_name                       -port "^[0-9]+$"
    lvs_non_user_name                       -net  "^[0-9]+$"
    // lvs_non_user_name                    -instance 
    lvs_out_of_range_exclude_zero           no
    // lvs_group_models                      
    lvs_strict_subtypes                     no
    // lvs_cpoint                            
    // lvs_power_name                        
    // lvs_ground_name                       
    // lvs_cell_list                         
    // lvs_device_type                       
                                             
    lvs_auto_pin_swap                       yes -swap_threshold 4000000
    lvs_swap_non_cpoint_pins                yes
    // lvs_swap_pins                         
    lvs_all_cap_pins_swappable              no
    lvs_builtin_device_pin_swap             yes
    // lvs_join_nets                         
    lvs_global_sigs_are_ports               yes
    lvs_discard_pins                        no
                                             
    lvs_filter                              no  -bipolar
    lvs_filter                              no  -capacitors
    lvs_filter                              no  -diodes
    lvs_filter                              no  -mos
    lvs_filter                              no  -resistors
    // lvs_filter_option                     
                                             
    lvs_reduction_priority                  -parallel
    lvs_reduce_split_gates                  yes
    lvs_derive_logic                        yes -sram
    lvs_derive_logic                        no  -dram
    lvs_derive_logic                        no  -rom
    // lvs_recognize_gates_tolerance         
    lvs_reduce                              yes -parallel_bipolar
    lvs_reduce                              yes -parallel_caps
    lvs_reduce                              yes -series_caps
    lvs_reduce                              yes -parallel_diodes
    lvs_reduce                              no  -series_diodes
    lvs_reduce                              yes -parallel_mos
    lvs_reduce                              no  -series_mos
    lvs_reduce                              yes -parallel_resistors
    lvs_reduce                              yes -series_resistors
    // lvs_reduce_device                     
    // lvs_reduce_do_not_merge               
                                             
    lvs_expand_on_device_climbing           no
    lvs_expand_unbalanced_cells             yes
    lvs_expand_cell_on_error                no
                                             
    // lvs_property_map                      
    // lvs_report_opt                        
    lvs_report_units                        yes
    lvs_keep_data                           no
    lvs_keep_source_cells                   no
    lvs_create_match_db                     no
    // lvs_map_device                        
    unit                                    -resistance ohm
    unit                                    -capacitance pf
    lvs_verilog_bus_map_by_position         no
    lvs_verilog_keep_backslash              no
    lvs_do_not_normalize                    no
    // lvs_generic_device                    
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    // virtual_connect                      -name 
    lvs_preserve_parameterized_cells        no
    lvs_check_color                         no
    // lvs_schematic_color_path              
    // lvs_assign_conflict_layer             
    // lvs_conflict_layer_check             
    lvs_check_color_label                   no
                                             
    // perc_pattern_library                 
    // perc_cd_constraint                    

Effective LVS Rule Values
-------------------------

    lvs_swap_non_cpoint_pins                yes -unbound_pin_threshold 10000


##############################################################################################################
#
#                                               CELL COMPARISON                                               
#
##############################################################################################################

                              +------------------------------------------------+
                              |                                                |
                              |        ------->>>   MATCH   <<<-------         |
                              |                                                |
                              |            inverter  <vs>  inverter            |
                              |                                                |
                              |                                                |
                              +------------------------------------------------+

+===[inverter]================================================================================================
|                                                 STATISTICS                                                  
+=============================================================================================================


                     |     Original      |     Filtered      |     Reduced      
Cell                 |   lay   :   sch   |   lay   :   sch   |   lay   :  sch
---------------------+---------+---------+---------+---------+---------+--------
MP [4 pins]          |         :         |         :         |         :        
 MP(PMOS_HS)         |       1 :       1 |       1 :       1 |       1 :       1
MN [4 pins]          |         :         |         :         |         :        
 MN(NMOS_HS_TOP)     |       1 :       1 |       1 :       1 |       1 :       1
---------------------+---------+---------+---------+---------+---------+--------
Total                |       2 :       2 |       2 :       2 |       2 :       2
=====================+=========+=========+=========+=========+=========+========
Pins                 |         :         |         :         |       4 :       4
Nets                 |         :         |         :         |       0 :       0
=====================+=========+=========+=========+=========+=========+========

+===[inverter]================================================================================================
|                                           INITIAL CORRESPONDENCES                                           
+=============================================================================================================

Type     | Name
---------+---------------------
Pin      | INP OUTP VDD VSS


##############################################################################################################
#
#                                                END OF REPORT                                                
#
##############################################################################################################

