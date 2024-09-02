function F=zcubF(X)
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

x2=x*x;    % pour economiser du temps calcul
y2=y*y;    % pour economiser du temps calcul

%% Le systeme (vecteur F)
F( 1,1)  =  x * (x2 - 3*y2) - 1;
F( 2,1)  =  y * (3*x2 - y2);

end

