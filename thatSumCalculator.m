function [ sumOutput ] = thatSumCalculator( Nold, c1, c2, c3,c4, c5, c6, U235lander )
%Calculates that sum that shows up in various places, like Prod and Nand1

A = area(200,400,240);
deltaZ = 5;
deltaT = 1; 

%Adjoint flux shape-----------
AdjFlux = zeros(1,240);

for n = 1:40
    
     AdjFlux(n) = 1;   
    
end
%------------------------------*

%the fission shape for the reactor--
Fj = zeros(1,240);
X = zeros(1,40); 
X = FjShape(40,5);
for n = 1:40

    Fj(n) = X(n); 
    
end
%-------------------------------*

%bottomSum Will be the same for all i and so can be treated as a constant--
bottomSum = 0; 
for n = 1:240
    
bottomSum = bottomSum + (Fj(n)*AdjFlux(n));

end
%------------------------------*

%Beacuse of the silly way the Cis are done some of this can't be done
%inside for loops

% i = 1 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c1(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(1)*(topSum/bottomSum); 

%------------------------------*

% i = 2 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c2(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(2)*(topSum/bottomSum); 

%------------------------------*

% i = 3 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c3(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(3)*(topSum/bottomSum); 

%------------------------------*

% i = 4 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c4(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(4)*(topSum/bottomSum); 

%------------------------------*

% i = 5 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c5(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(5)*(topSum/bottomSum); 

%------------------------------*

% i = 6 -------------------------
Sum = 0; 
topSum = 0; 

for n = 1:240
    
    topSum = topSum + A(n)*deltaZ*c6(n)*AdjFlux(n);
    
end

Sum = Sum + U235lander(6)*(topSum/bottomSum); 

%------------------------------*

Sum = Sum + (Nold/deltaT); 

sumOutput = Sum;

sumOutput; 

end

