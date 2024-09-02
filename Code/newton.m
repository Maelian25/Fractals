function [X,conv,k]=newton(F, DFDX, X, epsF, itermax)
    k=0;
    conv = norm(F(X)) < epsF;
    while not(conv) && k<itermax 
        
        Fx = F(X);
        delta = -DFDX(X)\F(X);
        X=X+delta;
        k=k+1;  
    conv = norm(Fx) < epsF;
    end
end
