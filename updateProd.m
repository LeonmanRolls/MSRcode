function [ Prod ] = updateProd( Nold, c1,c2,c3,c4,c5,c6, LanderI)
%Update the control rod value inorder to keep the reaction constant
%Note this is equation was derived based on a zero power benchmark
%Will probably want to rederive in the future

GA = 2.4*10^-4;
N = 10^9;% As we are trying to keep the number of neutrons const.
Beff = 0.006661; %Taken from table 8.2, U235
deltaT = 1; 

%Instead of summing fjs each time, just calculate once

sum = thatSumCalculator(Nold,c1,c2,c3,c4,c5,c6, LanderI); 

Prod = (GA/deltaT) - (GA/N)*((Nold/deltaT)+sum)+Beff; 

Prod;
end%end of function

