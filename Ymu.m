% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% Function Y_mu  


function s = Ymu(x2)
global  mu0 gmu kmu nZ_mu Zmu0 lambda_Z_mu n2 Smu0 gm km Zm0 lambda_Z_m lambda_S_m gZ kZ
gammamui=[0.005 0.05 0.5 0.5 0.5 0.5];
  Ymu1=0;
  for i=1:6
      Ymu1=Ymu1+gammamui(i).*i.*nchoosek(6,i).*(x2./mu0).^i;      
  end
s=(1./(1+x2./mu0).^6).*Ymu1;