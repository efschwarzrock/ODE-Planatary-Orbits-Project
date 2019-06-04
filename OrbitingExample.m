clear all;
clc;
timePeriod = [0 35000];
inital = [21000000, 21000000, -2000, 0];
ip = [21000000, 21000000];
iv = [-2000, 0];
MASS = 5.97*(10^24);

orbitPloter(ip, iv, MASS,timePeriod);
%func = @(t, x) (gravitationalFeildAceleration(t, x, MASS));
%[t, y] = ode45(func, timePeriod, inital);
%plot(y(:,1), y(:,2))
%axis equal