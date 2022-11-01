%% Ex1

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

fill(A1(1,:), A1(2,:), 'y');

v = [5 0]';
A2 = A1 + v;

hold on;
fill(A2(1,:), A2(2,:), 'r');


%% EX2 a)

hold on;
A3 = Rotation(50) * A2;
p = fill(A3(1,:), A3(2,:), 'c');
fill(A3(1,:), A3(2,:), 'b');

axis([-10, 10, -10, 10]);
axis equal
grid on

for N = 60:10:350
    hold on;
    A3 = Rotation(N) * A2;
    %fill(A3(1,:), A3(2,:), 'c');
    %pause(0.5)
    set(p, 'XData', A3(1,:), 'YData', A3(2,:));
    pause(0.3);
end

%% Ex2 b)
figure;
axis([-10, 10, -10, 10]);
axis equal
grid on

for N = 60:20:350
    hold on;
    A3 = Rotation(N) * A2;
    fill(A3(1,:), A3(2,:), 'g');
end

%% Ex2 c)
figure;
axis([-10, 10, -10, 10]);
axis equal
grid on

for N = 60:50:350
    hold on;
    A3 = Rotation(N) * A2;
    fill(A3(1,:), A3(2,:), 'p');
end


%% Ex3
close
clear

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

p = fill(A1(1,:), A1(2,:), 'r');
axis equal
axis([-10 10 -10 10]);
grid on

N = 50;
t = linspace(0,1,N);

A1_homogenio = [A1; 1 1 1];

u1 = [3 4]';
for k = 1:N
    hold on;
    M = TransGeom(u1(1)*t(k), u1(2)*t(k), 0);
    An = M * A1_homogenio;
    set(p, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end

A1_homogenio = An;

alpha = 80*pi/180;
for k = 1:N
    hold on;
    M = TransGeom(0,0,alpha*t(k));
    An = M * A1_homogenio;
    set(p, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end

A1_homogenio = An;

u2 = [2 -5]';
for k = 1:N
    hold on;
    M = TransGeom(u2(1)*t(k), u2(2)*t(k), 0);
    An = M * A1_homogenio;
    set(p, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end
