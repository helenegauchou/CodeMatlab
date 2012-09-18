function training_task1(task,target_key_side,stress)

global win0 winclear
global accuracy_identification response_time

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
    for rep=1:4                                             % 4*6 trials per loop = 24
        for target_case = settings.TARGET_CASE_task1        % 3=left tilt; 4=right tilt
            for setsize = settings.SET_SIZE_task1  
                l=l+1;
                m(l,:)=[target_case,setsize];
            end
        end
    end
    m=m(randperm(l),:);
    
    sum_hit_left = 0;
    sum_hit_right = 0;
    sum_RT_hit_left = 0;
    sum_RT_hit_right = 0;
    
    for w=1:settings.TRIAL_NUMBER_PER_TRAINING_BLOCK 
        
        Exp(task,m(w,1),0,m(w,2),target_key_side,stress)
        
        matresult(w,:) = [m(w,1),accuracy_identification,response_time];
        
        if (matresult(w,1) == settings.CASE_LEFT_TILT)
            sum_hit_left = sum_hit_left + matresult(w,2);
            if matresult(w,2) == 1
                sum_RT_hit_left = sum_RT_hit_left + matresult(w,3);
            end
        elseif (matresult(w,1) == settings.CASE_RIGHT_TILT)
            sum_hit_right = sum_hit_right + matresult(w,2);
            if matresult(w,2) == 1
                sum_RT_hit_right = sum_RT_hit_right + matresult(w,3);
            end
        end
        sum_correct_answer = sum_hit_left + sum_hit_right;
    end
    
    hit_left_string = int2str(floor(sum_hit_left*100/(w/2)));
    hit_right_string = int2str(floor(sum_hit_right*100/(w/2)));
    
    global_accuracy_rate = floor(sum_correct_answer*100/w);
    global_accuracy_rate_string = int2str(global_accuracy_rate);
    
    average_response_time_hit_left_string = int2str(floor(sum_RT_hit_left /(w/2)));
    average_response_time_hit_right_string = int2str(floor(sum_RT_hit_right /(w/2)));
    
    Screen(win0,'TextSize',settings.LETTER_SIZE);
    Screen(win0,'TextFont',settings.LETTER_FONT);
    
    Text_0 = 'Please ask the experimenter for further instructions.';
    Text_1 = strcat('AVERAGE ACCURACY:  ',global_accuracy_rate_string);
    Text_2 = strcat('Accuracy left tilt:  ',hit_left_string);
    Text_3 = strcat('RT left tilt:  ',average_response_time_hit_left_string);
    Text_4 = strcat('Accuracy right tilt:  ',hit_right_string);
    Text_5 = strcat('RT right tilt:  ',average_response_time_hit_right_string);
    
    Screen(win0,'DrawText',Text_0,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+2*settings.CM  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+4*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+5*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+7*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+8*settings.CM,settings.LETTER_COLOR);
    while 1
        if KbCheck == 1
            key = GetChar;
            if (key == 'n') || (key == 'N')
                break
            end
        end
    end
    Screen('CopyWindow',winclear,win0);
    Screen(win0,'WaitBlanking',settings.REFRESH_RATE/2);
    
       
end

