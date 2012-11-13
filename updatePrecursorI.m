function [ Ciand1 ] = updatePrecursorI( oldCI, i, Nn, U235lander, U235BetaEff)
%Update the precursor concentration of a paticular group
%The iteration over the groups is handled in the master script

MatrixA = zeros(240,240);
VectorB = zeros(1,240); 
GA = 2.4*10^-4;

deltaT = 1;
deltaZ = 5; 

aj = zeros(1,240);
bj = zeros(1,240);

A = area(200,400,240);

g = 80.247*10^3  % fuel flow rate

%Now we can work out aj and bj; 

for j = 1:240
aj(j) = ((1/deltaT)+U235lander(i)+((g)/(A(j)*deltaZ)));
end

for j = 1:240   
bj(j) = -((g)/(A(j)*deltaZ));
end    

%Need to fill an array to extend oldCI to 240 j
oldCI1 = zeros(1,240); 
for n = 1:40
   
    oldCI1(n) = oldCI(n);
    
end

for n = 41:240
    
   oldCI1(n) = 0; 
    
end

% Now filling up the matrix A
MatrixA(240,1) = bj(1); 
X = diag(aj);
MatrixA = MatrixA + X; 

% Making a vector of bjs minus the first element
bjedit = zeros(1,239); 
for n = 1:239
bjedit(n) = bj(n+1);
end

X = diag(bjedit,1);
MatrixA = MatrixA + X; 


%Making vectorB

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

for j = 1:240    
VectorB = (((U235BetaEff(i)*fj(j)*Nn)/(GA*A(j)*deltaZ))+(oldCI1(j)/deltaT));
end

%The important bit

Ciand1 = VectorB*inv(MatrixA); 

Ciand1; 

end%end of function

