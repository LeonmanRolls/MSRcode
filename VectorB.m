function [ VectorB ] = VectorB( N, Tn )
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

for n = 120:160 % Filling the h array 
    
    h = 0.3486;
    
end 

for n = 120:160 % Filling O array
    
    O = 1296.85;
    
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
    
 pcpt = (p*Cp) +((Cp_gr*Mgr)/(Vfuel_core));
    
end

for n = 41:240
    
   pcpt = (p*Cp); 
    
end

end

