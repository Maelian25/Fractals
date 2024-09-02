function DFDX = z4jac(X)
% F est la fonction vectoriel du systeme qui s'ecrit en complexe : 
%          z^4+z^3+z^2+z+1 = 0
%
z    = X(1) + 1i * X(2);

% pour mémoire f(z) = 1 + z * ( 1 + z * ( 1 + z * ( 1 + z ) ) )
% du coup la dérivée complexe f'(z) est :
fpz  = 1 + z * ( 2 + z * ( 3 + 4 * z ) ); 

% et la matrice Jacobienne est :
DFDX = [real(fpz) -imag(fpz) 
        imag(fpz)  real(fpz)];
    
% pour plus d'info : Wiki équations de Cauchy-Rieman
% ou : Wiki Fonction d'une variable complexe différentiable

end

