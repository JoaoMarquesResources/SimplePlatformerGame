/// @description Equip Gun
// You can write your code in this editor
global.hasgun = true;
instance_create_layer(oPlayer.x, oPlayer.y, "Gun", oGun);
instance_destroy();