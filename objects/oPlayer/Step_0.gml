/// @description Insert description here
// You can write your code in this editor

#region //Get Player Input
if (hascontrol)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
#endregion

#region //Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

canjump -= 1;
if (canjump > 0) && (key_jump)
{
	vsp = -7;
	canjump = 0;
	repeat(5)
	{
		with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
		{
			vsp = 0;
		}
	}
}

//Horizontal Collision
//Se o teu x + 4 pixeis estiver a tocar na parede
if (place_meeting(x+hsp,y,oWall))
{
	//Enquanto não esta a 1 pixel da parede
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		//Soma mais um para fazer com que a colisão seija mais certa
		x = x + sign(hsp);
	}
	//Certeficar que o player n passa a parede
	hsp = 0;
}

x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

#region//Animation
//Animações de quando esta a subir e a descer no salto
if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0; //Nao vai ter animação
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; //A sprite de subir e descer esta na mesma sprite, no frame 0 e 1
}else
{
	canjump = 10;
	if (sprite_index == sPlayerA) 
	{
		audio_sound_pitch(snLanding, choose(0.8, 1, 1.2));
		audio_play_sound(snLanding, 4, false);
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer; //Idle animation
	}else
	{
		sprite_index = sPlayerR; //Run animation
	}
	
}
#endregion
//show_debug_message(hsp)


//Flip player
if (hsp != 0) image_xscale = sign(hsp) * 2;
//show_debug_message(sign(hsp));

//show_debug_message(canjump)
#endregion