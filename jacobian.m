clear
clc
%   the length of link is paramater
theta=sym ('theta',[1,6]);
%  the=-[i i i i i i];
% theta=the./180*pi;
syms pi;
syms a2 a3 d1 d4 d5 d6;
alp=[0 90 0 0 90 -90];
alpha=alp./180*pi;
a=[0 0 a2 a3 0 0];
d=[d1 0 0 d4 d5  d6];
% a=[0 0 -425 -392 0 0] ;
% d=[89.2 0 0 109.3 94.75 82.5];
T=eye(4);
P=zeros(3,1);
digits(5)
for i=1:1:6
A(:,:,i)=[cos(theta(i)) -sin(theta(i)) 0 a(i);...
    sin(theta(i))*cos(alpha(i)) cos(theta(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);...
    sin(theta(i))*sin(alpha(i)) cos(theta(i))*sin(alpha(i)) cos(alpha(i)) cos(alpha(i))*d(i);...
    0 0 0 1];

T=T*A(:,:,i);
P=[P,T(1:3,4)];

% plot3(Po(1,:),Po(2,:),Po(3,:),'-*')
% hold on
end
% simplify(P)
% simple(P)
% digits(3)
% vpa(P)
% vpa(P(:,7))
% simplify(P(:,7))
Poe=P(1:3,7);
jo=jacobian(Poe,theta);
simplify(jo(1,6))
save ('PandJ','P', 'jo');
