%% finding the evrage of clusters which has been provided by clustering function

function [average]= clusters_average(cluster1,cluster2)
sum1=zeros(1,size(cluster1,2));
sum2=zeros(1,size(cluster1,2));
for c=1:size(cluster1,2)
    for row1=1:size(cluster1,1)
        sum1(c)=cluster1(row1,c)+sum1(c);
    end
    for row2=1:size(cluster2,1)
        sum2(c)=cluster2(row2,c)+sum2(c);
    end
    
end
ave1=sum1/size(cluster1,1);
ave2=sum2/size(cluster2,1);
average=[ave1;ave2];