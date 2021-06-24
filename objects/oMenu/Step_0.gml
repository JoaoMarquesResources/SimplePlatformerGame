/// @description Control Menu
// You can write your code in this editor

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_widht + 300;
		menu_committed = menu_cursor;
		ScreenShake(3, 30);
		menu_control = false;
		audio_play_sound(snDeath, 10, false);
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if (mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_widht + 300;
			menu_committed = menu_cursor;
			ScreenShake(3, 30);
			menu_control = false;
			audio_play_sound(snDeath, 10, false);
		}
	}
}

if (menu_x > gui_widht + 150) && (menu_committed != -1) //Se a opção q selecionei foi para a esquerda e foi commited
{
	switch (menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
		case 1: 
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT);
			}else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		case 0: game_end(); break;
		
	}
}