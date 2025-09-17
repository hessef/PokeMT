extends Node

class_name metadata

#region ENUMS
const Types = Enums.type
#endregion

#region BUILD INFORMATION
const game_version = "0.0.0.1"
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
