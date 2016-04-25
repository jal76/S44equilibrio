local JPN_Seta = ArmedBoat:New{
	name					= "Seta-class Gunboat",
	description				= "Large river gunboat",
	acceleration			= 0.05,
	brakeRate				= 0.025,
	buildCostMetal			= 9000,
	buildTime				= 9000,
	collisionVolumeOffsets	= [[0.0 -8.0 0.0]],
	collisionVolumeScales	= [[24.0 12.0 160.0]],
	corpse					= "JPNSeta_dead",
	mass					= 30800,
	maxDamage				= 30800,
	maxReverseVelocity		= 0.7,
	maxVelocity				= 1.6,
	movementClass			= "BOAT_RiverSmall",
	objectName				= "JPNSeta.s3o",
	transportCapacity		= 4, -- 4 x 1fpu turrets
	turnRate				= 250,	
	
	weapons = {	
		[1] = { -- give primary weapon for ranging
			name				= "Type376mmL40HE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
	},
	customparams = {
		smokegenerator		=	1,
		smokeradius		=	400,
		smokeduration		=	320,
		smokecooldown		=	130,
		smokeceg		=	"SMOKESHELL_Medium",
		soundcategory = "JPN/Boat",
		children = {
			"JPN_Seta_turret_76mm_front",
			"JPN_Seta_turret_25mm",
			"JPN_Seta_turret_25mm",
			"JPN_Seta_turret_76mm_rear",
		},
		piecehitvols = {
			tower = {
				offset = { 0, 0, 10 },
				scale = { 1, 1, 0.65 }
			}
		}
		--[[deathanim = {
			["z"] = {angle = -10, speed = 45},
		},]]
	},
}

local JPN_Seta_Turret_76mm_Front = PartiallyEnclosedBoatTurret:New{
	name					= "Seta 76mm Turret",
	description				= "Primary Turret",
	objectName				= "JPNSeta_turret_76mm.s3o",
  	weapons = {	
		[1] = {
			name				= "Type376mmL40HE",
			maxAngleDif			= 270,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
	},
	customparams = {
		maxammo					= 16,
		weaponcost				= 12,
		weaponswithammo			= 1,

		barrelrecoildist		= 7,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 25,
		elevationspeed			= 15,
    },
}

local JPN_Seta_Turret_76mm_Rear = JPN_Seta_Turret_76mm_Front:New{
	weapons = {
		[1] = {
			mainDir		= [[0 0 -1]],
		},
	},
	customparams = {
		facing = 2,
	},
}

local JPN_Seta_Turret_25mm = OpenBoatTurret:New{
	name					= "Seta 25mm Turret",
	description				= "AA Turret",
	objectName				= "JPNSeta_turret_25mm.s3o",
  	weapons = {	
		[1] = {
			name				= "Type9625mmAA",
			maxAngleDif			= 270,
			mainDir		= [[0 0 -1]],
			badTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP DEPLOYED",
			onlyTargetCategory	= "AIR",
		},
		[2] = {
			name				= "Type9625mmAA",
			maxAngleDif			= 270,
			mainDir		= [[0 0 -1]],
			badTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP DEPLOYED",
			onlyTargetCategory	= "AIR",
			slaveTo				= 1,
		},
		[3] = {
			name				= "Type9625mmHE",
			mainDir		= [[0 0 -1]],
			maxAngleDif			= 270,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
		[4] = {
			name				= "Type9625mmHE",
			mainDir		= [[0 0 -1]],
			maxAngleDif			= 270,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
			slaveTo				= 3,
		},
	},
	customparams = {
		maxammo					= 14,
		weaponcost				= 4,
		weaponswithammo			= 2,

		barrelrecoildist		= 3,
		barrelrecoilspeed		= 20,
		turretturnspeed			= 60,
		elevationspeed			= 60,
		aaweapon				= 1,
    },
}


return lowerkeys({
	["JPNSeta"] = JPN_Seta,
	["JPN_Seta_Turret_76mm_Front"] = JPN_Seta_Turret_76mm_Front,
	["JPN_Seta_Turret_76mm_Rear"] = JPN_Seta_Turret_76mm_Rear,
	["JPN_Seta_Turret_25mm"] = JPN_Seta_Turret_25mm,
})
