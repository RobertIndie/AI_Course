function [P1] = back(sample,k,X1,S1_,PW1,S11)
%BACK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
P1=(-1*(sample(k,:)'-X1)'*S1_*(sample(k,:)'-X1))+(log(PW1)-1/2*log(S11));
end

