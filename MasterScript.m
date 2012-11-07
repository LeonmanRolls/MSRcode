function MasterScript = MasterScript()

%BetaEff wihch is the sum of all the betais
for n = 1:6
    
   BetaEff = BetaEff + U235BetaEff(n);  
 
end

%These are the variables that will be updated as the simulation runs
g = 80247; %For now we are not varying g so this has been hard coded
Told = 1000; 
Nold = 10^9; 
Prod; 
reactivity;

%These are just the initial values of the precursor concentrations (Ci old)
c1 = zeros(1,240);
c2 = zeros(1,240);
c3 = zeros(1,240);
c4 = zeros(1,240);
c5 = zeros(1,240);
c6 = zeros(1,240); 

c1 = CiZ(Bieff(1), GA, LanderI(1), Nold,1);
c2 = CiZ(Bieff(2), GA, LanderI(2), Nold,0);
c3 = CiZ(Bieff(3), GA, LanderI(3), Nold,0);
c4 = CiZ(Bieff(4), GA, LanderI(4), Nold,0);
c5 = CiZ(Bieff(5), GA, LanderI(5), Nold,0);
c6 = CiZ(Bieff(6), GA, LanderI(6), Nold,0);

time = 1000; %Time to run the simulation for in seconds 
g = 80247; %From page 61 of MSR modelling paper, for now will be kept constant

%The first thing to be calculated is the update of the temperature
told = updateTemp(Nold,Told);

%Update the reactivity...
reactivity = reactivity(Told); 

%Calculate the precursor concentrations for all i
%Likely that we will have to provide the neutron number properly later
c1 = updatePrecursorI(c1,1,Nold);  
c2 = updatePrecursorI(c2,2,Nold);  
c3 = updatePrecursorI(c3,3,Nold);  
c4 = updatePrecursorI(c4,4,Nold);  
c5 = updatePrecursorI(c5,5,Nold);  
c6 = updatePrecursorI(c6,6,Nold);  

%Calculate the rod reactivitiy
Prod = updateProd(Nold, c1,c2,c3,c4,c5,c6); 

%Calculate N


MasterScript; 