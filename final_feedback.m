function final_feedback(task,block_first_matrix_line,block_last_matrix_line,task_setsize)

global matrix_tot
global win0 winclear 

matrix_settings;
global_settings;

Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);
if task == 1
    
    matrix_current_part = matrix_tot(block_first_matrix_line:block_last_matrix_line, :);
    
    matrix_target_LEFT = matrix_current_part(matrix_tot((block_first_matrix_line:block_last_matrix_line),column_target_case) == settings.CASE_LEFT_TILT, :);
    matrix_target_RIGHT = matrix_current_part(matrix_tot((block_first_matrix_line:block_last_matrix_line),column_target_case) == settings.CASE_RIGHT_TILT, :);
    
    matrix_target_LEFT_correct = matrix_target_LEFT(matrix_target_LEFT(:,column_accuracy_identification) == 1, :);
    matrix_target_RIGHT_correct = matrix_target_RIGHT(matrix_target_RIGHT(:,column_accuracy_identification) == 1, :);
    
    hit_rate_LEFT = sum(matrix_target_LEFT_correct(:,column_accuracy_identification),1) / size(matrix_target_LEFT,1) * 100;
    hit_rate_RIGHT = sum(matrix_target_RIGHT_correct(:,column_accuracy_identification),1) / size(matrix_target_RIGHT,1) * 100;

    hit_rate_LEFT_string = int2str(floor(hit_rate_LEFT));
    hit_rate_RIGHT_string = int2str(floor(hit_rate_RIGHT));
    
    global_accuracy_rate = (hit_rate_LEFT + hit_rate_LEFT)/2;% A verifier
    global_accuracy_rate_string = int2str(floor(global_accuracy_rate));
    
    average_response_time_hit_LEFT_string = int2str(floor((sum(matrix_target_LEFT_correct(:,column_response_time),1))/size(matrix_target_LEFT_correct,1)));
    average_response_time_hit_RIGHT_string = int2str(floor((sum(matrix_target_RIGHT_correct(:,column_response_time),1))/size(matrix_target_RIGHT_correct,1)));
    
    l=0;
    matRT_target_LEFT = ones(1,3);
    matRT_target_RIGHT = ones(1,3);
    
    for setsize = task_setsize
        matrix_target_LEFT_correct_setsize = matrix_target_LEFT_correct(matrix_target_LEFT_correct(:,column_set_size) == setsize, :);
        matrix_target_RIGHT_correct_setsize = matrix_target_RIGHT_correct(matrix_target_RIGHT_correct(:,column_set_size) == setsize, :);

        average_response_time_hit_setsize_LEFT = (sum(matrix_target_LEFT_correct_setsize(:,column_response_time),1))/size(matrix_target_LEFT_correct_setsize,1);
        average_response_time_hit_setsize_RIGHT = (sum(matrix_target_RIGHT_correct_setsize(:,column_response_time),1))/size(matrix_target_RIGHT_correct_setsize,1);
        
        l=l+1;
        matRT_target_LEFT(1,l) = average_response_time_hit_setsize_LEFT;
        matRT_target_RIGHT(1,l) = average_response_time_hit_setsize_RIGHT;
    end
    
    setsize = task_setsize';
    matRT_target_LEFT = matRT_target_LEFT';
    matRT_target_RIGHT = matRT_target_RIGHT';
    
    mat_intercept_slope_target_LEFT=[ones(3,1) setsize]\matRT_target_LEFT;
    mat_intercept_slope_target_RIGHT=[ones(3,1) setsize]\matRT_target_RIGHT;
    
    slope_target_LEFT_string = int2str(floor(mat_intercept_slope_target_LEFT(2,1)));
    slope_target_RIGHT_string = int2str(floor(mat_intercept_slope_target_RIGHT(2,1)));

    Screen(win0,'TextSize',settings.LETTER_SIZE);
    Screen(win0,'TextFont',settings.LETTER_FONT);
    
    Text_0 = 'Please ask the experimenter for further instructions.';
    Text_1 = strcat('AVERAGE ACCURACY: ',global_accuracy_rate_string);
    
    Text_2 = strcat('Hit rate LEFT tilt: ',hit_rate_LEFT_string);
    Text_3 = strcat('RT LEFT tilt: ',average_response_time_hit_LEFT_string);
    Text_4 = strcat('Slope LEFT tilt: ',slope_target_LEFT_string);

    Text_5 = strcat('Hit rate RIGHT tilt: ',hit_rate_RIGHT_string);
    Text_6 = strcat('RT RIGHT tilt: ',average_response_time_hit_RIGHT_string);
    Text_7 = strcat('Slope RIGHT tilt: ',slope_target_RIGHT_string);

    
    Screen(win0,'DrawText',Text_0,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+2*settings.CM  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+4*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+5*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+6*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+8*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+9*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+10*settings.CM,settings.LETTER_COLOR);
       
    while 1
        if KbCheck == 1
            key = GetChar;
            if lower(key) == settings.NEXT_KEY_FOR_EXPERIMENTER
                break;
            end
        end
    end
    Screen('CopyWindow',winclear,win0);
    
elseif task == 2    
    matrix_current_part = matrix_tot(block_first_matrix_line:block_last_matrix_line, :);
    
    matrix_target_present = matrix_current_part(matrix_tot((block_first_matrix_line:block_last_matrix_line),column_target_presence) == 1, :);
    matrix_target_absent = matrix_current_part(matrix_tot((block_first_matrix_line:block_last_matrix_line),column_target_presence) == 0, :);
    
    matrix_target_present_correct = matrix_target_present(matrix_target_present(:,column_accuracy_identification) == 1, :);
    matrix_target_present_correct_LINES = matrix_target_present_correct(matrix_target_present_correct(:,column_target_case) == settings.CASE_LONG_LINE, :);
    matrix_target_present_correct_Ts = matrix_target_present_correct(matrix_target_present_correct(:,column_target_case) == settings.CASE_T, :);
    
    matrix_target_absent_correct = matrix_target_absent(matrix_target_absent(:,column_accuracy_detection) == 1, :);
    
    hit_rate_LINES = sum(matrix_target_present_correct_LINES(:,column_accuracy_identification),1) / (size(matrix_target_present,1)/2) * 100;
    hit_rate_Ts = sum(matrix_target_present_correct_Ts(:,column_accuracy_identification),1) / (size(matrix_target_present,1)/2) * 100;
    hit_rate_LINES_string = int2str(floor(hit_rate_LINES));
    hit_rate_Ts_string = int2str(floor(hit_rate_Ts));
    
    correct_rejection_rate = sum(matrix_target_absent(:,column_accuracy_detection),1)/size(matrix_target_absent,1)*100;
    correct_rejection_rate_string = int2str(floor(correct_rejection_rate));
    
    global_accuracy_rate = (correct_rejection_rate*2+hit_rate_LINES+hit_rate_Ts)/4;% A verifier
    global_accuracy_rate_string = int2str(floor(global_accuracy_rate));
    
    average_response_time_hit_LINES_string = int2str(floor((sum(matrix_target_present_correct_LINES(:,column_response_time),1))/size(matrix_target_present_correct_LINES,1)));
    average_response_time_hit_Ts_string = int2str(floor((sum(matrix_target_present_correct_Ts(:,column_response_time),1))/size(matrix_target_present_correct_Ts,1)));
    average_response_time_correct_rejection_string = int2str(floor((sum(matrix_target_absent_correct(:,column_response_time),1))/size(matrix_target_absent_correct,1)));
    
    l=0;
    matRT_target_present_LINES = ones(1,3);
    matRT_target_present_Ts = ones(1,3);
    matRT_target_absent = ones(1,3);
    
    for setsize = task_setsize
        matrix_target_present_correct_setsize_LINES = matrix_target_present_correct_LINES(matrix_target_present_correct_LINES(:,column_set_size) == setsize, :);
        matrix_target_present_correct_setsize_Ts = matrix_target_present_correct_Ts(matrix_target_present_correct_Ts(:,column_set_size) == setsize, :);
        matrix_target_absent_correct_setsize = matrix_target_absent_correct(matrix_target_absent_correct(:,column_set_size) == setsize, :);
        
        average_response_time_hit_setsize_LINES = (sum(matrix_target_present_correct_setsize_LINES(:,column_response_time),1))/size(matrix_target_present_correct_setsize_LINES,1);
        average_response_time_hit_setsize_Ts = (sum(matrix_target_present_correct_setsize_Ts(:,column_response_time),1))/size(matrix_target_present_correct_setsize_Ts,1);
        average_response_time_correctrejection_setsize = (sum(matrix_target_absent_correct_setsize(:,column_response_time),1))/size(matrix_target_absent_correct_setsize,1);
        
        l=l+1;
        matRT_target_present_LINES(1,l) = average_response_time_hit_setsize_LINES;
        matRT_target_present_Ts(1,l) = average_response_time_hit_setsize_Ts;
        matRT_target_absent(1,l) = average_response_time_correctrejection_setsize;
    end
    
    setsize = task_setsize';
    matRT_target_present_LINES = matRT_target_present_LINES';
    matRT_target_present_Ts = matRT_target_present_Ts';
    matRT_target_absent = matRT_target_absent';
    
    mat_intercept_slope_target_present_LINES=[ones(3,1) setsize]\matRT_target_present_LINES;
    mat_intercept_slope_target_present_Ts=[ones(3,1) setsize]\matRT_target_present_Ts;
    mat_intercept_slope_target_absent = [ones(3,1) setsize]\matRT_target_absent;
    
    slope_target_present_string_LINES = int2str(floor(mat_intercept_slope_target_present_LINES(2,1)));
    slope_target_present_string_Ts = int2str(floor(mat_intercept_slope_target_present_Ts(2,1)));
    slope_target_absent_string = int2str(floor(mat_intercept_slope_target_absent(2,1)));
    
    
    Screen(win0,'TextSize',settings.LETTER_SIZE);
    Screen(win0,'TextFont',settings.LETTER_FONT);
    
    Text_0 = 'Please ask the experimenter for further instructions.';
    Text_1 = strcat('AVERAGE ACCURACY: ',global_accuracy_rate_string);
    
    Text_2 = strcat('Hit rate search 1 (lines): ',hit_rate_LINES_string);
    Text_3 = strcat('RT search 1 (lines): ',average_response_time_hit_LINES_string);
    Text_4 = strcat('Slope search 1 (lines): ',slope_target_present_string_LINES);
    
    Text_5 = strcat('Hit rate search 2 (Ts): ',hit_rate_Ts_string);
    Text_6 = strcat('RT search 2 (Ts): ',average_response_time_hit_Ts_string);
    Text_7 = strcat('Slope search 2 (Ts): ',slope_target_present_string_Ts);
    
    Text_8 = strcat('Correct rejection rate: ',correct_rejection_rate_string);
    Text_9 = strcat('Average response time: ',average_response_time_correct_rejection_string);
    Text_10 = strcat('Slope target absent: ',slope_target_absent_string);
    
    Screen(win0,'DrawText',Text_0,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_1,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+2*settings.CM  ,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_2,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+4*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_3,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+5*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_4,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+6*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_5,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+8*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_6,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+9*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_7,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+10*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_8,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+12*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_9,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+13*settings.CM,settings.LETTER_COLOR);
    Screen(win0,'DrawText',Text_10,settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y+14*settings.CM,settings.LETTER_COLOR);
    
    while 1
        if KbCheck == 1
            key = GetChar;
            if lower(key) == settings.NEXT_KEY_FOR_EXPERIMENTER
                break;
            end
        end
    end
    Screen('CopyWindow',winclear,win0);
end