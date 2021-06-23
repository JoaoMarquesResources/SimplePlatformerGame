/// @description Create Wall
// You can write your code in this editor

mywall = instance_create_layer(x, y, layer, oWall);
with (mywall)
{
	//this other refers to the Crate because is a other inside of a with
	image_xscale = other.sprite_width / sprite_width;
	image_yscale = other.sprite_height / sprite_height;
}
