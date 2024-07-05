%% IN THE NAME OF ALLAH
% USE ONLY FOR '.jpg'IMAGE
function varargout = tag_imag_1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tag_imag_1_OpeningFcn, ...
                   'gui_OutputFcn',  @tag_imag_1_OutputFcn, ...
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


% --- Executes just before tag_imag_1 is made visible.
function tag_imag_1_OpeningFcn(hObject, eventdata, handles, varargin)
 
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout      = tag_imag_1_OutputFcn(hObject, eventdata, handles) 
DirList                 = dir('*.jpg');  % load detail for toal image
handles.DirList         = DirList;       %
Number_row              = dim_exel();    % call function for evaluate dimension exel file
handles.Number_row      = Number_row;
guidata(hObject,handles)
set(handles.next, 'UserData', 0);
% varargout{1} = handles.output;

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
DirList = handles.DirList;
Number_row =  handles.Number_row;                          % number last row in exel file 
counter = get(hObject, 'UserData') + 1;                    % counter for loadig image
set(hObject, 'UserData', counter);     
guidata(hObject, handles);                               
imag_name  = DirList(counter).name;                        % read image name
number_row = ['A' num2str(counter+Number_row)];            % row numbring for image   
xlswrite('tag_image.xlsx',cellstr(imag_name),1,number_row) % write image name in exle file
img        = imread(imag_name);                            % load image;
imshow(img,'Parent',handles.axes1);                        % show orginal image
%% 
[BoundigBoxes,Number_Bundig] = BOUNDING_BOXES(img);
cla(handles.axes2)
if ~(Number_Bundig ==0)
set(handles.axes2,'Visible','On')  
regin          =  BoundigBoxes(1,1).BoundingBox;
regin_imag     = img (regin(1,2):regin(1,2)+regin(1,4),regin(1,1):regin(1,1)+regin(1,3));
imshow(regin_imag,'Parent',handles.axes2); 

end


% --- Executes on button press in next_object.
function next_object_Callback(hObject, eventdata, handles)
% hObject    handle to next_object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of next_object
