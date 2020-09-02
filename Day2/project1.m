% Declare Variables
c = -0.8;
d = 0.165;
nmax = 22;

% ICs
x = zeros(nmax,1);
y = x;
x(1) = 0.1;
y(1) = 0.1;

for k = 1:nmax-1
   x(k+1) = x(k).^2  - y(k).^2 + c;
   y(k+1) = 2.*x(k).*y(k) + d;
end

figure
plot(1:nmax,x,'-ob','linewidth',1.5)
xlabel('n','fontsize',12)
ylabel('x','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])

figure
plot(x,y,'-ob','linewidth',1.5)
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])