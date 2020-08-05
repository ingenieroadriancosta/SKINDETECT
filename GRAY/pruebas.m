function imRGB=pruebas
clear all;clc;
load ARCHIVOS\bebe2

direcction='E:\__ARCHIVOS MATLAB\FOTOS\MYCAM\';
% direcction='E:\IMAGENES\PERSONAL\FAMILIA\15 DE VIVI\';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all;return;
else
    filename=strcat(b,a);
end
imRGB=(imread(filename));hw=size(imRGB);hw=[hw(1) hw(2)];
immax=maxValues*(ones(hw));
immin=minValues*(ones(hw));
h=image(imRGB);
axis image off;pause(1);
tic
imGRAY=rgb2gray(imRGB);
imGRAY=double(imGRAY);
imRGB=double(imRGB);
imRGBGRAY=imGRAY./imRGB(:,:,1);
imlogical=( (imRGBGRAY<immax & imRGBGRAY>immin) );
imRGB(:,:,1)=imRGB(:,:,1).*imlogical;
imRGB(:,:,2)=imRGB(:,:,2).*imlogical;
imRGB(:,:,3)=imRGB(:,:,3).*imlogical;
set(h,'Cdata',uint8(imRGB))
drawnow
time=num2str(toc);
title([num2str(size(imGRAY)),...
'                                                   ',time,' sec.'])
% figure
% h=image(uint8(IMFINAL));
% axis off
% alicia.mat       
% alicia2.mat      
% alina1.mat       
% alina2.mat       
% analucia.mat     
% angelica1.mat    
% bebe1.mat        
% bebe2.mat        
% diana1.mat       
% dunia.mat        
% dunia2.mat       
% dunia3.mat       
% maritza.mat      
% maritza2.mat     
% maritza3.mat    