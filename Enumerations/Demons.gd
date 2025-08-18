extends Node

#list of traits

##all demons in the game. Details for each demon are stored in an sqlite database
enum demons {
	#region FOOL
	FoolStart,
	
	Arsene,
	Obariyon,
	OrpheusF,
	Orpheus_PicaroF,
	High_Pixie,
	Izanagi,
	Izanagi_Picaro,
	Orpheus,
	Orpheus_Picaro,
	Legion,
	Ose,
	Bugs,
	Crystal_Skull,
	Black_Frost,
	Raoul,
	Vishnu,
	Satanael,
	
	#pokemon
	Eevee,
	
	FoolEnd,
	#endregion
	
	#region MAGICIAN
	MagicianStart,
	
	Zorro,
	Mercurius,
	Diego,
	Jack_o_Lantern,
	Cait_Sith,
	Jack_Frost,
	Nekomata,
	Sandman,
	Choronzon,
	Queen_Mab,
	Rangda,
	Forneus,
	Surt,
	Futsunushi,
	
	#pokemon
	Meowth,
	
	MagicianEnd,
	#endregions
	
	#region PRIESTESS
	PriestessStart,
	
	Johanna,
	Anat,
	Agnes,
	Silky,
	Apsaras,
	Koh_i_Noor,
	Isis,
	Kikuri_Hime,
	Sarasvati,
	Skadi,
	Scathach,
	Cybele,
	
	#pokemon
	Chansey,
	
	PriestessEnd,
	#endregion
	
	#region EMPRESS
	EmpressStart,
	
	Milady,
	Astarte,
	Lucy,
	Queens_Necklace,
	Yaksini,
	Lamia,
	Hariti,
	Dakini,
	Titania,
	Kali,
	Alilat,
	Mother_Harlot,
	
	#pokemon
	Latias,
	
	EmpressEnd,
	#endregions
	
	#region EMPEROR
	EmperorStart,
	
	Goemon,
	Kamu_Susanoo,
	Gorokichi,
	Regent,
	Eligor,
	Setanta,
	Thoth,
	Barong,
	King_Frost,
	Oberon,
	Baal,
	Odin,
	
	#pokemon
	Latios,
	Palkia,
	Groudon,
	
	EmperorEnd,
	#endregion
	
	#region HIEROPHANT
	HierophantStart,
	
	Berith,
	Orobas,
	Anzu,
	Daisoujou,
	Mishaguji,
	Bishamonten,
	Kohryu,
	
	#pokemon
	Lugia,
	
	HierophantEnd,
	#endregions
	
	#region LOVERS
	LoversStart,
	
	Io,
	Carmen,
	Hecate,
	Celestine,
	Pixie,
	Saki_Mitama,
	Ame_no_Uzume,
	Leanan_Sidhe,
	Kushinada,
	Narcissus,
	Parvati,
	Raphael,
	Ishtar,
	
	#pokemon
	Sylveon,
	Xerneas,
	
	LoversEnd,
	#endregion
	
	#region CHARIOT
	ChariotStart,
	
	Captain_Kidd,
	Seiten_Taisei,
	William,
	Agathion,
	Slime,
	Shiki_Ouji,
	Kin_Ki,
	Ara_Mitama,
	White_Rider,
	Athena,
	Athena_Picaro,
	Thor,
	Chi_You,
	
	#pokemon
	Dialga,
	Kyogre,
	
	ChariotEnd,
	#endregion
	
	#region JUSTICE
	JusticeStart,
	
	Robin_Hood,
	Loki,
	Hereward,
	Angel,
	Archangel,
	Principality,
	Power,
	Mechizedek,
	Dominion,
	Throne,
	Uriel,
	Metatron,
	
	#pokemon
	Reshiram,
	Kyurem_White,
	
	JusticeEnd,
	#endregion
	
	#region HERMIT
	HermitStart,
	
	Bicorn,
	Koropokguru,
	Ippon_Datara,
	Sudama,
	Naga,
	Kurama_Tengu,
	Arahabaki,
	Kumbhanda,
	Koumokuten,
	Loa,
	Fafnir,
	Ongyo_Ki,
	
	#pokemon
	Regigigas,
	
	HermitEnd,
	#endregions
	
	#region FORTUNE
	FortuneStart,
	
	Stone_of_Scone,
	Clotho,
	Ariadne,
	Lachesis,
	Atropos,
	Ariadne_Picaro,
	Fortuna,
	Norn,
	Asterius,
	Asterius_Picaro,
	Lakshmi,
	
	#pokemon
	Zekrom,
	Kyurem_Black,
	
	FortuneEnd,
	#endregion
	
	#region STRENGTH
	StrengthStart,
	
	Cerberus,
	Kelpie,
	Shiisaa,
	Oni,
	Rakshasa,
	Orlov,
	Zouchouten,
	Valkyrie,
	Hanuman,
	Chimera,
	Zaou_Gongen,
	
	#pokemon
	Milotic,
	
	StrengthEnd,
	#endregions
	
	#region HANGED MAN
	HangedStart,
	
	Hua_Po,
	Inugami,
	Orthrus,
	Take_Minakata,
	Emperors_Amulet,
	Hecatoncheires,
	Jatayu,
	Moloch,
	Macabre,
	Attis,
	
	#pokemon
	Darkrai,
	Kyurem,
	
	HangedEnd,
	#endregion
	
	#region DEATH
	DeathStart,
	
	Mandrake,
	Mokoi,
	Matador,
	Nue,
	Pisaca,
	Hell_Biker,
	Hope_Diamond,
	Pale_Rider,
	Chernobog,
	Thanatos,
	Thanatos_Picaro,
	Mot,
	Alice,
	
	#pokemon
	Giratina,
	
	DeathEnd,
	#endregions
	
	#region TEMPERANCE
	TemperanceStart,
	
	Genbu,
	Koppa_Tengu,
	Makami,
	Jikokuten,
	Mitra,
	Byakko,
	Raja_Naga,
	Gabriel,
	Ardha,
	
	#pokemon
	Zygarde,
	
	TemperanceEnd,
	#endregion
	
	#region DEVIL
	DevilStart,
	
	Incubus,
	Flauros,
	Andras,
	Lilim,
	Pazuzu,
	Baphomet,
	Nebiros,
	Belial,
	Beelzebub,
	
	#pokemon
	Gengar,
	
	DevilEnd,
	#endregions
	
	#region TOWER
	TowerStart,
	
	Belphegor,
	Red_Rider,
	Magatsu_Izanagi,
	Magatsu_Izanagi_Picaro,
	Seth,
	Black_Rider,
	Mara,
	Yoshitsune,
	Mada,
	
	#pokemon
	Regice,
	Regirock,
	Registeel,
	Yveltal,
	
	TowerEnd,
	#endregion
	
	#region STAR
	StarStart,
	
	Kodama,
	Fuu_Ki,
	Neko_Shogun,
	Kaiwan,
	Garuda,
	Vasuki,
	Sraosha,
	Hastur,
	Lucifer,
	
	#pokemon
	Victini,
	
	StarEnd,
	#endregions
	
	#region MOON
	MoonStart,
	
	Succubus,
	Onmoraki,
	Kaguya,
	Black_Ooze,
	Sui_Ki,
	Kaguya_Picaro,
	Mothman,
	Girimehkala,
	Tsukiyomi,
	Tsukiyomi_Picaro,
	Lilith,
	Byakhee,
	Sandalphon,
	
	#pokemon
	Umbreon,
	
	MoonEnd,
	#endregion
	
	#region SUN
	SunStart,
	
	Suzaku,
	Thunderbird,
	Mithras,
	Yurlungur,
	Horus,
	Ganesha,
	Quetzalcoatl,
	Asura,
	
	#pokemon
	Espeon,
	
	SunEnd,
	#endregions
	
	#region JUDGEMENT
	JudgementStart,
	
	Anubis,
	Trumpeter,
	Yamata_no_Orochi,
	Abaddon,
	Messiah,
	Shiva,
	Michael,
	Messiah_Picaro,
	Satan,
	
	#pokemon
	Rayquaza,
	
	JudgementEnd,
	#endregion
	
	#region WORLD
	WorldStart,
	
	Izanagi_no_Okami,
	
	#pokemon
	Arceus,
	Terapagos,
	
	WorldEnd,
	#endregions
	
	#region FAITH
	FaithStart,
	
	Cendrillon,
	Vanadis,
	Ella,
	Phoenix,
	Tam_Lin,
	Uniorn,
	Okuninushi,
	Orichalcum,
	Atavaka,
	Cu_Culainn,
	Siegfried,
	Maria,
	
	#pokemon
	Gardevoir,
	
	FaithEnd,
	#endregions
	
	#region COUNCILLOR
	CouncillorStart,
	
	Azathot,
	Adam_Kadmon,
	Kushi_Mitama,
	Nigi_Mitama,
	Decarabia,
	Ananta,
	Yatagarasu,
	Seiryu,
	Dionysus,
	Vohu_Manah,
	
	#pokemon
	Metagross,
	
	CouncillorEnd
	#endregion
}
