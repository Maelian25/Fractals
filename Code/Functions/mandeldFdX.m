function DFDX = mandeldFdX(X,c)
% La matrice Jacobienne FX
DFDX(1,1)  =  pi*sin(X(1)) * cosh(X(2));
DFDX(1,2)  = -pi* cos(X(1)) * sinh(X(2));
DFDX(2,1)  = - DFDX(1,2);
DFDX(2,2)  =   DFDX(1,1);
end

