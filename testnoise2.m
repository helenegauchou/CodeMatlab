global_settings;

win0 = Screen(0,'OpenWindow',settings.BACKGROUND_COLOR,settings.screenRect,settings.COLOR_DEPTH);
winnoise = Screen(win0,'OpenOffscreenWindow',settings.BLANK_SCREEN_COLOR,settings.screenRect,settings.COLOR_DEPTH);

load('matrix_noise')
SCREEN(winnoise,'PutImage',matrix_noise,[0 0 1280 800]) 
Screen('CopyWindow',winnoise,win0);
KbWait;
Screen('CloseAll')