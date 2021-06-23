/// @description Insert description here
// You can write your code in this editor
y += vsp;
x += hsp;

hsp *= 0.9;
vsp *= 0.9;

life_time += 1;

if (life_time >= 120)
{
	if (image_index = 11) image_speed = 0;
	if (life_time == 160) instance_destroy();
}