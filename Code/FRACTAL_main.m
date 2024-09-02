clear variables 
close all

%% Données du problème
% Le nom générique permet de définir le nom du script 
% des données : "(nomgen).m", le nom du fichier de résultats :
% "(nomgen).res", ainsi que le nom de l'image : "(nomgen).png"
nomgen = input('Nom du cas à traiter :','s');
eval(nomgen);          % éxécution du script "(nomgen).m"

% En retour de ce script les valeurs suivantes sont définies : 
%   F        : handle vers le système d'equations traité 
%   DFDX     : handle vers la jacobienne du système traité
%   nbrsol   : nombre de solution du système
%   sol(2,nbrsol) : matrice des solutions du système
%   distsol  : distance de discrimination entre solution
%   itermax  : nombre max. d'itération
%   epsF     : valeur pour le test de conv. |F(X)| < epsF
%   xlimite  : intervalle des abscisses balayées
%   ylimite  : intervalle des ordonnées balayées
%   nbrlign  : nombre de ligne (pix) de l'image
%   nbrcolo  : nombre de colonne (pix) de l'image
%   nbrcoul  : vecteur des nombre de couleurs par solution (+1 pour la div)
%   maxcoul  : nbre total de couleur = sum(nbrcoul)
%   palette  : palette RVB des maxcoul couleurs


%% Chargement de la palette

colormap(palette);

%% Definition des valeurs x et y des pixels de la zone d'image
% (à partir de xlimite, ylimite, nbrlign et nbrcolo)
% on  les a appelés x et y dans la suite
x= linspace(xl(1),xl(2),nbrlign);
y= linspace(yl(1),yl(2),nbrcolo);

%% Fonction d'indexation des couleurs : indcoul
% Il s'agit de définir la mise en relation entre le couple formé 
% par le nombre d'iteration et le numero de la solution avec 
% l'indice sur la palette de la couleur associée. Le fait d'etablir
% a l'avance cette relation, permet de gagner beaucoup de temps 
% dans la double boucle principale.
%
% indcoul est une matrice qui doit donner le numero dans la 
% palette de la couleur correspondant a une solution "k" donnee 
% et a une valeur "iter" donnee: indcoul(iter,k)
% Cette matrice est calculé par appel à la fonction FRACTAL_indcoul :

indcoul = FRACTAL_indcoul(itermax,nbrsol,nbrcoul);

%% Préallocations (a priori il y en a 3)
Cimage = zeros(nbrlign, nbrcolo);
nbconvps = zeros(1,nbrsol+1) ;
nbiterps = zeros(nbrlign, nbrcolo) ;

%% Débrayage des warnings intempestifs du aux frôlements de zones
% où la Jacobienne est mal conditionnée voire singulière
warning('off','MATLAB:singularMatrix')
warning('off','MATLAB:illConditionedMatrix')
%
%% Les boucles de calculs
tic          % on déclenche le chrono (cf. doc tic toc pour l'unit?)

for i = 1:nbrlign
    for j=1:nbrcolo
        X=[x(i); y(j)];
        [X,conv,k]=newton(F, DFDX, X, epsF, itermax);
        nbiterps(i,j) = k;
        if k==0
            k=1 ;
        end
        for l = 1:nbrsol
            if abs(X(1)- sol(l,1)) <= seuil && abs(X(2)- sol(l,2)) <= seuil
                isol = l;
                Cimage(i,j) = indcoul(k,l);
                %Cimage(i,j) = l;
                nbconvps(l) = nbconvps(l) + 1;
            end
            
        end
        if Cimage(i,j) == 0
            isol = l;
            Cimage(i,j) = indcoul(k,nbrsol+1);
            %Cimage(i,j) = nbrsol+1;
            nbconvps(nbrsol+1) = nbconvps(nbrsol+1) + 1;

        end

    end
end
Cimage1 = Cimage';
% ici on construit Cimage, nbconvps et nbiterps

tcalcul = toc; % on arrête le chrono
fprintf('\n ----- Fin du calcul ---- \n');


%% Post processing :
imname = FRACTAL_image(nomgen,palette,x,y,Cimage1);
FRACTAL_result(nomgen,imname,tcalcul,nbconvps,nbiterps);
