function FRACTAL_result(nomgen,imname,tcalcul,nbconvps,nbiterps)
eval(nomgen); 
nbconv = sum(nbconvps);
nbiter = sum(nbiterps);
% Sauvegarde des resultats
FileID = fopen(strcat(nomgen,'.txt'),'w+');
for fid = [1 FileID]
    fprintf(fid,'image créer   : %s\n',imname);
    fprintf(fid,'système       : %s et %s\n',func2str(F),func2str(DFDX));
    fprintf(fid,'taille image  : %i x %i\n',nbrlign,nbrcolo);
    fprintf(fid,'zone d''étude  : [%g %g] x [%g %g]\n',...
        xl,yl);
    fprintf(fid,'itermax       : %i\n',itermax);
    fprintf(fid,'epsF          : %g\n',epsF);
    fprintf(fid,'temps calcul  : %.2f s\n',tcalcul);
    fprintf(fid,'%% de conv     : %.2f %%\n',100*nbconv/nbrlign/nbrcolo);
    fprintf(fid,'nbr moyen d''iter : %.2f\n',sum(nbiter)/sum(nbconv));
    for i = 1:nbrsol
        fprintf(fid,'conv vers solution %i : %.2f %% en %.2f iter\n',i,...
            100*nbconvps(i)/nbrlign/nbrcolo,...
            nbiterps(i)/nbconvps(i));
    end
end
fclose(FileID);
end