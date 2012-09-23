function m = create_block(task,part,block)
global_settings;

if task == 1
    setsize_task = settings.SET_SIZE_task1;
    trial_number_per_block = settings.TRIAL_NUMBER_PER_BLOCK_task1;
    number_of_experimental_conditions = settings.NUMBER_OF_EXPERIMENTAL_CONDITIONS_task1;
    target_case_task = settings.TARGET_CASE_task1;
    first_VS_task_type = 99;
else
    setsize_task = settings.SET_SIZE_task2;
    trial_number_per_block = settings.TRIAL_NUMBER_PER_BLOCK_task2;
    number_of_experimental_conditions = settings.NUMBER_OF_EXPERIMENTAL_CONDITIONS_task2;
    target_case_task = settings.TARGET_CASE_task2;
    first_VS_task_type = settings.FIRST_VS_TASK_TYPE;
end

trial_number = 0;
for rep = 1:(trial_number_per_block /number_of_experimental_conditions)
    for target_case = target_case_task
        for setsize = setsize_task
            for first_VS_task = first_VS_task_type
            trial_number = trial_number + 1;
            if target_case < 2
                target_presence = 0; % 0 = no target
            else
                target_presence = 1; % 1 = target
            end
            
            matrix_block(trial_number,:) = [part,block,111,task,target_case,target_presence,setsize,first_VS_task];
            end
        end
    end
end

matrix_block = matrix_block(randperm(trial_number),:);

for trial = 1:trial_number
    matrix_block(trial,3) = trial;
    m = matrix_block;
end

end
