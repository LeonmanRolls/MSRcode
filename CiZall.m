%This script will cycle through and figure out all of the CiZs 
%without fuel motion, i.e. it will work out the concentration 
%of each precursor group for each z.

%Precursors outside of the core do not contribute to the reaction as
%the neutrons they produce have no graphite around them to slow them
%down. 

%NOTE: This will take arrays as input obviously :S

function CiZall = CiZall(Bieff, GA, LanderI, N) 

c1 = zeros(1,40);
c2 = zeros(1,40);
c3 = zeros(1,40);
c4 = zeros(1,40);
c5 = zeros(1,40);
c6 = zeros(1,40); 

c1 = CiZ(Bieff(1), GA, LanderI(1), N,1);
c2 = CiZ(Bieff(2), GA, LanderI(2), N,0);
c3 = CiZ(Bieff(3), GA, LanderI(3), N,0);
c4 = CiZ(Bieff(4), GA, LanderI(4), N,0);
c5 = CiZ(Bieff(5), GA, LanderI(5), N,0);
c6 = CiZ(Bieff(6), GA, LanderI(6), N,0);

figure; 

plot (c1);
title('Precursor concentration for the six different groups');
xlabel('z');
ylabel('Precursor concentration(cm^-3)'); 
hold all;

plot(c2);
hold all; 

plot(c3);
hold all;  

plot(c4);
hold all;  

plot(c5);
hold all; 

plot(c6);
hleg1 = legend('Group1', 'Group2', 'Group3', 'Group4', 'Group5','Group6');
set(hleg1,'Location','NorthWest'); 
hold all;  

c1;
c2;
c3;
c4;
c5;
c6;
CiZall;

