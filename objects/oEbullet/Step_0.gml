/// @description Insert description here
// You can write your code in this editor
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (place_meeting(x, y, oWall)) && (image_index != 0)
{
	while (place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	spd = 0;
	instance_change(oHitSpark, true);
}