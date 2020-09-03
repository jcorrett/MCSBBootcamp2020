close all
clear all
clc

% Declare Variables
c = -0.8;
d = 0.2;
nmax = 22;

% ICs
x = zeros(nmax,1);
y = x;
x(1) = 0.1;
y(1) = 0.1;

% Part a
for k = 1:nmax-1
   x(k+1) = x(k).^2  - y(k).^2 + c;
   y(k+1) = 2.*x(k).*y(k) + d;
end

% Part b
figure
plot(1:nmax,x,'-ob','linewidth',1.5)
xlabel('n','fontsize',12)
ylabel('x','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])

% Part c
figure
plot(x,y,'ob','linewidth',1.5)
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])

% Part d
a = -2;
b = 2;
r = @(a,b,m) a + (b-a)*rand(m,1);

% Part e
% m = 100;
m = 1e7; % uncomment for part g
rx = r(a,b,m);
ry = r(a,b,m);

figure
plot(rx,ry,'ob','linewidth',1.5)
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title('Random Initial Conditions')

% Part f
kin = 1;
kout = 1;
xin = [];
yin = [];
xout = [];
yout = [];


for j = 1:m
    x(1) = rx(j);
    y(1) = ry(j);

    % Part a
    for k = 1:nmax-1
       x(k+1) = x(k).^2  - y(k).^2 + c;
       y(k+1) = 2.*x(k).*y(k) + d;
    end
    
    if abs(x(nmax))<2 && abs(y(nmax))<2
        xin(kin) = x(1);
        yin(kin) = y(1);
        kin = kin+1;
    else
        xout(kout) = x(1);
        yout(kout) = y(1);
        kout = kout + 1;
    end
end

figure
hold on
if ~isempty(xin)
    plot(xin,yin,'g*','linewidth',1.5)
end
if ~isempty(xout)
    plot(xout,yout,'k.','linewidth',1.5)
end
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title(['Random Initial Conditions at n = ',num2str(nmax)])

% Part i
xin = [];
yin = [];
kin = [];

for j = 1:m
    x(1) = rx(j);
    y(1) = ry(j);

    % Part a
    k = 1;
    while abs(x(k))<2 && abs(y(k))<2
       x(k+1) = x(k).^2  - y(k).^2 + c;
       y(k+1) = 2.*x(k).*y(k) + d;
       k = k+1;
    end
    
    xin(j) = x(1);
    yin(j) = y(1);
    kin(j) = k-1;


end

figure
scatter(xin,yin,1,kin);


