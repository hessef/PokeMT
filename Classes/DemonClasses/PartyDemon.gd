extends demon

class_name party_demon

func _init(base = null, race:=Race.Arsene, debug:=Debug.NONE):
	#if not creating from an existing object, run parent _init function
	if base == null:
		super(race, debug)
	else:
		#region COPY VALUES
		if debug != Debug.NONE:
			print("=====ASSIGNING BASIC DETAILS=====")
	
		ID 			= base.ID
		disp_name	= base.disp_name
		fake_ID		= base.fake_ID
		nickname	= base.nickname
		arcana		= base.arcana
		background	= base.background
		evolve		= base.evolve
		inheritance	= base.inheritance
		battack		= base.battack

		if debug == Debug.VERBOSE:
			print("ID: %s\nDisplay Name: %s\nFake Name: %s" % [Race.keys()[ID], disp_name, fake_ID])
			print("Arana: %s\nBackground: %s" % [Arcana.keys()[arcana], background])
			if evolve == Race.Arsene:
				print("Does not evolve")
			else:
				print("Evolves into: %s" % [Race.keys()[evolve]])
			print("Inheritance Type: %s" % [Type.keys()[inheritance]])
		
		if debug != Debug.NONE:
			print("=====ASSIGNING BASE STATS=====")
			
		St			= base.St
		Ma			= base.Ma
		En			= base.En
		Ag			= base.Ag
		Lu			= base.Lu
		MHP			= base.MHP
		MSP			= base.MSP
		HP			= MHP
		SP			= MSP
		Lv			= base.Lv
		Exp			= base.Exp
		
		if debug == Debug.VERBOSE:
			print("St: %d\nMa: %d\nEn: %d\nAg: %d" % [St, Ma, En, Ag])
			print("Lu: %d\nMHP: %d\nMSP: %d\nLv: %d" % [Lu, MHP, MSP, Lv])
			
		if debug != Debug.NONE:
			print("=====ASSIGNING STAT RATIOS=====")
		#find stat ratios
		var stat_total = St + Ma + En + Ag + Lu
		rSt			= base.rSt
		rMa			= base.rMa
		rEn			= base.rEn
		rAg			= base.rAg
		rLu			= base.rLu
		
		if debug == Debug.VERBOSE:
			print("Stat Total: %d" % [stat_total])
			print("rSt: %f\nrMa: %f\nrEn: %f\nrAg: %f\nrLu: %f" % [rSt, rMa, rEn, rAg, rLu])
		
		if debug != Debug.NONE:
			print("=====ASSIGNING ELEMENTAL AFFINITIES=====")
			
		for i in range(aff.size()):
			aff[i] = base.aff[i]
			
			if debug == Debug.VERBOSE:
				print("%s: %s" % [Type.keys()[i], Affinity.keys()[aff[i]]])

		if debug != Debug.NONE:
			print("=====ASSIGNING SKILLS AND TRAIT=====")
			
		ability = base.ability
		
		for j in range(base.move_pool.size()):
			move_pool.append(base.move_pool[j])
			
			if debug == Debug.VERBOSE:
				print("Skill %d: %s" % [j, move_pool[j].disp_name])
		if debug == Debug.VERBOSE:
			print("Trait: %s" % [Trait.keys()[ability]])
			
		#create learnset
		#create lists of learnset levels and skills
		learnset = base.learnset
		
	#endregion
