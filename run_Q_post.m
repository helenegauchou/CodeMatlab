function [sum_D,sum_E,sum_W] = run_Q_post(ID_subject)

global win0 winclear
global SSSQpost

global_settings;
question_list;

Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);

% Questionnaire 1 screen **************************************************
Screen('CopyWindow',winclear,win0);
Q1='QUESTIONNAIRE 1/1';
Screen(win0,'DrawText',Q1,15*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'WaitBlanking',2*settings.REFRESH_RATE);

% Question + confidence scale 
for ID_questSSSQpost=1:(length(SSSQpost))
    questID=4;
    Screen('CopyWindow',winclear,win0);
    FlushEvents('keyDown');
    % displays the question until the participant answers
    I='This questionnaire is concerned with your feelings and thoughts WHILE PERFORMING THE TASKS.';
    I2='Read the STATEMENT and then indicate how it describes your feeling and thoughts WHILE PERFORMING THE TASKS.';
    I3='There are no right or wrong answers. Answer, as honestly as you can, what is true of you.';
    I4='Please do not choose a reply just because it seems like "the right thing to say". Your answers will be kept entirely confidential.';
    I5='Do not spend too much time on any one statement and be sure to answer according to how you feel WHILE PERFORMING THE TASKS.';
   
    L1='1 = Not at all';
    L2='2 = A little bit';
    L3='3 = Somewhat';
    L4='4 = Very much';
    L5='5 = Extremely';
    question=SSSQpost{ID_questSSSQpost};
    
    Screen(win0,'DrawText',I,settings.CM,3*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',I2,settings.CM,4*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',I3,settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',I4,settings.CM,6*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',I5,settings.CM,7*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    
    Screen(win0,'DrawText',question,5*settings.CM,11*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',L1,6*settings.CM,12.5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',L2,6*settings.CM,13.5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',L3,6*settings.CM,14.5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',L4,6*settings.CM,15.5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    Screen(win0,'DrawText',L5,6*settings.CM,16.5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
    
    while 1
        key=GetChar;
        if (key =='1')||(key =='2')||(key =='3')||(key =='4')||(key =='5')
            break
        end
    end
    % reports participant's answer
    answerSSSQpost=str2num(key);
    
    % create a matrix containing the information we want to retrieve as data
    dataSSSQpost(ID_questSSSQpost,:) = [questID,ID_questSSSQpost,answerSSSQpost];
    M=dataSSSQpost;
end

sum_D = M(1,3) + M(3,3) + M(4,3) + M(6,3) + M(7,3) + M(8,3) + M(9,3) + M(10,3);
sum_E = M(2,3) + M(5,3) + M(11,3)+ M(12,3)+ M(13,3)+ M(17,3)+ M(21,3)+ M(22,3);
sum_W = M(14,3)+ M(15,3)+ M(16,3)+ M(18,3)+ M(19,3)+ M(20,3)+ M(23,3)+ M(24,3);


% End screen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('CopyWindow',winclear,win0);
thend='End of the questionnaire - THANK YOU!';
Screen(win0,'DrawText',thend,12*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'WaitBlanking',2*settings.REFRESH_RATE);

%%%%%%

data(:,:) = dataSSSQpost;
filename = [num2str(ID_subject),'_data_Q_post'];
save(filename,'data');
