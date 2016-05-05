# sin-function-look-up-table-verilog-module
This Matlab function creates an Verilog look-up table module of a sin(theta) function for theta between zero to 60 degree. This is used for space-vector pulse width modulation. The format is fixed-point with 16 digits precision (Q16_16). For example, 16'b1101110110110011 represents 0.8660 which is sin(pi/3). 

Inputs are clock, reset, enable signal and angle value. The resolution is set to be every 0.5 degree and it can be changed. Therefore, there will be 120 angle value for 60 degree. 

Outputs are sin(theta) and sin(pi/3-theta).

sinLUT.m calls another function for bianry conversion called dec2binfrac.m .
