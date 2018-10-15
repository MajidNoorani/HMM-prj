function [N]=Gaussian_func(cepstrals,all_ave,Variance,Num_state,cluster_num,coefficients_num,test)
N=cell(12,1);
if test==1
    data_num=9;
else
    data_num=12;
end
for file=1:data_num
    
    o=cepstrals{1,file};
    n=zeros(size(o,1),cluster_num*Num_state);
    for s=1:Num_state
        for row=1:size(o,1)
            ave=all_ave{1,s};
            var=Variance{1,s};
            n(row,s*2-1)=(1/sqrt(((2*pi)^coefficients_num)*det(Variance{1,s})))*exp((-1/2).*(o(row,:)-ave(1,:))*(var^-1)*transpose(o(row,:)-ave(1,:)));    
        end
        for row=1:size(o,1)
            ave=all_ave{1,s};
            var=Variance{2,s};
            n(row,s*2)=(1/sqrt(((2*pi)^coefficients_num)*det(Variance{2,s})))*exp((-1/2).*(o(row,:)-ave(2,:))*(var^-1)*transpose(o(row,:)-ave(2,:)));
        end
    end
    N{file,1}=n;
end
