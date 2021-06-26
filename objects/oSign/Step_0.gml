/// @description Insert description here
// You can write your code in this editor
if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64)) && (!instance_exists(oText))
{
	nearby = true;
	if (keyboard_check_pressed(ord("W")))
	{
		with (instance_create_layer(x, y - 64, layer, oText))
		{
			text = other.text;
			lengh = string_length(text);
		}
	
		with (oCamera)
		{
			follow = other.id;
		}
	}
}else nearby = false;

if (nearby)
{
	if (!instance_exists(oMarker))
	instance_create_layer(x, y - 32, "Enteties", oMarker);
}else
{
	instance_destroy(oMarker);
}
