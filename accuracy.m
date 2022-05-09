function [acc] = accuracy(predict,tunlabel)
[n_predict,x] = size(predict);
acc = 1;
for i = 1:n_predict
    if predict(i,1) == tunlabel(1,i)
        acc = acc + 1;
    end
end
acc = acc/n_predict *100;
end