local GBR_LCSL = ArmedBoat:New{
	name					= "LCS(L) Mk. 2",
	description				= "Landing Craft Support",
	acceleration			= 0.025,
	brakeRate				= 0.01,
	buildCostMetal			= 2900,
	buildTime				= 2900,
	collisionVolumeOffsets	= [[0.0 -16.0 0.0]],
	collisionVolumeScales	= [[35.0 18.0 240.0]],
	corpse					= "GBRLCSL_dead",
	mass					= 8400,
	maxDamage				= 8400,
	maxReverseVelocity		= 0.6,
	maxVelocity				= 1.4,
	movementClass			= "BOAT_LightPatrol",
	objectName				= "GBRLCSL.s3o",
	transportCapacity		= 5, -- 5 x 1fpu turrets
	turnRate				= 240,	
	weapons = {	
		[1] = { -- give primary weapon for ranging
			name				= "qf6pdr57mmap",
			onlyTargetCategory	= "OPENVEH HARDVEH SHIP LARGESHIP TURRET",
		},
	},
	customparams = {
		soundcategory		= "GBR/Boat",
		children = {
			"GBR_LCSL_Turret_4inMortar",
			"GBR_LCSL_Turret_6pdr",
			"GBR_LCSL_Turret_20mm_Left",
			"GBR_LCSL_Turret_20mm_Right",
			"GBR_LCSL_Turret_Vickers50",
		},
		deathanim = {
			["z"] = {angle = 30, speed = 15},
		},
	},
}

local GBR_LCSL_Turret_4inMortar = OpenBoatTurret:New{
	name					= "4in Smoke Mortar",
	description				= "Smoke Launcher",
	objectName				= "GBRLCSL_Turret_4inMortar.s3o",
  	weapons = {	
		[1] = {
			name				= "BL4inMortarSmoke",
			maxAngleDif			= 270,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH SHIP LARGESHIP DEPLOYED OPENVEH HARDVEH", 
		},
	},
	customparams = {
		maxammo					= 10,
		weaponcost				= 10,
		weaponswithammo			= 1,
		turretturnspeed			= 30,
		elevationspeed			= 20,
    },
}


local GBR_LCSL_Turret_Vickers50 = OpenBoatTurret:New{
	name					= "Vickers 50cal Turret",
	description				= "Heavy Machinegun Turret",
	objectName				= "GBRLCSL_Turret_Vickers50.s3o",
	weapons = {	
		[1] = {
			name				= "twin05calVickers", -- needs a single version
			onlyTargetCategory	= "INFANTRY SOFTVEH AIR OPENVEH TURRET",
			maxAngleDif			= 270,
			mainDir				= [[0 0 -1]],
		},
		[2] = {
			name				= "twin05calVickers", -- needs a single version
			onlyTargetCategory	= "INFANTRY SOFTVEH AIR OPENVEH TURRET",
			maxAngleDif			= 270,
			slaveTo				= 1,
		},
	},
	customparams = {
		--barrelrecoildist		= 1,
		--barrelrecoilspeed		= 10,
		turretturnspeed			= 45,
		elevationspeed			= 45,
		facing 					= 2,
	},
}

local GBR_LCSL_Turret_6pdr = EnclosedBoatTurret:New{
	name					= "6Pdr Turret",
	description				= "Primary Turret",
	objectName				= "GBRLCSL_Turret_6pdr.s3o",
  	weapons = {	
		[1] = {
			name				= "qf6pdr57mmhe",
			maxAngleDif			= 270,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH  DEPLOYED",
		},
		[2] = {
			name				= "qf6pdr57mmap",
			maxAngleDif			= 270,
			onlyTargetCategory	= "OPENVEH HARDVEH SHIP LARGESHIP TURRET",
		},
	},
	customparams = {
		maxammo					= 10,
		weaponcost				= 10,
		weaponswithammo			= 2,

		barrelrecoildist		= 7,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 30,
		elevationspeed			= 20,
		aaweapon				= 2, -- TODO: rename to something more generic e.g. masterweapon
    },
}


local GBR_LCSL_Turret_20mm_Left = OpenBoatTurret:New{
	name					= "Oerlikon 20mm Turret",
	description				= "20mm AA Turret",
	objectName				= "GBRLCSL_Turret_20mm.s3o",
	weapons = {	
		[1] = {
			name				= "Oerlikon20mmaa",
			onlyTargetCategory	= "AIR",
			maxAngleDif			= 180,
			mainDir				= [[1 0 0]],
		},
		[2] = {
			name				= "Oerlikon20mmhe",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED",
			maxAngleDif			= 150,
			mainDir				= [[1 0 0]],
		},
	},
	customparams = {
		maxammo					= 14,
		weaponcost				= 4,
		weaponswithammo			= 2,

		barrelrecoildist		= 2,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 45,
		elevationspeed			= 45,
		aaweapon				= 1,
		facing 					= 3,
	},
}
local GBR_LCSL_Turret_20mm_Right = GBR_LCSL_Turret_20mm_Left:New{
	weapons = {	
		[1] = {
			mainDir				= [[-1 0 0]],
		},
		[2] = {
			mainDir				= [[-1 0 0]],
		},
	},
	customparams = {
		facing 					= 1,
	},
}


return lowerkeys({
	["GBRLCSL"] = GBR_LCSL,
	["GBR_LCSL_Turret_4inMortar"] = GBR_LCSL_Turret_4inMortar,
	["GBR_LCSL_Turret_Vickers50"] = GBR_LCSL_Turret_Vickers50,
	["GBR_LCSL_Turret_6pdr"] = GBR_LCSL_Turret_6pdr,
	["GBR_LCSL_Turret_20mm_Left"] = GBR_LCSL_Turret_20mm_Left,
	["GBR_LCSL_Turret_20mm_Right"] = GBR_LCSL_Turret_20mm_Right,
})
