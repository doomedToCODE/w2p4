J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
Kp = 21;
Ki = 500;
Kd = 0.05;

for i = 1:3
    C(:,:,i) = pid(Kp,Ki,Kd);
    Kd = Kd + 0.1;
end
% dist_cl = feedback(P_motor,C);
% t = 0:0.001:0.2;
% step(dist_cl(:,:,1), dist_cl(:,:,2), dist_cl(:,:,3), t)
% ylabel('Position, \theta (radians)')
% title('Step Response with K_p = 21, K_i = 500 and Different values of K_d')
% legend('Kd = 0.05', 'Kd = 0.15', 'Kd = 0.25')

dist_cl = feedback(P_motor,C);
t = 0:0.001:0.2;
step(dist_cl(:,:,1), dist_cl(:,:,2), dist_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Step Disturbance Response with K_p = 21, K_i = 500 and Different values of K_d')
legend('Kd = 0.05', 'Kd = 0.15', 'Kd = 0.25')