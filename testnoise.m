
global_settings;

win0 = Screen(0,'OpenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
winnoise = Screen(win0,'OpenOffscreenWindow',settings.BLANK_SCREEN_COLOR,settings.screenRect,settings.COLOR_DEPTH);

    
%matrix_noise = ones(settings.SCREEN_X, settings.SCREEN_Y);
matrix_noise = ones(800,1280);

for x = 1:800%settings.SCREEN_X
    for y = 1:1280%settings.SCREEN_Y
        pix_rand = randperm(255);
        pixel_color = pix_rand(1);
            matrix_noise(x,y) = pixel_color;
    end
end
save('matrix_noise','matrix_noise');
%load('matrix_noise')
SCREEN(winnoise,'PutImage',matrix_noise,[0 0 1280 800]) 
Screen('CopyWindow',winnoise,win0);
KbWait;
Screen('CloseAll')