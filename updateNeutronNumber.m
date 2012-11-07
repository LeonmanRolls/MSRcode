function [ Nand1 ] = updateNeutronNumber( Nold, landerI, c1, c2, c3, c4, c5 ,c6, reactivity,Prod, BetaEff )
%Will return N for the next time step 

A = area(200,400,240); %The shape of the reacor esentially
deltaz = 5; %Size of the Zs, initially 5cm
GA = 2.4*10^-4;

%the fission shape for the reactor
Z = zeros(1,240);
X = zeros(1,40); 
X = FjShape(40,5);
for n = 1:40

    Z = X(n); 
    
end
%-------------------------------

%Adjoint flux shape
AdjFlux = zeros(1,240);

for n = 1:40
    
     AdjFlux(n) = 1;   
    
end
%------------------------------

%the fission shape for the reactor--
Fj = zeros(1,240);
X = zeros(1,40); 
X = FjShape(40,5);
for n = 1:40

    Fj = X(n); 
    
end
%-------------------------------*

thatSum = thatSumCalculator(Nold,c1,c2,c3,c4,c5,c6); 
Nand1 = thatSum*(1/((1/deltaT)-((reactivity+Prod-BetaEff)/GA)))

end

