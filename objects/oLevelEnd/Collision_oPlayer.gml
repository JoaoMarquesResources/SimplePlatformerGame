/// @description Move to the next room
// You can write your code in this editor
show_message("COLIDIUUUUUUUUUUUUUUUUUUUUUUUUUUU")
with (oPlayer)
{
	if (hascontrol)
	{
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
	}
}
