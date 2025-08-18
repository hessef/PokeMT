extends Node

class_name Enum
#enums to make my life not terrible
#region DEBUG LEVEL
enum debug_level {	NONE,
					INFO,
					VERBOSE
}
#endregion

#region OBJECT TYPES
##Object Types
enum ObjectType {	Demon,
					Skill,
					Trait,
					Item,
					EncounterTable,
					Team,
					Trainer
}
#endregion

#region MENU TYPES
##Menu Types
enum MenuType {	None,
				Action,
				Skill,
				Enemy_Target,
				Ally_Target
				}
#endregion

#region Affinities
#These are for type interactions
##Elemental Affinities
enum affinity {Neutral, Resist, Weak, Null, Drain, Repel}

##Elemental Relations
enum relation {Neutral, Match, Oppose}
#endregion

#region Types
#Items in row 1 are the elemental types for attacks
#Items in row 2 are there mostly for showing the proper icon in the UI.
#By default, Slash, Strike, and Gun skills are physical (scaling with
#strength) and consume HP while all others are magic (scaling with magic)
#and consume SP. Almighty skills have no type interactions and Enigmatic
#moves do not follow standard typing rules.
##Elemental Types
enum type {	Slash, Strike, Gun, Fire, Ice, Wind, Elec, Psy, Nuke, Bless, Curse, Almighty,
				Recovery, Buff, Debuff, Ailment, Shield, Negate, Utility, Passive, None}
##category
enum skill_category {	Phys,
						Magic,
						Ailment,
						Recovery,
						Support,
						Passive
}
#endregion

#region Attack Range
#These are the types of ranges for attacks
enum range {	Melee,	#makes contact
				Ranged,	#Does not make contact
				Other	#unique cases
				}
#additionally, moves also have an area of effect
enum aoe {	SingleTarget,	#hits a single target
			MultiTarget,	#hits all targets on a particular side
			Random			#hits random targets
			}
#endregion

#region Attack Scaling
#This determines how an attack scales
enum scaling {	Strength,	#scale on strength stat (physical attack)
				Magic,		#scale on magic stat (special attack)
				Other		#unique cases
				}
#endregion

#region Skill Subtypes
#These are the subtypes of skills, generally used for differentiating
#niche mechanics and interactions
enum skill_subtypes {	
						##standard, no special effects
						Standard,
						
						##instakill skills, ailment chance will instead by success rate
						Instakill,
						
						##reduce target hp by a specific amount
						NonStandardDamage,
						
						##positive status, like crit up or charge
						PositiveStatus,
						
						##negation, like Dekaja and Dekunda
						Negation,
						
						##break resistance
						Break,
						
						##do not follow type interactions and
						##instead base damage multipliers on the
						##target's inheritance type and the user's
						##inheritance type, manually set for each
						##move individually
						Enigmatic,
						
						##sound based
						Sound,
						
						##dance based
						Dance,
						
						##cannot be inherited
						Unique
					}
##inheritance types
enum inherit {
	Inheritable,
	Unique
}
#endregion

#region Recovery Types
##these are the options for what a recovery skill can cure
enum recovery_type{
	##just health
	HP, 
	
	##remove Dizzy, Forget, Hunger, and Sleep
	Patra,
	
	##remove Burn, Paralyze, Freeze, and Frostbite
	Baisudi,
	
	##remove Confuse, Fear, Rage, Despair, Brainwash
	Energy_Drop,
	
	##Patra + Baisudi + Energy Drop
	Amrita,
	
	##HP + Amrita
	HP_Amrita
}
#endregion

#region Trigger Condition
##These are for passive ability/passive skill trigger conditions
enum trigger_condition {UseSkill, Attacking, Attacked, 
						InflictingAilment, ResistingAilment,
						RecoverHP, RecoverSP, BattleStart,
						TurnStart}
#endregion

#region Passive Effects
##These are the types of effects a passive skill can have
enum passive_effects {
	##nullify aliment(s)
	NullAilment,
	
	##boost power of move (damage for attacks, recovery for healing)
	BoostPower,
	
	##restore HP and/or SP
	Restore,
	
	##drain an element
	Drain,
	
	##survive mortal blow
	Endure,
	
	##boost evasion
	Evade,
	
	##reduce recovery time
	HealRate,
	
	##reduce skill cost
	ReduceCost,
	
	##repel an element
	Repel,
	
	##reduce ailment susceptibility
	BoostImmune,
	
	##cast skill at the start of battle
	Auto,
	
	##increase exp gained when not in active party
	ExpBoost,
	
	##nullify an element
	NullElement,
	
	##boost ailment infliction rate
	BoostAilment,
	
	##chance to counter strength based attacks
	Counter,
	
	##grant a resistance to incoming damage
	Resist,
	
	##boost critrate
	CritRate,
	
	##avoid crit
	AvoidCrit
}

##These are the types of passives
enum passive_types {	Counter,
						Offense,
						Defense,
						Evasion,
						RecoveryPassive,
						OncePer,
						PostBattle
}
#endregion

#region Skill Conditions
##These are the possible conditions that must be met for a skill to work
enum skill_conditions {
	##none
	Neutral,
	
	##receive a baton pass
	RBatonPass,
	
	##successful ambush
	Ambush,
	
	##must be surrounded
	Surrounded,
	
	##special weather is active
	Weather
}
#endregion

#region Mobility
##These are the different mobility methods for demons. They determine how
##hazards, terrains, some moves, etc. affect the demon.
enum mobility {	Legged,		#walks on legs
				Wheeled,	#has wheels
				Levitating,	#levitates a small distance off the ground
				Flying		#flies high above the ground
				}
#endregion

#region Battle Stats
##these are the stats in battle
enum battle_stats{
	##physical attack
	Att,
	##magical attack
	Spa,
	##physical defence
	Def,
	##magical defence
	Spd,
	##speed
	Spe,
	##accuracy
	Acc,
	##evasion
	Eva
}
#endregion

#region Arcana
##These are the various Arcana that each demon is a part of.
##The order and corresponding numerical value are based on
##the portrayal of the Arcana in Persona 5 Royal
enum arcana {Fool, Magician, Priestess, Empress, Emperor, Hierophant,
				Lovers, Chariot, Justice, Hermit, Fortune, Strength,
				Hanged, Death, Temperance, Devil, Tower, Star, Moon,
				Sun, Judgement, World, Faith, Councillor}
#endregion

#region Non-Volatile Status
##These are non-volatile status effects which do not get
##removed when a demon leaves the field. Only one of these
##can be inflicted at once, and can not be overwritten by
##another non-volatile status.
enum non_volatile_status {	None, 		#no non-valatile status
							Burn, 		#halve physical attack, take 1/16 HP damage at the end of each turn
										#TECHNICALS: Wind, Nuke
							Frostbite, 	#halve magical attack, take 1/16 HP damage at the end of each turn
										#TECHNICALS: Strike, Slash, Gun, Nuke
							Poison, 	#take 1/8 HP damage at the end of each turn
										#TECHNICALS: Psy, Fire
							Toxic, 		#take 1/16 HP damage at the end of each turn, then 2/16, then 3/16, etc.
										#change to normal poison when leaving the field
										#TECHNICALS: Psy, Fire
							Paralysis,	#50% chance to not move and halve speed. 10% chance to transfer to attacker
										#when hit with a melee attack
										#TECHNICALS: Strike, Slash, Gun, Nuke
							Sleep,		#cannot act, recovers 10% HP and SP per turn, removed when hit
										#TECHNICALS: All
							Freeze		#cannot act, physical affinities are changes to neutral, removed when hit,
										#replaced with Frostbite when removed (unless removed by healing)
										#TECHNICALS: Strike, Slash, Gun, Nuke
							}
#endregion

#region Volatile Status
##These are volatile status effects which get removed upon switching
##out of battle. Any number can be inflicted at once but the same effect
##cannot be stacked multiple times. These can also be inflicted even
##when a non-volatile condition is active.
enum volatile_status {	None,				#no volatile status
						Guard,				#cannot evade, but damage taken from attacks reduced to 40%
											#also prevents being knocked down, getting inflicted with
											#status effects, and being instakilled. Ends when hit or
											#when acting.
											#TECHNICALS: None
						Down,				#cannot evade or receive baton pass and take 125% damage 
											#from attacks. Ends when taking their turn.
											#TECHNICALS: None
						Dizzy,				#accuracy reduced by 50% for 3 turns
											#TECHNICALS: All
						Forget,				#cannot use skills, only basic attack for 3 turns
											#TECHNICALS: None
						Confuse,			#33% chance to damage themselves instead of acting.
											#damage based on basic attack not including type interactions.
											#Cured in 3 turns
											#TECHNICALS: Psy
						Fear,				#50% chance to not act, cannot evade, instantly dies
											#if the skill Ghastly Wail is used. Cured in 3 turns
											#TECHNICALS: Psy
						Despair,			#unable to act, loses 5% SP per turn, will die in
											#3 turns if not cured or switched out
											#TECHNICALS: Psy
						Rage,				#attack is doubled while defense, evasion, and accuracy are halved.
											#Will only be able to use basic attacks. Cured in 3 turns
											#TECHNICALS: Psy
						Brainwash,			#Equal chance to attack ally, heal enemy, or buff enemy (based on
											#usable skills). Cannot be switched out. Cured in 3 turns
											#TECHNICALS: Psy
						Hunger,				#reduces all damage dealt by 50%
											#TECHNICALS: None
						Mouse,				#party member becomes a mouse and is unable to act
											#cured in 3 turns
											#TECHNICALS: None
						Paint,				#changes all elemtal damage affinities to weak and negates guarding.
											#Cured in 2 turns.
											#TECHNICALS: None
						Lust,				#50% chance to not act for 3 turns
											#TECHNICALS: None
						Wrath,				#doubles all damage dealt and received for 3 turns
											#TECHNICALS: None
						Envy,				#50% chance to attack the ally that uses a support skill if
											#the inflicted demon was not targeted for 3 turns
											#TECHNICALS: None
						Desperation,		#damage dealt multiplied by 2.5x but damage recieved is doubled
											#cured in 3 turns
											#TECHNICALS: None
						Substitute,			#a substitute with 1/4 total HP of the user at time of creation
											#takes damage in place of the user until it is destroyed.
											#Also prevents additional status effects from being inflicted
											#TECHNICALS: None
						Bound,				#cannot leave the field, takes 1/8 max HP per turn, ends after
											#2-5 turns, or when the demon that inflicted it leaves the field
											#TECHNICALS: All
						Curse,				#Take 25% make HP in damage per turn
											#TECHNICALS: Fire
						Nightmare,			#take 25% max HP in damage per turn. Can only be inflicted
											#if target is asleep and ends when target wakes up
											#TECHNICALS: Psy
						PerishSong,			#after 3 turns, all demons that heard the song die
											#TECHNICALS: None
						Seeded,				#take 1/8 max HP in damage per turn, all of which gets 
											#drained to heal the enemy in the spot of the inflictor.
											#When the victim switches out, it is transferred to the
											#demon that replaces them
											#TECHNICALS: Nuke
						AquaRing,			#heal 1/16 max HP per turn
											#TECHNICALS: None
						FireBreak,			#removes resistance to fire skills
						IceBreak,			#removes resistance to ice skills
						ElecBreak,			#removes resistance to elec skills
						WindBreak,			#removes resistance to wind skills
						PsyBreak,			#removes resistance to psy skills
						NukeBreak,			#removes resistance to nuke skills
						FireWall,			#adds resistance to fire skills
						IceWall,			#adds resistance to ice skills
						ElecWall,			#adds resistance to elec skills
						WindWall,			#adds resistance to wind skills
						PsyWall,			#adds resistance to psy skills
						NukeWall,			#adds resistance to nuke skills
						RplPhys,			#repel one slash, strike, or gun attack
						RplMag,				#repel one magic attack or ailment skill.
											#Does not repel almighty
						Charged,			#next strength-based attack damage multiplied by 2.5x
						Focused,			#next magic-based attack damage multiplied by 2.5x
						Helped,				#next attack does 1.5x damage
						InstakillBarrier,	#prevents one instakill skill from succeeding
						PaintingBarrier,	#absorbs one attack, except almighty
						Reflect,			#halve melee damage taken. Lasts for 5 turns,
											#or 8 if Light Clay is held by the caster
						LightScreen,		#halve ranged damage taken. Lasts for 5 turns,
											#or 8 if Light Clay is held by the caster
						Protected,			#negate all effects of enemy attacks and skills
											#until the user acts again
						CritUp,				#increase crit chance by 50% for 3 turns
						AilmentChance,		#increase ailment susceptibility by 50%
						AttackDown,			#decrease attack stats to 10% 
						Flinch				#cannot act this turn
						}
#endregion

#region Hazards
##These are entry hazards that effect any demons entering the field while the
##hazard is active. Multiple can be active at once.
enum hazard {	None,				#no hazards
				Spikes1,			#one layer of spikes; deal 1/8 max HP in damage
				Spikes2,			#two layers of spikes; deal 1/6 max HP in damage
				Spikes3,			#three layers of spikes; deal 1/4 max HP in damage
				ChargedShards,		#deal 12.5% max HP in damage, affected by Elec affinity
				RadioactiveDebris,	#deal 12.5% max hp in damage, affected by Nuke affinity
				StickyWeb			#lower speed by one stage
}
#hazards only effect the enemy team, so this enum is just to keep track of which
#side(s) to impact
enum hazard_aoe {	Player,	#affecting player side
					Enemy,	#affecting enemy side
					Both	#affecting both sides
}
#endregion

#region Environment
#These are the various terrain conditions that can be applied
#to the battlefield and affect all active demons. Only one can
#be active at once and only grounded demons are affected. Trying
#to apply a terrain when one is already active will overwrite it
enum terrain {	Neutral,	#standard terrain with no special properties
				Electric,	#demons can't fall asleep and elec skill
							#damage is boosted by 30%. Ends in 5 turns.
				Windy,		#demons restore 1/16 max HP per turn and
							#wind skill damage is boosted by 30%.
							#Ends in 5 turns.
				Psychic		#demons will not be hit by any priority
							#moves and psychic skill damage is boosted
							#by 30%. Ends in 5 turns.
				}

#There are also effects which effect the environment but not the terrain,
#thus affecting non grounded demons as well. Only one can be applied at a time,
#but they can stack with terrains. They can not overwrite an active atmosphere
enum atmosphere {	Neutral,	#standard environment with no special properties
					TrickRoom,	#turn order within priority brackets is reversed.
								#Ends in 5 turns or if Trick Room is used again
					MagicRoom,	#held items no longer work. Ends in 5 turns
								#or if Magic Room is used again
					WonderRoom	#physical and magical defense are switched
								#Ends in 5 turns, or if Wonder Room is used again.
				}

#weather conditions also impact the battle and can be applied
#in addition to terrains and atmospheres, and new weather conditions
#overwrite currently active ones
enum weather {	Neutral,		#standard weather with no special properties
				HarshSunlight,	#boosts damage from fire skills by 50% and
								#reduces damage from ice skills by 50%. Also
								#prevents any demons from being inflicted with
								#freeze or frostbit
				Snow,			#boosts damage from ice skills by 50% and
								#reduces damage from fire skills by 50%.
				Fog				#accuracy of all skills reduced by 50%
				}
#endregion
