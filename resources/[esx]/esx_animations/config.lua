Config = {}

Config.Animations = {

	{
		name  = 'festives',
		label = 'Festive',
		items = {
			{label = "Smoke a Cigarette", type = "scenario", data = {anim = "WORLD_HUMAN_SMOKING"}},
			{label = "Play Guitar", type = "scenario", data = {anim = "WORLD_HUMAN_MUSICIAN"}},
			{label = "Dj", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj"}},
			{label = "Drink a Beer", type = "scenario", data = {anim = "WORLD_HUMAN_DRINKING"}},
			{label = "Party", type = "scenario", data = {anim = "WORLD_HUMAN_PARTYING"}},
			{label = "Air Guitar", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar"}},
			{label = "Air Shagging", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging"}},
			{label = "Rock'n'roll", type = "anim", data = {lib = "mp_player_int_upperrock", anim = "mp_player_int_rock"}},
		 	{label = "Smoke a Joint", type = "scenario", data = {anim = "WORLD_HUMAN_SMOKING_POT"}},
			{label = "Drunk", type = "anim", data = {lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a"}},
			{label = "Puke", type = "anim", data = {lib = "oddjobs@taxi@tie", anim = "vomit_outside"}},
		}
	},

{
		name = 'dance',
		label = 'Dance',
		items = {
		{label = "Dance 1", type = "anim", data = {lib = "misschinese2_crystalmazemcs1_cs", anim = "dance_loop_tao"}},
		{label = "Dance 2", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_3@monologue_3a", anim = "mnt_dnc_buttwag"}},
		{label = "Dance 3", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_4@monologue_4a", anim = "mnt_dnc_verse"}},
		{label = "Dance 4", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_2@monologue_2a", anim = "mnt_dnc_angel"}},
		{label = "Dance 5", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_1@monologue_1a", anim = "mtn_dnc_if_you_want_to_get_to_heaven"}},
		{label = "Dance 6", type = "anim", data = {lib = "special_ped@mountain_dancer@base", anim = "base"}},
		{label = "Fidget Dance 1", type = "anim", data = {lib = "move_clown@p_m_two_idles@", anim = "fidget_short_dance"}},
		{label = "Fidget Dance 2", type = "anim", data = {lib = "move_clown@p_m_zero_idles@", anim = "fidget_short_dance"}},
		{label = "Freakout", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@freakout", anim = "freakout"}},
		{label = "Jazz Hands", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@jazz_hands", anim = "jazz_hands"}},

		}
	},

	{
		name  = 'greetings',
		label = 'Greetings',
		items = {
			{label = "Hello", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_hello"}},
			{label = "Shake Hand", type = "anim", data = {lib = "mp_common", anim = "givetake1_a"}},
			{label = "Shake Hand 2", type = "anim", data = {lib = "mp_ped_interaction", anim = "handshake_guy_a"}},
			{label = "Bandit Salute", type = "anim", data = {lib = "mp_ped_interaction", anim = "hugs_guy_a"}},
			{label = "Millitary Salute", type = "anim", data = {lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute"}},
		}
	},

	{
		name  = 'work',
		label = 'Work',
		items = {
			{label = "Suspect: Busted", type = "anim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
			{label = "Fishing", type = "scenario", data = {anim = "world_human_stand_fishing"}},
			{label = "Police : Investigate", type = "anim", data = {lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f"}},
			{label = "Police : Radio", type = "anim", data = {lib = "random@arrests", anim = "generic_radio_chatter"}},
			{label = "Police : Traffic", type = "scenario", data = {anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT"}},
			{label = "Police : Binoculars", type = "scenario", data = {anim = "WORLD_HUMAN_BINOCULARS"}},
			{label = "Gardening : Plant", type = "scenario", data = {anim = "world_human_gardener_plant"}},
			{label = "Mechanic : Fix Vehicle", type = "anim", data = {lib = "mini@repair", anim = "fixing_a_ped"}},
			{label = "Doctor : Observe", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_KNEEL"}},
			{label = "Taxi : Talk to Client", type = "anim", data = {lib = "oddjobs@taxi@driver", anim = "leanover_idle"}},
			{label = "Taxi : Give Bill", type = "anim", data = {lib = "oddjobs@taxi@cyi", anim = "std_hand_off_ps_passenger"}},
			{label = "Shopkeep : Give Bags", type = "anim", data = {lib = "mp_am_hold_up", anim = "purchase_beerbox_shopkeeper"}},
			{label = "Bartender : Serve a Shot", type = "anim", data = {lib = "mini@drinking", anim = "shots_barman_b"}},
			{label = "Journalist : Take a Photo", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
			{label = "General : Take Notes", type = "scenario", data = {anim = "WORLD_HUMAN_CLIPBOARD"}},
			{label = "General : Hammer", type = "scenario", data = {anim = "WORLD_HUMAN_HAMMERING"}},
			{label = "Homeless : Bum", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_FREEWAY"}},
			{label = "Homeless : Human Statue", type = "scenario", data = {anim = "WORLD_HUMAN_HUMAN_STATUE"}},
			{label = "Club: Bouncer", type = "anim", data = {lib = "mini@strip_club@idles@bouncer@base", anim = "base"}},
			
		}
	},

	{
		name  = 'humors',
		label = 'Moods',
		items = {
			{label = "Cheering", type = "scenario", data = {anim = "WORLD_HUMAN_CHEERING"}},
			{label = "Thanks", type = "anim", data = {lib = "mp_action", anim = "thanks_male_06"}},
			{label = "Point", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_point"}},
			{label = "Follow me", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_come_here_soft"}}, 
			{label = "Bring it on", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on"}},
			{label = "Me?", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_me"}},
			{label = "That's old news.", type = "anim", data = {lib = "anim@am_hold_up@male", anim = "shoplift_high"}},
			{label = "Tired", type = "scenario", data = {lib = "amb@world_human_jog_standing@male@idle_b", anim = "idle_d"}},
			{label = "I'm in shit", type = "scenario", data = {lib = "amb@world_human_bum_standing@depressed@idle_a", anim = "idle_a"}},
			{label = "Facepalm", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@face_palm", anim = "face_palm"}},
			{label = "Calm down", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_easy_now"}},
			{label = "What did I do?", type = "anim", data = {lib = "oddjobs@assassinate@multi@", anim = "react_big_variations_a"}},
			{label = "Scared", type = "anim", data = {lib = "amb@code_human_cower_stand@male@react_cowering", anim = "base_right"}},
			{label = "Fight ?", type = "anim", data = {lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e"}},
			{label = "That's not Possible !", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_damn"}},
			{label = "Kiss", type = "anim", data = {lib = "mp_ped_interaction", anim = "kisses_guy_a"}},
			{label = "Middle Finger", type = "anim", data = {lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter"}},
			{label = "You wanker!", type = "anim", data = {lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01"}},
			{label = "Bullet in the head", type = "anim", data = {lib = "mp_suicide", anim = "pistol"}},
		}
	},

	{
		name  = 'sports',
		label = 'Sports',
		items = {
			{label = "Flex", type = "anim", data = {lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base"}},
			{label = "Weights", type = "anim", data = {lib = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base"}},
			{label = "Pushups", type = "anim", data = {lib = "amb@world_human_push_ups@male@base", anim = "base"}},
			{label = "Situps", type = "anim", data = {lib = "amb@world_human_sit_ups@male@base", anim = "base"}},
			{label = "Yoga", type = "anim", data = {lib = "amb@world_human_yoga@male@base", anim = "base_a"}},
		}
	},

	{
		name  = 'misc',
		label = 'Misc',
		items = {
			{label = "Drink Coffee", type = "anim", data = {lib = "amb@world_human_aa_coffee@idle_a", anim = "idle_a"}},
			{label = "Sit", type = "anim", data = {lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle"}},
			{label = "Lean", type = "scenario", data = {anim = "world_human_leaning"}},
			{label = "Lay on back", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE_BACK"}},
			{label = "Lay on Stomach", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE"}},
			{label = "Clean something", type = "scenario", data = {anim = "world_human_maid_clean"}},
			{label = "Prepare Food", type = "scenario", data = {anim = "PROP_HUMAN_BBQ"}},
			{label = "Being searched", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female"}},
			{label = "Take a selfie", type = "scenario", data = {anim = "world_human_tourist_mobile"}},
			{label = "Listen in", type = "anim", data = {lib = "mini@safe_cracking", anim = "idle_base"}}, 
		}
	},

	{
		name  = 'attitudem',
		label = 'Walk Style',
		items = {
			{label = "Normal M", type = "attitude", data = {lib = "move_m@confident", anim = "move_m@confident"}},
			{label = "Normal F", type = "attitude", data = {lib = "move_f@heels@c", anim = "move_f@heels@c"}},
			{label = "Depressed", type = "attitude", data = {lib = "move_m@depressed@a", anim = "move_m@depressed@a"}},
			{label = "Depressed F", type = "attitude", data = {lib = "move_f@depressed@a", anim = "move_f@depressed@a"}},
			{label = "Business", type = "attitude", data = {lib = "move_m@business@a", anim = "move_m@business@a"}},
			{label = "Determined", type = "attitude", data = {lib = "move_m@brave@a", anim = "move_m@brave@a"}},
			{label = "Casual", type = "attitude", data = {lib = "move_m@casual@a", anim = "move_m@casual@a"}},
			{label = "Fat", type = "attitude", data = {lib = "move_m@fat@a", anim = "move_m@fat@a"}},
			{label = "Hipster", type = "attitude", data = {lib = "move_m@hipster@a", anim = "move_m@hipster@a"}},
			{label = "Blessed", type = "attitude", data = {lib = "move_m@injured", anim = "move_m@injured"}},
			{label = "Intimidating", type = "attitude", data = {lib = "move_m@hurry@a", anim = "move_m@hurry@a"}},
			{label = "Homeless", type = "attitude", data = {lib = "move_m@hobo@a", anim = "move_m@hobo@a"}},
			{label = "Sad", type = "attitude", data = {lib = "move_m@sad@a", anim = "move_m@sad@a"}},
			{label = "Muscle", type = "attitude", data = {lib = "move_m@muscle@a", anim = "move_m@muscle@a"}},
			{label = "Shocked", type = "attitude", data = {lib = "move_m@shocked@a", anim = "move_m@shocked@a"}},
			{label = "Sombre", type = "attitude", data = {lib = "move_m@shadyped@a", anim = "move_m@shadyped@a"}},
			{label = "Tired", type = "attitude", data = {lib = "move_m@buzzed", anim = "move_m@buzzed"}},
			{label = "In a Hurry", type = "attitude", data = {lib = "move_m@hurry_butch@a", anim = "move_m@hurry_butch@a"}},
			{label = "Proud", type = "attitude", data = {lib = "move_m@money", anim = "move_m@money"}},
			{label = "Little Sprint", type = "attitude", data = {lib = "move_m@quick", anim = "move_m@quick"}},
			{label = "Man Eater", type = "attitude", data = {lib = "move_f@maneater", anim = "move_f@maneater"}},
			{label = "Sassy", type = "attitude", data = {lib = "move_f@sassy", anim = "move_f@sassy"}},	
			{label = "Arrogant", type = "attitude", data = {lib = "move_f@arrogant@a", anim = "move_f@arrogant@a"}},
		}
	},
	{
		name  = 'porn',
		label = 'PEGI 21',
		items = {
			{label = "Grab Crotch", type = "anim", data = {lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch"}},
			{label = "Seductive", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_02"}},
			{label = "Michto Pose", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
			{label = "Show Off Chest", type = "anim", data = {lib = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b"}},
			{label = "Strip Tease 1", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
			{label = "Strip Tease 2", type = "anim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
			{label = "Stip Tease 3", type = "anim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
		}
	}
}