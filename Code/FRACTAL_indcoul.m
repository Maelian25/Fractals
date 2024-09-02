function indcoul = FRACTAL_indcoul(itermax,nbrsol,nbrcoul)


N=0;
for l = 1:nbrsol+1
    for iter= 0:itermax

    indcoul(iter+1, l) = round ((nbrcoul(l)-1)/itermax *iter ) + 1 + N;

    end
    N=N+nbrcoul(l);
end
