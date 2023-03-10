/* Plugin generated by AMXX-Studio */

#include <amxmodx>
#include <amxmisc>
#include <cstrike>

#define PLUGIN "Top Level"
#define VERSION "1.0"
#define AUTHOR "FoNiX.x.X Pr0"

#pragma compress 1 // Anti De-compiler

// Darori tkon 3andk native f level mod or change it as u like.
// You should create a native function in you level mod script.

native get_level(id)
native get_exp(id)
native get_exp2(id)

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_clcmd("say /toplevel" , "ShowToplevel" )
}
public ShowToplevel(id) 
{
	new menu = menu_create("\r[DG] \yPlayers Level:" , "HandlMenu");
	
	new name[ 32 ] , pid[32] , players[32] , text[555 char] , pnum , tempid;
	get_players(players , pnum , "c")
	
	for(new i; i< pnum; i++)
	{
		tempid = players[i];
		
		get_user_name(tempid ,name , charsmax(name));
		formatex(text , charsmax(text), "%s \r: \w[ \yLevel \w: \r%i \w| \yXP \y: \r%i\w/\r%i \w]", name, get_level(tempid),get_exp(tempid) , get_exp2(tempid) );
		num_to_str(get_user_userid(tempid), pid ,9);
		menu_additem(menu, text, pid , 0);
		
	}
	menu_display(id , menu)
	menu_setprop(menu, MPROP_EXIT, MEXIT_NEVER)
	return PLUGIN_CONTINUE;
}
public HandlMenu(id, menu, item )
{
    if( item == MENU_EXIT )
    {
        menu_destroy( menu );
        
        return PLUGIN_HANDLED;
    }
    
    menu_display( id, menu );  
    return PLUGIN_HANDLED;
}  
