% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% Function L  


function s = L(x2)
global  mu0 gmu kmu nZ_mu Zmu0 lambda_Z_mu n2 Smu0 gm km Zm0 lambda_Z_m lambda_S_m gZ kZ

li=[0.6,0.3,0.1,0.05,0.05,0.05];
L1=1.0;
for i=1:6
L1=L1+li(i).*nchoosek(6,i).*(x2./mu0).^i;
end
s=(1./(1+x2./mu0).^6).*L1;