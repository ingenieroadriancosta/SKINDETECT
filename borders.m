% function borders
clc;clear all;
File = 'Angelina_Jolie.jpg';
im = imread( strcat( 'PIC\', File ) );
imdbl = double( im );
image( im );
axis image off
drawnow

NFil = 50;
h = ones( NFil, NFil );
mp = floor( NFil/2 ) + 1;
h( mp, mp ) = mp * mp;
for t = 1:floor( length(h)/2-1 )
    V2R = t;
    h( mp, mp+t ) = h( mp, mp ) - V2R;
    h( mp, mp-t ) = h( mp, mp ) - V2R;
end

for t = mp+1:length(h)
    h( t, : ) = h( t-1, : ) - t;
end


for t = mp-1:-1:1
    h( t, : ) = h( t+1, : ) - 1;
end


% for t = 1:floor(length( h )/2-1)
%     h( t, : ) = h( t+1, : )-1;
% end

% for t = floor(length( h )/2+1):length( h )
%     h( t, : ) = h( t-1, : );
% end



Y = conv2( imdbl(:, :, 1), h );
Y = uint8( 255 * Y/max( max(Y) ) );
imdbl(:, :, 1) = Y( 1:size(imdbl,1), 1:size(imdbl,2) );

Y = conv2( imdbl(:, :, 2), h );
Y = uint8( 255 * Y/max( max(Y) ) );
imdbl(:, :, 2) = Y( 1:size(imdbl,1), 1:size(imdbl,2) );

Y = conv2( imdbl(:, :, 3), h );
Y = uint8( 255 * Y/max( max(Y) ) );
imdbl(:, :, 3) = Y( 1:size(imdbl,1), 1:size(imdbl,2) );


imshow( [im uint8(imdbl)] );
drawnow
% clc;h

% 
% imdbl(:, :, 1) = Y( 1:size(im,2), 1:size(im,1) );
% 
% imshow( Y );
% drawnow






% imgray = rgb2gray( im );
% BW = edge( Y, 'canny' );
% imshow( BW );
% drawnow
imwrite( uint8(imdbl), '_a.jpg' )
