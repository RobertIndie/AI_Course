function [res] = parse(A,repeat)
%PARSE 此处显示有关此函数的摘要
%   此处显示详细说明
res = repmat(A,repeat,1); % 复制扩充：无用
rowrank = randperm(size(res, 1)); % 乱序：无用
res = res(rowrank, :);
res = zscore(res);
% res =A
end

