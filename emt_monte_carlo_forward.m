% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% This code generates the time series (for the forward transition)
% of ZEB mRNA levels from the probabilistic model 
% through Monte Carlo simulation 

clc;
clear all;

global  mu0 gmu kmu nZ_mu Zmu0 lambda_Z_mu n2 Smu0 gm km Zm0 lambda_Z_m lambda_S_m gZ kZ
fileID1=fopen('forward.out','w');

%%PARAMETERS FOR THE SIMULATION
mu0=10000;Zmu0=220000;Zm0=25000;Smu0=180000;Sm0=180000;m0=50;
gmu=2100; gm=11; kmu=0.05; km=0.5;gZ=100;kZ=0.1;Z0=10000;
m=m0;mu=mu0;Z=Z0;
m1=m0;mu1=mu0;Z1=Z0;
nZ_mu=3;lambda_Z_mu=0.1;n2=2;lambda_Z_m=7.5;lambda_S_m=10.0;
nZ_m=n2;nS_m=n2;nS_mu=n2;lambda_S_mu=lambda_Z_mu;
p=[];
n = 0;                  % Reaction counter.
S=150000;
S_max=250000;
t_max = 20;
dt=0.01;
n_max=t_max/dt;
dS=(S_max-S)/n_max;
disp(n_max);
while n<n_max
    disp(n);
    n = n + 1;
    S=S+dS;
    t=0;
    while t < t_max
        hZ_mu=H(Z,nZ_mu,Zmu0,lambda_Z_mu);
        hS_mu=H(S,nS_mu,Smu0,lambda_S_mu);
        hZ_m=H(Z,nZ_m,Zm0,lambda_Z_m);
        hS_m=H(S,nS_m,Sm0,lambda_S_m);
        h1=hZ_mu.*hS_mu;
        h2=hZ_m.*hS_m;
        
        aa=[h1*gmu m*Ymu(mu) mu*kmu h2*gm m*Ym(mu) m*km m*gZ*L(mu) Z*kZ];
        aa0 = sum(aa);
        r = rand(2,1);
        tau = -log(r(1))/aa0;
        rxn = find(r(2)*aa0 <= cumsum(aa),1,'first');
        t = t + tau;
        
        switch rxn
            case 1
                mu=mu+1;
            case 2
                mu=mu-1;
               
            case 3
                mu=mu-1;
            case 4
                m=m+1;
            case 5
                m=m-1;
              
            case 6
                m=m-1;
            case 7
              
                Z=Z+1;
            case 8
                Z=Z-1;
        end
    end
    
    fprintf(fileID1, '%f %f %f %f %f\n',S, t, m, mu, Z);
end


