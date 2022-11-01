%% Ex1
close

[P,F] = seixos3(1);

% só consideramos linhas 1 a 3 porque a 4 é a parte das coordenadas
% homogéneas
h = patch('Vertices', P(1:3,:)', 'Faces', F, 'Facecolor', 'g');
grid on; axis equal; hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-1 6 -1 7 -1 7]);
view(120,30);

% auxiliary blue axis lines
line([0 0]', [0 0]', [0 10]')
line([0 10]', [0 0]', [0 0]')
line([0 0]', [0 10]', [0 0]')

% auxiliary red trajectory line
traj = [ 0 0 0 4 4 4
    0 0 6 6 6 0
    0 5 5 5 0 0];
pp = line(traj(1,:)', traj(2,:)', traj(3,:)');
pp.LineStyle = '-.';
pp.Color = 'r';

% Obj 1 - trans em Z e rotação local de -90 em X

% transformações
% cada uma é em relação ao referencial local
T(:,:,1) = Trans(0,0,5)*RotX(-pi/2);
T(:,:,2) = Trans(0,0,6)*RotY(pi/2);
T(:,:,3) = Trans(0,0,4)*RotX(-pi/2);
T(:,:,4) = Trans(0,0,5)*RotY(pi/2);
T(:,:,5) = Trans(0,0,6)*RotX(-pi/2);

TT = eye(4);
for n=1:size(T,3)

    TT = TT*T(:,:,n);
    P2 = TT*P;
    patch('Vertices', P2(1:3,:)', 'Faces', F, 'Facecolor', 'b');

end

%% Ex4: testing manimate
% warning: for this to work, you can't close the window of the previous
% exercise

NN = 500;
Tset = mrotz(linspace(0,2*pi,NN));
Tcurr = eye(4);

manimate(h,P,Tcurr,Tset,0);

%% Ex5

NN = 50;
clear T;

% path with mixed pre- and pos-multiplications
T(:,:,:,1) = mtrans(0,0,linspace(0,5,NN));
T(:,:,:,2) = mrotx(linspace(0,-pi/2,NN));
T(:,:,:,3) = mtrans(0,linspace(0,6,NN),0);
T(:,:,:,4) = mroty(linspace(0,pi/2,NN));
T(:,:,:,5) = mtrans(linspace(0,4,NN),0,0);
T(:,:,:,6) = mrotx(linspace(0,-pi/2,NN));

order = [0 1 0 1 0 1 0 1 0 1 1 0 0];

Tcurr = eye(4);

for n=1:size(T,4)
    Tcurr = manimate(h, P, Tcurr, T(:,:,:,n), order(n));
    pause();
end