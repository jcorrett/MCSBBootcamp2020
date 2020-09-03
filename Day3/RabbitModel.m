close all
clear all
clc
% 
% [x,nvec] = DiscretePopSolve(2.836,0.6,1e3);
% plot(nvec,x,'bo')
% x = x(end-30:end);
% unique(x)

rvec = linspace(0,3,1e4);
K = 0.6;
N = 1e6;

figure
hold on
xi = 1;
for i = 1:length(rvec)
    r = rvec(i);
    [x,nvec] = DiscretePopSolve(r,K,N);
    eq = FindEQ(x);
    for j = 1:length(eq)
        xvec(xi) = eq(j);
        rplot(xi) = r;
        xi = xi+1;
    end
    clc
    disp(['Compeletion : ',num2str(100*i/length(rvec)),'%'])
end

figure
plot(rplot,xvec,'k.')
xlabel('r','fontsize',12)
ylabel('Population (Thousands)','fontsize',12)
title('Rabbit Population Bifurcation Diagram','fontsize',16)

function[x,nvec] = DiscretePopSolve(r,K,N)

    nvec = (1:N)';
    x = zeros(N,1);
    x(1) = 0.2;

    for n = 2:N
    x(n) = x(n-1) + r*(1-x(n-1)./K).*x(n-1);
    end

end

function[eq] = FindEQ(x)
    x = x(end-1e3:end);
%     eq = [];
%     eq = uniquetol(x,1e-10);
    eq = x;
end