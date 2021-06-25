/// @description Insert description here
// You can write your code in this editor

x = oPlayer.x + 12;
y = oPlayer.y + 15;

if (oPlayer.controller == 0)
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}
else
{
	var controllerh = gamepad_axis_value(0, gp_axisrh);
	var controllerv = gamepad_axis_value(0, gp_axisrv);
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerangel = point_direction(0, 0, controllerh, controllerv)
	}
	image_angle = controllerangel;
}

firingdelay = firingdelay - 1;

if ((mouse_check_button(mb_left)) || gamepad_button_check(0, gp_shoulderrb))&& (firingdelay < 0)
{
	recoil = 4;
	firingdelay = 5;
	ScreenShake(2, 10);
	audio_sound_pitch(snLanding, choose(0.8, 1, 1.2));
	audio_play_sound(snShoot, 5, false);
	with (instance_create_layer(x + lengthdir_x(15, point_direction(x, y, mouse_x, mouse_y)), y + lengthdir_y(15, point_direction(x, y, mouse_x, mouse_y)), "Bullets", oBullet))
	{
		spd = 25;
		direction = other.image_angle + random_range(-3, 3)
		image_angle = direction;
	}
	
	with (oPlayer)
	{
		gunKickx = lengthdir_x(1.5, other.image_angle - 180);
		gunKicky = lengthdir_y(1, other.image_angle - 180);
	}
}

recoil = max(0, recoil - 1);

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1 * 2;//Flip the gun
}else
{
	image_yscale = 1 * 2;
}