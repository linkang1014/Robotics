clear
clc
format long
theta0=zeros(6,1);
global dq ti
dq=[];
ti=[];
%  theta0=[0;-90;0;-90;0;0];
%%% plot a cycle in T s
thet0=theta0*pi/180;
r=40;   %mm
 syms pi;
T=10;  
[P0,T0,J0]=Position(theta0);
theta(:,1)=theta0;
h=0.01;     % sampling time
i=1;
  
% phi=2*pi*sin(0.5*pi*t/T)^2;
%    
% tra=[P0(1,7);...
%     r*sin(phi)+P0(2,7);...
%     r*cos(phi)+P0(3,7)-r];
options=odeset('relTol',1e-8,'AbsTol',1e-9);
[t,theta] = ode15s(@lotka,[0:0.01:10],theta0);

for i=1:1:length(t)
    [P,~,~]=Position(theta(i,:));
    dq(:,i)=lotka(t(i),theta(i,:));
    plot3(P(1,:),P(2,:),P(3,:),'-*')
    hold on
end
figure
for i=1:6
plot(t,theta(:,i));
hold on 
end
figure
for i=1:6
plot(t,dq(i,:));
hold on 
end
%  [P,T1,J]=Position(theta);
%  
%  J1=J(1:3,1:5);
%  dtheta=J1'*pinv(J1*J1')*dtra;
%  dtheta=[dtheta;0];
%  i=i+1;
%  theta(:,i)=theta(:,i-1)+dtheta*h;
%  t
% plot3(P(1,:),P(2,:),P(3,:),'-*')
% hold on


function dtheta = lotka(t,theta)
global dq ti
r=40;
T=10;
dtra=[ 0;...
  (2*r*pi^2*cos((pi*t)/(2*T))*sin((pi*t)/(2*T))*cos(2*pi*sin((pi*t)/(2*T))^2))/T;...
 -(2*r*pi^2*cos((pi*t)/(2*T))*sin((pi*t)/(2*T))*sin(2*pi*sin((pi*t)/(2*T))^2))/T];
 [~,~,J]=Position(theta);
dtheta=J'/(J*J')*dtra;
end
