function dd = orbitPloter(initalPos, initalVelocity, MASSOFCENTER, timePeriod)
inital = [initalPos, initalVelocity];
func = @(t, x) (gravitationalFeildAceleration(t, x, MASSOFCENTER));
[t, y] = ode45(func, timePeriod, inital);
plot(y(:,1), y(:,2), 0, 0, 'r*', initalPos(1), initalPos(2), 'black*')
axis equal