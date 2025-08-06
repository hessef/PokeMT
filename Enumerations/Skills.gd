extends Node

#list of skills

##all skills in the game. Details for each skill are stored an sqlite database
enum skills {	
				#region SLASH SKILLS
				##start header for phys skills
				StartPhys,
				
				##start header for slash
				StartSlash,
				
				##slash, light65 damage, single target, 90% acc, 20% crit, 6% HP
				Cleave,
				
				##slash, medium90 damage, single target, 90% acc, 30% crit, 9% HP
				Giant_Slice,
				
				##slash, medium100 damage, single target, 85% acc, 20% crit, 10% HP
				Power_Slash,
				
				##slash, colossal360 damage, single target, 90% acc, 40% crit, 21% HP
				Sword_Dance,
				
				##slash, colossal600 damage, single target, 90% acc, 35% crit, 24% HP
				Brave_Blade,
				
				##slash, colossal800 damage, single target, 90% acc, 5% crit, 25% HP,
				##unique to Loki
				Laevateinn,
				
				##slash, light40 damage 2 times, single target, 90% acc, 5% crit, 10% HP
				Double_Fangs,
				
				##slash, medium90 damage 2-3 times, single target, 85% acc, 5% crit, 20% HP
				Myriad_Slashes,
				
				##slash, miniscule20 damage 3-5 times, single target, 85% acc, 5% crit, 17% HP
				Tempest_Slash,
				
				##slash, medium100 damage, single target, 90% acc, 5% crit, 8% HP,
				##medium35 chance to inflict fear
				Terror_Claw,
				
				##slash, heavy120 damage, single target, 90% acc, 3% crit, 12% HP,
				##medium35 chance to inflict despair
				Negative_Pile,
				
				##slash, severe300 damage, single target, 90% acc, 5% crit, 20% HP,
				##medium55 chance to inflict fear
				Death_Scythe,
				
				##slash, heavy140 damage, single target, 90% acc, 5% crit, 14% HP,
				##more 1.5x powerful after baton pass
				Rising_Slash,
				
				##slash, severe220 damage, single target, 90% acc, 5% crit, 18% HP,
				##1.5x powerful under baton pass
				Deadly_Fury,
				
				##slash, medium100 damage, single target, 85% acc, 35% crit, 10% HP,
				##1.5x more powerful when ambushed
				Cornered_Fang,
				
				##slash, heavy160 damage 2 times, single target, 99% acc, 20% crit, 20% HP,
				##unique to Izanagi
				Cross_Slash,

				##slash, light40 damage 8 times, multi target, 75% acc, 5% crit, 25% HP,
				##unique to Yoshitsune
				Hassou_Tobi,
				
				##slash, colossal1200 damage, single target, 90% acc, 22% crit, 20% HP,
				##inflicts attack down status (attack stats reduced to 10%) on user,
				##unique to Ariadne
				Beast_Weaver,
				
				##slash, medium100 damage 1-2 times, multi target, 80% acc, 5% crit, 22% HP
				Deathbound,
				
				##slash, medium110 damage, multi target, 80% acc, 5% crit, 19% HP,
				##low25 chance to inflict confuse
				Mind_Slice,
				
				##slash, heavy120 damage, multi target, 80% acc, 5% crit, 22% HP,
				##low25 chance to inflict fear
				Bloodbath,
				
				##slash, severe210 damage, multi target, 80% acc, 10% crit, 23% HP
				Vorpal_Blade,
				
				##end header for slash
				EndSlash,
				#endregion
				
				#region STRIKE SKILLS
				##start header for strike skills
				StartStrike,
				
				##strike, light60 damage, single target, 90% acc, 20% crit, 5% HP
				Lunge,
				
				##strike, light60 damage, single target, 90% acc, 20% crit, 5% HP
				Bash,
				
				##strike, heavy130 damage, single target, 90% acc, 20% crit, 13% HP
				Assault_Dive,
				
				##strike, severe300 damage, single target, 90% acc, 25% crit, 16% HP
				Megaton_Raid,
				
				##strike, colossal800 damage, single target, 90% acc, 15% crit, 25% HP
				Gods_Hand,
				
				##strike, light40 damage 1-3 times, single target, 90% acc, 10% crit, 10% HP
				Kill_Rush,
				
				##strike, medium100 damage 3 times, single target, 95% acc, 10% crit, 25% HP,
				##unique to Baal
				Ayamur,
				
				##strike, light30 damage 3-4 times, single target, 90% acc, 5% crit, 16% HP
				Gattling_Blows,
				
				##strike, medium80 damage, single target, 90% acc, 5% crit, 9% HP,
				##medium35 chance to inflict forget
				Headbutt,
				
				##strike, medium80 damage, single target, 90% acc, 5% crit, 9% HP,
				##medium35 chance to inflict rage
				Hysterical_Slap,
				
				##strike, medium80 damage, single target, 90% acc, 5% crit, 9% HP,
				##medium35 chance to inflict brainwash
				Brain_Shake,
				
				##strike, medium100 damage, single target, 90% acc, 5% crit, 9% HP,
				##medium35 chance to inflict dizzy
				Sledgehammer,
				
				##strike, medium100 damage, single target, 90% acc, 5% crit, 9% HP,
				##medium35 chance to inflict confuse
				Skull_Cracker,
				
				##strike, miniscule25 damage, single target, 75% acc, 50% crit, 3% HP
				Lucky_Punch,
				
				##strike, medium80 damage, single target, 75% acc, 55% crit, 8% HP
				Miracle_Punch,
				
				##strike, medium80 damage, multi target, 55% acc, 40% crit, 16% HP,
				##unige to Zorro
				Miracle_Rush,
				
				##strike, medium80 damage, multi target, 80% acc, 5% crit, 14% HP
				Vajra_Blast,
				
				##strike, medium110 damage, multi target, 80% acc, 5% crit, 18% HP
				Vicious_Strike,
				
				##strike, heavy150 damage, multi target, 80% acc, 5% crit, 20% HP
				Heat_Wave,
				
				##strike, colossal350 damage, multi target, 85% acc, 5% crit, 25% HP
				Gigantomachia,
				
				##strike, light30 damage 1-3 times, multi target, 70% acc, 10% crit, 13% HP
				Rampage,
				
				##strike, medium110 damage 1-3 times, multi target, 70% acc, 10% crit, 24% HP
				Agneyastra,
				
				##strike, miniscule20 damage 3-4 times, multi target, 70% acc, 10% crit, 17% HP
				Swift_Strike,
				
				##strike, low70 damage, multi target, 80% acc, 5% crit, 15% HP,
				##low25 chance to inflict forget
				Memory_Blow,
				
				##strike, medium damage, multi target, 80% acc, 5% crit, 16% HP,
				##low25 chance to inflict sleep
				Dormin_Rush,
				
				##strike, medium80 damage, multi target, 80% acc, 5% crit, 16% HP,
				##low25 chance to inflict rage
				Oni_Kagura,
				
				##strike, medium100 damage, multi target, 80% acc, 5% crit, 19% HP,
				##low25 chance to inflict dizzy
				Flash_Bomb,
				
				##strike, medium110 damage, multi target, 80% acc, 5% crit, 21% HP,
				##low25 chance to inflict despair
				Bad_Beat,
				
				##strike, heavy120 damage, multi target, 80% acc, 5% crit, 22% HP,
				##low25 chance to inflict brainwash
				Brain_Buster,
				
				##strike, light60 damage, single target, 95% acc, 5% crit, 7% HP,
				##priority +1
				Quick_Attack,
				
				##strike, light60 damage, single target, 90% acc, 20% crit, 8% HP,
				##priority +1
				Sonic_Punch,
				
				##strike, heavy300 damage 1-2 times, 80% acc, 30% crit, 20% HP,
				##unique to Athena
				Akashic_Arts,
				
				##end header for strike skills
				EndStrike,
				#endregion
				
				#region GUN SKILLS
				##start header for gun skills
				StartGun,
				
				##gun, medium80 damage, single target, 90% acc, 20% crit, 9% HP
				Snap,
				
				##gun severe210 damage, single target, 90% acc, 40% crit, 17% HP
				One_shot_Kill,
				
				##gun, light70 damage, single target, 90% acc, 5% crit, 8% HP,
				##medium35 chance to inflict sleep
				Dream_Needle,
				
				##gun, light50 damage 2 times, 90% acc, 5% crit, 12% HP
				Double_Shot,
				
				##gun, light30 damage 3 times, multi target, 70% acc, 5% crit, 16% HP
				Triple_Down,
				
				##gun, severe300 damage, multi target, 80% acc, 10% crit, 24% HP
				Riot_Gun,
				
				##end header for gun skills
				EndGun,
				
				##end header for physical skills
				EndPhys,
				#endregion
				
				#region FIRE SKILLS
				##start header for magic attacks
				StartMagic,
				
				##start header for fire skills
				StartFire,
				
				##fire, light40 damage, single target, 99% acc, 4 SP,
				##low25 chance to inflict burn
				Agi,
				
				##fire, medium100 damage, single target, 99% acc, 8 SP,
				##low25 chance to inflict burn
				Agilao,
				
				##fire, heavy160 damage, single target, 99% acc, 12 SP,
				##low25 chance to inflict burn
				Agidyne,
				
				##fire, severe200 damage, single target, 98% acc, 48 SP,
				##low26 chance to inflict burn
				Inferno,
				
				##fire, medium100 damage, single target, 98% acc, 10% HP,
				##low25 chance to inflict burn,
				##scales on strength
				Fire_Dracostrike,
				
				##fire, light40 damage, multi target, 95% acc, 10 SP,
				##low20 chance to inflict burn
				Maragi,
				
				##fire, medium100 damage, multi target, 95% acc, 16 SP,
				##low20 chance to inflict burn
				Maragion,
				
				##fire, heavy160 damage, multi target, 95% acc, 22 SP,
				##low20 chance to inflict burn
				Maragidyne,
				
				##fire, severe180 damage, multi target, 95% acc, 54 SP,
				##low24 chance to inflict burn
				Blazing_Hell,
				
				##fire, heavy160 damage, multi target, 98% acc, 18% HP,
				##low24 chance to inflict burn,
				##scales on strength
				Hell_Burner,
				
				##fire, severe210 damage, multi target, 90% acc, 21% HP,
				##high70 chance to inflict fear,
				##scales on strength,
				##unique to Asterius
				Titanomachia,
				
				##end header for fire skills
				EndFire,
				#endregion
				
				#region ICE SKILLS
				##start header for ice skills
				StartIce,
				
				##ice, light40 damage, single target, 99% acc, 4 SP,
				##low25 chance to inflict ailment, 50/50 frostbite or freeze
				Bufu,
				
				##ice, medium100 damage, single target, 99% acc, 8 SP,
				##low25 chance to inflict ailment, 50/50 frostbite or freeze
				Bufula,
				
				##ice, heavy160 damage, single target, 99% acc, 12 SP,
				##low25 chance to inflict ailment, 50/50 frostbite or freeze
				Bufudyne,
				
				##ice, severe200 damage, single target, 98% acc, 48 SP,
				##low26 chance to inflict ailment, 50/50 frostbite or freeze
				Diamond_Dust,
				
				##ice, medium100 damage, single target, 98% acc, 10% HP,
				##low25 chance to inflict ailment, 50/50 frostbite or freeze,
				##scales on strength
				Ice_Dracostrike,
				
				##ice, light40 damage, multi target, 95% acc, 10 SP,
				##low20 chance to inflict ailment, 50/50 frostbite or freeze
				Mabufu,
				
				##ice, medium100 damage, multi target, 95% acc, 16 SP,
				##low20 chance to inflict ailment, 50/50 frostbite or freeze
				Mabufula,
				
				##ice, heavy160 damage, multi target, 95% acc, 22 SP,
				##low20 chance to inflict ailment, 50/50 frostbite or freeze
				Mabufudyne,
				
				##ice, severe180 damage, multi target, 95% acc, 54 SP,
				##low26 chance to inflict ailment, 50/50 frostbite or freeze
				Ice_Age,
				
				##end header for ice skills
				EndIce,
				#endregion
				
				#region ELEC SKILlS
				##start header for elec skills
				StartElec,
				
				##elec, light40 damage, single target, 99% acc, 4 SP,
				##25 chance to inflict paralysis
				Zio,
				
				##elec, medium100 damage, single target, 99% acc, 8 SP,
				##low25 chance to inflict paralysis
				Zionga,
				
				##elec, heavy160 damage, single target, 99% acc, 12 SP,
				##low25 chance to inflict paralysis
				Ziodyne,
				
				##elec, severe200 damage, single target, 98% acc, 48 SP
				##low26 chance to inflict paralysis
				Thunder_Reign,
				
				##elec, medium100 damage, single target, 98% acc, 10% HP,
				##low25 chance to inflict paralysis,
				##scales on strength
				Storm_Dracostrike,
				
				##elec, light40 damage, multi target, 95% acc, 10 SP,
				##low20 chance to inflict paralysis
				Mazio,
				
				##elec, medium100 damage, multi target, 99% acc, 16 SP,
				##low20 chance to inflict paralysis
				Mazionga,
				
				##elec, heavy160 damage, multi target, 99% acc, 22 SP,
				##low20 chance to inflict paralysis
				Maziodyne,
				
				##elec, severe180 damage, multi target, 95% acc, 54 SP
				##low24 chance to inflict paralysis
				Wild_Thunder,
				
				##end header for elec skills
				EndElec,
				#endregion
				
				#region WIND SKILLS
				##start header for wind skills
				StartWind,
				
				##wind, light40 damage, single target, 99% acc, 3 SP
				Garu,
				
				##wind, medium100 damage, single target, 99% acc, 6 SP
				Garula,
				
				##wind, heavy160 damage, single target, 99% acc, 10 SP
				Garudyne,
				
				##wind, severe200 damage, single target, 98% acc, 42 SP
				Panta_Rhei,
				
				##wind, medium100 damage, single target, 98% acc, 10% HP
				##scales on strength
				Wind_Dracostrike,
				
				##wind, light40 damage, multi target, 95% acc, 3 SP
				Magaru,
				
				##wind, medium100 damage, multi target, 95% acc, 6 SP
				Magarula,
				
				##wind, heavy160 damage, multi target, 95% acc, 10 SP
				Magarudyne,
				
				##wind, severe200 damage, multi target, 95% acc, 42 SP
				Vacuum_Wave,
				
				##end header for wind skills
				EndWind,
				#endregion
				
				#region PSY SKILLS
				##start header for psy skills
				StartPsy,
				
				##psy, light40 damage, single target, 99% acc, 4 SP
				Psi,
				
				##psy, medium100 damage, single target, 99% acc, 8 SP
				Psio,
				
				##psy, heavy160 damage, single target, 99% acc, 12 SP
				Psiodyne,
				
				##psy, severe200 damage, single target, 99% acc, 48 SP
				Psycho_Force,
				
				##psy, light40 damage, multi target, 95% acc, 10 SP
				Mapsi,
				
				##psy, medium100 damage, multi target, 95% acc, 16 SP
				Mapsio,
				
				##psy, heavy160 damage, multi target, 95% acc, 22 SP
				Mapsiodyne,
				
				##psy, severe180 damage, multi target, 95% acc, 54 SP
				Psycho_Blast,
				
				##end header for psy skills
				EndPsy,
				#endregion
				
				#region NUKE SKILLS
				##start header for nuke skills
				StartNuke,
				
				##nuke, light40 damage, single target, 99% acc, 4 Sp
				Frei,
				
				##nuke, medium100 damage, single target, 99% acc, 8 Sp
				Freila,
				
				##nuke, heavy160 damage, single target, 99% acc, 12 SP
				Freidyne,
				
				##nuke severe200 damage, single target, 98% acc, 48 SP
				Atomic_Flare,
				
				##nuke, light40 damage, multi target, 95% acc, 10 Sp
				Mafrei,
				
				##nuke, medium100 damage, multi target, 95% acc, 16 Sp
				Mafreila,
				
				##nuke, heavy160 damage, multi target, 95% acc, 22 SP
				Mafreidyne,
				
				##nuke severe180 damage, multi target, 95% acc, 54 SP
				Cosmic_Flare,
				
				##end header for nuke skills
				EndNuke,
				#endregion
				
				#region BLESS SKILLS
				##start header for bless skills
				StartBless,
				
				##bless, light50 damage, single target, 99% acc, 4 SP
				Kouha,
				
				##bless, heavy120 damage, single target, 99% acc, 8 SP
				Kouga,
				
				##bless, severe190 damage, single target, 99% acc, 12 SP
				Kougaon,
				
				##bless, light50 damage, multi target, 95% acc, 10 SP
				Makouha,
				
				##bless, heavy120 damage, multi target, 95% acc, 16 SP
				Makouga,
				
				##bless, severe190 damage, multi target, 95% acc, 22 SP
				Makougaon,
				
				##bless, halves target's remaining HP, single target, 100% acc, 48 SP
				Divine_Judgement,
				
				##bless, instakill, single target, low25 chance, 8 SP
				Hama,
				
				##bless, instakill, single target, high60 chance, 15 SP
				Hamaon,
				
				##bless, instakill, multi target, low30 chance, 18 SP
				Mahama,
				
				##bless, instakill, multi target, high60 chance, 34 SP
				Mahamaon,
				
				##bless, instakill, multi target, high70 chance, 44 SP,
				##unique to daisoujou
				Samsara,
				
				##bless, miniscule15 damage 4-8 times, multi target, 90% acc, 22 SP,
				##unique to Kaguya
				Shining_Arrows,
				
				##end header for bless skills
				EndBless,
				#endregion
				
				#region CURSE SKILLS
				##start header for curse skills
				StartCurse,
				
				##curse, light50 damage, single target, 99% acc, 4 SP
				Eiha,
				
				##curse, heavy120 damage, single target, 99% acc, 8 SP
				Eiga,
				
				##curse, severe190 damage, single target, 99% acc, 12 SP
				Eigaon,
				
				##curse, light50 damage, multi target, 95% acc, 10 SP
				Maeiha,
				
				##curse, heavy120 damage, multi target, 95% acc, 16 SP
				Maeiga,
				
				##curse, severe190 damage, multi target, 95% acc, 22 SP
				Maeigaon,
				
				##curse, halve remaining HP of target, single target, 100% acc, 48 SP
				Demonic_Decree,
				
				##curse, instakill, single target, low25 chance, 8 SP
				Mudo,
				
				##curse, instakill, single target, high60 chance, 15 SP
				Mudoon,
				
				##curse, instakill, multi target, low30 chance, 18 SP
				Mamudo,
				
				##curse, instakill, multi target, high60 chance, 34 SP
				Mamudoon,
				
				##curse, instakill, multi target, high70 chance, 44 SP,
				##unique to Alice
				Die_For_Me,
				
				##curse, heavy160 damage, multi target, 90% acc, 30 SP,
				##unique to Magatsu-Izanagi
				Magatsu_Mandala,
				
				##curse, severe210 damage, multi target, 90% acc, 30 SP,
				##unique to Tsukiyomi
				Abyssal_Wing,
				
				##end header for curse skills
				EndCurse,
				#endregion
				
				#region ALMIGHTY SKILLS
				##start header for almighty skills
				StartAlmighty,
				
				##almighty, heavy120 damage, multi target, 95% acc, 15 SP
				Megido,
				
				##almighty, severe180 damage, multi target, 95% acc, 24 SP
				Megidola,
				
				##almighty, severe210 damage, multi target, 95% acc, 38 SP
				Megidolaon,
				
				##almighty, drain 30 HP, single target, 100% acc, 3 SP
				Life_Drain,
				
				##almighty, drain 30 SP, single target, 100% acc, 3 SP
				Spirit_Drain,
				
				##almighty, increase ailment susceptibility, single target, 100% acc, 8 SP
				Foul_Breath,
				
				##almighty, increase ailment susceptibility, all foes and allies, 100% acc, 5 SP
				Stagnant_Air,
				
				##almighty, kills all enemies inflicted with fear, multi target, 100% acc, 28 SP
				Ghastly_Wail,
				
				##almighty, severe230 damage, single target, 98% acc, 48 SP
				Black_Viper,
				
				##almighty, severe230 damage, multi target, 95% acc, 52 SP,
				##unique to Lucifer
				Morning_Star,
				
				##almighty, heavy160 damage and 60% chance to instakill, multi target, 90% acc, 32 SP,
				##unique to Thanatos
				Door_of_Hades,
				
				##almighty, colossal900 damage, down bonus set to 2.5x, strength-based, single target,
				##90% acc, 26% HP, unique to Loki
				Rebellion_Blade,
				
				##almighty, severe220 damage, multi target, 95% acc, 50 SP,
				##unique to Hastur
				Abyssal_Eye,
				
				##almighty, heavy120 damage 3 times, multi target, 95% acc, 40 SP,
				##unique to Izanagi-no-Okami
				Myriad_Truths,
				
				##end header for almighty skills
				EndAlmighty,
				
				##end header for magic attacks
				EndMagic,
				#endregion
				
				#region AILMENT SKILLS
				##start header for ailment skills
				StartAilment,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict dizzy
				Dazzler,
				
				##ailment, multi target, 12 SP,
				##medium50 chance to inflict dizzy
				Nocturnal_Flash,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict forget
				Makajam,
				
				##ailment, single target, 12 SP,
				##medium4 chance to inflict forget
				Makajamaon,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict sleep
				Dormina,
				
				##ailment, single target, 12 SP,
				##medium50 chance to inflict sleep
				Lullaby,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict confuse
				Pulinpa,
				
				##ailment, single target, 12 SP,
				##medium4 chance to inflict confuse
				Tentarafoo,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict fear
				Evil_Touch,
				
				##ailment, single target, 12 SP,
				##medium4 chance to inflict fear
				Evil_Smile,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict despair
				Ominous_Words,
				
				##ailment, single target, 12 SP,
				##medium50 chance to inflict despair
				Abysmal_Surge,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict rage
				Taunt,
				
				##ailment, single target, 12 SP,
				##medium50 chance to inflict rage
				Wage_War,
				
				##ailment, single target, 5 SP,
				##high70 chance to inflict brainwash
				Marin_Karin,
				
				##ailment, single target, 12 SP,
				##medium50 chance to inflict brainwash
				Brain_Jack,
				
				##ailment, multi target, 4 SP,
				##high90 chance to inflict sleep
				##unique to Raoul
				Phantom_Show,
				
				##end header for ailment skills
				EndAilment,
				#endregion
				
				#region HEALING SKILLS
				##start header for healing skills
				StartRecovery,
				
				##healing, slight restore, single target, 3 SP
				Dia,
				
				##healing, moderate restore, single target, 6 SP
				Diarama,
				
				##healing, restore all HP, single target, 18 SP
				Diarahan,
				
				##healing, slight restore, multi target, 7 SP
				Media,
				
				##healing, moderate restore, multi target, 12 SP
				Mediarama,
				
				##healing, restore all HP, multi target, 30 SP
				Mediarahan,
				
				##healing, cure Burn/Paralysis/Frostbite/Freeze,
				##single target, 4 SP
				Baisudi,
				
				##healing, cure Burn/Paralysis/Frostbite/Freeze,
				##multi target, 8 SP
				Mabaisudi,
				
				##healing, cure Dizzy/Forget/Sleep/Hunger,
				##single target, 4 SP
				Patra,
				
				##healing, cure Dizzy/Forget/Sleep/Hunger,
				##multi target, 8 SP
				Me_Patra,
				
				##healing, cure Confuse/Fear/Despair/Rage/Brainwash,
				##single target, 4 SP
				Energy_Drop,
				
				##healing, cure Confuse/Fear/Despair/Rage/Brainwash,
				##multi target, 8 SP
				Energy_Shower,
				
				##healing, cure all ailments, single target, 6 SP
				Amrita_Drop,
				
				##healing, cure all ailments, multi target, 12 SP
				Amrita_Shower,
				
				##healing, restore all HP and cure all ailments,
				##multi target, 48 SP
				Salvation,
				
				##healing, restore 50% HP and evasion +1,
				##multi target, 24 SP,
				##unique to Orpheus
				Cadenza,
				
				##healing, restore all HP and negate all debuffs,
				##multi target, 38 SP,
				##unique to Messiah
				Oratorio,
				
				##end header for healing skills
				EndRecovery,
				#endregion
				
				#region BUFF SKILLS
				##start header for support skills
				StartSupport,
				
				##start header for buffs
				StartBuff,
				
				##buff, attack stats + 1, single target, 8 SP
				Tarukaja,
				
				##buff, defense stats +1, single target, 8 SP
				Rakukaja,
				
				##buff, accuracy and evasion +1, single target, 8 SP
				Sukukaja,
				
				##buff, attack stats/defense stats/accuracy and evasion +1, 
				##single target, 30 SP
				Heat_Riser,
				
				##buff, attack stats + 1, multi target, 24 SP
				Matarukaja,
				
				##buff, defense stats +1, multi target, 24 SP
				Marakukaja,
				
				##buff, accuracy and evasion +1, multi target, 24 SP
				Masukukaja,
				
				##buff, attack stats/defense stats/accuracy and evasion +1, 
				##only usable when ambushed, multi target, 30 SP
				Thermopylae,
				
				##buff, increase crit rate by 50% for 3 turns,
				##single target, 5 SP
				Rebellion,
				
				##buff, increase crit rate by 50% for 3 turns,
				##all allies and enemies, 5 SP
				Revolution,
				
				##buff, next strength based attack does 2.5x damage,
				##self target, 15 SP
				Charge,
				
				##buff, next magic based attack does 2.5x damage,
				##self target, 15 SP
				Concentrate,
				
				##end header for buffs
				EndBuff,
				#endregion
				
				#region DEBUFF SKILLS
				##start header for debuffs
				StartDebuff,
				
				##debuff, attack stats -1, single target, 8 SP
				Tarunda,
				
				##debuff, defense stats -1, single target, 8 SP
				Rakunda,
				
				##debuff, accuracy and evasion -1, single target, 8 SP
				Sukunda,
				
				##buff, attack stats/defense stats/accuracy and evasion -1, 
				##single target, 30 SP
				Debilitate,
				
				##debuff, attack stats -1, multi target, 24 SP
				Matarunda,
				
				##debuff, defense stats -1, multi target, 24 SP
				Marakunda,
				
				##debuff, accuracy and evasion -1, multi target, 24 SP
				Masukunda,
				
				##end header for debuffs
				EndDebuff,
				#endregion
				
				#region SHIELD SKILLS
				##start header for shield skills
				StartShield,
				
				##support, apply resistance to fire for 3 turns, single target, 18 SP
				Fire_Wall,
				
				##support, apply resistance to ice for 3 turns, single target, 18 SP
				Ice_Wall,
				
				##support, apply resistance to elec for 3 turns, single target, 18 SP
				Elec_Wall,
				
				##support, apply resistance to wind for 3 turns, single target, 18 SP
				Wind_Wall,
				
				##support, apply resistance to psy for 3 turns, single target, 18 SP
				Psy_Wall,
				
				##support, apply resistance to nuke for 3 turns, single target, 18 SP
				Nuke_Wall,
				
				##support, nullify 1 instakill attack, multi target, 24 SP
				Tetraja,
				
				##support, repel 1 strength based attack, single target, 36 SP
				Tetrakarn,
				
				##support, repel 1 magic based attack, single target, 36 SP
				Makarakarn,
				
				##support, negate all effects of incoming attacks until next action, 36 SP,
				##priority +4
				Protect,
				
				##end header for shield skills
				EndShield,
				#endregion
				
				#region NEGATION SKILLS
				##start header for negation skills
				StartNegate,
				
				##support, negate all buff effects, multi target, 10 SP
				Dekaja,
				
				##support, negate all debuff effects, multi target, 10 SP
				Dekunda,
				
				##support, suppress resistance to fire for 3 turns, single target, 15 SP
				Fire_Break,
				
				##support, suppress resistance to ice for 3 turns, single target, 15 SP
				Ice_Break,
				
				##support, suppress resistance to elec for 3 turns, single target, 15 SP
				Elec_Break,
				
				##support, suppress resistance to wind for 3 turns, single target, 15 SP
				Wind_Break,
				
				##support, suppress resistance to psy for 3 turns, single target, 15 SP
				Psy_Break,
				
				##support, suppress resistance to nuke for 3 turns, single target, 15 SP
				Nuke_Break,
				
				##support, remove physical repellent shield, single target, 18 SP
				Tetra_Break,
				
				##support, remove magic repellent shield, single target, 18 SP
				Makara_Break,
				
				##end header for negation skills
				EndNegate,
				#endregion
				
				#region UTILITY SKILLS
				##start header for utility skills
				StartUtility,
				
				##utility, boost damage of next attack by 50%, single target, 8 SP,
				##priority +5
				Helping_Hand,
				
				##end header for utility skills
				EndUtility,
				
				##end header for support skills
				EndSupport,
				#endregion
				
				#region COUNTER SKILLS
				##start header for passives
				StartPassive,
				
				##start header for counter skills
				StartCounter,
				
				##passive, 10% chance to reflect strength based attack attacks
				##cannot stack with other counter skills
				Counter,
				
				##passive, 15% chance to reflect strength based attack attacks
				##cannot stack with other counter skills
				Counterstrike,
				
				##passive, 20% chance to reflect strength based attack attacks
				##cannot stack with other counter skills
				High_Counter,
				
				##end header for counter skills
				EndCounter,
				#endregion
				
				#region OFFENSIVE PASSIVE SKILLS
				##start header for offensive passives
				StartOffense,
				
				##passive, strengthen fire skills by 25%
				##can stack multiplicatively
				Fire_Boost,
				
				##passive, strengthen ice skills by 25%
				##can stack multiplicatively
				Ice_Boost,
				
				##passive, strengthen elec skills by 25%
				##can stack multiplicatively
				Elec_Boost,
				
				##passive, strengthen wind skills by 25%
				##can stack multiplicatively
				Wind_Boost,
				
				##passive, strengthen psy skills by 25%
				##can stack multiplicatively
				Psy_Boost,
				
				##passive, strengthen nuke skills by 25%
				##can stack multiplicatively
				Nuke_Boost,
				
				##passive, strengthen bless skills by 25%
				##can stack multiplicatively
				Bless_Boost,
				
				##passive, strengthen curse skills by 25%
				##can stack multiplicatively
				Curse_Boost,
				
				##passive, strengthen almighty skills by 25%
				##can stack multiplicatively
				Almighty_Boost,
				
				##passive, strengthen fire skills by 50%
				##can stack multiplicatively
				Fire_Amp,
				
				##passive, strengthen ice skills by 50%
				##can stack multiplicatively
				Ice_Amp,
				
				##passive, strengthen elec skills by 50%
				##can stack multiplicatively
				Elec_Amp,
				
				##passive, strengthen wind skills by 50%
				##can stack multiplicatively
				Wind_Amp,
				
				##passive, strengthen psy skills by 50%
				##can stack multiplicatively
				Psy_Amp,
				
				##passive, strengthen nuke skills by 50%
				##can stack multiplicatively
				Nuke_Amp,
				
				##passive, strengthen bless skills by 50%
				##can stack multiplicatively
				Bless_Amp,
				
				##passive, strengthen curse skills by 50%
				##can stack multiplicatively
				Curse_Amp,
				
				##passive, strengthen almighty skills by 50%
				##can stack multiplicatively
				Almighty_Amp,
				
				##passive, increase success rate of bless instakill skills by 25%
				Hama_Boost,
				
				##passive, increase success rate of curse instakill skills by 25%
				Mudo_Boost,
				
				##passive, increase chance of inflicting burn by 25%
				Burn_Boost,
				
				##passive, increase chance of inflicting freeze and frostbite by 25%
				Freeze_Boost,
				
				##passive, increase chance of inflicting paralyze by 25%
				Para_Boost,
				
				##passive, increase chance of inflicting dizzy by 25%
				Dizzy_Boost,
				
				##passive, increase chance of inflicting forget by 25%
				Forget_Boost,
				
				##passive, increase chance of inflicting sleep by 25%
				Sleep_Boost,
				
				##passive, increase chance of inflicting confuse by 25%
				Confuse_Boost,
				
				##passive, increase chance of inflicting fear by 25%
				Fear_Boost,
				
				##passive, increase chance of inflicting despair by 25%
				Despair_Boost,
				
				##passive, increase chance of inflicting rage by 25%
				Rage_Boost,
				
				##passive, increase chance of inflicting brainwash by 25%
				Brainwash_Boost,
				
				##passive, increase chance of inflicting all ailments by 25%
				Ailment_Boost,
				
				##passive, increase chance of inflicting all ailments by 50%,
				##only when weather effects are active
				Ambient_Aid,
				
				##passive, increase crit chance by 25% when ambushed
				Adverse_Resolve,
				
				##passive, apply sukukaja to self when baton passing to an ally
				Touch_n_Go,
				
				##passive, doubles crit rate
				Apt_Pupil,
				
				##passive, halves HP cost of skills
				Arms_Master,
				
				##passive, halves SP cost of skills
				Spell_Master,
				
				##passive, strengthen gun attacks by 25%
				Snipe,
				
				##passive, strengthen gun attacks by 50%
				Cripple,
				
				##passive, increase crit chance for gun skills by 15%
				Trigger_Happy,
				
				##passive, strengthen all magical attacks by 25%
				Magic_Ability,
				
				##passive, multiply all damage dealt by 1.25x,
				##unique to Satanael
				Tyrants_Mind,
				
				##end header for offensive passives
				EndOffense,
				#endregion
				
				#region DEFENSIVE PASSIVE SKILLS
				##start header for defensive passives
				StartDefense,
				
				##passive, grants resistance to slash
				Resist_Slash,
				
				##passive, grants resistance to strike
				Resist_Strike,
				
				##passive, grants resistance to fire
				Resist_Fire,
				
				##passive, grants resistance to ice
				Resist_Ice,
				
				##passive, grants resistance to elec
				Resist_Elec,
				
				##passive, grants resistance to wind
				Resist_Wind,
				
				##passive, grants resistance to psy
				Resist_Psy,
				
				##passive, grants resistance to nuke
				Resist_Nuke,
				
				##passive, grants resistance to bless
				Resist_Bless,
				
				##passive, grants resistance to curse
				Resist_Curse,
				
				##passive, reduces susceptibility to dizzy by 25%
				Resist_Dizzy,
				
				##passive, reduces susceptibility to forget by 25%
				Resist_Forget,
				
				##passive, reduces susceptibility to sleep by 25%
				Resist_Sleep,
				
				##passive, reduces susceptibility to confuse by 25%
				Resist_Confuse,
				
				##passive, reduces susceptibility to fear by 25%
				Resist_Fear,
				
				##passive, reduces susceptibility to despair by 25%
				Resist_Despair,
				
				##passive, reduces susceptibility to rage by 25%
				Resist_Rage,
				
				##passive, reduces susceptibility to brainwash by 25%
				Resist_Brainwash,
				
				##passive, reduces susceptibility to all ailments by 25%
				Fortify_Spirit,
				
				##passive, grants immunity to slash
				Null_Slash,
				
				##passive, grants immunity to strike
				Null_Strike,
				
				##passive, grants immunity to fire
				Null_Fire,
				
				##passive, grants immunity to ice
				Null_Ice,
				
				##passive, grants immunity to elec
				Null_Elec,
				
				##passive, grants immunity to wind
				Null_Wind,
				
				##passive, grants immunity to psy
				Null_Psy,
				
				##passive, grants immunity to nuke
				Null_Nuke,
				
				##passive, grants immunity to bless
				Null_Bless,
				
				##passive, grants immunity to curse
				Null_Curse,
				
				##passive, grants immunity to dizzy
				Null_Dizzy,
				
				##passive, grants immunity to forget
				Null_Forget,
				
				##passive, grants immunity to sleep
				Null_Sleep,
				
				##passive, grants immunity to confuse
				Null_Confuse,
				
				##passive, grants immunity to fear
				Null_Fear,
				
				##passive, grants immunity to despair
				Null_Despair,
				
				##passive, grants immunity to rage
				Null_Rage,
				
				##passive, grants immunity to brainwash
				Null_Brainwash,
				
				##passive, grants immunity to confuse/fear/rage/despair,
				##unique to Asura
				Unshaken_Will,
				
				##passive, repel slash
				Repel_Slash,
				
				##passive, repel strike
				Repel_Strike,
				
				##passive, repel fire
				Repel_Fire,
				
				##passive, repel ice
				Repel_Ice,
				
				##passive, repel elec
				Repel_Elec,
				
				##passive, repel wind
				Repel_Wind,
				
				##passive, repel psy
				Repel_Psy,
				
				##passive, repel nuke
				Repel_Nuke,
				
				##passive, repel bless
				Repel_Bless,
				
				##passive, repel curse
				Repel_Curse,
				
				##passive, drain slash
				Drain_Slash,
				
				##passive, drain strike
				Drain_Strike,
				
				##passive, drain fire
				Drain_Fire,
				
				##passive, drain ice
				Drain_Ice,
				
				##passive, drain elec
				Drain_Elec,
				
				##passive, drain wind
				Drain_Wind,
				
				##passive, drain psy
				Drain_Psy,
				
				##passive, drain nuke
				Drain_Nuke,
				
				##passive, drain bless
				Drain_Bless,
				
				##passive, drain curse
				Drain_Curse,
				
				##passive, crit rate halved for incoming attacks
				Sharp_Student,
				
				##passive, halves all incoming damage but can no longer evade
				Firm_Stance,
				
				##end header for defensive passives
				EndDefense,
				#endregion
				
				#region EVASION PASSIVE SKILLS
				##start header for evasion passives
				StartEvasion,
				
				##passive, doubles evasion against slash
				Dodge_Slash,
				
				##passive, doubles evasion against strike
				Dodge_Strike,
				
				##passive, doubles evasion against fire
				Dodge_Fire,
				
				##passive, doubles evasion against ice
				Dodge_Ice,
				
				##passive, doubles evasion against elec
				Dodge_Elec,
				
				##passive, doubles evasion against wind
				Dodge_Wind,
				
				##passive, doubles evasion against psy
				Dodge_Psy,
				
				##passive, doubles evasion against nuke
				Dodge_Nuke,
				
				##passive, doubles evasion against bless
				Dodge_Bless,
				
				##passive, doubles evasion against curse
				Dodge_Curse,
				
				##passive, triples evasion against slash
				Evade_Slash,
				
				##passive, triples evasion against strike
				Evade_Strike,
				
				##passive, triples evasion against fire
				Evade_Fire,
				
				##passive, triples evasion against ice
				Evade_Ice,
				
				##passive, triples evasion against elec
				Evade_Elec,
				
				##passive, triples evasion against wind
				Evade_Wind,
				
				##passive, triples evasion against psy
				Evade_Psy,
				
				##passive, triples evasion against nuke
				Evade_Nuke,
				
				##passive, triples evasion against bless
				Evade_Bless,
				
				##passive, triples evasion against curse
				Evade_Curse,
				
				##passive, doubles evasion against magic attacks
				##except for instakill and almighty
				Angelic_Grace,
				
				##passive, doubles evasion against all attacks
				##when weather is active
				Climate_Decorum,
				
				##passive, halves hit rate of all incoming attacks
				Ali_Dance,
				
				##passive, reduce hit rate by 2/3 of all incoming attacks,
				##only when ambushed
				Pressing_Stance,
				
				##end header for evasion passives
				EndEvasion,
				#endregion
				
				#region RECOVERY PASSIVE SKILLS
				##start header for recovery passives
				StartRecoveryPassive,
				
				##passive, restore 2% max HP per turn
				Regenerate1,
				
				##passive, restore 4% max HP per turn
				Regenerate2,
				
				##passive, restore 6% max HP per turn
				Regenerate3,
				
				##passive, restore 3 SP per turn
				Invigorate1,
				
				##passive, restore 5 SP per turn
				Invigorate2,
				
				##passive, restore 7 SP per turn
				Invigorate3,
				
				##passive, halves the time needed to recover from ailments
				Fast_heal,
				
				##passive, recover from ailments in 1 turn
				Insta_Heal,
				
				##passive, effects of healing magic are increased by 50%
				Divine_Grace,
				
				##passive, recovers 5% HP and 10 SP per turn,
				##only after ambushing the enemy
				Heat_Up,
				
				##passive, restore 25% HP each turn,
				##unique to Maria
				Holy_Embrace,
				
				##passive, restore 15% HP and 15 SP per turn,
				##unique to Maria
				Holy_Whisper,
				
				##end header for recovery passives
				EndRecoveryPassive,
				#endregion
				
				#region ONCE PER BATTLE PASSIVE SKILLS
				##start header for once per battle
				StartOncePer,
				
				##passive, automatic tarukaja at the start of battle
				Attack_Master,
				
				##passive, automatic rakukaja at the start of battle
				Defense_Master,
				
				##passive, automatic sukukaja at the start of battle
				Speed_Master,
				
				##passive, automatic matarukaja at the start of battle
				Auto_Mataru,
				
				##passive, automatic marakukaja at the start of battle
				Auto_Maraku,
				
				##passive, automatic masukukaja at the start of battle
				Auto_Masuku,
				
				##passive, survive one fatal blow with 1 HP remaining
				Endure,
				
				##passive, survive one instakill attack with 1 HP remaining
				Survival_Trick,
				
				##passive, survive one fatal blow with HP completely recovered
				Enduring_Soul,
				
				##end header for once per battle
				EndOncePer,
				#endregion
				
				#region POST BATTLE PASSIVE SKILLS
				##start header for post-battle skills
				StartPostBattle,
				
				##passive, gain 1/4 EXP while inactive
				Growth1,
				
				##passive, gain 1/2 EXP while inactive
				Growth2,
				
				##passive, gain full EXP while inactive
				Growth3,
				
				##passive, recover 8% HP and SP after victory
				Life_Aid,
				
				##passive, fully recover HP and SP after victory
				Victory_Cry,
				
				##end header for post-battle skills
				EndPostBattle,
				
				##end header for passives
				EndPassive,
				#endregion
				
				#region BOSS SIGNATURE SKILLS
				##start header for boss skills
				StartBoss,
				
				##end header for boss skills
				EndBoss,
				#endregion
				
				#region ENIGMATIC SKILLS
				##start header for enigmatic
				StartEnigmatic,
				
				##enigmatic, no effect, 12 SP
				Splash,
				
				##end header for enigmatic
				EndEnigmatic,
				#endregion
				
				##no skill in this slot
				None
				}
				
