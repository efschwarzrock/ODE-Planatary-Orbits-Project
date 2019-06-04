function dd = gravitationalFeildAcelerationAndRocketThrust(t, pos, MASS, THRUST)
G = 6.67*(10^-11);
acel = G*MASS/(pos(1)^2 + pos(2)^2);
theta = atan(pos(2)/pos(1));
dd = [pos(3); pos(4); -acel*cos(theta)*sign(pos(1)) + THRUST(1); -acel*sin(theta)*sign(pos(1)) + THRUST(2)];