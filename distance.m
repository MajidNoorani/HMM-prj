function [d]=distance(new,old,num_state)
dis=zeros(2,num_state);
check=zeros(1,num_state);
d=1;
for s=1:num_state
    new1=new{1,s};
    old1=old{1,s};
    distance1=0;
    distance2=0;
    
        for c=1:size(new1,2)
            distance1=(new1(1,c)-old1(1,c))^2+distance1;
            distance2=(new1(2,c)-old1(2,c))^2+distance2;
        end
    dis(1,s)=distance1;
    dis(2,s)=distance2;
end

for i=s:num_state
    if dis(1,s)>0.5 && dis(2,s)>0.5
        check(1,s)=0;
    else
        check(1,s)=1;
    end
end

for s=1:num_state
    d=check(1,s)*d;  %if d==0 then iteration is needed
end
        