% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% Function H  


function g = H( x1,y1,z1,l1 )
global  mu0 gmu kmu nZ_mu Zmu0 lambda_Z_mu n2 Smu0 gm km Zm0 lambda_Z_m lambda_S_m gZ kZ

g= 1./(1+(x1./z1).^y1)+l1.*(1-(1./(1+(x1./z1).^y1)));
