function mu=mean_1D(signal,win)
    mu=signal; 
    for j=1+win:length(signal)-win
        temp=0;
        for i=-win:win
            temp=temp+signal(j+i);
        end
        mu(j)=temp/(win*2+1);
    end
end