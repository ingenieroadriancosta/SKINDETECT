clc
[mayorlevel,minorlevel]=skindetect(size(im,1),size(im,2),'white');
times=100;
time=1:times;
for i=1:times


im=double(imread('E:\_FILESMATLAB\FOTOS\MYCAM\1.jpg'));
tic

imskin=cat(3 ,(im(:,:,1)./im(:,:,2)),(im(:,:,1)./im(:,:,3)),...
    (im(:,:,2)./im(:,:,3)));
imskin=((imskin>minorlevel) &...
    (imskin<mayorlevel));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...                     %
    imskin(:,:,[3,1,2]);                                                 %
%     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);           %
%     imskin=cat(3,imskinp,imskinp,imskinp);                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im=im.*imskin;
im=uint8(im);

image(im)
axis image off
pause(0.01)
time(i)=toc;
end
maximo=max(time);
minimo=min(time);
promedio=sum(time)/length(time);
disp('    maximo    minimo    promedio')



























disp([maximo minimo promedio])