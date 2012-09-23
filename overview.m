function overview(stress)

global win0 winclear
global_settings;

Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);

if stress == 1
    Text1 = 'In this study we are trying to understand the effect of chronic stress on people’s intelligence.';
    Text2 = 'The questionnaires you filled out will tell us about your level of chronic stress.';
    Text3 = 'Now you will be required to complete different tasks several times.';
    Text4 = 'These tasks evaluate different types of intelligence.';
    Text5 = 'The final stage of the experiment will consist of a short oral presentation and an interview';
    Text6 = 'that will be conducted by the experimenters and two other examiners.';
    Text7 = '>>> The interview will be videotaped.';
    Text8 = '>>> You will receive an assessment of your performance on the interview with respect to other participants. ';
    Text9 = '>>> You will have 5 minutes before the interview to get ready.';
    Text10 = 'Please ask the experimenter for further instructions.';
    Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 2*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 5*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 6*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 8*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 9*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 11*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text8,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 12*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text9,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 13*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text10,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 15*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
else
    Text1 = 'In this study we are trying to understand the effect of chronic stress on cognition.';
    Text2 = 'The questionnaires you filled out will tell us about your level of chronic stress.';
    Text3 = 'Now you will be required to complete 3 different tasks 4 times.';
    Text4 = 'Please ask the experimenter for further instructions.';
    Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 2*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 5*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
    Screen(win0,'DrawText',Text4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 6*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
end
while 1
    if KbCheck == 1
        key = GetChar;
        if lower(key) == settings.NEXT_KEY_FOR_EXPERIMENTER
            break
        end
    end
end
Screen('CopyWindow',winclear,win0);
end