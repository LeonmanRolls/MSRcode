function FjShape = FjShape(i,deltaZ) 

FjShape = zeros(1,i);
for n = 1:i
    FjShape(n) = fj(n,deltaZ);
end
%plot(FjShape); 
FjShape;