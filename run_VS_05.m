function run_VS_05

global win0 win1 win2 winclear winnoise
global response_detection response_identification accuracy_detection accuracy_identification valid_trial
global trial_duration response_time response_time_log
global total_number_of_cycle total_number_of_screen total_number_of_target_screen target_screen screen_number_when_keypress_happened
global excentricity quadrant
global DIPLAY_DURATION BLANK_DURATION matrix_tot

HideCursor;

matrix_settings;
global_settings;

win0 = Screen(0,'OpenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
win1 = Screen(win0,'OpenOffscreenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
win2 = Screen(win0,'OpenOffscreenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
winnoise = Screen(win0,'OpenOffscreenWindow',settings.BLANK_SCREEN_COLOR,settings.screenRect,settings.COLOR_DEPTH);
winclear = Screen(win0,'OpenOffscreenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);

Screen(win0,'TextSize',settings.LETTER_SIZE);
Screen(win0,'TextFont',settings.LETTER_FONT);

% QUESTIONS FOR EXPERIMENTER **********************************************
GetEchoString(win0,'FOR EXPERIMENTER ONLY - upper case check!',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);

% type of run
question_run_type = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Check (1) / Experiment (2)',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
run_type = str2num(question_run_type);

% PARTICIPANT'S INFORMATION ***********************************************
% Subject's ID
question_ID_subject = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Participant''s ID? (digits only)',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
ID_subject = str2num(question_ID_subject);

% Part number
Screen('CopyWindow',winclear,win0);
question_part_number = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Part? (1 to 3)',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
part_number = str2num(question_part_number);

% Diplays following questions only at the beginning of the part 1
if part_number == 1

    % Experimental group: 0 = control, no stress; 1 = test, stress
    Screen('CopyWindow',winclear,win0);
    question_condition = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Condition? [0/1]',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
    stress = str2num(question_condition);
    
    % Target key: L=left (Q); R=right (M)
    Screen('CopyWindow',winclear,win0);
    question_target_key = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Target key: Left [0] or Right [1]?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
    target_key_side = str2num(question_target_key);
    
    % Task type (for programing: if first_task_type values (1/2)modified, check create experiment file which uses the values!
    Screen('CopyWindow',winclear,win0);
    question_first_task_type = GetEchoString(win0,'FOR EXPERIMENTER ONLY - First task type: Identification [1] or Detection [2]?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
    first_task_type = str2num(question_first_task_type);
    
    % Diplays following questions only in CHECK mode
    if run_type == 1

        Screen('CopyWindow',winclear,win0);
        question_DIPLAY_DURATION = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Presentation time in seconds (display)?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        DIPLAY_DURATION = str2num(question_DIPLAY_DURATION);
        
        Screen('CopyWindow',winclear,win0);
        question_BLANK_DURATION = GetEchoString(win0,'FOR EXPERIMENTER ONLY - Presentation time in seconds (blank)?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        BLANK_DURATION = str2num(question_BLANK_DURATION);
    end
    
    % Diplays following questions only in NON CHECK mode
    if run_type == 2

        % Partcipant's age
        Screen('CopyWindow',winclear,win0);
        question_age = GetEchoString(win0,'FOR EXPERIMENTER ONLY - age?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        age = str2num(question_age);
        
        % Partcipant's gender
        Screen('CopyWindow',winclear,win0);
        question_gender = GetEchoString(win0,'FOR EXPERIMENTER ONLY - gender: female [F] or male [M]?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        if (question_gender == 'F')||(question_gender == 'f')
            gender = 0;
        end
        if (question_gender == 'M')||(question_gender == 'm')
            gender = 1;
        end
        
        % Partcipant's handedness
        Screen('CopyWindow',winclear,win0);
        question_handedness = GetEchoString(win0,'FOR EXPERIMENTER ONLY - left-handed [L], right handed [R] or ambidextrous [A]?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        if (question_handedness == 'L')||(question_handedness == 'l')
            handedness = 0;
        end
        if (question_handedness == 'R')||(question_handedness == 'r')
            handedness = 1;
        end
        if (question_handedness == 'A')||(question_handedness == 'a')
            handedness = 2;
        end
        
        % Partcipant's vision
        Screen('CopyWindow',winclear,win0);
        question_vision = GetEchoString(win0,'FOR EXPERIMENTER ONLY - corrective eyewear [0], glasses [1], or contacts [2]?',settings.LOCATION_TEXT_X,settings.LOCATION_TEXT_Y,settings.LETTER_COLOR_INSTRUCTIONS,settings.BACKGROUND_COLOR);
        vision = str2num(question_vision);
    else

        age = 100;
        gender = 100;
        handedness = 100;
        vision = 100;
    end
end
Screen('CopyWindow',winclear,win0);

% QUESTIONNAIRES PRE EXPERIMENT *******************************************
if run_type == 2

    if part_number == 1
        [sum_STAI,sum_PSS,sum_D,sum_E,sum_W] = run_Q_pre(ID_subject);
        Screen('CopyWindow',winclear,win0);
    end
else

    sum_STAI = 100;
    sum_PSS = 100;
    sum_D = 100;
    sum_E = 100;
    sum_W = 100;
end

% MATRIX ******************************************************************
if part_number == 1

    matrix_tot = ones((settings.TRIAL_NUMBER_PER_BLOCK_task1 * settings.NUMBER_OF_BLOCKS_PER_TASK_task1 + ...
        settings.TRIAL_NUMBER_PER_BLOCK_task2 * settings.NUMBER_OF_BLOCKS_PER_TASK_task2),...
        CONST_number_columns)* CONST_default_value; % Create the matrix for datas filled with default value
    
    matrix_tot(:,(column_part:column_first_VS_task_type)) = create_experiment(first_task_type);
    
    total_number_of_rows = length(matrix_tot);
    
    for row = 1:total_number_of_rows
        matrix_tot(row,column_ID_subject:column_stress) = [ID_subject,age,gender,handedness,vision,target_key_side,stress];
        matrix_tot(row,column_score_anxiety:column_score_acute_stress_pre_E) = [sum_STAI,sum_PSS,sum_W,sum_D,sum_E];
    end
else
    load(strcat('Matrix_Participant_',question_ID_subject));
end

% ONLY WHEN RUN MODE = EXPERIMENT *****************************************
stress = matrix_tot(1,column_stress);
if run_type == 2
    % experiment overview -------------------------------------------------
    if part_number == 1
        overview(stress);
    end
    
    % series completion task ----------------------------------------------
    series_completion_task(stress,part_number);
    
    % subtraction task ----------------------------------------------------
    substraction_task(stress,part_number);
end

% VISUAL SEARCH TASK ******************************************************
% TITLE screen
Screen('CopyWindow', winclear, win0);
Text1 = 'TASK 3: VISUAL SEARCH TASK';
Screen(win0,'DrawText',Text1,settings.LOCATION_TEXT_X+9*settings.CM,settings.LOCATION_TEXT_Y+3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
WaitSecs(2);
Screen('CopyWindow',winclear,win0);
WaitSecs(0.1);

% Task starts here
if part_number > 1
    first_task_type = matrix_tot(1,column_task);
end

if first_task_type == 1
    block_first_matrix_line = settings.BLOCK_FIRST_MATRIX_LINE_task1_first(part_number);
    block_last_matrix_line = settings.BLOCK_LAST_MATRIX_LINE_task1_first(part_number);
else
    block_first_matrix_line = settings.BLOCK_FIRST_MATRIX_LINE_task2_first(part_number);
    block_last_matrix_line = settings.BLOCK_LAST_MATRIX_LINE_task2_first(part_number);
end
task = matrix_tot(block_first_matrix_line,column_task);
target_key_side = matrix_tot(block_first_matrix_line,column_target_key_side);

% instructions
instruction(task,target_key_side);

% %training
% block_number =  matrix_tot(block_first_matrix_line,column_block);
% if block_number == 1
%     if task == 1
%         training_task1(task,target_key_side,stress);
%     elseif task == 2
%         training_task2(task,target_key_side,stress);
%     end
% end

% instructions reminder
readytostart;

% task
if task == 1
    trial_number_per_block = settings.TRIAL_NUMBER_PER_BLOCK_task1;
    task_setsize = settings.SET_SIZE_task1;
else

    trial_number_per_block = settings.TRIAL_NUMBER_PER_BLOCK_task2;
    task_setsize = settings.SET_SIZE_task2;
end

for x = 1:trial_number_per_block
    
    current_matrix_line = block_first_matrix_line - 1 + x;
    
    Exp(matrix_tot(current_matrix_line,column_task),...
        matrix_tot(current_matrix_line,column_target_case),...
        matrix_tot(current_matrix_line,column_target_presence),...
        matrix_tot(current_matrix_line,column_set_size),...
        matrix_tot(current_matrix_line,column_first_VS_task_type),...
        matrix_tot(current_matrix_line,column_target_key_side),...
        matrix_tot(current_matrix_line,column_stress));
    
    matrix_tot(current_matrix_line,column_response_detection:column_quadrant) = ...
        [response_detection,...
        response_identification,...
        accuracy_detection,...       
        accuracy_identification,...
        valid_trial,...
        trial_duration,...
        response_time,...
        response_time_log,...
        total_number_of_cycle,...
        total_number_of_screen,...
        total_number_of_target_screen,...
        target_screen,...
        screen_number_when_keypress_happened,...        
        excentricity,...
        quadrant];
end

Screen('CopyWindow',winclear,win0);

filename = (strcat('Matrix_ParticipantTEST_',question_ID_subject));
save(filename,'matrix_tot');

filename_csv = strcat( filename,'.csv');
csvwrite(filename_csv,matrix_tot)

% POST BLOCK FEEDBACK *****************************************************
final_feedback(task,block_first_matrix_line,block_last_matrix_line,task_setsize);


% QUESTIONNAIRE POST EXPERIMENT *******************************************
if part_number == 3
    if run_type == 2
        [sum_D,sum_E,sum_W] = run_Q_post(ID_subject);
    else
        sum_D = 100;
        sum_E = 100;
        sum_W = 100;
    end
    matrix_tot(:,column_score_acute_stress_post_W) = sum_W;
    matrix_tot(:,column_score_acute_stress_post_D) = sum_D;
    matrix_tot(:,column_score_acute_stress_post_E) = sum_E;
    
    Screen('CopyWindow',winclear,win0);
end

% END screen **************************************************************
Screen('CopyWindow', winclear, win0);
Text_end = ['END OF PART ',num2str(part_number)];
Screen(win0,'DrawText',Text_end,settings.LOCATION_TEXT_X+9*settings.CM,settings.LOCATION_TEXT_Y+3*settings.CM,settings.LETTER_COLOR_INSTRUCTIONS);
WaitSecs(2);

% SAVE data ***************************************************************
filename = (strcat('Matrix_Participant_',question_ID_subject));
save(filename,'matrix_tot');

filename_csv = strcat( filename,'.csv');
csvwrite(filename_csv,matrix_tot)

ShowCursor;

clear mex;