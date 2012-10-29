function MasterScript = MasterScript()

% Flow rate
g = 80247; 
Told = 1000; 
Nold = 10^9; 

%These are just the initial values of the precursor concentrations
c1 = zeros(1,240);
c2 = zeros(1,240);
c3 = zeros(1,240);
c4 = zeros(1,240);
c5 = zeros(1,240);
c6 = zeros(1,240); 

c1 = CiZ(Bieff(1), GA, LanderI(1), N,1);
c2 = CiZ(Bieff(2), GA, LanderI(2), N,0);
c3 = CiZ(Bieff(3), GA, LanderI(3), N,0);
c4 = CiZ(Bieff(4), GA, LanderI(4), N,0);
c5 = CiZ(Bieff(5), GA, LanderI(5), N,0);
c6 = CiZ(Bieff(6), GA, LanderI(6), N,0);




MasterScript; 