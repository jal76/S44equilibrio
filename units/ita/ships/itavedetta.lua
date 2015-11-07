local ITA_Vedetta = ArmedBoat:New{
	name					= "Classe Vedetta",
	description				= "Patrol Gunboat",
	acceleration			= 0.075,
	brakeRate				= 0.05,
	buildCostMetal			= 2800,
	buildTime				= 2800,
	collisionVolumeOffsets	= [[0.0 -12.5 0.0]],
	collisionVolumeScales	= [[24.0 11.0 150.0]],
	corpse					= "ITAVedetta_dead",
	mass					= 6000,
	maxDamage				= 6000,
	maxReverseVelocity		= 0.7,
	maxVelocity				= 1.56,
	movementClass			= "BOAT_LightPatrol",
	objectName				= "ITAVedetta.s3o",
	transportCapacity		= 4, -- 4 x 1fpu turrets
	turnRate				= 140,	
	weapons = {	
		[1] = { -- give primary weapon for ranging
			name				= "Ansaldo76mmL40HE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED",
		},
	},
	customparams = {
		soundcategory		= "ITA/Boat",
		children = {
			"ITA_Vedetta_Turret_76mm", 
			"ITA_Vedetta_Turret_MG", 
			"ITA_Vedetta_Turret_MG", 
			"ITA_Vedetta_Turret_MG", 
		},
		--[[deathanim = {
			["z"] = {angle = -30, speed = 10},
		},]]
	},
}

local ITA_Vedetta_Turret_76mm = OpenBoatTurret:New{
	name					= "76mm Turret",
	description				= "Primary Turret",
	objectName				= "ITAVedetta_Turret_76mm.s3o",
	weapons = {	
		[1] = {
			name				= "Ansaldo76mmL40HE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED",
		},
	},
	customparams = {
		maxammo					= 16,
		weaponcost				= 12,
		weaponswithammo			= 1,
		barrelrecoildist		= 7,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 15,
		elevationspeed			= 15,
	},
}

local ITA_Vedetta_Turret_MG = OpenBoatTurret:New{
	name					= "MG Turret",
	description				= "Heavy Machinegun Turret",
	objectName				= "ITAVedetta_Turret_MG.s3o",
	weapons = {	
		[1] = {
			name				= "BredaM1931AA",
			onlyTargetCategory	= "AIR",
			maxAngleDif			= 200,
			mainDir		= [[0 0 -1]],
		},
		[2] = {
			name				= "BredaM1931",
			onlyTargetCategory	= "INFANTRY SOFTVEH AIR OPENVEH TURRET",
			maxAngleDif			= 200,
			mainDir		= [[0 0 -1]],
		},
	},
	customparams = {
		--barrelrecoildist		= 1,
		--barrelrecoilspeed		= 10,
		turretturnspeed			= 60,
		elevationspeed			= 60,
		facing					= 2,
		aaweapon				= 1,
	},
}


return lowerkeys({
	["ITAVedetta"] = ITA_Vedetta,
	["ITA_Vedetta_Turret_76mm"] = ITA_Vedetta_Turret_76mm,
	["ITA_Vedetta_Turret_MG"] = ITA_Vedetta_Turret_MG,
})
