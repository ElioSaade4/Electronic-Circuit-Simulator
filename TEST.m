% -------------------------------------------------------------------------
%Author: Elio Saade
%
%Description: Simulator Test Bench
% -------------------------------------------------------------------------


global G C F b n;

%Specify the number of nodes n
n = 10;

G = zeros(n);
C = zeros(n);
b = zeros(n,1);
F = sym(zeros(n,1));

%%

%Write the netlist of the circuit
vol(1,0,1);
res(1,2,9600);
res(2,0,23200);
res(2,3,6800);
cap(2,4,96e-9);
cap(3,0,20.5e-9);
res(4,5,9300);
opa(3,4,4);
res(5,6,52200);
cap(5,6,15e-9);
opa(0,5,6);
res(6,7,9400);
res(5,10,9400);
cap(7,8,15e-9);
opa(0,7,8);
res(8,9,20e3);
res(9,10,20e3);
opa(0,9,10);

%%

%DC Solution
dc_sol = dcsolve_linear_LU();

%%

%Frequency Response
[fpoints,r] = fsolve_linear(1,1e5,5e3,10);
figure1 = figure;
semilogx(fpoints,r);
grid on;
xlabel('Frequency (Hz)');
ylabel('Vout (V)');
title('Frequency Response');

%%

%Transient Response
in = @(t) cos(2*pi*2000*t);
[tpoints,trans] = trans_trapeziodal(0,8e-3,20e-6,in,10);
figure2 = figure;
plot(tpoints,trans); 
grid on;
xlabel('Time (s)');
ylabel('Vout (V)');
title('Transient Response');
  