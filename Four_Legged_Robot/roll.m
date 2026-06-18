clear;

global s L W H Lc Lf Lt Init str;
str = 'Roll';
t = 30;

s = 30;
L = 190.4;
W = 129.4;
H = 120;
Lc = 38.6;
Lf = 87.7;
Lt = 82;
Init = [1 0 0;1 0 0;-1 0 0;-1 0 0] * L / 2 + [0 0 -1;0 0 1;0 0 -1;0 0 1] * 52.2/2;
L0 = zeros(abs(t)+1, 4, 3);      %시간, 다리번호, 관절번호

for theta = 0:sign(t):t
  L0(abs(theta)+1,1,:) = actuate(1, 0, -H * cos(deg2rad(theta)) + W * sin(deg2rad(theta)) / 2, W / 2 - H * sin(deg2rad(theta)) - W * cos(deg2rad(theta)) / 2);
  L0(abs(theta)+1,3,:) = actuate(3, 0, -H * cos(deg2rad(theta)) + W * sin(deg2rad(theta)) / 2, W / 2 - H * sin(deg2rad(theta)) - W * cos(deg2rad(theta)) / 2);
  L0(abs(theta)+1,2,:) = actuate(2, 0, -H * cos(deg2rad(theta)) - W * sin(deg2rad(theta)) / 2, -W / 2 - H * sin(deg2rad(theta)) + W * cos(deg2rad(theta)) / 2);
  L0(abs(theta)+1,4,:) = actuate(4, 0, -H * cos(deg2rad(theta)) - W * sin(deg2rad(theta)) / 2, -W / 2 - H * sin(deg2rad(theta)) + W * cos(deg2rad(theta)) / 2);
end
L1 = embody(L0, t);

Vid_3d = VideoWriter(strcat(str,'Simulation_t=', int2str(t), '_3D')); 
Vid_3d.FrameRate = 10;
open(Vid_3d)
for i=1:abs(t)
    h1 = plot3([Init(1,1) L1(i,1,1,1)], [Init(1,2) L1(i,1,1,2)], [Init(1,3) L1(i,1,1,3)],[L1(i,1,1,1) L1(i,1,2,1)], [L1(i,1,1,2) L1(i,1,2,2)], [L1(i,1,1,3) L1(i,1,2,3)], [L1(i,1,2,1) L1(i,1,3,1)], [L1(i,1,2,2) L1(i,1,3,2)], [L1(i,1,2,3) L1(i,1,3,3)], 'LineWidth', 5);
    hold on
    h3 = plot3([Init(2,1) L1(i,2,1,1)], [Init(2,2) L1(i,2,1,2)], [Init(2,3) L1(i,2,1,3)],[L1(i,2,1,1) L1(i,2,2,1)], [L1(i,2,1,2) L1(i,2,2,2)], [L1(i,2,1,3) L1(i,2,2,3)], [L1(i,2,2,1) L1(i,2,3,1)], [L1(i,2,2,2) L1(i,2,3,2)], [L1(i,2,2,3) L1(i,2,3,3)], 'LineWidth', 5);
    h4 = plot3([Init(3,1) L1(i,3,1,1)], [Init(3,2) L1(i,3,1,2)], [Init(3,3) L1(i,3,1,3)],[L1(i,3,1,1) L1(i,3,2,1)], [L1(i,3,1,2) L1(i,3,2,2)], [L1(i,3,1,3) L1(i,3,2,3)], [L1(i,3,2,1) L1(i,3,3,1)], [L1(i,3,2,2) L1(i,3,3,2)], [L1(i,3,2,3) L1(i,3,3,3)], 'LineWidth', 5);
    h5 = plot3([Init(4,1) L1(i,4,1,1)], [Init(4,2) L1(i,4,1,2)], [Init(4,3) L1(i,4,1,3)],[L1(i,4,1,1) L1(i,4,2,1)], [L1(i,4,1,2) L1(i,4,2,2)], [L1(i,4,1,3) L1(i,4,2,3)], [L1(i,4,2,1) L1(i,4,3,1)], [L1(i,4,2,2) L1(i,4,3,2)], [L1(i,4,2,3) L1(i,4,3,3)], 'LineWidth', 5);
    ylim([-200, 200])
    xlim([-200, 200])
    zlim([-200, 200])
    xlabel('x');
    ylabel('z');
    zlabel('y');
    hold on
    h2 = surf([-100,100], [-50, 50], [0 0; 0 0]);
    alpha 0.5;
    rotate(h1, [1 0 0], 90);
    rotate(h3, [1 0 0], 90);
    rotate(h4, [1 0 0], 90);
    rotate(h5, [1 0 0], 90);
%    rotate(h1, [0 1 0], t);
%    rotate(h2, [0 1 0], t);
    view(135,45);
    pause(0.01) 
    frame = getframe(gcf); 
    writeVideo(Vid_3d, frame);
    hold off
end
close(Vid_3d)

Vid_xy = VideoWriter(strcat(str,'Simulation_t=', int2str(t), '_XY')); 
Vid_xy.FrameRate = 10;
open(Vid_xy)
for i=1:abs(t)
    plot([Init(1,1) L1(i,1,1,1)], [Init(1,2) L1(i,1,1,2)], 'LineWidth', 5)
    ylim([-200, 200])
    xlim([-200, 200])
    xlabel('x')
    ylabel('y')
    hold on
    plot([L1(i,1,1,1) L1(i,1,2,1)], [L1(i,1,1,2) L1(i,1,2,2)] , 'LineWidth', 5)
    plot([L1(i,1,2,1) L1(i,1,3,1)], [L1(i,1,2,2) L1(i,1,3,2)] , 'LineWidth', 5)
    plot([Init(2,1) L1(i,2,1,1)], [Init(2,2) L1(i,2,1,2)],[L1(i,2,1,1) L1(i,2,2,1)], [L1(i,2,1,2) L1(i,2,2,2)],[L1(i,2,2,1) L1(i,2,3,1)], [L1(i,2,2,2) L1(i,2,3,2)], 'LineWidth', 5);
    plot([Init(3,1) L1(i,3,1,1)], [Init(3,2) L1(i,3,1,2)],[L1(i,3,1,1) L1(i,3,2,1)], [L1(i,3,1,2) L1(i,3,2,2)],[L1(i,3,2,1) L1(i,3,3,1)], [L1(i,3,2,2) L1(i,3,3,2)], 'LineWidth', 5);
    plot([Init(4,1) L1(i,4,1,1)], [Init(4,2) L1(i,4,1,2)],[L1(i,4,1,1) L1(i,4,2,1)], [L1(i,4,1,2) L1(i,4,2,2)],[L1(i,4,2,1) L1(i,4,3,1)], [L1(i,4,2,2) L1(i,4,3,2)], 'LineWidth', 5);
    pause(0.01)
    frame = getframe(gcf);
    writeVideo(Vid_xy, frame);
    hold off
end
close(Vid_xy)

Vid_yz = VideoWriter(strcat(str, 'Simulation_t=', int2str(t), '_YZ')); 
Vid_yz.FrameRate = 10;
open(Vid_yz)
for i=1:abs(t)
    plot([Init(1,2) L1(i,1,1,2)], [Init(1,3) L1(i,1,1,3)], 'LineWidth', 5)
    ylim([-200, 200])
    xlim([-200, 200])
    xlabel('y')
    ylabel('z')
    hold on
    plot([L1(i,1,1,2) L1(i,1,2,2)], [L1(i,1,1,3) L1(i,1,2,3)] , 'LineWidth', 5)
    plot([L1(i,1,2,2) L1(i,1,3,2)], [L1(i,1,2,3) L1(i,1,3,3)] , 'LineWidth', 5)
    plot([Init(2,2) L1(i,2,1,2)], [Init(2,3) L1(i,2,1,3)],[L1(i,2,1,2) L1(i,2,2,2)], [L1(i,2,1,3) L1(i,2,2,3)],[L1(i,2,2,2) L1(i,2,3,2)], [L1(i,2,2,3) L1(i,2,3,3)], 'LineWidth', 5);
    plot([Init(3,2) L1(i,3,1,2)], [Init(3,3) L1(i,3,1,3)],[L1(i,3,1,2) L1(i,3,2,2)], [L1(i,3,1,3) L1(i,3,2,3)],[L1(i,3,2,2) L1(i,3,3,2)], [L1(i,3,2,3) L1(i,3,3,3)], 'LineWidth', 5);
    plot([Init(4,2) L1(i,4,1,2)], [Init(4,3) L1(i,4,1,3)],[L1(i,4,1,2) L1(i,4,2,2)], [L1(i,4,1,3) L1(i,4,2,3)],[L1(i,4,2,2) L1(i,4,3,2)], [L1(i,4,2,3) L1(i,4,3,3)], 'LineWidth', 5);
    pause(0.01)
    frame = getframe(gcf); 
    writeVideo(Vid_yz, frame);
    hold off
end
close(Vid_yz)

function T = actuate(a,x,y,z)
T = zeros(1,3);
global Lc Lt Lf;
x1 = x;
y1 = -sqrt(y * y + z * z - Lc * Lc);

if (a == 2 || a == 4)
    z = z - Lc;
    T(1) = (acos(Lc * y1 * (y / Lc + z / y1) / (y1 * y1 + Lc * Lc)));
    T(2) = (acos((Lf * Lf + x1 * x1 + y1 * y1 - Lt * Lt) / (2 * Lf * sqrt(x1 * x1 + y1 * y1))) - atan(x1 / y1));
    T(3) = (asin((x ^ 2 + y ^ 2 + z ^ 2 - Lc ^ 2 - Lt ^ 2 - Lf ^ 2) / (2*Lf * Lt)));
end
if (a == 1 || a == 3)
    z = z + Lc;
    T(1) = (acos(Lc * y1 * (y / Lc - z / y1) / (y1 * y1 + Lc * Lc)));
    T(2) = (acos((Lf * Lf + x1 * x1 + y1 * y1 - Lt * Lt) / (2 * Lf * sqrt(x1 * x1 + y1 * y1))) - atan(x1 / y1));
    T(3) = (asin((x ^ 2 + y ^ 2 + z ^ 2 - Lc ^ 2 - Lt ^ 2 - Lf ^ 2) / (2*Lf * Lt)));
end
end

function L1 = embody(L0, t)
global Lc Lt Lf Init;
L1 = zeros(abs(t)+1, 4, 3, 3);   %시간, 다리번호, 관절끝점 3개, 3차원 좌표
Lc1 = Lc * [-1 1 -1 1];
for i = 1:4
for theta = 0:abs(t)
    L1(theta+1,i,1,:) = Init(i,:) + [0 -sin(L0(theta+1,i,1)) cos(L0(theta+1,i,1))] * Lc1(i);
    L1(theta+1,i,2,:) = reshape(L1(theta+1,i,1,:),[1,3]) + [-sin(L0(theta+1,i,2)) 0 0] * Lf + [0 -cos(L0(theta+1,i,1)) -sin(L0(theta+1,i,1))] * Lf * cos(L0(theta+1,i,2));
    L1(theta+1,i,3,:) = reshape(L1(theta+1,i,2,:),[1,3]) + [cos(L0(theta+1,i,2)+L0(theta+1,i,3)) 0 0] * Lt+ [0 -cos(L0(theta+1,i,1)) -sin(L0(theta+1,i,1))] * Lt * sin(L0(theta+1,i,2) + L0(theta+1,i,3));
end
end
end
