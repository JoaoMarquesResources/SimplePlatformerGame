/// @description Insert description here
// You can write your code in this editor
show_debug_message(image_angle);
show_debug_message(image_yscale);
show_debug_message(image_xscale);

image_yscale = yscale;

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1 * 2;//Flip the gun
}else
{
	image_yscale = 1 * 2;
}