% function pruebas
clc;clear all;close all;
direcction='PICT2\';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all;
    return
else
    filename=strcat(b,a);
end;
im = imread( filename );
figure
image( im )
axis image off
MaximizeGCF

cropRGB=imcrop;
% cropRGB=im;
figure
image( cropRGB )
axis image off
MaximizeGCF

figure;MaximizeGCF;
subplot( 4, 1, 1 )
hr = imhist(cropRGB(:,:,1));
bar( hr, 'r' )
hold on
hg = imhist(cropRGB(:,:,2));
bar( hg, 'g' )
hb = imhist(cropRGB(:,:,3));
bar( hb, 'b' )
title( 'RGB' )

subplot( 4, 1, 2 )
bar( hr, 'r' )
title( 'Red' )

subplot( 4, 1, 3 )
bar( hg, 'g' )
title( 'Green' )

subplot( 4, 1, 4 )
bar( hb, 'b' )
title( 'Blue' )



%%%
figure;MaximizeGCF;
subplot( 4, 1, 1 )

bar( hr/hg, 'r' )
hold on

bar( hr/hb, 'g' )

bar( hg/hb, 'b' )
title( 'RGB' )




subplot( 4, 1, 2 )
bar( hr/hg, 'r' )
title( 'Red' )

subplot( 4, 1, 3 )
bar( hr/hb, 'g' )
title( 'Green' )

subplot( 4, 1, 4 )
bar( hg/hb, 'b' )
title( 'Blue' )