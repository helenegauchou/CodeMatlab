function training_task2(task,target_key_side,stress)

global win0 winclear
global accuracy_identification accuracy_detection response_time

matrix_settings;
global_settings;

Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);

%Instruction reminder
readytostart;

%*************************************************************************
global_accuracy_rate = 0;

while global_accuracy_rate < 90;
    
    Screen('CopyWindow',winclear,win0);
    Screen(win0,'WaitBlanking',settings.REFRESH_RATE/2);
    
    l=0;
    %for rep=1:2                                             % 2*12 trials per loop = 24
        for target_case = settings.TARGET_CASE_task2        % 0= no target, 1 = target long line, 2 = target T
            for setsize = settings.SET_SIZE_task2
                for first_VS_task = settings.FIRST_VS_TASK_TYPE
                l=l+1;
                if target_case < 2
                    target_presence = 0; % 0 = no target
                else
                    target_presence = 1; % 1 = target
                end
                m(l,:)=[target_case,setsize,target_presence];
                end
            end
        end
    %end
    m=m(randperm(l),:);
    
    sum_hit_long_line = 0;
    sum_hit_T = 0;
    sum_correct_rejection = 0;
    
    sum_RT_hit_long_line = 0;
    sum_RT_hit_T = 0;    
    sum_RT_correct_rejection = 0;
    
    for w=1:settings.TRIAL_NUMBER_PER_TRAINING_BLOCK
        
        Exp(task,m(w,1),m(w,3),m(w,2),first_VS_task,target_key_side,stress)
        
        matresult(w,:) = [m(w,1),accuracy_identification,accuracy_detection,response_time,m(w,3)];
        col_target_case = 1;
        col_accuracy_identification = 2;
        col_accuracy_detection = 3;
        col_response_time = 4;
        col_target_presence = 5;
        
        if (matresult(w,col_target_case) == settings.CASE_LONG_LINE)&&(matresult(w,col_accuracy_identification) == 1)
            sum_hit_long_line = sum_hit_long_line + matresult(w,col_accuracy_identification);
            sum_RT_hit_long_line = sum_RT_hit_long_line + matresult(w,col_response_time);
        elseif (matresult(w,col_target_case) == settings.CASE_T)&&(matresult(w,col_accuracy_identification) == 1)
            sum_hit_T = sum_hit_T + matresult(w,col_accuracy_identification);
            sum_RT_hit_T = sum_RT_hit_T + matresult(w,col_response_time);
        elseif (matresult(w,col_target_presence) == 0)&&(matresult(w,col_accuracy_detection) == 1);
            sum_correct_rejection = sum_correct_rejection + matresult(w,col_accuracy_detection);
            sum_RT_correct_rejection = sum_RT_correct_rejection + matresult(w,col_response_time);
        end
        sum_correct_answer = sum_hit_long_line + sum_hit_T + sum_correct_rejection;
    end
    
    hit_long_line_string = int2str(floor(sum_hit_long_line*100/(w/4)));
    hit_T_string = int2str(floor(sum_hit_T*100/(w/4)));
    correct_rejection_string = int2str(floor(sum_correct_rejection*100/(w/2)));
    
    global_accuracy_rate = floor(sum_correct_answer*100/w);
    global_accuracy_rate_string = int2str(global_accuracy_rate);
    
    average_response_time_hit_long_line_string = int2str(floor(sum_RT_hit_long_line /(w/2)));
    average_response_time_hit_T_string = int2str(floor(sum_RT_hit_T /(w/2)));
    average_response_time_correct_rejection = int2str(floor(sum_RT_correct_rejection /(w/2)));

    
    Screen(win0,'TextSize',settings.LETTER_SIZE);
    Screen(win0,'TextFont',settings.LETTER_FONT);
    
    Text_0 = 'Please ask the experimenter for further instructions.';
    Text_1 = strcat('AVERAGE ACCURACY: ',global_accuracy_rate_string);
    Text_2 = strcat('Hit rate search 1 (lines): ',hit_long_line_string);
    Text_3 = strcat('RT search 1 (lines): ',average_response_time_hit_long_line_string);
    Text_4 = strcat('Hit rate search 2 (Ts): ',hit_T_string);
    Text_5 = strcat('RT search 2 (Ts): ',average_response_time_hit_T_string);
    Text_6 = strcat('Correct rejection rate: ',correct_rejection_string);
    Text_7 = strcat('RT correct rejection: ',average_response_time_correct_rejection);
    
        
    Screen(win0,'DrawText',Text_0,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+1*settings.CM  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+3*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+4*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+6*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+7*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+9*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+10*settings.CM,settings.LETTER_COLOR);
    
    while 1
        if KbCheck == 1
            key = GetChar;
            if lower(key) == settings.NEXT_KEY_FOR_EXPERIMENTER
                break
            end
        end
    end
    Screen('CopyWindow',winclear,win0);
    Screen(win0,'WaitBlanking',settings.REFRESH_RATE/2);
    
       
end

