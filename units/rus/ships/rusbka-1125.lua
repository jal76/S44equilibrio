local RUS_BKA_1125 = ArmedBoat:New{
	name					= "Pr.1125 Armored Boat",
	description				= "Armoured river gunboat",
	acceleration			= 0.05,
	brakeRate				= 0.025,
	buildCostMetal			= 3500,
	buildTime				= 3500,
	collisionVolumeOffsets	= [[0.0 -6.0 0.0]],
	collisionVolumeScales	= [[24.0 12.0 160.0]],
	corpse					= "RUSBKA-1125_dead",
	mass					= 2660,
	maxDamage				= 2660, --+25% because it has armor
	maxReverseVelocity		= 0.9,
	maxVelocity				= 1.8,
	movementClass			= "BOAT_RiverSmall",
	objectName				= "RUSBKA1125.s3o",
	transportCapacity		= 4, -- 4 x 1fpu turrets
	turnRate				= 250,	
	
	weapons = {	
		[1] = { -- give primary weapon for ranging
			name				= "F3476mmHE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
	},
	customparams = {
		damageGroup			= 'armoredboat',
		soundCategory			= "RUS/Boat",
		killvoicecategory		= "RUS/Boat/RUS_BOAT_KILL",
		killvoicephasecount		= 3,
        	children = {
			"RUS_BKA_1125_turret_76mm", 
			"RUS_BKA_1125_Turret_DshK_Front", 
			"RUS_BKA_1125_Turret_DshK_Top", 
			"RUS_BKA_1125_Turret_DshK_Rear"
		},
		deathanim = {
			["x"] = {angle = -5, speed = 5},
		},
	},
}

local RUS_BKA_1125_Turret_76mm = EnclosedBoatTurret:New{
	name					= "Pr.1125 76mm Turret",
	description				= "Primary Turret",
	objectName				= "RUSBKA1125_76mm.s3o",
  	weapons = {	
		[1] = {
			name				= "F3476mmHE",
			maxAngleDif			= 300,
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
			mainDir				= [[0 0 1]],
		},
	},
	customparams = {
		maxammo					= 12,
		weaponcost				= 12,
		weaponswithammo			= 1,

		barrelrecoildist		= 5,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 15,
		elevationspeed			= 20,
    },
}

local RUS_BKA_1125_Turret_DshK = EnclosedBoatTurret:New{
	name					= "Pr.1125 DshK Turret",
	description				= "Heavy Machinegun Turret",
	objectName				= "RUSBKA1125_DshK.s3o",
	weapons = {	
		[1] = {
			name				= "dshk",
			onlyTargetCategory	= "INFANTRY SOFTVEH OPENVEH TURRET",
		},
	},
	customparams = {
		barrelrecoildist		= 1,
		barrelrecoilspeed		= 10,
		turretturnspeed			= 30,
		elevationspeed			= 45,
	},
}

local RUS_BKA_1125_Turret_DshK_Front = RUS_BKA_1125_Turret_DshK:New{
	weapons = {
		[1] = {
			maxAngleDif			= 270,
			mainDir		= [[0 0 1]],
		},
	},
}

local RUS_BKA_1125_Turret_DshK_Top = RUS_BKA_1125_Turret_DshK:New{
	weapons = {
		[1] = {
			maxAngleDif			= 358,
			mainDir		= [[0 0 1]],
		},
	},
}

local RUS_BKA_1125_Turret_DshK_Rear = RUS_BKA_1125_Turret_DshK:New{
	weapons = {
		[1] = {
			maxAngleDif			= 270,
			mainDir		= [[0 0 -1]],
		},
	},
	customparams = {
		facing = 2,
	},
}

return lowerkeys({
	["RUSBKA-1125"] = RUS_BKA_1125,
	["RUS_BKA_1125_Turret_76mm"] = RUS_BKA_1125_Turret_76mm,
	["RUS_BKA_1125_Turret_DshK_Front"] = RUS_BKA_1125_Turret_DshK_Front,
	["RUS_BKA_1125_Turret_DshK_Top"] = RUS_BKA_1125_Turret_DshK_Top,
	["RUS_BKA_1125_Turret_DshK_Rear"] = RUS_BKA_1125_Turret_DshK_Rear,
})
