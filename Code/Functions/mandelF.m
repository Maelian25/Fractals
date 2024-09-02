function F=mandelF(X,c)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'?crit en complexe : 
%          c-pi*cos(z) = 0
% et qui correspond dans R^2 (X = (x,y)) au systeme :
%
%          /  c- pi*cos(x)*cosh(y) ;
%  F(X) = {
%          \  c + sin(x)*sinh(y) ;

% Le systeme (vecteur F)
F( 1,1)  =  c - pi*(cos(X(1)) * cosh(X(2))) ;
F( 2,1)  =  c+pi*(sin(X(1)) * sinh(X(2)));
end