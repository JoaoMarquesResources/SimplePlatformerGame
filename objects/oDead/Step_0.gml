/// @description Insert description here
// You can write your code in this editor
if (done == 0)
{
	vsp = vsp + grv;

	//Horizontal Collision
	//Se o teu x + 4 pixeis estiver a tocar na parede
	if (place_meeting(x+hsp,y,oWall))
	{
		//Enquanto não esta a 1 pixel da parede
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			//Soma mais um para fazer com que a colisão seija mais certa
			x = x + sign(hsp);
		}
		//Certeficar que o Enemy n passa a parede
		hsp = 0;
	}

	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		if (vsp > 0)
		{
			done = 1;
		}
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
}
if (image_index < 6)
{
	image_index += 0.4
}