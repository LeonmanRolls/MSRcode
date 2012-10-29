function [ MatrixA ] = MatrixA(  )
%Calculates the Matrix A for the calculation of the temperature
aj = zeros(1,240);
bj = zeros(1,240);
deltaT = 1; %Seconds
p = 2263*10^-6 % fuel density
Cp = 1982.5 % Heat capacity 
g = 80.247*10^3  % fuel flow rate
A = area(200,400,240); 
h = zeros(1,240); % Heat exchanger coefficent
O = zeros(1,240); % circumference of the heat exchanger
Cp_gr = 1750  % heat capacity of the graphite 
Mgr = 3715 % Total graphite mass inside the core.. at the moment this
                 % is equal to the fuel volume inside the core
Vfuel_core = 818.8*10^3; % Volume of the fuel inside the core
pcpt = zeros(1,240) % 
deltaZ = 5; 
MatrixA = zeros(240,240);

for n = 120:160 % Filling the h array 
    
    h = 0.3486;
    
end 

for n = 120:160 % Filling O array
    
    O = 1296.85;
    
end 

for n = 1:40 % filling up the pcpt values, which are different inside and 
             % outside the core 
    
 pcpt = (p*Cp) +((Cp_gr*Mgr)/(Vfuel_core));
    
end

for n = 41:240
    
   pcpt = (p*Cp); 
    
end

%Now we can work out aj and bj; 

for j = 1:240
aj = (1/deltaT) + ((p*Cp*g)/(pcpt(j)*a(j)*deltaZ)) + ((h(j)*O(j))/(pcpt(j)*a(j)*deltaZ));
end

for j = 1:240
   
bj = -((p*Cp*g)/(pcpt*A(j)*deltaZ));
    
end

% Now filling up the matrix A
MatrixA(240,1) = bj(1); 
X = diag(aj);
MatrixA = MatrixA + X; 

% Making a vector of bjs minus the first element
bjeidt = zeros(1,239); 
for n = 1:239
bjedit(n) = bj(n+1);
end

X = diag(1,bjedit);
MatrixA = MatrixA + X; 

MatrixA;%end of function

end

