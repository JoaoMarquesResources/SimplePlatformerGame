/// @description Auto Save
// You can write your code in this editor

//Overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create new Save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file, room);
file_text_write_real(file, global.kills);
file_text_close(file);