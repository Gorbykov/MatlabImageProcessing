function varargout = MainForm(varargin)
%MAINFORM MATLAB code file for MainForm.fig
%      MAINFORM, by itself, creates a new MAINFORM or raises the existing
%      singleton*.
%
%      H = MAINFORM returns the handle to a new MAINFORM or the handle to
%      the existing singleton*.
%
%      MAINFORM('Property','Value',...) creates a new MAINFORM using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to MainForm_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAINFORM('CALLBACK') and MAINFORM('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAINFORM.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainForm

% Last Modified by GUIDE v2.5 04-Oct-2016 23:09:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainForm_OpeningFcn, ...
                   'gui_OutputFcn',  @MainForm_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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

% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global imMap;
imMap = containers.Map;
clc


% --- Outputs from this function are returned to the command line.
function varargout = MainForm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in applyButton.
function applyButton_Callback(hObject, eventdata, handles)
% hObject    handle to applyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listOfWorkspace.
function listOfWorkspace_Callback(hObject, eventdata, handles)
% hObject    handle to listOfWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listOfWorkspace contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listOfWorkspace
global imMap;
contents = cellstr(get(hObject,'String'));
imshow(imMap(contents{get(hObject,'Value')}).im,'Parent', handles.showWindow);
set(handles.title,'String', imMap(contents{get(hObject,'Value')}).title);

% --- Executes during object creation, after setting all properties.
function listOfWorkspace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listOfWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in openButton.
function openButton_Callback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imMap;
[FileName,PathName] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';
'*.*','All Files' },'Open Image');
imMap(FileName) = Image(imread(fullfile(PathName, FileName)),FileName);
listStrings = get(handles.listOfWorkspace, 'String');
listStrings{length(listStrings)+1} = imMap(FileName).title;
set(handles.listOfWorkspace, 'String', listStrings);
   
      

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imMap;
i=int8(1);
while isKey(imMap,strcat(handles.title.String,' (',int2str(i),')'))
    i=i+1;
end
handles.title.String = strcat(handles.title.String,' (',int2str(i),')');
imMap(handles.title.String) = Image(getimage(handles.showWindow),handles.title.String);
listStrings = get(handles.listOfWorkspace, 'String');
listStrings{length(listStrings)+1} = imMap(handles.title.String).title;
set(handles.listOfWorkspace, 'String', listStrings);


% --- Executes on selection change in listOfFnctions.
function listOfFnctions_Callback(hObject, eventdata, handles)
% hObject    handle to listOfFnctions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listOfFnctions contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listOfFnctions
contents = cellstr(get(hObject,'String'));
global I;
I = getimage(handles.showWindow);
global mainHendles
mainHendles = handles;
switch contents{get(hObject,'Value')}
    case 'rgb2gray'        
        I = rgb2gray(I);
    case 'imnoise'
        imnoiseControl;
end;
imshow(I,'Parent', handles.showWindow); 
handles.title.String = strcat(handles.title.String,' {', contents{get(hObject,'Value')},'}');

% --- Executes during object creation, after setting all properties.
function listOfFnctions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listOfFnctions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearListButton.
function clearListButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearListButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imMap
imMap = containers.Map;
set(handles.listOfWorkspace, 'String', {});

% --- Executes on button press in delButton.
function delButton_Callback(hObject, eventdata, handles)
% hObject    handle to delButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imMap;
contents = cellstr(get(handles.listOfWorkspace,'String'));
remove(imMap,contents{get(handles.listOfWorkspace,'Value')});
contents{get(handles.listOfWorkspace,'Value')}=[];
set(handles.listOfWorkspace,'String', contents(~cellfun('isempty',contents)));
set(handles.listOfWorkspace,'Value',1);
