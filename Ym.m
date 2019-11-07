% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% Function Y_m 


function s = Ym(x2)
global  mu0 gmu kmu nZ_mu Zmu0 lambda_Z_mu n2 Smu0 gm km Zm0 lambda_Z_m lambda_S_m gZ kZ

gammami=[0.04 0.2 1 1 1 1];
Ym1=0.0;
for i=1:6
Ym1=Ym1+gammami(i).*nchoosek(6,i).*(x2./mu0).^i;
end
s=(1./(1+x2./mu0).^6).*Ym1;