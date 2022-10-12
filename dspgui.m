function dspgui
clc
clear all
close all

S = figure('Visible','on','units','normalized','outerposition',[0 0 1 1]);
S.n = uicontrol('style','text','unit','normalized','position',[0 .9 .3 .05],'fontsize',20,'string','Numerator','value',1);
S.n1 = uicontrol('style','pop','unit','normalized','position',[0 .8 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@n1pop_menu_Callback});
S.n2 = uicontrol('style','pop','unit','normalized','position',[0.1 .8 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@n2pop_menu_Callback});
S.n3 = uicontrol('style','pop','unit','normalized','position',[0.2 .8 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@n3pop_menu_Callback});

S.d = uicontrol('style','text','unit','normalized','position',[0 .75 .3 .05],'fontsize',20,'string','Denomenator','value',1);
S.d1 = uicontrol('style','pop','unit','normalized','position',[0 .65 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@d1pop_menu_Callback});
S.d2 = uicontrol('style','pop','unit','normalized','position',[0.1 .65 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@d2pop_menu_Callback});
S.d3 = uicontrol('style','pop','unit','normalized','position',[0.2 .65 .1 .1],'fontsize',12,'string',{0:20},'value',1,'Callback',{@d3pop_menu_Callback});

S.pp = uicontrol('style','push','unit','normalized','position',[0 .6 .3 .05],'fontsize',12,'string','Output','value',1,'Callback',{@pbbutton_Callback});
sys=[];
S.d = uicontrol('style','text','unit','normalized','position',[.6 .8 .3 .05],'fontsize',20,'string',sys,'value',1);

n1=0;
n2=0;
n3=1;
d1=1;
d2=0;
d3=0;
h1=axes('Units','normalized','Position',[.5,.5,.4,.4]);
h2=axes('Units','normalized','Position',[.5,.05,.4,.4]);
% zplane(zero(filt([n1 n2 n3],[d1 d2 d3])),pole(filt([n1 n2 n3],[d1 d2 d3])));title('pole zero plot');
function pbbutton_Callback(handles,eventdata)
    sys=filt([n1 n2 n3],[d1 d2 d3]);
    axes(h1);impz([n1 n2 n3],[d1 d2 d3]);title('impulse respose');
    sys=filt(1,[1 -.6 .08]);
%     axes(h2);zplane(zero(filt([n1 n2 n3],[d1 d2 d3])),pole(filt([n1 n2 n3],[d1 d2 d3])));title('pole zero plot');
%     axes(h2);pole(filt([n1 n2 n3],[d1 d2 d3]));title('pole zero plot');
%     axes('Units','normalized','Position',[.5,.05,.4,.4]);
end
function n1pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     n1=str2num(str{val});
%      disp(n1)
end
function n2pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     n2=str2num(str{val});
%      disp(n1)
end
function n3pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     n3=str2num(str{val});
%      disp(n1)
end
function d1pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     d1=str2num(str{val});
%      disp(n1)
end
function d2pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     d2=str2num(str{val});
%      disp(n1)
end
function d3pop_menu_Callback(source,eventdata)
     str = get(source, 'String');
     val = get(source,'Value');
     d3=str2num(str{val});
%      disp(n1)
end
end