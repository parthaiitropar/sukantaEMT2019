% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% This code generates the steady state values needed for the calculation of
% basin stability


clc;
clear all;

global s q gmi kmi1 n1 z0mi lambdami n2 s0mi gmz kmz z0m lambdam lambdas gz kz
fileID =fopen('trajectory_BS.out','w');
q=10000;gmi=2100;kmi1=0.05;
n1=3;z0mi=220000;lambdami=0.1;n2=2;s0mi=180000;
gmz=11;kmz=0.5;z0m=25000;lambdam=7.5;lambdas=10;
gz=100;kz=0.1;
q1=[];
s=200000;
for i=1:10000
    display(i);
ic=[(1400+22000*rand(1)) 900*rand(1) 3000+800000*rand(1)];
[t,xa]=ode45('Fx',[0:0.01:2000],ic);
fprintf(fileID,'%d\n',round(xa(end,2),-1));
end
