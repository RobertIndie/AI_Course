%% 初始化
% 元参数初始化
clear;
clc;
Nc=50;
w=4;
n=5;
N = [15 5 25 5];


%% 数据
% 读取数据
A = [40.8 3 3.6 3.5 7.4;285 36.3 75 8.4 133;42 62 5 63 73;260 130 29 84 92;23 12 12 10 61;528 3179 320 3020 2314;60 40 9.9 110 70;250 63 3.8 66 120;57 13 0.1 11 12;335 67 18 143 170;240 28 6 26 85;59 7.1 19 4.5 71;31 6.6 19 4.7 67;44 12.2 3.4 3.2 17.4;466.5 148.8 13 266 511];
B = [650 53 34 20 0;1565 93 34 47 0;160 90 27 17 5.8;35 25 0 23 22;0 5.2 5.12 9.58 14.6];
C = [280 1500 150 1200 140;1400 3000 560 3500 4;17000 110000 84000 89000 16000;249 726 278 938 0;228 380 82 1012 19;47 106 28.7 242.2 6.35;81 130 74 230 2.9;170 330 77 340 13;50 90 18 260 5.9;220 340 42 480 14;130 440 180 730 0;170 320 53 520 3.2;48 230 160 810 7;380 190 30 280 22;70 69 29 241 10;11 88 83 250 8.5;90 160 54 330 29;30 62 60 460 3.4;130 440 180 730 0;1000 4300 1100 5400 24;168 1353 581 3281 63;770 1420 401 1452 3;3606.4 1182 328.4 1604.8 6.3;613 3240 1432 2788 0;577 3541 521 2928 7];
D = [10 4 3 33 6;8.5 7.2 4.3 3.9 3.5;32 31 7.5 50 1.1;13.5 1.7 1.2 0.6 0;9.87 2.49 0.79 4.0 64.8];
testA=[35 25 0 23 22;160 90 27 17 5;565 93 34 47 0;150 53 34 20 0;980 73 58 12 0;176 206 47.7 75.7 68.7];
testB=[293 50 13 115 120;443 85 9.5 103 174];
testC=[73 520 140 1200 6;42 97 157 600 0;766 993 116 665 4;16 237 92 470 0;15 125 29 574 7;120 120 33 84 0.55;5 217 69 523 6;0 434 226 387 0;2844 8517 4422 10196 39;117 357 92 468 4;80 153 42 276 18;86 110 18 92 7.4;8 631 254 2020 39];
testD=[10 4 3 33 6;14.7 3.8 10.5 2.7 0.2;6.7 10 11 71 3.9;0.33 0.26 0.04 0.27 0];

% A=normal(A);
% B=normal(B);
% C=normal(C);
% D=normal(D);
% testA=normal(testA);
% testB=normal(testB);
% testC=normal(testC);
% testD=normal(testD);
% 归一化对结果无影响
% 使用归一化会降低准确率（失去了含量特征）

% A = parse(A,6);
% B = parse(B,20);
% C = parse(C,5);
% D = parse(D,20);

test_data={testA,testB,testC,testD};
testN=[6 2 13 4];
data = {A B C D};

%% 训练
% 训练
X1=mean(A)';
X2=mean(B)';
X3=mean(C)';
X4=mean(D)';
S1=cov(A);
S2=cov(B);
S3=cov(C);
S4=cov(D);
S1_=pinv(S1);
S2_=pinv(S2);
S3_=pinv(S3);
S4_=pinv(S4);
S11=det(S1);
S22=det(S1);
S33=det(S1);
S44=det(S1);
PW1=N(1)/Nc;
PW2=N(2)/Nc;
PW3=N(3)/Nc;
PW4=N(4)/Nc;

%% 测试
% 测试
correct = 0;
correct2 = 0;
total = 0;
for i=1:4
    disp(i);
sample=cell2mat(test_data(i))
count = testN(i);
% sample=cell2mat(data(i))
% count = N(i);
for k=1:count
%     P1=-1/2*(sample(k,:)'-X1)'*S1_*(sample(k,:)'-X1)+log(PW1)-1/2*log(S11);
%     P2=-1/2*(sample(k,:)'-X2)'*S2_*(sample(k,:)'-X2)+log(PW2)-1/2*log(S22);
%     P3=-1/2*(sample(k,:)'-X3)'*S3_*(sample(k,:)'-X3)+log(PW3)-1/2*log(S33);
%     P4=-1/2*(sample(k,:)'-X4)'*S4_*(sample(k,:)'-X4)+log(PW4)-1/2*log(S44);
    P1 = back(sample,k,X1,S1_,PW1,S11);
    P2 = back(sample,k,X2,S2_,PW2,S22);
    P3 = back(sample,k,X3,S3_,PW3,S33);
    P4 = back(sample,k,X4,S4_,PW4,S44);
    P=[ P1 P2 P3 P4]
    Pmax=max(P);
    w=0;
    if P1==max(P)
        w=1;
        %plot3(sample(k,1),sample(k,2),sample(k,3),'ro')
        %grid on;hold on
    elseif P2==max(P)
        w=2;
        %plot3(sample(k,1),sample(k,2),sample(k,3),'b>')
        %grid on;hold on
    elseif  P3==max(P)
      w=3;
      %plot3(sample(k,1),sample(k,2),sample(k,3),'g+')
      %grid on;hold on
    elseif P4==max(P)
      w=4;
      %plot3(sample(k,1),sample(k,2),sample(k,3),'y*')
      %grid on;hold on
    else
        disp("Fuck");
    end
    total = total + 1;
     disp(w);
     if i==w
        correct = correct +1;
     end
     if (i<=3 && w <=3) || (i==4 && w==4)
         correct2 = correct2 + 1;
     else
         
     end
end
end
disp('正确率');
correct2/total
correct/total

% 故障识别   类型识别  （左：学习样本；右：测试样本）
% 0.8913 0.84     0.5870 0.52
% 0.9 0.84              0.6 0.52   提高C的样本数
% 0.9 0.84              0.66 0.52   P1=(-1*(sample(k,:)'-X1)'*S1_*(sample(k,:)'-X1))+(log(PW1)-1/2*log(S11));