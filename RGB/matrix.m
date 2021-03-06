% function matrix
clear all;clc;
direcction='E:\IMAGENES\IMAGENES DE PRUEBAS\VGA_IMAGENES';
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


[mayorlevel,minorlevel]=skindetect(size(im,1)/4,size(im,2)/4,'white',im); %#ok<NASGU>
pause(3)

disp(size(im))
imf=(zeros(size(im)));
im4=im(1:4:end,1:4:end,:);
disp(size(im4))
[mayorlevel,minorlevel]=skindetect(size(im,1)/4,size(im,2)/4,'white',im4);
pause(1)
hImage=image(uint8(im));
axis image off



% tic
% imf(1:4:end,1:4:end,:)=im4;
% imf(2:4:end,1:4:end,:)=im4;
% imf(3:4:end,1:4:end,:)=im4;
% imf(4:4:end,1:4:end,:)=im4;
% imf(:,2:4:end,:)=imf(:,1:4:end,:);
% imf(:,3:4:end,:)=imf(:,1:4:end,:);
% imf(:,4:4:end,:)=imf(:,1:4:end,:);
% toc

tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imskin=( im4(:,:,[1,1,2])./im4(:,:,[2,3,3]) );
imskin=((imskin>minorlevel) &...
    (imskin<mayorlevel));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...
    imskin(:,:,[3,1,2]);
%     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);
%     imskin=cat(3,imskinp,imskinp,imskinp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imf(1:4:end,1:4:end,:)=imskin;
imf(2:4:end,1:4:end,:)=imskin;
imf(3:4:end,1:4:end,:)=imskin;
imf(4:4:end,1:4:end,:)=imskin;
imf(:,2:4:end,:)=imf(:,1:4:end,:);
imf(:,3:4:end,:)=imf(:,1:4:end,:);
imf(:,4:4:end,:)=imf(:,1:4:end,:);




im=im.*(imf);
set(hImage,'Cdata',uint8(im))
drawnow
% image(uint8(im))
% axis image off
% pause(0.01)
toc

% 0.059471
% imf(1:4:end,1:4:end,:)=imskin;
% imf(2:4:end,1:4:end,:)=imskin;
% imf(3:4:end,1:4:end,:)=imskin;
% imf(4:4:end,1:4:end,:)=imskin;






























% 
% 
% [mayorlevel,minorlevel]=skinmatrix(360,240,'white',im);
% toc
% imf=(zeros(720,480,3));
% pause(3)
% tic
% im=double(imread('E:\__ARCHIVOS MATLAB\FOTOS\MYCAM\_11.jpg'));
% imm=im(1:2:end,1:2:end,:);
% 
% % imf(1:4:end,1:4:end,:)=imm;
% % imf(2:4:end,1:4:end,:)=imm;
% % imf(:,2:4:end,:)=imf(:,1:4:end,:);
% % imf(:,1:4:end,:)=imf(:,2:4:end,:);
% 
% % imf(1:end/2,2:2:end,:)=im;
% 
% % image(uint8(imm))
% % axis off
% % pause(1)
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% imskin=( imm(:,:,[1,1,2])./imm(:,:,[2,3,3]) );
% imskin=((imskin>minorlevel) &...
%     (imskin<mayorlevel));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...
%     imskin(:,:,[3,1,2]);
% %     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);
% %     imskin=cat(3,imskinp,imskinp,imskinp);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% imf(1:2:end,1:2:end,:)=imskin;
% imf(2:2:end,1:2:end,:)=imskin;
% imf(:,2:2:end,:)=imf(:,1:2:end,:);

% 
% im=im.*(imf);
% 
% image(uint8(im))
% axis image off
% toc