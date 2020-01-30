
// Peter J. Lambert replication of:
// Kiyotaki, N. and Moore, J., 1997. Credit cycles.
// Journal of political economy, 105(2), pp.211-248 (adapted from user
// "angwon").

// This replication of KT97 is in fulfilment of the coursework for 
// EC539: Macroeconomics for Research Students,
// taught by Dr Shengxing Zhang

// All errors are my own.

var k q b u ;

varexo epsilon;

parameters phi lambda a R v pai kss qss bss uss;

a=1;
R=1.01;
v=2;
pai=0.1;
phi=20;
lambda=.975;

qss=(R/(R-1))*(pai*a-(1-lambda)*(1-R+pai*R)*phi)/(lambda*pai+(1-lambda)*(1-R+pai*R));
kss  = qss * (R-1)/R + v;
bss  = ((a + lambda*phi - phi)/(R-1)) * kss ;
uss = (R-1)*qss/R;

model;
q = q(+1)/R + (k - v);
k = (1-pai)*lambda*k(-1)+(pai/(q+phi-q(+1)/R))*( (a*(1+epsilon) +lambda*phi + q)*k(-1) - R*b(-1));
b = R*b(-1)+q*(k - k(-1))+phi*(k -lambda*k(-1))-a*(1+epsilon)*k(-1);
u = q-q(+1)/R;
end;

initval;
q=qss;
b=bss;
k=kss;
u=uss;
end;

resid;
steady;
check;

shocks;
var epsilon;
periods 1;
values 0.01;
end;

simul(periods=600);

figure
plot(k(1:30)/kss),hold on,plot(b(1:30)/bss,'r')
hold on,plot(q(1:30)/qss,'g')
hold on,plot(u(1:30)/uss,'m')
legend('k = K_{t}/K*','b = B_{t}/B*','q = q_{t}/q*','u = u_{t} / u*')
title('Figure 1: (based on Figure 3, p238, KM97)')

figure
subplot(221),plot(k(1:30)),title('k = K_{t}')
subplot(222),plot(b(1:30)),title('b = B_{t}')
subplot(223),plot(q(1:30)),title('q = q_{t}')
subplot(224),plot(u(1:30)),title('u = u_{t}')
sgtitle('Figure 2: In levels (i.e. not normalised by SS values) ')

figure
plot(k(1:100)/kss),hold on,plot(b(1:100)/bss,'r')
hold on,plot(q(1:100)/qss,'g')
hold on,plot(u(1:100)/uss,'m')
legend('k = K_{t}/K*','b = B_{t}/B*','q = q_{t}/q*','u = u_{t} / u*')
title('Figure 3: Longer time horizon / Return to SS')
