clc,clear all;
warning off %#ok<WNOFF>
readavi=0;
if readavi==1
    video1 = aviread('ARCHIVOS\AVI\example.avi');
    video1 = {video1.cdata};
    tic
    for i=1:122
        image((video1{i}))
        axis off
        pause(0.01)
    end
%     clear video1 i
    toc  
    
else
    for t=1:122
        nombre=strcat('E:\__ARCHIVOS MATLAB\FOTOS\VARIAS\PEZP\pez',...
            num2str(t),'.jpg');
        imp{t}=(imread(nombre));     %#ok<AGROW>
    end

    aviobj = avifile('example.avi','fps',30,'quality',100);

    for i=1:122
        aviobj = addframe(aviobj,imp{i});
    end
    clear all

    

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









% hImage1 = image(zeros(480,640,3));
% axis off
% %%
% for i=1:5
%     for t=1:122
%         set(hImage1,'Cdata',uint8(imp{t}))
%         drawnow
%     end
% end
% %%







% avi = aviread('ARCHIVOS\AVI\p.avi');
% video = {avi.cdata};
% imp=video{1};
% % imp=imp;
% hImage=image(imp);
% axis off










% im=(imread('ARCHIVOS\JPG\_1.jpg'));
% imtool(im)







% pause(1)
% for I=1:2
%     for a = 1:length(video)
%         imp=video{a};
%         imp=imp(93:280,110:360,:);
%         writevideo{a}=imp;
% %         set(hImage,'Cdata',imp)
%         imshow(imp)
%         axis off
%         drawnow;
%     end;
% end
% tic
% for a = 1:length(video)
%         imp=video{a};
%         imp=imp(93:280,110:360,:);
%         writevideo{a}=imp;
% end
% toc
% 
% 
% disp('output video');
% disp(length(imp(1,:,1))/length(imp(:,1,1)))
% clc;cla;pause(1)








% clc;clear all
% disp('Prueba')
% 
% for t=1:122
%     nombre=strcat('ARCHIVOS\AVI\pez',...
%         num2str(t),'.jpg');
%     writevideo{t}=imread(nombre);
%     
% end
% hImage=imshow(writevideo{1});
% axis off
% title('Prueba')
% pause(.1)
% for i=1:1
% for a = 1:length(writevideo)
%         imshow(writevideo{a})
%         title('Prueba')
%         axis off
%         drawnow;
% end
% end
% 
% 
% clc
% for a = 1:length(writevideo)
%     b=size(writevideo{a});
%     if b(1)~=480
%         disp(a)
%     end
%         
% end















% imfinal=uint8((zeros(960,1280,3)));
% im = (imread('ARCHIVOS\5.jpg'));
% imshow(im)
% axis off
% 
% r=1;
% c=1;
% for row=2:2:960
%         imfinal(row,1:640,:)=im(r,:,:);
%         imfinal(row-1,1:640,:)=im(r,:,:);
%         r=r+1;
%         
% end
% 
% imtrans=imfinal;
% 
% for col=2:2:1280
%         imfinal(:,col,:)=imtrans(:,c,:);
%         imfinal(:,col-1,:)=imtrans(:,c,:);
%         c=c+1;
%         
% end
% 
% 
% 
% imshow((imfinal))
% axis off
%     
    
%     640*480*3=921600;