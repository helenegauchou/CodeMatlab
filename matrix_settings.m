
% Description of the matrix-tot's columns and associated constants when
% relevant:

CONST_default_value = 111;
CONST_number_columns = 31; %!!!!!!!!!!!!!!!!

column_ID_subject = 1;
column_age = 2;
column_gender = 3;      % 0 = female; 1 = male
column_handedness = 4;  % 0 = left; 1 = right; 2 = both
column_vision = 5;      % 0 = no eyewear; 1 = glasses; 2 = contact lens

column_target_key_side = 6; % 0:1 (0=left; 1=right)
column_stress = 7;          % 0:1 (0=no stress; 1= stress)

column_part = 8;            % 1:4
column_block = 9;           % 1:2
column_trial_number = 10;   % 1:120

column_task = 11;               % 1:2 (1 = 1 tilt side = left tilt only; 2 = 2 tilt sides = left and right tilts)
column_target_case = 12;        % 0:5 = no target/no target/long line/T/left tilt/right tilt 
column_target_presence = 13;    % 0:1 = absent/present
column_set_size = 14;           % task 1 = 3,7,11; task 2 = 7,11,16
column_first_VS_task_type = 15; % for task 2 only: 1 = feature search tasks first (lines); 2 = conjunction search

column_response_detection = 16;      % 0:1 = participant's detection answer: 0 = target; 1 = no target
column_response_identification = 17; % 0:2 = participant's identification answer: 0 = no target; 1 = target long line; 2 = target T 
column_accuracy_detection = 18;      % 0:1 = incorrect/correct detection; 99 for task 1 (identification only task)
column_accuracy_identification = 19; % 0:1 = incorrect/correct identification
column_response_time = 20;      % Reports the accuracy (0 = false; 1 = true)
column_response_time_log = 21;  % Reports the accuracy (0 = false; 1 = true)
column_excentricity = 22;       % Reports the response time (s)
column_quadrant = 23;           % Reports the response time (s)

column_score_anxiety = 24;  
column_score_chronic_stress = 25; 
column_score_acute_stress_pre_W = 26;
column_score_acute_stress_pre_D = 27;
column_score_acute_stress_pre_E = 28;
column_score_acute_stress_post_W = 29;
column_score_acute_stress_post_D = 30;
column_score_acute_stress_post_E = 31;



