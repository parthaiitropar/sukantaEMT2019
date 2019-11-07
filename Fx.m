% Author: Sukanta Sarkar et al
% Date: 07/11/2019

% The deterministic model

function dxx=Fx(t,x)
global s q gmi kmi1 n1 z0mi lambdami n2 s0mi gmz kmz z0m lambdam lambdas gz kz


dxx=[gmi*hs(x(3),n1,z0mi,lambdami)*hs(s,n2,s0mi,lambdami)-...
    x(2)*ymi(x(1))-kmi1*x(1); gmz*hs(x(3),n2,z0m,lambdam)*hs(s,n2,s0mi,lambdas)-...
    x(2)*ym(x(1))-kmz*x(2); gz*x(2)*l(x(1))-kz*x(3)];