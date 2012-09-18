
function m = create_experiment(first_task_type)
if first_task_type == 1
    m1 = create_block(first_task_type,1,1);
    m2 = create_block(mod(2*first_task_type,3),2,1);
    m3 = create_block(mod(2*first_task_type,3),3,2);
    m = vertcat(m1,m2,m3);
end
if first_task_type == 2
    m1 = create_block(first_task_type,1,1);
    m2 = create_block(first_task_type,2,2);
    m3 = create_block(mod(2*first_task_type,3),3,1);
    m = vertcat(m1,m2,m3);
end
end
