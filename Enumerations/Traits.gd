extends Node

#list of traits
##all traits in the game. Details for each trait are stored in an sqlite database
enum traits {	
				#region P5 PARTY PERSONA TRAITS
				##increase effect of allies' healing skills by 50%
				##unique to Zorro and Mercurius
				Proud_Presence,
				
				##20% chance to increase allies' slash or strike attacks by 40%
				##unique to Captain Kidd and Seiten Taisei
				Raging_Temper,
				
				##20% chance to reduce SP cost of allies' skills by 25%
				##unique to Carmen and Hecate
				Mastery_of_Magic,
				
				##20% chance to increase allies' evasion against slash and strike attacks by 40%
				##unique to Goemon and Kamu Susano-o
				Scoundrel_Eyes,
				
				##increase allies' chance of inflicting burn/freeze/frostbite/paralysis by 25%
				##unique to Johanna and Anat
				Gaia_Pact,
				
				##decrease allies' chance of being inflicted by non-special ailments by 25%
				##unique to Milady and Astarte
				Icy_Glare,
				
				##20% chance to reduce SP cost of allies' support skills by 25%
				##unique to Robin Hood and Loki
				Tactical_Spirit,
				
				##20% chance for ally to not be downed when hit with a crit or weakness
				##unique to Cendrillon and Vanadis
				Veil_of_Midnight,
				
				##increase effect of allies' healing skills by 50%,
				##20% chance to decrease SP cost of allies' healing skills by 25%,
				##unique to Diego
				Majestic_Presence,
				
				##20% chance to increase allies' slash or strike attacks by 80%
				##unique to William
				Eccentric_Temper,
				
				##20% chance to reduce SP cost of allies' skills by 50%
				##unique to Celestine
				Pinnacle_of_Magic,
				
				##20% chance to increase allies' evasion against slash and strike attacks by 80%
				##unique to Gorokichi
				Unparalleled_Eyes,
				
				##increase allies' chance of inflicting burn/freeze/frostbite/paralysis by 50%
				##unique to Agnes
				Gaia_Blessing,
				
				##decrease allies' chance of being inflicted by non-special ailments by 50%
				##unique to Lucy
				Cool_Customer,
				
				##20% chance to reduce SP cost of allies' support skills by 50%
				##unique to Hereward
				Ingenious_Spirit,
				
				##40% chance for ally to not be downed when hit with a crit or weakness
				##unique to Ella
				Veil_of_Sunrise,
				#endregion
				
				#region P3 PARTY PERSONA TRAITS
				##reduces SP cost of healing skills to 25%
				##unique to Io
				Healing_Apex,
				
				##increases crit chance by 50% and doubles crit damage
				##unique to Hermes
				Critical_Amp,
				
				##increases crit rate by 50% on enemies inflicted with ailments
				##unique to Penthesilea
				Ailment_Surge,
				
				##doubles the effect of buffs on self
				##unique to Polydeuces
				Buff_Amp,
				
				##increases the damage of slash, strike, and gun skills by 50%
				##unique to Palladion
				Phys_Amp,
				
				##automatically cast masukunda at the start of battle
				##unique to Cerberus
				Auto_Masukunda,
				
				##restore 10 SP each turn
				##unique to Nemesis
				Spirit_Restore,
				
				##automatically cast heat riser on self at the start of battle
				##unique to Castor
				Auto_Heat_Riser,
				#endregion
				
				#region SP REDUCTION TRAITS
				##reduce cost of fire skills by 50%
				Heated_Bloodline,
				
				##reduce cost of ice skills by 50%
				Frigid_Bloodline,
				
				##reduce cost of elec skills by 50%
				Electric_Bloodline,
				
				##reduce cost of wind skills by 50%
				Wind_Bloodline,
				
				##reduce cost of psy skills by 50%
				Psychic_Bloodline,
				
				##reduce cost of nuke skills by 50%
				Atomic_Bloodline,
				
				##reduce cost of bless skills by 50%
				Blessed_Bloodline,
				
				##reduce cost of curse skills by 50%
				Cursed_Bloodline,
				
				##reduce cost of healing skills by 50%
				Savior_Bloodline,
				
				##reduce cost of support skills by 50%
				Relief_Bloodline,
				
				##reduce cost of fire skills by 75%
				Drunken_Passion,
				
				##reduce cost of ice skills by 75%
				Cocytus,
				
				##reduce cost of elec skills by 75%
				Bargain_Bolts,
				
				##reduce cost of wind skills by 75%
				Vahanas_Wings,
				
				##reduce cost of psy skills by 75%
				Chi_Yous_Blessing,
				
				##reduce cost of nuke skills by 75%
				Atomic_Hellscape,
				
				##reduce cost of bless skills by 75%
				Martyrs_Gift,
				
				##reduce cost of curse skills by 75%
				Mothers_Lament,
				
				##reduce cost of healing skills by 75%
				Grace_of_Mother,
				
				##reduce cost of support skills by 75%
				Ave_Maria,
				
				##reduces cost of instakill skills to 0
				Just_Die,
				
				##reduces cost of magic skills by 75%
				Allure_of_Wisdom,
				#endregion
				
				#region AILMENT BOOSTER TRAITS
				##increases chance of inflicting burn by 25% after baton pass
				Thermal_Conduct,
				
				##increases chance of inflicting freeze and frostbite by 25% during 1 More
				Cold_Blooded,
				
				##increases chance of inflicting paralysis by 25% on downed enemy
				Static_Electricity,
				
				##increases chance of inflicting ailments by 25% after baton pass
				Foul_Odor,
				
				##increases chance of inflicting ailments by 25% on downed enemy
				Ghost_Nest,
				
				##increases chance of inflicting ailments by 25%
				Foul_Stench,
				#endregion
				
				#region OFFENSIVE TRAITS
				##strengthen slash and strike skills by 20%
				Striking_Weight,
				
				##strengthen slash and strike skills by 30%
				Undying_Fury,
				
				##strengthens single target magic attacks by 20%
				Intense_Focus,
				
				##strengthens multi target magic attacks by 20%
				Mighty_Gaze,
				
				##increase attack by 20% after baton pass
				Skillful_Combo,
				
				##increase attack by 50% after baton pass
				Linked_Bloodline,
				
				##increase attack by 25% per non-special ailment inflicted on target
				Ailment_Hunter,
				
				##increase success rate of instakill skills by 25%, can stack
				Deathly_Illness,
				
				##increase success rate of instakill skills by 50%, can stack
				Omen,
				
				##strengthen technical damage by 25%
				Skillful_Technique,
				
				##strengthen technical damage by 50%
				Universal_Law,
				
				##increases attack by 50% when striking enemy weakness
				Relentless,
				
				##doubles counter damage
				Retaliating_Body,
				
				##triples effect of concentrate and charge,
				##automatic charge at the start of battle
				Will_of_the_Sword,
				
				##strengthen magic attacks by 50%
				Pagan_Allure,
				
				##doubles attack stats when inflicted with burn
				##or frostbite instead of halving them
				Guts,
				#endregion
				
				#region DEFENSIVE TRAITS
				##doubles the effect of drain skills and passives
				Draining_Mouth,
				
				##increases the amount of HP restored to self by 50%
				Gluttonmouth,
				
				##doubles amount of HP restored to self
				Demons_Bite,
				
				##increases the amount of SP restored to self by 50%
				Mouth_of_Savoring,
				
				##doubles amount of SP restored to self
				Naranari,
				
				##25% chance to double the effect of buff skills on self
				Internal_Hypnosis,
				
				##50% chance to double the effect of buff skills on self
				Positive_Thoughts,
				
				##25% chance to double the effect of buff skills on party
				Potent_Hypnosis,
				
				##50% chance to double the effect of buff skills on party
				Wealth_of_Lotus,
				
				##reduces susceptibility to all non-special ailments by 25%
				Rare_Antibody,
				
				##grants immunity to all non-special ailments
				Immunity,
				
				##increases evasion by 40% against foes inflicted with non-special
				##ailments. Also casts tarukaja on self at the start of battle
				Bloodstained_Eyes,
				
				##decreases damage received when struck by weakness by 40%
				Crisis_Control,
				#endregion
				
				#region OTHER TRAITS
				##activates all equipped weather passives in normal weather
				Gloomy_Child,
				
				##allows the use of skills only usable when surrounded after a Baton Pass
				Pinch_Anchor,
				
				##allows the use of skills only usable when surrounded
				##in normal conditions
				Vitality_of_the_Tree,
				#endregion
				
				#region P5 DLC PERSONA TRAITS
				##revives with 1 HP when KO'd. Usable 4 times in battle,
				##unique to Orpheus
				Circle_of_Sadness,
				
				##decreases SP cost of all skills by half after baton pass.
				##Also casts tetrakarn and makarakarn on self at the start of batle,
				##unique to Thanatos
				Iron_Heart,
				
				##doubles amount of HP and SP restored to self,
				##unique to Messiah
				Hallowed_Spirit,
				
				##triples the chance of ally traits triggering,
				##unique to Izanagi
				God_Maker,
				
				##increases attack by 40% per non-special ailment on target,
				##unique to Magatsu-Izanagi
				Hollow_Jester,
				
				##triples counter damage,
				##unique to Kaguya
				Inviolable_Beauty,
				
				##consumables not used up after Baton Pass,
				##unique to Ariadne
				Tag_Team,
				
				##increases damage dealt by 50% when health under 25%,
				##unique to Asterius
				Frenzied_Bull,
				
				##increases attack by 50% during 1 More,
				##unique to Tsukiyomi
				Bolstering_Force,
				
				##decreases HP and SP costs to 0 during 1 More,
				##unique to Athena
				Grace_of_the_Olive,
				
				##increases attack and defense stats by the percentage
				##of the compendium completed,
				##unique to Izanagi-no-Okami
				Country_Maker,
				
				##25% chance for ally to follow up with a basic attack
				##on the target after an attack,
				##unique to Raoul
				Hazy_Presence,
				#endregion
			
				#region POKEMON ABILITIES
				##STAB bonus increased to 2x instead of 1.5x
				Adaptability
				#endregion
			}
