function [ VectorB ] = VectorB( Nn, Tn )
%Calculates vector B for use with calculating the temperature

Pfiss = 3.0864*10^-11; %probability of fission event occuring
GA = 2.4*10^-4;
v = 2.49; %Average number of neutrons generated per fission
deltaZ = 5; 
pcpt = zeros(1,240); 
A = area(200,400,240); 
The = 566.7; %Assumed to be constant and a given value. Doesn't seem to be given
        %in the paper so taken as the temperature of the fluid upon leaving
        %the heat exhanger. Measured in celcius
h = zeros(1,240); % Heat exchanger coefficent
O = zeros(1,240); % circumference of the heat exchanger
p = 2263*10^-6 % fuel density
Cp = 1982.5 % Heat capacity
Cp_gr = 1750  % heat capacity of the graphite 
Mgr = 3715 % Total graphite mass inside the core.. at the moment this
                 % is equal to the fuel volume inside the core
Vfuel_core = 818.8*10^3; % Volume of the fuel inside the core
deltaT = 1;

for n = 120:160 % Filling the h array 
    
    h(n) = 0.3486;
    
end 

for n = 120:160 % Filling O array
    
    O(n) = 1296.85;
    
end 

%Calculate the fjs ----------------
f = zeros(1,40);
f = FjShape(40,5); 
fj = zeros(1,240);
for n = 1:40
   fj(n) = f(n); 
end

for n = 41:240
   fj(n) = 0; %No fission takes place outside of the core  
end
%----------------------- 

for n = 1:40 % filling up the pcpt values, which are different inside and 
             % outside the core 
    
 pcpt(n) = (p*Cp) +((Cp_gr*Mgr)/(Vfuel_core));
    
end

for n = 41:240
    
   pcpt(n) = (p*Cp); 
    
end

for j = 1:240
    
VectorB = ((Pfiss*Nn*fj(j))/(GA*deltaZ*v*pcpt(j)*A(j)))+((The*h(j)*O(j))/(deltaZ*pcpt(j)*A(j))) +(Tn/deltaT); 

end

end

