function [aij_log]=A_calc(cluster,Num_state)
aij=zeros(Num_state,Num_state);
for i=1:Num_state-1
    aij(i,i+1)=Num_state/(size(cluster{1,i},1)+size(cluster{2,i},1));
    aij(i,i)=1-aij(i,i+1);
    aij(Num_state,Num_state)=1;
end
aij_log=log10(aij);