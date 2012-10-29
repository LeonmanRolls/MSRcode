function [ Tand1 ] = updateTemp(Nn,Tn)
%Update the temperature

%Get matrix a
A = MatrixA; 
B = VectorB(Nn,Tn); 

Tand1 = B*inv(A); 

Tand1; 

end

