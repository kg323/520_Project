# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\ECE520\Project\UART\UART_design_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\ECE520\Project\UART\UART_design_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {UART_design_wrapper}\
-hw {C:\ECE520\Project\UART\UART_design_wrapper.xsa}\
-out {C:/ECE520/Project/UART}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {UART_design_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform clean
platform generate
platform generate
platform create -name {UART_design_wrapper}\
-hw {C:\ECE520\Project\UART\UART_design_wrapper.xsa}\
-out {C:/ECE520/Project/UART}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {UART_design_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform generate
