function [b_log]=B_calc(N,Cjk,Num_state,cluster_num,test)
if test==1
    data_num=9;
else
    data_num=12;
end
b=cell(data_num,1);
for file=1:data_num
    n=N{file,1};
    bj=zeros(size(n,1),Num_state);
    for o=1:size(n,1)
        for s=1:Num_state
            for k=1:cluster_num
                bj(o,s)=Cjk(k,s)*n(o,((2*s)-2)+k)+bj(o,s);
            end
        end
    end
    b{file,1}=bj;
end

b_log=cell(size(b));
for file=1:data_num
    b1=log10(b{file,1});
    b_log{file,1}=b1;
end