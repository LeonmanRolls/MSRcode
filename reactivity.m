function reactivity = reactivity (f,T,UraniumIsotope,status) 
% Calculation of the reactivity with variables f,T,UraniumIsotope and status.
% The value of f has been obtained already from the function, fj.
% Tj is the newest avaiable temperature in volume cell j.
% UraniumIsotope == 233 represents Uranium-233 and UraniumIsotope == 235 represents Uranium-235
% In the homogeneous model, the status would be 1. While, in the non-homogeneous model, the status would be 2.

a1=0; % a1 is a quantity, which is given.
a2=0; % a2 is a quantity, which is given.
T0=632.06;% The reactivity feedback equilibrium T0 for the fuel and graphite are given by [4table 2.3] as T0=1169.7 F or 632.06 C.
ans=0;% Initial answer is set to be zero.
reactivity1=0;% Initial answer is set to be zero.
reactivity2=0;% Initial answer is set to be zero.


if UraniumIsotope == 233% Uranium isotope is 233
   a1=-9.54;% the value of alpha is -9.54 Pcm/C for fuel
   a2=-5.76;% the value of alpha is -5.76 Pcm/C for graphite
end

if UraniumIsotope == 235%there are two conditions. one is the isotope is Uranium-235. and the other is that it is fuel.
   a1=-8.46;% the value of alpha is -8.46 Pcm/C for fuel
   a2=-4.68;% the value of alpha is -4.68 Pcm/C for graphite
end

for j = 1:240 % from first to last value
    ans=ans+(f(j)*T(j)); %total sum of mutiplications of f(j) and T(j)
end

if state == 1% in the homogeneous model
   reactivity=(a1+a2)*(ans-T0);% calculates the reactivity
   reactivity;
end


if state ==2% in the non-homogeneous model
   reactivity1=a1*(ans-T0);% calculates the reactivity for fuel
   reactivity2=a2*(ans-T0);% calculates the reactivity for graphite
   reactivity=reactivity1+reactivity2;%% calculates the total reactivity
   reactivity;
end
end
