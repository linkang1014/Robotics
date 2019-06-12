clear
clc
% theta=sym ('theta',[1,6]);
the=[0 -90 0 -90 0 0];
for i=1:10
%  the=[i i i i i i];
theta=the./180*pi;
alp=[0 90 0 0 90 -90];
alpha=alp./180*pi;
a=[0 0 -425 -392 0 0] ;
d=[89.2 0 0 109.3 94.75 82.5];
T=eye(4);
P=zeros(4,1);
for i=1:1:length(alpha)
A(:,:,i)=[cos(theta(i)) -sin(theta(i)) 0 a(i);...
    sin(theta(i))*cos(alpha(i)) cos(theta(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);...
    sin(theta(i))*sin(alpha(i)) cos(theta(i))*sin(alpha(i)) cos(alpha(i)) cos(alpha(i))*d(i);...
    0 0 0 1];
T=T*A(:,:,i);
P=[P,T(:,4)];
Po=P(1:3,:);
plot(Po(2,:),Po(3,:),'-*')
hold on
end
end
