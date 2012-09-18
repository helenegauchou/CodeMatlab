function s = format_series_completion_task(matrix_series_row)
s = '';
for i = 1:4
    s = [s, num2str(matrix_series_row(1, i)), ' -> '];
end
s = [s, '?'];
end