% This file contains all the necessary settings to run the experiment
settings = struct;

% Experiment's Independant variables
settings.TYPE_OF_TASK = 1:2; %1 = tilt side identification task; 2=switch between feature and conjunction search

settings.FIRST_VS_TASK_TYPE = 1:2;%

settings.SET_SIZE_task1 = [3,7,11];
settings.SET_SIZE_task2 = [7,11,16];
setsize_number = size(settings.SET_SIZE_task2,2);
settings.MAX_SETSIZE = settings.SET_SIZE_task2(setsize_number);

% % to be finalized!!!!! Presentation times (in second) for task 2 (switch task)
% settings.DIPLAY_DURATION = .5; 
% settings.BLANK_DURATION = .5;

% response keys
settings.LEFT_RESPONSE_KEY = 'a'; 
settings.RIGHT_RESPONSE_KEY = 'p'; 
settings.NO_TARGET_KEY = 32; 
settings.NEXT_KEY_FOR_EXPERIMENTER = 'n'; 
settings.NEXT_KEY_FOR_PARTICIPANT = 32; 

% Matrix related parameters
settings.TARGET_CASE_task2 = 0:3; % 0 & 1=no target; 2=long line; 3=T shape; 
settings.TARGET_CASE_task1 = 4:5; % 3=left tilt; 4=right tilt 
settings.CASE_NO_TARGET_0 = 0;
%settings.CASE_NO_TARGET_0 = 1;
settings.CASE_LONG_LINE = 2;
settings.CASE_T = 3;
settings.CASE_LEFT_TILT = 4;
settings.CASE_RIGHT_TILT = 5;

settings.NUMBER_OF_EXPERIMENTAL_CONDITIONS_task1 = 6;
settings.NUMBER_OF_EXPERIMENTAL_CONDITIONS_task2 = 24;

settings.TRIAL_NUMBER_PER_BLOCK_task1 = 120; % (6 * 20 = 20 observations per experimental condition)
settings.TRIAL_NUMBER_PER_BLOCK_task2 = 120; % (24 * 5 = 5 observations per experimental condition)

settings.BLOCK_FIRST_MATRIX_LINE_task1_first = [1,...
                                                settings.TRIAL_NUMBER_PER_BLOCK_task1+1,...
                                                settings.TRIAL_NUMBER_PER_BLOCK_task1+settings.TRIAL_NUMBER_PER_BLOCK_task2+1];

settings.BLOCK_FIRST_MATRIX_LINE_task2_first = [1, settings.TRIAL_NUMBER_PER_BLOCK_task2+1, 2*settings.TRIAL_NUMBER_PER_BLOCK_task2+1];

settings.BLOCK_LAST_MATRIX_LINE_task1_first = [settings.TRIAL_NUMBER_PER_BLOCK_task1,...
                                               settings.TRIAL_NUMBER_PER_BLOCK_task1+settings.TRIAL_NUMBER_PER_BLOCK_task2,...
                                               settings.TRIAL_NUMBER_PER_BLOCK_task1+2*settings.TRIAL_NUMBER_PER_BLOCK_task2];
settings.BLOCK_LAST_MATRIX_LINE_task2_first = [settings.TRIAL_NUMBER_PER_BLOCK_task2,...
                                               settings.TRIAL_NUMBER_PER_BLOCK_task1+settings.TRIAL_NUMBER_PER_BLOCK_task2,...
                                               settings.TRIAL_NUMBER_PER_BLOCK_task1+2*settings.TRIAL_NUMBER_PER_BLOCK_task2];

settings.TRIAL_NUMBER_PER_TRAINING_BLOCK = 24; 
settings.NUMBER_OF_BLOCKS_PER_PART = 1;
settings.NUMBER_OF_BLOCKS_PER_TASK_task1 = 1;
settings.NUMBER_OF_BLOCKS_PER_TASK_task2 = 2;
settings.NUMBER_OF_PARTS = 3;

% Screen settings
settings.COLOR_DEPTH = 32;    % bits
settings.REFRESH_RATE = 60; % Hz
settings.SCREEN_X = 1280; 
settings.SCREEN_Y = 800;
settings.screenRect = [0 0 settings.SCREEN_X settings.SCREEN_Y]; 
settings.CM = 38.4;% pixels

% Stimuli settings for dotted lines
settings.NUMBER_OF_DOTS = 3;
settings.DOTS_DIAMETER = 0.14 * settings.CM;    
settings.INTER_DOTS_DISTANCE = 0.2 * settings.CM;
settings.TILT_ANGLE_TARGET = 6; 
settings.TILT_ANGLE_NON_TARGET = 0;

% Stimuli settings for NON dotted lines
settings.LENGTH_LONG_LINE = settings.CM;
settings.LENGTH_SHORT_LINE = 0.8 * settings.CM;
settings.WIDTH_LINE = 4;

% Stimuli settings
settings.WIDTH_CELL = 3.45 * settings.CM; 
settings.MINIMAL_INTER_ITEM_DISTANCE = 0.6 * settings.CM;   
white = [255,255,255]; 
black = [0,0,0];
grey = [180,180,180];
red = [255,0,0];
settings.TARGET_COLOR = white;
settings.NON_TARGETS_COLOR = white;
settings.FIX_POINT_COLOR = white;
settings.BACKGROUND_COLOR = black;
settings.BLANK_SCREEN_COLOR = white;

% Text settings
settings.LETTER_SIZE = 20;
settings.LETTER_FONT = 'Tahoma';
settings.LETTER_COLOR = white;
settings.LETTER_COLOR_QUESTIONNAIRES = white;
settings.LETTER_COLOR_INSTRUCTIONS = white;
settings.LETTER_COLOR_STRESS = red;

settings.TEXT_READY_TO_START = 'Remember to answer as FAST and as ACCURATELY as you can! When ready to start, hit the SPACE BAR.';
settings.LOCATION_TEXT_X = 3*settings.CM;
settings.LOCATION_TEXT_Y = 3*settings.CM;

% colors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
white = [255,255,255]; 
light_grey = [210,210,210]; 
grey = [180,180,180];
dark_grey = [80,80,80];
black = [0,0,0];

red = [255,0,0];
dark_orange = [250,100,50];
orange = [255,153,0];

yellow = [255,255,0];
yellow_1 = [250,200,80];
light_yellow = [237,233,119];

light_green = [0,255,0];
green_1=[50,230,130];
green_2=[50,125,0];
dark_green = [40,140,28];
pastel_green = [157,237,159];

dark_blue = [0,0,255];
light_blue = [0,255,255];
blue_1=[0,100,200];
light_blue_1=[120,229,249];
blue_2=[200,100,255];%mauve
blue_3=[125,200,250];

purple = [255,0,255];%fuschia
purple_1 = [255,0,180];%rose
purple_2 = [199,21,197];%violet
violet_f = [113,87,145];
violet = [159,2,165];

pink = [255,0,180];
rose = [254,2,215];
pastel_pink = [253,204,175];

brown = [179,109,26];
dark_brown = [168,74,30];

% fontNames{1} = 'Bookman Old Style'; 
% fontNames{2} = 'Times New Roman'; 
% fontNames{3} = 'Symbol';
% fontNames{4} = 'Garamond';
% fontNames{5} = 'Tahoma'; 
