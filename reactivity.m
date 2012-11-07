function reactivity = reactivity (f,T,UraniumIsotope,status) 
% Calculation of the reactivity with variables f,T,UraniumIsotope and status.
% The value of f has been obtained already from the function, fj.
% Tj is the newest avaiable temperature of fuwl=salt in volume cell j.
% UraniumIsotope == 233 represents Uranium-233 and UraniumIsotope == 235 represents Uranium-235
% when the Uranium is fuel, the status would be 1. When the Uranium is graphite, the status would be 2.

a=0; % a is quantity, which is given.
T0=632.06;% The reactivity feedback equilibrium T0 for the fuel and graphite was given [4table 2.3] as T0=1169.7 F or 632.06 C.
ans=0;% Initial answer is set to be zero.


if (UraniumIsotope == 233 || status == 1)% there are two conditions. one is the isotope is Uranium-233. and the other is that it is fuel.
   a= -9.54;% the value of -9.54 is Pcm/C
end

if (UraniumIsotope == 233 || status == 2)%there are two conditions. one is the isotope is Uranium-233. and the other is that it is graphite.
   a= -5.76;% the value of -5.76 is Pcm/C
end

if (UraniumIsotope == 235 || status == 1)%there are two conditions. one is the isotope is Uranium-235. and the other is that it is fuel.
   a= -8.46;% the value of -8.46 is Pcm/C
end

if (UraniumIsotope == 235 || status == 2)%there are two conditions. one is the isotope is Uranium-235. and the other is that it is graphite.
   a= -4.68;% the value of -4.68 is Pcm/C
end


for j = 1:240 % from first to last value
 ans=ans+(f(j)*T(j)); %total sum of mutiplications of f(j) and T(j)
end
 reactivity=a*(ans-T0);% calculates the reactivity 


  
