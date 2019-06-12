clear 
clc
syms pi t T r
%%%% this code can generate the differential end position
phi=2*pi*sin(0.5*pi*t/T)^2;
 tra=[0;...
    r*sin(phi);...
    r*cos(phi)-r];
dtra=diff(tra,t);