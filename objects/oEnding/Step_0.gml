/// @description Move Play towards center
// You can write your code in this editor
layer_x("TitleAssets", min(layer_get_x("TitleAssets") + 1, RES_W * 0.5 - 32));

//Progress Text
letters += spd;
text = string_copy(endtext[currentline], 1, floor(letters));

//Next Line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline + 1 == array_length_1d(endtext)) //Chegou ao fim
	{
		SlideTransition(TRANS_MODE.RESTART);
	}else
	{
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}
