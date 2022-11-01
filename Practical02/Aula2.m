%% Ex1

close all;
figure;

P1 = [-1 0 0]';
P2 = [1 0 0]';
P3 = [0 2 0]';
A1 = [P1 P2 P3];

p = fill3(A1(1,:), A1(2,:), A1(3,:), 'r');

axis equal
axis([-3 3 -3 3 -3 3]);
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

N = 200;
t = linspace(0,1,N);

alpha = 4*pi;
A1_homogenio = [A1; 1 1 1];

for k = 1:N
    hold on;
    M = RotX(alpha*t(k));
    An = M * A1_homogenio;
    set(p, 'XData', An(1,:), 'YData', An(2,:), 'ZData', An(3,:));
    pause(0.05);
end


%% Ex2

close all;
figure;

P = [   0.5 0.5 1   0   -1  -0.5    -0.5
        0   2   2   3   2   2       0
        0   0   0   0   0   0       0
        1   1   1   1   1   1       1
    ];

fill3(P(1,:), P(2,:), P(3,:), 'g');

Px = RotX(pi) * P;
Py = RotY(3*pi/2) * RotX(pi/2) * P;
Pz = RotZ(pi/2) * RotX(pi/2) * P;

hold on;
fill3(Px(1,:), Px(2,:), Px(3,:), 'p');
fill3(Py(1,:), Py(2,:), Py(3,:), 'r');
fill3(Pz(1,:), Pz(2,:), Pz(3,:), 'y');

axis equal
axis([-3 3 -3 3 -3 3]);
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on


%% Ex3
close all;
figure;

P = [   0.5 0.5 1   0   -1  -0.5    -0.5
        0   2   2   3   2   2       0
        0   0   0   0   0   0       0
        1   1   1   1   1   1       1
    ];

Px = RotX(pi) * P;
Py = RotY(3*pi/2) * RotX(pi/2) * P;
Pz = RotZ(pi/2) * RotX(pi/2) * P;

P_x = fill3(Px(1,:), Px(2,:), Px(3,:), 'p');
hold on;
P_y = fill3(Py(1,:), Py(2,:), Py(3,:), 'r');
P_z = fill3(Pz(1,:), Pz(2,:), Pz(3,:), 'y');

axis equal
axis([-3 3 -3 3 -3 3]);
view(120, 30);
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

N = 500;
alpha = 2*pi;
t = linspace(0,alpha,N);

for k = 1:N
    X = RotX(t(k)) * Px;
    Y = RotZ(0.1*t(k)) * Py;
    Z = RotY(2*t(k)) * Pz;
    set(P_x, 'XData', X(1,:), 'YData', X(2,:), 'ZData', X(3,:));
    set(P_y, 'XData', Y(1,:), 'YData', Y(2,:), 'ZData', Y(3,:));
    set(P_z, 'XData', Z(1,:), 'YData', Z(2,:), 'ZData', Z(3,:));
    pause(0.05);
end


%% Ex4

close all;
figure;

P = [   0.5 0.5 1   0   -1  -0.5    -0.5
        0   2   2   3   2   2       0
        0   0   0   0   0   0       0
        1   1   1   1   1   1       1
    ];

h = fill3(P(1,:), P(2,:), P(3,:), 'y');

axis equal
siz = 20;
axis([-siz siz -siz siz -siz siz]);
view(120, 30);
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

hold on;
N = 50;
pInicial = eye(4);

D = [ 0 0 0 pi/2 0 0
      0 0 5 0 0 0
      0 0 0 0 -pi/2 0
      0 6 0 0 0 0
      0 0 0 0 -pi 0
      4 0 0 0 0 0
      0 0 0 0 pi/2 0
      0 0 -5 0 0 0
      0 0 0 -pi/2 0 0
      0 -6 0 0 0 0
    ];

for i = 1:10
    pFinal = Animate(h, P, pInicial, D(i, :), N);
    pInicial = pFinal;
end
