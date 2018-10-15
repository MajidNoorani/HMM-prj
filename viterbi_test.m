function [final_delta,states]=viterbi_test(aij_log,b_log,Num_state,model_num)

all_delta=cell(12,1);
states=cell(12,1);
for file=1:9
    delta=zeros(Num_state,size(b_log{file,1},1));
    b=b_log{file,1};
    delta(:,1:end)=-inf;
    delta(1,1)=b(1,1);
    prior_states=zeros(size(b,1),Num_state);
    
    for o=2:size(b,1)
        for j=1:Num_state
            for i = 1 : Num_state 
            d = delta (i,o-1)+aij_log(i,j)+b(o,j);
            if (d > delta(j,o))
                delta(j,o) = d;
                prior_states(o,j) = i;
            end
            end
        end
    end
    all_delta{file,1}=delta;
    last_state=prior_states(size(b,1),Num_state);
    frames_states_new = zeros (1,size(b,1));
    
    for k = size(b,1) : -1 : 1
        if (k == size(b,1))
            frames_states_new (k) = last_state;
            s = last_state;
        else
            frames_states_new (k) = prior_states (k+1,s);
            s = prior_states (k+1,s);
        end
    end
    states{file,1}=frames_states_new;
    
    
    
end

% plotting the dedicated states to all training data

for file=1:9
    
    
  
    figure(model_num+3)
    st=states{file,1};
    x=1:size(st,2);
    y=st(1,:);
    subplot(3,3,file)
    
    plot(x,y)
    if file==1 || file==2 || file==3
        title(['Test file: Darya ',num2str(file)])
    elseif file==4 || file==5 || file==6
        title(['Test file: Jangal ',num2str(file)])
    elseif file==7 || file==8 || file==9
        title(['Test file: Mordab ',num2str(file)])
    end
    xlabel('frames')
    ylabel('states')
    axis([1 size(st,2) 1 8])
    grid on
    
    set(gca,'ytick',1:8)
end

final_delta=zeros(1,9);
for file=1:9
    a=all_delta{file,1};
    [x]=max(a(:,end));
    final_delta(file)=x;
end

