function [Cjk]=Cjk_calc(cluster,Num_state,cluster_num)
Cjk=zeros(cluster_num,Num_state);
for s=1:Num_state
    allframes=0;
    for i=1:cluster_num
        allframes=size(cluster{i,s},1)+allframes;
    end
    for i=1:cluster_num
        Cjk(i,s)=size(cluster{i,s},1)/allframes;
    end
end