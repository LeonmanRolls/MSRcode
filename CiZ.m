%Calculation of Ci(z) at steady state with no fuel motion
%for a particular precursor group

function CiZ = CiZ(Bieff,GA,LanderI,N,Print)

A = area(200,400,240);
Z = FjShape(40,5); 
CiZ = zeros(1,40)



for n = 1:40
CiZ(n) = ((Bieff*Z(n)*N)/(GA*LanderI*A(n))); 

end

if Print == 1
    
 figure;
 plot(A);
 title('Shape of the reactor');
 xlabel('z(cm)');
 ylabel('Cross-sectional area (cm^2)');
  
 figure;
plot(Z);
title('Fission Shape');
xlabel('z(cm)');
ylabel('Realtive amount of fission');
    
end


end