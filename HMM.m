%% feature extraction

clc
close all;
clear all;
%% ############## feature extraction ###################

[cd,cj,cm]=file_reading_and_feature_extraction();
Num_state=8; % number of states
coefficients_num=12; %number of cepstral coefficients
cluster_num=2; %number of gaussian clusters

%% ################ Training #####################
test=0;
%% model 1: Darya
model_num=1;
[b_log1,aij_log1,Variance1,all_ave1,Cjk1]=Training(cd,model_num,Num_state,coefficients_num,cluster_num,test);
%generating taxt file
text_report(aij_log1,Variance1,all_ave1,Num_state,coefficients_num,cluster_num,model_num);


%% model 2: Jangal
model_num=2;
[b_log2,aij_log2,Variance2,all_ave2,Cjk2]=Training(cj,model_num,Num_state,coefficients_num,cluster_num,test);
%generating taxt file
text_report(aij_log2,Variance2,all_ave2,Num_state,coefficients_num,cluster_num,model_num);

%% model 3: Mordab
model_num=3;
[b_log3,aij_log3,Variance3,all_ave3,Cjk3]=Training(cm,model_num,Num_state,coefficients_num,cluster_num,test);
%generating taxt file
text_report(aij_log3,Variance3,all_ave3,Num_state,coefficients_num,cluster_num,model_num);


%% ##################### test ######################
test=1;
%% calculation of b for each test file
cepstrals={cd{1,13} cd{1,14} cd{1,15} cj{1,13} cj{1,14} cj{1,15} cm{1,13} cm{1,14} cm{1,15}} ;
[N1]=Gaussian_func(cepstrals,all_ave1,Variance1,Num_state,cluster_num,coefficients_num,test);
[N2]=Gaussian_func(cepstrals,all_ave2,Variance2,Num_state,cluster_num,coefficients_num,test);
[N3]=Gaussian_func(cepstrals,all_ave3,Variance3,Num_state,cluster_num,coefficients_num,test);
[b_log_test1]=B_calc(N1,Cjk1,Num_state,cluster_num,test);
[b_log_test2]=B_calc(N2,Cjk2,Num_state,cluster_num,test);
[b_log_test3]=B_calc(N3,Cjk3,Num_state,cluster_num,test);
%% testing part
model_num=1;
[final_delta1,states1]=viterbi_test(aij_log1,b_log_test1,Num_state,model_num);

model_num=2;
[final_delta2,states2]=viterbi_test(aij_log2,b_log_test2,Num_state,model_num);

model_num=3;
[final_delta3,states3]=viterbi_test(aij_log3,b_log_test3,Num_state,model_num);

final_delta=[final_delta1;final_delta2;final_delta3]
