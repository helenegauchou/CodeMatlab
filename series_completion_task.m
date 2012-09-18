function series_completion_task(stress,part_number)

global win0 winclear
global_settings;


% TITLE screen ************************************************************

Screen('CopyWindow', winclear, win0);
Text1 = 'TASK 1: SERIES COMPLETION TASK';
Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X+9*settings.CM,settings.LOCATION_TEXT_Y+3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
WaitSecs(2);
Screen('CopyWindow',winclear,win0);
WaitSecs(1);

% Instructions screen *****************************************************

Text1 = 'SERIES COMPLETION TASK - Instructions';
Text2 = '5 series of numbers will be presented in succession.';
Text3 = 'Discover the rule governing a series in order to identify the next number.';
Text4 = 'E.g: 2 -> 4 -> 6 -> 8 -> ?';
Text5 = 'Here the answer is: 10';
if stress == 1
    Text6 = 'You will have 30 seconds to find the answer for each series.';
end
Text7 = 'Please tell your answer to the experimenter.';
Text8 = 'Any questions?';
Text9 = 'Please tell the experimenter when you are ready to start the task.';

Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 2*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 5*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 6*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
if stress == 1
    Screen(win0,'DrawText',Text6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 8*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
end
Screen(win0,'DrawText',Text7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 9*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text8,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 11*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text9,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 12*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);

while 1
    if KbCheck == 1
        key = GetChar;
        if (key == 'N')||(key == 'm')
            break
        end
    end
end

% Task starts here ********************************************************

for series_number = 1:5
    Screen('CopyWindow', winclear, win0);
    Screen(win0, 'WaitBlanking', settings.REFRESH_RATE);
    series_completion_row = series_list(stress, part_number, series_number);    % Let's get the line of the matrix containing the series completion task we want to display
    message = ['Series ',num2str(series_number),'/5'];
    Screen(win0,'DrawText',message,14.5*settings.CM,8*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    response_series = GetEchoString(win0,...
        format_series_completion_task(series_completion_row),...
        14.5*settings.CM,9*settings.CM,...
        settings.LETTER_COLOR,settings.BACKGROUND_COLOR);
    
    Screen('CopyWindow', winclear, win0);
end
