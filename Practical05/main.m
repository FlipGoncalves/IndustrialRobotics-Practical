%% Ex1
Q1 = [1
      3
     -2];

Q2 = [4
      0
     -8];

N = 4;

MQ = LinspaceVect(Q1, Q2, N);


%% Ex2

N = 4;

Q1 = [1
      3
     -2];

Q2 = [4
      0
     -4];

Q3 = [3
      5
      0];

Q4 = [6
     -1
      3];

MQ1 = LinspaceVect(Q1,Q2,N);
MQ2 = LinspaceVect(Q2,Q3,N);
MQ3 = LinspaceVect(Q3,Q4,N);

MMQ = [MQ1 MQ2(:,2:size(MQ2,2)) MQ3(:,2:size(MQ3,2))];

%% Ex3

close all

L1 = 2;
L2 = 1;

Q1 = [0 0]';
Q2 = [60*pi/180 60*pi/180]';

N = 7;

MQ = LinspaceVect(Q1,Q2,N);

DH = [0 L1 0 0
      0 L2 0 0];

MDH = GenerateMultiDH(DH, MQ);

[P,F] = seixos3(0.3); 

for i=1:size(MDH,3)
    AA=Tlinks(MDH(:,:,i));
    Org=LinkOrigins(AA);
    h=DrawLinks(Org);
    H=DrawFrames(AA,P,F);
end


%% Ex6

figure;

L1 = 1;
L2 = 1;

Q1 = [0 0 0]';
Q2 = [0 60*pi/180 1];

N = 5;

t = [0 0 1];

MQ = LinspaceVect(Q1, Q2, N);

DH = [0 0 L1 pi/2
      0 L2 0 0
      0 0 0 pi/2];

MDH2 = GenerateMultiDH(DH,MQ,t)

[P,F] = seixos3(0.3); 

for i=1:size(MDH2,3)
    AA=Tlinks(MDH2(:,:,i));
    Org=LinkOrigins(AA);
    h=DrawLinks(Org);
    H=DrawFrames(AA,P,F);
end








