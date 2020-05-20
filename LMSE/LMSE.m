%主程序
%输入数据
clear all
close all
clc
% s1=xlsread('.\ln.xls')%读入数据
testA=[35 25 0 23 22;160 90 27 17 5;565 93 34 47 0;150 53 34 20 0;980 73 58 12 0;176 206 47.7 75.7 68.7];
testA(:,6)=1;
testB=[293 50 13 115 120;443 85 9.5 103 174];
testB(:,6)=2;
testC=[73 520 140 1200 6;42 97 157 600 0;766 993 116 665 4;16 237 92 470 0;15 125 29 574 7;120 120 33 84 0.55;5 217 69 523 6;0 434 226 387 0;2844 8517 4422 10196 39;117 357 92 468 4;80 153 42 276 18;86 110 18 92 7.4;8 631 254 2020 39];
testC(:,6)=3;
testD=[10 4 3 33 6;14.7 3.8 10.5 2.7 0.2;6.7 10 11 71 3.9;0.33 0.26 0.04 0.27 0];
testD(:,6)=4
s1=[testA;testB;testC;testD];
samp=s1(1:25,1:5);%读入测试数据
sampletotall=samp';
ac=[ ];%定义分类矩阵
correct = 0;
correct2 = 0;
total=25;
for k=1:total
    sample=sampletotall(:,k);
    y=lmseclassify(sample);
%     x=sample(1);
%     yy=sample(2);
%     z=sample(3);
    ac(k)=y;
    if y==s1(k,6)
       correct = correct +1;
    end
    if (s1(k,6)<=3 && y <=3) || (s1(k,6)==4 && y==4)
         correct2 = correct2 + 1;
    end
%     axis([0 3500 0 3500 0 3500]);
%     if y==1
%         plot3(x,yy,z,'g*')  %第一类用绿色表示
%     elseif y==2
%         plot3(x,yy,z,'b>')  %第二类用篮色表示
%     elseif y==3
%         plot3(x,yy,z,'ro')  %第三类用红色表示
%     elseif y==4
%         plot3(x,yy,z,'k+')  %第四类用黄色表示
%     end
%     hold on
end
correct/total
correct2/total
% 故障识别   类型识别  （左：学习样本；右：测试样本）
% NULL 0.84     NULL 0.72s
