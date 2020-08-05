% function pruebas
clc;clear all;
warning all off %#ok<CTPCT>
File = '0Angelina_Jolie.jpg';
im = imread( strcat( 'PIC\', File ) );

% NFil = 13;
% h = ones( NFil, NFil );
% h( 13 ) = 1;
% 
% cred = conv2( double(im(:,:,1))/255, h, 'full' );
% cred = cred/max( max(cred) );
% im( :, :, 1 ) = uint8( 255 * cred( 1:size(im,1), 1:size(im,2) ) );
% 
% cred = conv2( double(im(:,:,2))/255, h, 'full' );
% cred = cred/max( max(cred) );
% im( :, :, 2 ) = uint8( 255 * cred( 1:size(im,1), 1:size(im,2) ) );
% 
% cred = conv2( double(im(:,:,3))/255, h, 'full' );
% cred = cred/max( max(cred) );
% im( :, :, 3 ) = uint8( 255 * cred( 1:size(im,1), 1:size(im,2) ) );
% 
% 
% % conv2( I, h, 'same')
% % im(:,:,2) = uint8( imfilter( double(im(:,:,2)), h, 'conv' ) );
% % im(:,:,3) = uint8( imfilter( double(im(:,:,3)), h, 'conv' ) );
% imshow( im )
% % return


imdbl = double( im );
SetG = 1;
im3 = im;
rX = 465:515;
% rY = 290:270;
rY = 610:642;
im3( rY, rX, : ) = 255;
image( im3 );
axis image off
drawnow
% return
im2 = double( im( rY, rX, : ) );
% im2 = imcrop;
image( im2/255 );
axis image off
drawnow
% return
perc = 8;10^100;
MaxRG = max( max( im2(:,:,1)./im2(:,:,2) ) );
MaxRG = MaxRG + MaxRG/perc;

MaxRB = max( max( im2(:,:,1)./im2(:,:,3) ) );
MaxRB = MaxRB + MaxRB/perc;

MaxGB = max( max( im2(:,:,2)./im2(:,:,3) ) );
MaxGB = MaxGB + MaxGB/perc;

MinRG = min( min( im2(:,:,1)./im2(:,:,2) ) );
MinRG = MinRG - MinRG/perc;

MinRB = min( min( im2(:,:,1)./im2(:,:,3) ) );
MinRB = MinRB - MinRB/perc;

MinGB = min( min( im2(:,:,2)./im2(:,:,3) ) );
MinGB = MinGB - MinGB/perc;

% size( imdbl )
imgray = double( rgb2gray( im ) );
a = imdbl( :, :, 1 )./imdbl( :, :, 2 );
b = imdbl( :, :, 1 )./imdbl( :, :, 3 );
c = imdbl( :, :, 2 )./imdbl( :, :, 3 );

imb = ~( ((a>MinRG & a<MaxRG) & (b>MinRB & b<MaxRB) & (c>MinGB & c<MaxGB)) );
imb = double( imb );

imdbl( :, :, 1) = ( imb .* imdbl( :, :, 1) );
imdbl( :, :, 2) = ( imb .* imdbl( :, :, 2) );
imdbl( :, :, 3) = ( imb .* imdbl( :, :, 3) );

if SetG==1
    imgray = ( double(~boolean(imb)) .* (imgray) );
    imdbl( :, :, 1) = imdbl( :, :, 1) + imgray;
    imdbl( :, :, 2) = imdbl( :, :, 2) + imgray;
    imdbl( :, :, 3) = imdbl( :, :, 3) + imgray;
end




if size( im, 1 )>size( im, 2 )
    imF = [ im uint8( imdbl ) ];
else
    imF = [ im; uint8( imdbl ) ];
end
imFN = uint8( imdbl );

image( imF( 200:end, 1600:end-150, : ) );
image( imF );
% image( imFN( 500:end-600, 1500:end-1000, : ) );
axis image off
drawnow
imwrite( uint8( imF ), File );
