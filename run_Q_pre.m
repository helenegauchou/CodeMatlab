function [sum_STAI,sum_PSS,sum_D,sum_E,sum_W] = run_Q_pre(ID_subject)

global win0 winclear 
global STAI PSS SSSQpre

global_settings;
question_list;


Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);

% GENERAL INSTRUCTIONS
Text1 = 'WELCOME!';
Text2 = 'The goal of this experiment is to study the effect of CHRONIC STRESS on cognition.';
Text3 = 'For that reason we first need to gather information about how you feel today and in general.';
Text4 = 'You will have to fill out 3 questionnaires.';
Text5 = 'REMEMBER that it is really IMPORTANT that you answer HONESTLY since we are trying to understand';
Text6 = 'the link between how you perform and how you feel.';
Text7 = 'Before you answer each questionnaire please read the instructions carefully.';
Text8 = 'Do not hesitate to ask the experimenter if you have any questions.';
Text9 = 'Please hit the SPACE BAR when you are ready to proceed to the questionnaires.';
Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 2*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 4*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 6*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 7*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 9*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text8,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 10*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
Screen(win0,'DrawText',Text9,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y + 12*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
while 1
    if KbCheck == 1
        if GetChar == 32;% Space bar
            break
        end
    end
end
Screen('CopyWindow',winclear,win0);

% Questionnaire 1 screen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('CopyWindow',winclear,win0);
Q1='QUESTIONNAIRE 1/3';
Screen(win0,'DrawText',Q1,15*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'WaitBlanking',2*settings.REFRESH_RATE);

% Question + confidence scale

for ID_quest=1:(length(STAI))
    questID=1;
    Screen('CopyWindow',winclear,win0);
    FlushEvents('keyDown');
    % displays the question until the participant answers
    I='A number of statements which people have used to describe themselves will be displayed below.';
    I2='Read the STATEMENT and then type the number corresponding to how you GENERALLY feel.';
    I3='There are no right or wrong answers. Answer, as honestly as you can, what is true of you.';
    I4='Please do not choose a reply just because it seems like "the right thing to say". Your answers will be kept entirely confidential.';
    I5='Do not spend too much time on any one statement and be sure to answer according to how you GENERALLY feel.';
    
    L1='1 = Quite untrue of you';
    L2='2 = Somewhat untrue of you';
    L3='3 = Somewhat true of you';
    L4='4 = Quite true of you';
    question=STAI{ID_quest};
    
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
    
    while 1
        key=GetChar;
        if (key =='1')||(key =='2')||(key =='3')||(key =='4')
            break
        end
    end
    % reports participant's answer
    answerSTAI=str2num(key);
    % recodes answers
    if (ID_quest == 1)||(ID_quest == 3)||(ID_quest == 6)||(ID_quest == 7)||(ID_quest == 10)||(ID_quest == 13)||(ID_quest == 14)||(ID_quest == 16)||(ID_quest == 19)
        answerSTAI=5-answerSTAI;
    end
    
%    Screen(win0,'WaitBlanking',settings.REFRESH_RATE/2);
    
    % create a matrix containing the information we want to retrieve as data
    dataSTAI(ID_quest,:) = [questID,ID_quest,answerSTAI];
end
sum_STAI=sum(dataSTAI(:,3));

% Questionnaire 2 screen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('CopyWindow',winclear,win0);
Q2='QUESTIONNAIRE 2/3';
Screen(win0,'DrawText',Q2,15*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'WaitBlanking',2*settings.REFRESH_RATE);

% Question + confidence scale 
for ID_questPSS=1:(length(PSS))
    questID=2;
    Screen('CopyWindow',winclear,win0);
    FlushEvents('keyDown');
    % displays the question until the participant answers
    I='This questionnaire is concerned with your feelings and thoughts DURING THE LAST MONTH.';
    I2='Read the QUESTION and then type the number corresponding to how often you felt or thought a certain way.';
    I3='There are no right or wrong answers. Answer, as honestly as you can, what is true of you.';
    I4='Please do not choose a reply just because it seems like "the right thing to say". Your answers will be kept entirely confidential.';
    I5='Do not spend too much time on any one statement and be sure to answer according to how you felt DURING THE LAST MONTH.';
    
    L1='0 = Never';
    L2='1 = Almost never';
    L3='2 = Sometimes';
    L4='3 = Fairly Often';
    L5='4 = Very Often';
    question=PSS{ID_questPSS};
    
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
        if (key =='0')||(key =='1')||(key =='2')||(key =='3')||(key =='4')
            break
        end
    end
    % reports participant's answer
    answerPSS=str2num(key);
    % recodes answers
    if (ID_questPSS == 4)||(ID_questPSS == 5)||(ID_questPSS == 7)||(ID_questPSS == 8)
        answerPSS=4-answerPSS;
    end
    
%    Screen(win0,'WaitBlanking',settings.REFRESH_RATE/2);
    
    % create a matrix containing the information we want to retrieve as data
    dataPSS(ID_questPSS,:) = [questID,ID_questPSS,answerPSS];
end
sum_PSS=sum(dataPSS(:,3));


% Questionnaire 3 screen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('CopyWindow',winclear,win0);
Q3='QUESTIONNAIRE 3/3';
Screen(win0,'DrawText',Q3,15*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'WaitBlanking',2*settings.REFRESH_RATE);

% Question + confidence scale 
for ID_questSSSQpre=1:(length(SSSQpre))
    questID=3;
    Screen('CopyWindow',winclear,win0);
    FlushEvents('keyDown');
    % displays the question until the participant answers
    I='This questionnaire is concerned with your feelings and thoughts AT THE MOMENT.';
    I2='Read the STATEMENT and then indicate how it describes your feeling and thoughts AT THE MOMENT.';
    I3='There are no right or wrong answers. Answer, as honestly as you can, what is true of you.';
    I4='Please do not choose a reply just because it seems like "the right thing to say". Your answers will be kept entirely confidential.';
    I5='Do not spend too much time on any one statement and be sure to answer according to how you feel AT THE MOMENT.';
   
    L1='1 = Not at all';
    L2='2 = A little bit';
    L3='3 = Somewhat';
    L4='4 = Very much';
    L5='5 = Extremely';
    question=SSSQpre{ID_questSSSQpre};
    
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
    answerSSSQpre=str2num(key);
    
    % create a matrix containing the information we want to retrieve as data
    dataSSSQpre(ID_questSSSQpre,:) = [questID,ID_questSSSQpre,answerSSSQpre];
    M=dataSSSQpre;
end
sum_D = M(1,3) + M(3,3) + M(4,3) + M(6,3) + M(7,3) + M(8,3) + M(9,3) + M(10,3);
sum_E = M(2,3) + M(5,3) + M(11,3)+ M(12,3)+ M(13,3)+ M(17,3)+ M(21,3)+ M(22,3);
sum_W = M(14,3)+ M(15,3)+ M(16,3)+ M(18,3)+ M(19,3)+ M(20,3)+ M(23,3)+ M(24,3);

% End screen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('CopyWindow',winclear,win0);
thend='End of the questionnaires - THANK YOU!';
pleaseask='Please ask the experimenter for further instructions.';
Screen(win0,'DrawText',thend,12*settings.CM,5*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
Screen(win0,'DrawText',pleaseask,11*settings.CM,7*settings.CM,settings.LETTER_COLOR_QUESTIONNAIRES);
while 1
    if KbCheck == 1
        key = GetChar;
        if (key == 'N')||(key == 'm')
            break
        end
    end
end

%%%%%%
%sumTOT(:,:) = [sum_STAI,sum_PSS,sum_D,sum_E,sum_W];

data(:,:) = [dataSTAI;dataPSS;dataSSSQpre];
filename = [num2str(ID_subject),'_data_Q_pre'];
save(filename,'data');
csvwrite(strcat( filename,'.csv'),'data')
