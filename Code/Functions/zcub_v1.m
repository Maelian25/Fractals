F=@zcubF;
DFDX=@zcubDFDX;
sol =[1 0
     -1/2 sqrt(3)/2
     -1/2 -sqrt(3)/2];

xl= [-5 5];
yl= [-5 5];
nbrsol = 3;
nbrcoul = [30; 30; 30; 1];
maxcoul = sum(nbrcoul);

Jaune = [1 1 0];
Cyan = [0 .5 1];
alpha = linspace(0,1,30)';
palette1 = alpha*Jaune + (1-alpha)*Cyan ;

Magenta = [1 0 1];
Vert= [0 1 0];
alpha = linspace(0,1,30)';
palette2= alpha*Magenta + (1-alpha)*Vert;

Rouge = [0.6350 0.0780 0.1840];
Orange = [0.9290 0.6940 0.1250];
alpha = linspace(0,1,30)';
palette3= alpha*Rouge + (1-alpha)*Orange ;


palette = [palette1 ; 
    palette2;
    palette3;
    1 1 1];
%palette = [ 1 0 0 
          % 0 1 0
          %  0 0 1
           % 0 0 0 ]; 
nbrlign = 1000;
nbrcolo = 1000;
x= linspace(xl(1),xl(2),nbrlign);
y= linspace(yl(1),yl(2),nbrcolo);
F = @zcubF ;
DFDX = @zcubDFDX;

epsF = 1e-5;
itermax = 15;
seuil = 1e-10;