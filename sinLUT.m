%%      Description 
    %   Functionality
    %   This script will generate a verilog code of look-up table for sine function 
    %   using fixed-point arithmetic and variable fraction part. 
    %   0 < alpha < 60 degree
    %   
    %   required functions
    %   dec2binfrac
%%

clear all
clc

%%
x = 0:.5:60;                    % Look-up table for every 0.5 degree
num_deg = 1:1:length(x);
res =16;                        % fixed-point resolution Q16_16

%%
for i= 1:length(num_deg)-1
sin_frac_mat_121x7{i}  = dec2binfrac(sin(x(i)*pi/180), res);
sin_frac_pi3_mat_121x7{i} = dec2binfrac(sin(pi/3 - x(i)*pi/180), res);
end

for m = 1:length(num_deg)-1
sin_frac(m) =  str2double(sin_frac_mat_121x7{m});
sin_frac_pi3(m) =  str2double(sin_frac_pi3_mat_121x7{m});
end

 
 %%  compiling to verilog
 
 
 A = [num_deg(1:end-1); sin_frac; sin_frac_pi3];
 fileID = fopen('sinLUT.txt','w');
 
fprintf(fileID,'`timescale 1ns / 1ps \n\n\n\n\n\n');
fprintf(fileID,'module sin_LUT ( CLK, angle_value, enable, sin_pi3_value, sin_value ); \n\n');
 
fprintf(fileID,' input                         enable, CLK; \n');
fprintf(fileID,' output    reg     [%1d:0]     sin_value     = %1d''d0; \n',res-1,res);
fprintf(fileID,' output    reg     [%1d:0]     sin_pi3_value = %1d''d0;\n',res-1,res);
fprintf(fileID,' input             [%1d:0]     angle_value; \n\n\n\n\n',6);

fprintf(fileID,'always @(posedge CLK)\n');
fprintf(fileID,' if (enable) \n');
fprintf(fileID,'   case ( angle_value) \n');
             
fprintf(fileID,'     7''d%3d : begin sin_value <= 16''b%16.0f;    sin_pi3_value <= 16''b%16.0f;    end \n', A);
fprintf(fileID,'   endcase\n');
fprintf(fileID,'endmodule\n');
fclose(fileID);
 
 
 
