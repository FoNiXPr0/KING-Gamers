#include <amxmodx>
#include <amxmisc>
#include <dhudmessage>

/*================================================================================
 [Defines]
=================================================================================*/

#define PLUGIN "Countdown"
#define VERSION "1.0"
#define AUTHOR "FoNiX.x.X Pr0"

/*================================================================================
 [Plugin init]
=================================================================================*/

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_event("HLTV", "event_round_start", "a", "1=0", "2=0") ;
}

/*================================================================================
 [Precaches]
=================================================================================*/

public plugin_precache()
{
	precache_sound("Countdown/05.wav");
	precache_sound("Countdown/04.wav");
	precache_sound("Countdown/03.wav");
	precache_sound("Countdown/02.wav");
	precache_sound("Countdown/01.wav");
	precache_sound("Countdown/timestart.wav");
}

/*================================================================================
 [Round start event]
=================================================================================*/

public event_round_start()
{
	set_task(0.1, "countdown");
}

/*================================================================================
 [Countdown]
=================================================================================*/

public countdown()
{
	set_task(2.0, "eight");
	set_task(3.0, "seven");
	set_task(4.0, "six");
	set_task(5.0, "five");
	set_task(6.0, "four");
	set_task(7.0, "three");
 	set_task(10.0, "timestart");
}


public eight()
{
	set_dhudmessage(0, 180, 255, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= 5 =-");
	client_cmd(0, "spk Countdown/05");
}

public seven()
{
	set_dhudmessage(0, 180, 255, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= 4 =-");
	client_cmd(0, "spk Countdown/04");
}

public six()
{
	set_dhudmessage(0, 180, 255, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= 3 =-");
	client_cmd(0, "spk Countdown/03");
}

public five()
{
	set_dhudmessage(0, 180, 255, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= 2 =-");
	client_cmd(0, "spk Countdown/02");
}

public four()
{
	set_dhudmessage(0, 180, 255, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= 1 =-");
	client_cmd(0, "spk Countdown/01");
}

public three()
{
	set_dhudmessage(255, 0, 0, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= DG Round Start =-");
	client_cmd(0, "spk Countdown/timestart");
}

public timestart()
{
	set_dhudmessage(255, 0, 0, -1.0, 0.28, 2, 0.02, 1.0, 0.01, 0.1, 10);
	show_dhudmessage(0, "-= GO GO GO  =-");
	client_cmd(0, "");
}

/*================================================================================
                                      END
=================================================================================*/


