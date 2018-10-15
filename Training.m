function [b_log,aij_log,Variance,all_ave,Cjk]=Training(cepstrals,model_num,Num_state,coefficients_num,cluster_num,test)

% in this part we want to have a cell of all the training frames which are
% distriuted in a uniform way in 8 states

frames_state=cell(12,Num_state);
for file=1:12
    [s1,s2,s3,s4,s5,s6,s7,s8]= uniform_distribution(cepstrals{file},Num_state);
    x={s1 s2 s3 s4 s5 s6 s7 s8};
    for j=1:Num_state
        frames_state{file,j}=x{j}; % s is cell that in each row contains a training file and it has 12 rows
    end
end


for vit=1:15
%% K-means
[all_ave,cluster]=k_means(Num_state,frames_state,coefficients_num,cluster_num);
%% covariance
[Variance]=Final_Variance(all_ave,frames_state,Num_state,coefficients_num,cluster_num);
%% calculation of N 
[N]=Gaussian_func(cepstrals,all_ave,Variance,Num_state,cluster_num,coefficients_num,test);
%% calculation of Cjk
[Cjk]=Cjk_calc(cluster,Num_state,cluster_num);
%% calculation of bj(ot)
[b_log]=B_calc(N,Cjk,Num_state,cluster_num,test);
%% aij
[aij_log]=A_calc(cluster,Num_state);
%% viterbi
[frames_state]=Viterbi(cepstrals,b_log,aij_log,Num_state,model_num);
end 
