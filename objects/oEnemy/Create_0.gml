/// @description Insert description here
// You can write your code in this editor
image_xscale = 2;
image_yscale = image_xscale;

if (hasweapon)
{
	mygun = instance_create_layer(x, y, "Egun", oEgun);
	with(mygun)
	{
		owner = other.id;//owner = este oEnemy instance id
	}
}else mygun = noone;