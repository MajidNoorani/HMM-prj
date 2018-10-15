%% dividing frames in 2 clusters with the help of enjoying 2 center points 

function [clus1,clus2]=clustering(all_frames,center_point1,center_point2)
cluster1=[];
cluster2=[];
for row=1:size(all_frames,1)
    distance1=0;
    distance2=0;
    
    for c=1:size(all_frames,2)
        distance1=(all_frames(row,c)-center_point1(1,c))^2+distance1;
        distance2=(all_frames(row,c)-center_point2(1,c))^2+distance2;
    end
    if distance1<=distance2
        cluster1=[cluster1;all_frames(row,:)];
    else
        cluster2=[cluster2;all_frames(row,:)];
    end
end
clus1=cluster1;
clus2=cluster2;