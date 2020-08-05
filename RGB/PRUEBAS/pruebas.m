% function pruebas
clc;clear all
evaluar=1;
direcction='E:\AIIF\SegAll\IMAGENES\YO';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all
    return
else

    filename=strcat(b,a);
end
im=imread(filename);
image(im)
axis  off
if evaluar==1
    imp=(imcrop);
    sz=size(imp);
    image(imp)
    axis  off
    totalh=size(imp,1);
    totalw=size(imp,2);
    totalxy=totalh*totalw;

%     rgbpromedio={sum(imp(:,:,1))/totalxy; sum(imp(:,:,2))/totalxy;
%     sum(imp(:,:,3))/totalxy};
rgbpromedio={sum(imp(1:totalxy))/totalxy; sum(imp(totalxy+1:2*totalxy))/totalxy; sum(imp(2*totalxy+1:3*totalxy))/totalxy};
    
    rgbpromediom=[sum(imp(1:totalxy))/totalxy; sum(imp(totalxy+1:2*totalxy))/totalxy; sum(imp(2*totalxy+1:3*totalxy))/totalxy]

    rangosdecolor=[max(max(imp(:,:,1))) min(min(imp(:,:,1)));...
        max(max(imp(:,:,2))) min(min(imp(:,:,2)));...
        max(max(imp(:,:,3))) min(min(imp(:,:,3)))];

    rangosdecolorcat={max(max(imp(:,:,1))) min(min(imp(:,:,1)));...
        max(max(imp(:,:,2))) min(min(imp(:,:,2)));...
        max(max(imp(:,:,3))) min(min(imp(:,:,3)))};

    range=cat(2,rangosdecolorcat,rgbpromedio,{'R';'G';'B'});
    range=cat(1,{'Max','Min','Promedio','Data'},range);
    range %#ok<NOPTS>
else
    load 2.mat
end
tic



imskin=( im(:,:,1)>rangosdecolor(1,2) & im(:,:,1)<rangosdecolor(1,1) &...
    im(:,:,2)>rangosdecolor(2,2) &...
    im(:,:,2)<rangosdecolor(2,1) &...
    im(:,:,3)>rangosdecolor(3,2) &...
    im(:,:,3)<rangosdecolor(3,1) );


imskin=cat(3,imskin,imskin,imskin);
im=im.*uint8(imskin);
image(uint8(im))
axis image off
title(num2str(toc))