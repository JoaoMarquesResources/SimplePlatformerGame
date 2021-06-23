/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x, y, oWall)) instance_destroy();