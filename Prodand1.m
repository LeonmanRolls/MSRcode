function [ Prodand1 ] = Prodand1(Nold, landerI, c1,c2,c3,c4,c5,c6, BetaEffI  )
%If we want to run a zero power experiment then we need to use this function
%to adjust the position of the graphite rod

GA = 2.4*10^-4;
deltaT = 1; %time step
N_0 = 10^9; %Remember to change this if we change the initial neutron number
A = area(200,400,240);
deltaZ = 5;
BetaEff = 0; 
Sum = 0; 


Sum = sumCalculatorForProand1(landerI,c1,c2,c3,c4,c5,c6); 
    

Prodand1 = ((GA/deltaT)-(GA/N_0)*((Nold/deltaT)+Sum)+BetaEff);

Prodand1; 


end

