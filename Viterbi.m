function [frames_state]=Viterbi(cepstrals,b_log,aij_log,Num_state,model_num)
all_delta=cell(12,1);
states=cell(12,1);


for file=1:12
    delta=zeros(Num_state,size(b_log{file,1},1));
    b=b_log{file,1};
    delta(:,:)=-inf;
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
    states_new = zeros (1,size(b,1));
    
    for o = size(b,1) : -1 : 1
        if o == size(b,1)
            states_new(o) = last_state;
            s = last_state;
        else
            states_new(o) = prior_states(o+1,s);
            s = prior_states(o+1,s);
        end
    end
    states{file,1}=states_new;
end

% plotting the dedicated states to all training data

for file=1:12
    figure(model_num)
    
    st=states{file,1};
    x=1:size(st,2);
    y=st(1,:);
    subplot(4,3,file)
    plot(x,y)
    title(['Learning file ',num2str(file)])
    xlabel('frames')
    ylabel('states')
    axis([1 size(st,2) 1 8])
    grid on
    set(gca,'ytick',1:8)
end
frames_state=cell(12,Num_state);

for file=1:12
    for o=1:size(states{file},2)
        index=states{file}(o);
        frames_state{file,index}=[frames_state{file,index};cepstrals{1,file}(o,:)];
    end
end
       