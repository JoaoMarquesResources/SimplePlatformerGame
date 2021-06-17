/// @description Update Camera
// You can write your code in this editor

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//Keep camera center inside room
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

//Screen Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
// 6 - (1 / "TempoDuraScreenShake") * 6 = 6 | O  max entre 0 e 6 vai ser aplicado no screenshake, e em cada frame vai diminuir até chegar a 0 para parar o screen shake, por isso vai demorar 1 sec
shake_remain = max(0, shake_remain-((1/shake_lenght) * shake_magnitude));

//Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if (layer_exists("Mountains"))
{
	layer_x("Mountains", x / 2);
}

if (layer_exists("Trees"))
{
	layer_x("Trees", x / 4);
}

//show_debug_message(shake_lenght); //10		//10
//show_debug_message(shake_magnitude); //2		//2
//show_debug_message(shake_remain); //0			//2
//show_debug_message();
/*
1.80
1.60
1.40
1.20
1.00
0.80
0.60
0.40
0.20
0.00