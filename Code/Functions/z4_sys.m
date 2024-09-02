function F = z4sys(X)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'ecrit en complexe : 
%          z^4+z^3+z^2+z+1 = 0
% si on multiplie par (z-1) on obtient z^5-1=0
% donc les solutions sont les racines 5eme de 
% l'unite sauf 1. Soit exp(2kpi/5) k= 1 2 3 4
%
z    =  X(1) + 1i * X(2);      % 1i est le nombre complexe i
%
% pas de puissance = gain de temps calcul :
fz   =  1 + z * ( 1 + z * ( 1 + z * ( 1 + z ) ) ); 
%
F    = [ real(fz) ; imag(fz) ];
end

