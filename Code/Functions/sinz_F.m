function F=sinzF(X)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'?crit en complexe : 
%          sin(z)-1 = 0
% et qui correspond dans R^2 (X = (x,y)) au systeme :
%
%          /  sin(x)*cosh(y)-1 ;
%  F(X) = {
%          \  cos(x)*sinh(y) ;

% Le systeme (vecteur F)
F( 1,1)  =  sin(X(1)) * cosh(X(2)) - 1;
F( 2,1)  =  cos(X(1)) * sinh(X(2));
end