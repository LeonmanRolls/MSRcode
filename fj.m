function fj = fj(j,deltaZ)

f = inline('sin((pi*(z+0.975))/201.950)/128.551');
syms z;

 fj = int(f(z),((j-1)*deltaZ),j*deltaZ);