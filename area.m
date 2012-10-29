function area = area(reactorLength,pipeLength,jtot)

area = zeros(1,jtot); 
unit = jtot/6;

 for n = 1:unit
     r = reactorLength*0.18;
     area(n) = pi*(r^2); 
 end
 
 for n = 40:120
     r = pipeLength*0.03866;
     area(n) = pi*r^2;
 end
 
 for n = (unit*3):(unit*4)
     r = reactorLength*0.155;
     area(n) = pi*r^2;
 end
 
 for n = (unit*4):(unit*6)
     r = pipeLength*0.03866;
     area(n) = pi*r^2;
 end
 
 %plot(area)
 area; 

 
 
