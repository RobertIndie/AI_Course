%LMSE分类函数
function y=lmseclassify(sample)
clc;
pattern=struct('feature',[ ]);
N = [15 5 25 5];
A = [40.8 3 3.6 3.5 7.4;285 36.3 75 8.4 133;42 62 5 63 73;260 130 29 84 92;23 12 12 10 61;528 3179 320 3020 2314;60 40 9.9 110 70;250 63 3.8 66 120;57 13 0.1 11 12;335 67 18 143 170;240 28 6 26 85;59 7.1 19 4.5 71;31 6.6 19 4.7 67;44 12.2 3.4 3.2 17.4;466.5 148.8 13 266 511];
B = [650 53 34 20 0;1565 93 34 47 0;160 90 27 17 5.8;35 25 0 23 22;0 5.2 5.12 9.58 14.6];
C = [280 1500 150 1200 140;1400 3000 560 3500 4;17000 110000 84000 89000 16000;249 726 278 938 0;228 380 82 1012 19;47 106 28.7 242.2 6.35;81 130 74 230 2.9;170 330 77 340 13;50 90 18 260 5.9;220 340 42 480 14;130 440 180 730 0;170 320 53 520 3.2;48 230 160 810 7;380 190 30 280 22;70 69 29 241 10;11 88 83 250 8.5;90 160 54 330 29;30 62 60 460 3.4;130 440 180 730 0;1000 4300 1100 5400 24;168 1353 581 3281 63;770 1420 401 1452 3;3606.4 1182 328.4 1604.8 6.3;613 3240 1432 2788 0;577 3541 521 2928 7];
D = [10 4 3 33 6;8.5 7.2 4.3 3.9 3.5;32 31 7.5 50 1.1;13.5 1.7 1.2 0.6 0;9.87 2.49 0.79 4.0 64.8];
p1=A;
pattern(1).feature=p1';
pattern(1).feature(6,:)=1;
p2=B;
pattern(2).feature=p2';
pattern(2).feature(6,:)=1;
p3=C;
pattern(3).feature=p3';
pattern(3).feature(6,:)=1;
p4=D;
pattern(4).feature=p4';
pattern(4).feature(6,:)=1;    
w=zeros(6,6);%初始化
  flag=1;
  num=0;
  num1=0;
  d=[];
  m=[];
  r=[];
% s=xlsread('.\ln.xls')
  while flag
      flag=0;
      num1=num1+1;
      for i=1:4
          for j=1:N(i)
              num=num+1;
              r=[0 0 0 0];
              r(i)=1;
              for k=1:4
                  m=pattern(i).feature(:,j);
                  m=m/norm(m);
                  d(k)=w(:,k)'*m;
              end
              for k=1:4 
                  if k~=i
                      if d(i)<=d(k)
                          flag=1;
                      end
                  end
              end
                 %调整权值
                  num;
                  num1;
                  for k=1:4
                      w(:,k)=w(:,k)+m*(r(k)-d(k))/num;
                  end
              end
          end
          if num1>200
              flag=0;
          end
  end
      sample(6)=1;
      h=[];
      for k=1:4
          h(k)=w(:,k)'*sample;
      end
      [maxval,maxpos]=max(h);
      y=maxpos;
  