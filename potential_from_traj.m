% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% This code generates the stochastic potential from the trajectory 

clc;
clear all;
format long
fileID =fopen('concentration_trajectory_forward_188_6.out','r');
fileID2 =fopen('probability.out','w');
fileID3 =fopen('potential.out','w');
fileID4 =fopen('probability2_4d.out','w');
%formatSpec = '%f %f %f %f %f %f %f';
formatSpec = '%f %f %f %f %f';
sizeA = [4 Inf];
A2 = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A2=A2';
b=size(A2);
nmax=40;
range=[max(A2(1:b(1),2)) min(A2(1:b(1),2)) max(A2(1:b(1),3)) min(A2(1:b(1),3)) max(A2(1:b(1),4)) min(A2(1:b(1),4))];
dm=(range(1)-range(2))/nmax;dmu=(range(3)-range(4))/nmax;
dZ=(range(5)-range(6))/nmax;
p_g(1:nmax+1,1:nmax+1,1:nmax+1)=1;
p_total=0.0;

for i=1:b(1)
    if A2(i,1)>5.0 
        m=fix((A2(i,2)-range(2))/dm)+1;
        mu=fix((A2(i,3)-range(4))/dmu)+1;
        Z=fix((A2(i,4)-range(6))/dZ)+1;
        p_g(m,mu,Z)=p_g(m,mu,Z)+1;
        p_total=p_total+1.0; 
    end
end
%p_g=p_g;


p=[];
m=range(2);
    p_xy=zeros(nmax,nmax);
    for i=1:nmax
        m=m+dm;
        mu=range(4);
            for j=1:nmax
                mu=mu+dmu; 
                    p_xy(i,j)=sum(p_g(:,j,i)); 
                    %p=[p; m mu p_xy(i,j)]; 
                    fprintf(fileID2, '%20.10f %20.10f %20.10f\n',m, mu, p_xy(i,j));
                    fprintf(fileID3, '%20.10f %20.10f %20.10f\n',m, mu, -log(p_xy(i,j)));
                    Z=range(6);
                    for k=1:nmax
                        Z=Z+dZ;
                        fprintf(fileID4, '%20.10f %20.10f %20.10f %20.10f\n',m, mu, Z, p_g(i,j,k));
                    end
            end 
            fprintf(fileID4, '\n');
    end

load probability2_4d.out
x=probability2_4d;
p=100.0*(x(:,4)/max(x(:,4)));
scatter3( x(:,1), x(:,2), x(:,3),p*10.0,p*10.0, 'filled')