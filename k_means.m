function [all_ave,cluster]=k_means(Num_state,frames_states,coefficients_num,cluster_num)

%###################averages (miu) of all the states##########################
all_ave=cell(1,Num_state);
ave=zeros(1,coefficients_num);
cluster=cell(cluster_num,Num_state);
for s=1:Num_state
    
    current_state=[];
    
    for i=1:12
        current_state=[current_state;frames_states{i,s}]; %merging all the frames which are in a same state
    end
    
    center(1,s)=randi([1 floor(size(current_state,1)/2)]);
    center(2,s)=randi([floor(size(current_state,1)/2) size(current_state,1)]);
    
    [cluster{1,s},cluster{2,s}]=clustering(current_state,current_state(center(1,s),:),current_state(center(2,s),:));
    [ave]= clusters_average(cluster{1,s},cluster{2,s});
    all_ave{1,s}=ave;
    % till here we have the first averages of the states
end
%% iterations for k-means
all_ave_old=cell(size(all_ave));
for s=1:Num_state
    all_ave_old{1,s}=zeros(size(all_ave{1,s}));
end


for iterations=1:30
    for s=1:Num_state
        current_state=[];
        for i=1:12
            current_state=[current_state;frames_states{i,s}]; %merging all the frames which are in a same state
        end

        a=all_ave{1,s};
        [cluster{1,s},cluster{2,s}]=clustering(current_state,a(1,:),a(2,:));
        [ave]= clusters_average(cluster{1,s},cluster{2,s});
        all_ave{1,s}=ave;
    
    end   
end
