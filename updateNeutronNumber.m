function [ Nand1 ] = updateNeutronNumber( Nold, landerI, c1, c2, c3, c4, c5 ,c6 )
%Will return N for the next time step 

A = area(200,400,240); %The shape of the reacor esentially
deltaz = 5; %Size of the Zs, initially 5cm

%the fission shape for the reactor
Z = zeros(1,240);
X = FjShape(40,5);
for n = 1:40

    Z = X(n); 
    
end
%Adjoint flux shape
AdjFlux = zeros(1,240);

for n = 1:40
    {
     AdjFlux(n) = 1;   
    }
end


end

