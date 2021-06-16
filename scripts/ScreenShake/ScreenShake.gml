// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(magnitude, frames){
	with (oCamera)
	{
		if (argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_lenght = argument1;
		}
	}
}