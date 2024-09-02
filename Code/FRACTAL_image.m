function imname = FRACTAL_image(nomgen,palette,x,y,Cimage)
% Affichage et sauvegarde de l'image
% Input parameters :
%    nomgen : 
HA = axes;
image(x,y,Cimage);
HA.YDir = 'normal';
HA.DataAspectRatio = [1 1 1];
imname = strcat(nomgen,'.png');
imwrite(Cimage,palette,imname);
imfinfo(imname);
end