/// @description Insert description here
// You can write your code in this editor
vsp = vsp + grv;

//Dont walk off edges
if (grounded) && (afraidofheights) && (!place_meeting(x + hsp, y + 1, oWall)) //Se estivermos quase a walk off edges
{
	hsp = -hsp; //flip;
}

//Horizontal Cor4 pixeis estiver a tocar na parede
if (place_meeting(x+hsp,y,oWallEnemy))
{
	//Enquanto não esta a 1 pixel da parede
	while (!place_meeting(x+sign(hsp),y,oWallEnemy))
	{
		//Soma mais um para fazer com que a colisão seja mais certa
		x = x + sign(hsp);
	}
	//Flipar o player quando toca na parede
	if (x >= 2016) hsp = -hsp;
	
	hsp = -hsp;
}

x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWallEnemy))
{
	while (!place_meeting(x,y+sign(vsp),oWallEnemy))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
//Animações de quando esta a subir e a descer no salto
if (!place_meeting(x, y + 1, oWallEnemy))
{
	grounded = false;
	sprite_index = sEnemyA;
	image_speed = 0; //Nao vai ter animação
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; //A sprite de subir e descer esta na mesma sprite, no frame 0 e 1
}else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemy; //Idle animation
	}else
	{
		sprite_index = sEnemyR; //Run animation
	}
	
}

//show_debug_message(hsp)


//Flip Enemy
if (hsp != 0) image_xscale = sign(hsp) * (2 * size);
image_yscale = 2 * size;

//show_debug_message(hp);
//show_debug_message(image_index);