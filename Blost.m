%Calculate the loss in reaction rate due to fuel motion. You may choose
%which specific isotope of uranium you want to use 233/235. 

function Blost = Blost(Bieff, GA, LanderI, UraniumIsotope)

Beff;
X = 0;
A = area(200,400,240);
deltaZ = 5; 
c1 = zeros(1,40); 
Z = FjShape(40,5);
Y = 0;
Q = 0; 
N = 10^9; 

if UraniumIsotope == 233

    Beff = 0.002894; 

end

if UraniumIsoptope == 235
   
    Beff = 0.006661;
    
end

for n = 1:6
   
  
  c1 = CiZ(Bieff(n), GA, LanderI(n), N,0);
  
  for o = 1:40 
     
      Y = Y + (A(o)*deltaZ*c1(o))/Z(o);
      
  end
  
  Q = Q + LanderI(n) + Y; 
    
end

Blost = Beff - (GA/N)*Q; 