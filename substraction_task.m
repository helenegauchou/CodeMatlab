function substraction_task(stress,part_number)

global win0 winclear
global_settings;
substraction_list;



% TITLE screen ************************************************************

Screen('CopyWindow', winclear, win0);
Text1 = 'TASK 2: SUBTRACTION TASK';
Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X+9*settings.CM,settings.LOCATION_TEXT_Y+3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
WaitSecs(2);
Screen('CopyWindow',winclear,win0);
WaitSecs(1);

% Instructions screen *****************************************************

Text1 = 'Please wait for the experimenter''s instructions';
Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR);
while 1
    if KbCheck == 1 %
        if (GetChar == 'n') || (GetChar == 'N')
            break;
        end
    end
end
Screen('CopyWindow',winclear,win0);

% Task starts here ********************************************************

list = eval(['substraction_list_', num2str(stress)]);
chunk = list((part_number-1)*20 + 1:part_number * 20, :);

for t = 1:20
    substraction_line = chunk(t, :);
    substraction_text = [num2str(substraction_line(1)), ' - ', num2str(substraction_line(2)), ' = ', num2str(substraction_line(3))];
    Screen('CopyWindow', winclear, win0);
    message = ['Subtraction ',num2str(t),'/20'];
    Screen(win0,'DrawText',message,14.5*settings.CM,8*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',substraction_text,14.5*settings.CM,9*settings.CM,settings.LETTER_COLOR);
    while 1
    if KbCheck == 1
        key = GetChar;
        if (key == 'Q')||(key == 'q')||(key == 'M')||(key == 'm')
            break
        end
    end
end
end




