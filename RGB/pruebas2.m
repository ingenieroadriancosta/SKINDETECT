% function pruebas2
clc;clear all;warning off %#ok<WNOFF>

direcction='X:\SegAll\IMAGENES\IMAGENES DE PRUEBAS\VGA_IMAGENES';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all
    return
else
    filename = strcat(b,a);
end
tic
im=double(imread(filename));
toc
tic
for pasos=1:1

for t=1:20:240


hImage=imshow(ones(480,640,3));axis off
% im=double(imread('ARCHIVOS\im.jpg'));
r=t;
% sindvalue=sind(r*10);
centro=320;
for i=240:-1:240-r
    c=round(sqrt(r^2-(240-i)^2));
    a=length(centro-c:centro+c);
    sindvalue=sind(0);
    % r*200/i
%     circulo(i,centro-c+1:centro)=sindvalue;
%     circulo(480-i,centro-c+1:centro)=sindvalue;
%     circulo(i,321:320+c)=sindvalue(end:-1:1);
%     circulo(480-i,321:320+c)=sindvalue(end:-1:1);


    try     %#ok<TRYNC>
    circulo(i,320-c)=sindvalue;
    circulo(i,320+c)=sindvalue;
    circulo(480-i,320-c)=sindvalue;
    circulo(480-i,320+c)=sindvalue;
    end
end
im(:,:,1)=im(:,:,1).*abs(circulo);
im(:,:,2)=im(:,:,2).*abs(circulo);
im(:,:,3)=im(:,:,3).*abs(circulo);
set(hImage,'Cdata',uint8(im))
drawnow

end
end
toc
% imshow(uint8(im))
% axis off
% pause(0.01)
% imshowtime------->  0.1191
% sindrawnow------->  0.0889
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%
% condrawnow------->  0.0840-----
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c=sqrt(r^2-(240-r-i)^2);
% format short g
% long g
%     sindvalue=sind(r*200/i);
%     circulo(i,320-c:320+c)=sindvalue;
%     circulo(i,320-c)=sindvalue;
%     circulo(i,320+c)=sindvalue;
%     circulo(480-i,320-c:320+c)=sindvalue; 
%     circulo(480-i,320-c)=sindvalue;
%     circulo(480-i,320+c)=sindvalue;