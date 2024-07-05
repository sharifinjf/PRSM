%% IN THE NAME oF ALLH
%% ONLy use for jpg image
% % 
% % 
function varargout = tag_imag(varargin)
% TAG_IMAG MATLAB code for tag_imag.fig
%      TAG_IMAG, by itself, creates a new TAG_IMAG or raises the existing
%      singleton*.
%
%      H = TAG_IMAG returns the handle to a new TAG_IMAG or the handle to
%      the existing singleton*.
%
%      TAG_IMAG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAG_IMAG.M with the given input arguments.
%
%      TAG_IMAG('Property','Value',...) creates a new TAG_IMAG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tag_imag_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tag_imag_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tag_imag

% Last Modified by GUIDE v2.5 14-Jul-2017 08:08:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tag_imag_OpeningFcn, ...
                   'gui_OutputFcn',  @tag_imag_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before tag_imag is made visible.
function tag_imag_OpeningFcn(hObject, eventdata, handles, varargin)
% global countr_image
 DirList         = dir('*.jpg');
 handles.DirList = DirList;
 guidata(hObject,handles)
  countr_image   = 0;
  handles.countr_image = countr_image;
  guidata(hObject,handles);
  
handles.output  = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tag_imag wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tag_imag_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
DirList = handles.DirList;
N =0;
 
%  countr_imag = countr_imag+1;
img =imread(DirList(N+1).name);
imshow(img,'Parent',handles.image);
