function im=skindetect(selecction,im)


switch selecction
    case 'white'
        levelcolor=[2.9268,1.1233;...
            35.0000,1.2750;16.0000,1.1010];
    case 'excellent'
        levelcolor=[2.5294,1.2115;...
            9.9231,1.4540;3.9231,1.1645];
    case 'quality'
        levelcolor=[5.6000,1.1357;...
           Inf,1.2479;Inf,1.0769];
    case 'deep'
        levelcolor=[2.0435,1.1415;...
           23.6667,1.3444;14.3333,1.1582];
    case 'webcam1'
        levelcolor=[1.5556,1.0635;...
            2.6667,1.1835;1.7381,1.0150];
    case 'webcam2'
        levelcolor=[1.5870,1.0273;...
            2.0645,1.2151;1.7500,1.0189];
    otherwise
           error('myApp:argChk', 'Wrong selecction of color level')
end
height=size(im,1);
width=size(im,2);

minorlevel=cat(3,levelcolor(1,2)*ones(height,width),...
    levelcolor(2,2)*ones(height,width),levelcolor(3,2)*ones(height,width));

mayorlevel=cat(3,levelcolor(1,1)*ones(height,width),...
levelcolor(2,1)*ones(height,width),levelcolor(3,1)*ones(height,width));

im=double(im);

imskin=( im(:,:,[1,1,2])./im(:,:,[2,3,3]) );

imskin=((imskin>minorlevel) &...
    (imskin<mayorlevel));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*imskin(:,:,[3,1,2]);%
    imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);           %
    imskin=cat(3,imskinp,imskinp,imskinp);                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    im=im.*imskin;
    im=uint8(im);
return