
global_settings;

win0 = Screen(0,'OpenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
winnoise = Screen(win0,'OpenOffscreenWindow',settings.BLANK_SCREEN_COLOR,settings.screenRect,settings.COLOR_DEPTH);

    
matrix_noise = ones(10, 10, 3);
%pixel_color = 0;
for x = 1:settings.SCREEN_X
    for y = 1:settings.SCREEN_Y
        pix_rand = randperm(255);
        pixel_color = pix_rand(1);
        for z = 1:3
            matrix_noise(x,y,z) = pixel_color;
        end
    end
end
SCREEN(winnoise,'PutImage',matrix_noise) 
Screen('CopyWindow',winnoise,win0);
while 1
    if KbCheck == 1
        break
    end
end
%KbWait;
close