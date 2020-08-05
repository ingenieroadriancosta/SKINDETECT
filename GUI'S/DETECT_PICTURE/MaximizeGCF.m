function MaximizeGCF( HanFig )
if( nargin==0 )
    HanFig = gcf;
end
drawnow
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
try
    jFig = get( HanFig, 'JavaFrame');
    jFig.setMaximized(true);
catch Me
    Str = sprintf( 'Error - function MaximizeGCA( HanFig )\n\n%s',...
                                                            Me.message);
    h = errordlg( Str, 'Error' );
    set( h, 'WindowStyle', 'modal')
end
return