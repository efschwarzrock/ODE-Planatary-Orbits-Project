function d = rocketPloter(initalPos, initalVelocity, MASSOFCENTER, THRUST, timePeriodThrust, overallTimePeriod)
inital = [initalPos, initalVelocity];
inital1 = inital;
if(0 ~= timePeriodThrust(1))
    timePeriod1 = [0 timePeriodThrust(1)];
    orbitFunc1 = @(t, x1) (gravitationalFeildAceleration(t, x1, MASSOFCENTER));
    [t, y1] = ode45(orbitFunc1, timePeriod1, inital1);
    inital2 = [y1(end, 1), y1(end, 2), y1(end, 3), y1(end, 4)];
else
    orbitFunc1 = @(t, x1) (gravitationalFeildAceleration(t, x1, 0));
    [t, y1] = ode45(orbitFunc1, [0 1], inital1);
    inital2 = inital1;
end


timePeriod2 = [0 (timePeriodThrust(2)-timePeriodThrust(1))];
rocketFunc = @(t, x2) (gravitationalFeildAcelerationAndRocketThrust(t, x2, MASSOFCENTER, THRUST));
[t, y2] = ode45(rocketFunc, timePeriod2, inital2);
inital3 = [y2(end, 1), y2(end, 2), y2(end, 3), y2(end, 4)];


if(0 ~= (overallTimePeriod(2) - timePeriodThrust(2)))
    timePeriod3 = [0 (overallTimePeriod(2) - timePeriodThrust(2))];
    orbitFunc2 = @(t, x3) (gravitationalFeildAceleration(t, x3, MASSOFCENTER));
    [t, y3] = ode45(orbitFunc2, timePeriod3, inital3);
else
    orbitFunc3 = @(t, x3) (gravitationalFeildAceleration(t, x3, 0));
    [t, y3] = ode45(orbitFunc1, [0 1], inital1);
end

plot(y1(:,1), y1(:,2), 'g', y2(:,1), y2(:,2), 'r', y3(:,1), y3(:,2), 'b', 0, 0, 'r*', initalPos(1), initalPos(2), 'black*');
axis equal
