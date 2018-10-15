function [V]= variance(o,ave,coefficients_num)
V=zeros(1,coefficients_num);
for i=1:coefficients_num
    for row=1:size(o,1)
        V(1,i)=(o(row,i)-ave(1,i))^2+V(1,i);
    end
end
V=V/size(o,1);