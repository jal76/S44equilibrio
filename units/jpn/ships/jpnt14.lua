local JPNT14 = ArmedBoat:New{
	name					= "Type T-14 Motor Torpedo Boat",
	description				= "Motor Torpedo Boat",
	acceleration			= 0.9,
	brakeRate				= 0.15,
	buildCostMetal			= 1800,
	buildTime				= 1800,
	collisionVolumeOffsets	= [[0.0 -10.0 -5.0]],
	collisionVolumeScales	= [[22.0 20.0 85.0]],
	corpse					= "GERSBoot_dead", -- TODO: needs a corpse (model exists)
	mass					= 1450,
	maxDamage				= 1450,
	maxReverseVelocity		= 3.005,
	maxVelocity				= 6.01,
	movementClass			= "BOAT_LightPatrol",
	objectName				= "JPNT14.s3o",
	transportCapacity		= 1, -- 1 x 1fpu turrets
	turnRate				= 205,	
	weapons = {	
		[1] = {
			name				= "Type9625mmHE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
	},
	customparams = {
		soundcategory = "JPN/Boat",
		children = {
			"JPNT14_Turret_25mm",
		},
		deathanim = {
			["z"] = {angle = 45, speed = 15},
		},
	},
}

local JPNT14_Turret_25mm = OpenBoatTurret:New{
	name					= "25mm Turret",
	description				= "25mm AA Turret",
	objectName				= "JPNT14_Turret_25mm.s3o",
  	weapons = {	
		[1] = {
			name				= "Type9625mmAA",
			onlyTargetCategory	= "AIR",
		},
		[2] = {
			name				= "Type9625mmHE",
			onlyTargetCategory	= "BUILDING INFANTRY SOFTVEH OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED TURRET",
		},
	},
	customparams = {
		maxammo					= 14,
		weaponcost				= 4,
		weaponswithammo			= 2,

		barrelrecoildist		= 4,
		barrelrecoilspeed		= 20,
		turretturnspeed			= 90,
		elevationspeed			= 80,
		aaweapon				= 1,
    },
}

return lowerkeys({
	["JPNT14"] = JPNT14,
	["JPNT14_Turret_25mm"] = JPNT14_Turret_25mm,
})
