function DFDX = zpi_DFDX(X,p)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'ecrit en complexe : 
%          (z-1)^p (z+1) = 0

%Version non optimisée

%% Notations :
z          = X(1)+1i*X(2);   % en matlab "i" complexe s'écrit "1i"

%% La matrice Jacobienne FX
dfdz       =   p*(z-1)^(p-1) * (z+1) + (z-1)^p;
ux         =  real(dfdz);
vx         =  imag(dfdz);
DFDX(1,1)  =  ux;
DFDX(1,2)  = -vx;
DFDX(2,1)  =  vx;
DFDX(2,2)  =  ux;
end
