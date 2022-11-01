
close all;

DH=[ -pi/4 1 0 0;
    pi/2 1.5 0 0;
    -pi/3 0.5 0 0;
    ];

AA = Tlinks(DH);

Org=LinkOrigins(AA);

h=DrawLinks(Org);

[P, F] = seixos3(0.3);

H=DrawFames(AA,P,F);


%% RR planar

RR_DH=[0 3 0 0
        0 2 0 0];

RR_AA = Tlinks(RR_DH);
Org=LinkOrigins(RR_AA);
h=DrawLinks(Org);
[P, F] = seixos3(0.3);
H=DrawFames(RR_AA,P,F);

%% RRR planar

RRR_DH=[0 3 0 0
        0 2 0 0
        0 2 0 0];

RRR_AA = Tlinks(RRR_DH);
Org=LinkOrigins(RRR_AA);
h=DrawLinks(Org);
[P, F] = seixos3(0.3);
H=DrawFames(RRR_AA,P,F);

%% RR a 3D

RRR_DH=[0 0 3 pi/2
        0 2 0 0];

RRR_AA = Tlinks(RRR_DH);
Org=LinkOrigins(RRR_AA);
h=DrawLinks(Org);
[P, F] = seixos3(0.3);
H=DrawFames(RRR_AA,P,F);

%% RRR a 3D

RRR_DH=[0 0 3 pi/2
        0 2 0 0
        0 2 0 0];

RRR_AA = Tlinks(RRR_DH);
Org=LinkOrigins(RRR_AA);
h=DrawLinks(Org);
[P, F] = seixos3(0.3);
H=DrawFames(RRR_AA,P,F);



