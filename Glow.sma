#include <amxmodx>
#include <amxmisc>
#include <cstrike>
#include <fun>
#include <nvault>
#include <fakemeta>
#include <hamsandwich>
#include <xs>

#pragma tabsize 0

new mg_Glow

public plugin_init() 
{
    register_plugin("Admin-Glow","2.3","FoNiX.x.X Pr0")
	
	RegisterHam( Ham_Spawn, "player", "g_Player_Spawn", 1 )
        
    mg_Glow = register_cvar( "amx_admin_glow", "1" )
}

public g_Player_Spawn(id)
{	
     if(is_user_alive(id))
     if(cs_get_user_team(id) == CS_TEAM_CT)   
     g_Glows(id)    
}

public g_Glows(id) 
{ 
      set_task(3.0, "g_Glows", id) 
	  
      if(!is_user_alive(id)) 
	  return;
	  
      if(cs_get_user_team(id) == CS_TEAM_CT &&get_user_flags(id) & ADMIN_LEVEL_A && get_pcvar_num(mg_Glow)) 
      { 
			set_user_rendering(id, kRenderFxGlowShell,  random_num(0,255),  random_num(0,255),  random_num(0,255), kRenderNormal, 16 ) 
      } 
}  
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ ansicpg1252\\ deff0{\\ fonttbl{\\ f0\\ fnil\\ fcharset0 Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang6145\\ f0\\ fs16 \n\\ par }
*/
