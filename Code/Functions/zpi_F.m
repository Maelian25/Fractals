function F = zpi_F(X,p)
% fonction renvoyant la fonction vectorielle F et la 
% matrice Jacobienne FX du systeme qui s'ecrit en complexe : 
%          (z-1)^p (z+1) = 0

%Version non optimisée

%% Notations :
z        = X(1)+1i*X(2);            % en matlab "i" complexe s'écrit "1i"

%% Le systeme (vecteur F)
f        = (z-1)^p * (z+1);
F( 1,1)  =  real(f);
F( 2,1)  =  imag(f);
end

