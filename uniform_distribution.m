%function [s1,s2,s3,s4,s5,s6,s7,s8]= uniform_distribution(cepstral_coefficients)
function [s1,s2,s3,s4,s5,s6,s7,s8]= uniform_distribution(cepstral_coefficients,Num_state)

x=size(cepstral_coefficients);
num_frames=floor(x(1)/Num_state);
s1=cepstral_coefficients(1:num_frames,:);
s2=cepstral_coefficients(num_frames+1:num_frames*2,:);
s3=cepstral_coefficients(num_frames*2+1:num_frames*3,:);
s4=cepstral_coefficients(num_frames*3+1:num_frames*4,:);
s5=cepstral_coefficients(num_frames*4+1:num_frames*5,:);
s6=cepstral_coefficients(num_frames*5+1:num_frames*6,:);
s7=cepstral_coefficients(num_frames*6+1:num_frames*7,:);
s8=cepstral_coefficients(num_frames*7+1:x(1),:);
