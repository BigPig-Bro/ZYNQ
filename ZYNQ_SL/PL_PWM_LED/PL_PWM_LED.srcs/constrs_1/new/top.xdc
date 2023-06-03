# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ---------------------------------------------------------------------------- 
set_property  PACKAGE_PIN M19 [get_ports {clk_100m}];  
set_property  IOSTANDARD LVCMOS33 [get_ports {clk_100m}];  

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ---------------------------------------------------------------------------- 
set_property  PACKAGE_PIN P20 [get_ports {led[0]}];  # "LD0"
set_property  PACKAGE_PIN P21 [get_ports {led[1]}];  # "LD1"
set_property  IOSTANDARD LVCMOS33 [get_ports {led[0]}];  # "LD0"
set_property  IOSTANDARD LVCMOS33 [get_ports {led[1]}];  # "LD1"
