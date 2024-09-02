function dFdX = zcubDFDX(X)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'ecrit en complexe : 
%          z^3-1 = 0
% et qui correspond dans R^2 (X = (x,y)) au systeme :
%
%           /  x^3 -3xy^2 -1 ;
%  F(X) = {
%           \  3x^2y - y^3 ;

%% Notations :
x = X(1);
y = X(2);

%% La matrice Jacobienne FX
dFdX(1,1)  =  3 * (x * x - y * y);
dFdX(1,2)  = -6 * x * y;
dFdX(2,1)  = -dFdX(1,2);
dFdX(2,2)  =  dFdX(1,1);

end