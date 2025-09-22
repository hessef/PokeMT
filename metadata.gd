extends Node

class_name metadata

#region ENUMS
const Types = Enums.type
const Race = Demons.demons
const Skill = Skills.skills
#endregion

#region BUILD INFORMATION
const game_version = "0.0.0.1"
#endregion

#region CREDITS
const credits = {	"Programming": {"Name": "Literally //REDACTED//",
									"Github": "hessef"},
					"Logo Artist": {"Name": "PommePaloma",
									"Instagram": "pommepaloma",
									"Tumblr": "pommepaloma"},
					"Made By":		"Perspicacious Entertainment",
					"Sources": {	"Assets": "The Spriter's Resource"}}
#endregion

#region DEV FLAGS
const disabled_skill_types = [	Types.Buff,
								Types.Debuff,
								Types.Recovery,
								Types.Ailment,
								Types.Shield,
								Types.Negate,
								Types.Utility,
								Types.Passive]
#endregion

#region IMPLEMENTED DEMONS
const implemented_demons = [	Race.Arsene,
								Race.Zorro,
								Race.Jack_o_Lantern,
								Race.Orpheus,
								Race.Izanagi,
								Race.Pixie,
								Race.Jack_Frost,
								Race.Captain_Kidd,
								Race.Angel,
								Race.Mokoi,
								Race.Io,
								Race.Take_Mikazuchi,
								Race.Cerberus,
								Race.Kaiwan,
								Race.Cait_Sith,
								Race.Incubus,
								Race.Succubus,
								Race.Makami]
#endregion

#region IMPLEMENTED SKILLS
const implemented_skills = [	Skill.Cleave,
								Skill.Bash,
								Skill.Sonic_Punch,
								Skill.Double_Fangs,
								Skill.Kill_Rush,
								Skill.Headbutt,
								Skill.Hysterical_Slap,
								Skill.Dream_Needle,
								Skill.Agi,
								Skill.Maragi,
								Skill.Maragion,
								Skill.Bufu,
								Skill.Mabufu,
								Skill.Zio,
								Skill.Zionga,
								Skill.Mazio,
								Skill.Storm_Dracostrike,
								Skill.Garu,
								Skill.Magaru,
								Skill.Psi,
								Skill.Psio,
								Skill.Mapsi,
								Skill.Frei,
								Skill.Freila,
								Skill.Kouha,
								Skill.Hama,
								Skill.Eiha,
								Skill.Eiga,
								Skill.Maeiga,
								Skill.Mudo,
								Skill.Mamudo,
								Skill.Life_Drain,
								Skill.Spirit_Drain,
								Skill.Rakunda,
								Skill.Rakukaja,
								Skill.Tarukaja,
								Skill.Rebellion,
								Skill.Revolution,
								Skill.Ice_Break,
								Skill.Dia,
								Skill.Baisudi,
								Skill.Energy_Drop,
								Skill.Media,
								Skill.Helping_Hand,
								Skill.Sharp_Student,
								Skill.Dodge_Elec,
								Skill.Dodge_Curse,
								Skill.Resist_Curse,
								Skill.Null_Bless,
								Skill.Curse_Boost,
								Skill.Regenerate1,
								Skill.Makajama,
								Skill.Dazzler,
								Skill.Dormina]
#endregion
