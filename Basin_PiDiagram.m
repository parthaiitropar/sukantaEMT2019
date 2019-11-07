% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% This code generates the pie daigram for a particular value of SNAIL

load trajectory_BS.out
p=trajectory_BS;
count1=0;
count2=0;
count3=0;
for i=1:length(p)
if p(i,1)==70
count1=count1+1;
end
if p(i,1)==330
count2=count2+1;
end
if p(i,1)==830
count3=count3+1;
end
end
q=[];
q=[q; count1 count2 count3];
pie(q);


