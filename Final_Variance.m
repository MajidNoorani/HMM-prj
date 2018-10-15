function [final_var]=Final_Variance(all_ave,frames_state,Num_state,coefficients_num,cluster_num)
all_var=cell(1,Num_state); %we save variances in seperate rows in this parametere
Var=zeros(2,coefficients_num); 
for s=1:Num_state
    current_state=[];
    for i=1:12
        current_state=[current_state;frames_state{i,s}]; %merging all the frames which are in a same state
    end
    
    
    ave=all_ave{1,s};
    i=1:floor(size(current_state,1)/2);
    [Var(1,:)]= variance(current_state(i,:),ave(1,:),coefficients_num);
    i=floor(size(current_state,1)/2)+1:size(current_state,1);
    [Var(2,:)]= variance(current_state(i,:),ave(2,:),coefficients_num);
    all_var{1,s}=Var;
end

%% making a square matrix

final_var=cell(cluster_num,Num_state); %contains all the covariances in square matrices
for s=1:Num_state
    for j=1:cluster_num
        var=all_var{1,s};
        final_var{j,s}=diag(var(j,:));
    end
end

