function [res] = parse(A,repeat)
%PARSE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res = repmat(A,repeat,1); % �������䣺����
rowrank = randperm(size(res, 1)); % ��������
res = res(rowrank, :);
res = zscore(res);
% res =A
end

