function varargout = Dec_Panel(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Dec_Panel_OpeningFcn, ...
                   'gui_OutputFcn',  @Dec_Panel_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Dec_Panel_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Dec_Panel_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile('encrypted.bmp');
fullpathname=strcat(pathname,filename);
global s;
s=imread(fullpathname);
axes(handles.axes1);
imshow(s);
dec(s);
fid = fopen('out.txt');
msg= fgetl(fid);
msg=regexprep(msg,'ÿ','');
set(handles.final_msg,'String',msg);
