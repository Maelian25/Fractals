function Fx = dFdX(X)
% La matrice Jacobienne FX
FX(1,1)  =  cos(X(1)) * cosh(X(2));
FX(1,2)  =  sin(X(1)) * sinh(X(2));
FX(2,1)  = - FX(1,2);
FX(2,2)  =   FX(1,1);
end

