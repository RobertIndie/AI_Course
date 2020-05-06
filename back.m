function [P1] = back(sample,k,X1,S1_,PW1,S11)
%BACK 此处显示有关此函数的摘要
%   此处显示详细说明
P1=(-1*(sample(k,:)'-X1)'*S1_*(sample(k,:)'-X1))+(log(PW1)-1/2*log(S11));
end

