function []=text_report(aij_log,all_variance,all_ave,Num_state,coefficients_num,cluster_num,model_num)


if model_num==1
    textfile='model1.txt';
    fileID = fopen(textfile,'w');
    fprintf(fileID,'<BEGINHMM>:\r\n');
elseif model_num==2
    textfile='model2.txt';
    fileID = fopen(textfile,'w');
    fprintf(fileID,'<BEGINHMM>:\r\n');
elseif model_num==3
    textfile='model3.txt';
    fileID = fopen(textfile,'w');
    fprintf(fileID,'<BEGINHMM>:\r\n');
end

fprintf(fileID,' <NUMSTATE>: %d\r\n', Num_state);
for s=1:Num_state
    ave=all_ave{1,s};
    var=all_variance{1,s};
    var=diag(var);
    fprintf(fileID,' <State> %d \t <NUMMIXES> %d\r\n',s,cluster_num);
    fprintf(fileID,' <MIXTURE> 1\r\n');
    fprintf(fileID,' <MEAN> %d\r\n', coefficients_num);
    fprintf(fileID,'%3.6f ',ave(1,:));
    fprintf(fileID,'\r\n');
    fprintf(fileID,' <VARIANCE> %d\r\n', coefficients_num);
    fprintf(fileID,'%3.6f ',var(:,1));
    fprintf(fileID,'\r\n');
    fprintf(fileID,' <MIXTURE> 2\r\n');
    fprintf(fileID,' <MEAN> %d\r\n', coefficients_num);
    fprintf(fileID,'%3.6f ',ave(2,:));
    fprintf(fileID,'\r\n');
    var=all_variance{2,s};
    var=diag(var);
    fprintf(fileID,' <VARIANCE> %d\r\n', coefficients_num);
    fprintf(fileID,'%3.6f ',var(:,1));
    fprintf(fileID,'\r\n');
end
%% aij

aij=10.^aij_log;
fprintf(fileID,'\r\n\r\n\r\n');
fprintf(fileID,'<TRANSP>');
fprintf(fileID,'\r\n');
for s=1:Num_state
    fprintf(fileID,'%1.6f ',aij(s,:));
    fprintf(fileID,'\r\n');
end
fprintf(fileID,'<ENDHMM>');
fclose(fileID);