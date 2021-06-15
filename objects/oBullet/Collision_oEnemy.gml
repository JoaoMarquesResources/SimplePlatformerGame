/// @description Insert description here
// You can write your code in this editor
with (other)
{
	//Este codigo vai ser aplicado do expecifico enemy que colidiu
	hp--;
	flash = 3;
	hitfrom = other.direction;//este other vai se referir à bullet por causa q esta dentro de um with
}

instance_destroy();