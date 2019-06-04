clear all;
clc;
timePeriod = [0 4400];
inital = [2100000, 2100000, 0, 0];
ip = [2100000, 2100000];
iv = [0, 0];
THRUST = [40, 0];
MASS = 5.97*(10^24);
rocketPloter(ip, iv, MASS, THRUST, timePeriod, timePeriod);
%func = @(t, x) (gravitationalFeildAcelerationAndRocketThrust(t, x, MASS, THRUST));
%[t, y] = ode45(func, timePeriod, inital);
%plot(y(:,1), y(:,2));
%axis equal
