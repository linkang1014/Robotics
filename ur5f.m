clear
clc
format long
% theta=zeros(6,1);
theta0=[0;-90;0;-90;0;0];
thet0=theta0*pi/180;
%%% plot a cycle in T s
 pi;
T=10;  
[P0,T0,J0]=Position(theta0);
h=0.01;     % sampling time
i=1;
q0=theta0;   % q is the angular of each joint
for t=0:1:100
    q(:,i)=q0+t*pi/180;
 
 [P,T1,J]=Position(q(:,i));
 P1(:,:,i)=P;
 
 t
plot3(P1(1,:,i),P1(2,:,i),P1(3,:,i),'-*');
hold on
i=i+1;
end


