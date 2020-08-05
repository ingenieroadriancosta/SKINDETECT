function [maxValues minValues proValues]=pruebasmatematicas
clear all;clf;clc;pause(.01);warning off %#ok<WNOFF>
evaluar=1;%direcction='E:\__ARCHIVOS MATLAB\FOTOS\WEBCAM';
% restriccionb=255;
direcction='X:\SegAll\IMAGENES\IMAGENES DE PRUEBAS\VGA_IMAGENES\';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all
    return
else
    filename=strcat(b,a);
end;                            iter=1;
proValues=1:iter;
maxValues=1:iter;
minValues=1:iter;
if evaluar==1
for n=1:iter
imRGB=(imread(filename));
tic
imGRAY=rgb2gray(imRGB);
toc
image((imRGB))
axis image off
    cropRGB=imcrop;
    try
        cropGRAY=rgb2gray(cropRGB);
    catch %#ok<CTCH>
        return
    end
%     subplot(121)
%     image((imRGB))
%     axis image off
%     subplot(122)
%     imshow(cropRGB)
%     axis off
%     pause(1)
%     subplot(122)
%     imshow(cropGRAY)
%     axis off
%     pause(1)
    cropRGB=double(cropRGB);                %%%%%%%%%%%%%%%%%%%%%%
    cropGRAY=double(cropGRAY);              prueba=cropRGB(:,:,1);
    Values=cropGRAY./prueba;                 %%%%%%%%%%%%%%%%%%%%%%
    proValues(n)=sum(sum(Values))/(length(Values(1:end)));
    maxValues(n)=max(max(Values));
    minValues(n)=min(min(Values));
end
proValues=sum(proValues)/length(proValues);
maxValues=sum(maxValues)/length(maxValues);
minValues=sum(minValues)/length(minValues);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% direcction='X:\SegAll\IMAGENES\IMAGENES DE PRUEBAS\VGA_IMAGENES\';
% [a b]=uigetfile({'*.jpg;'},'Image file',direcction);
% if b==0
%     clear all
%     return
% else
%     filename=strcat(b,a);
% end;   
% imRGB=(imread(filename));
% tic
% imGRAY=rgb2gray(imRGB);


immax=maxValues*(ones(size(imGRAY)));
immin=minValues*(ones(size(imGRAY)));
tic
imGRAY=double(imGRAY);
imRGB=double(imRGB);
imRGBGRAY=imGRAY./imRGB(:,:,1);
imlogical=~( (imRGBGRAY<immax & imRGBGRAY>immin) );
IMFINAL(:,:,1)=imRGB(:,:,1).*imlogical;
IMFINAL(:,:,2)=imRGB(:,:,2).*imlogical;
IMFINAL(:,:,3)=imRGB(:,:,3).*imlogical;
image(uint8(IMFINAL))
axis image off
time=num2str(toc);
time=strcat(num2str(size(imGRAY)),'___',time,' sec.');
title(time)
% figure
h=image(uint8(IMFINAL));
axis image off
% [maxValues minValues proValues]=pruebasmatematicas

% 0.8820    0.6092    0.7788