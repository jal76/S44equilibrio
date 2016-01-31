local RUS_Tender15t = Boat:New{
	name					= "15-ton Tender",
	description				= "Infantry Landing Craft",
	acceleration			= 0.15,
	brakeRate				= 0.14,
	buildCostMetal			= 600,
	buildTime				= 600,
	--collisionVolumeOffsets	= [[0.0 -30.0 0.0]],
	--collisionVolumeScales	= [[60.0 50.0 220.0]],
	corpse					= "RUSTender15t_dead",
	iconType				= "landingship",
	mass					= 1360,
	maxDamage				= 1360,
	maxReverseVelocity		= 1.1,
	maxVelocity				= 2.2,
	movementClass			= "BOAT_LandingCraftSmall",
	objectName				= "RUSTender15t.s3o",
	transportCapacity		= 20,
	transportMass			= 1000,
	transportSize			= 1,
	turnRate				= 220,	
	weapons = {	
		[1] = {
			name				= "dshk",
			maxAngleDif			= 270,
			onlyTargetCategory	= "INFANTRY SOFTVEH AIR OPENVEH HARDVEH SHIP LARGESHIP DEPLOYED",
		},
	},
	customparams = {
		smokegenerator		=	1,
		smokeradius		=	120,
		smokeduration		=	320,
		smokecooldown		=	130,
		smokeceg		=	"SMOKESHELL_Medium",
		soundCategory			= "RUS/Boat",
		killvoicecategory		= "RUS/Boat/RUS_BOAT_KILL",
		killvoicephasecount		= 3,
		transportsquad			= "rus_platoon_tender",
		supplyRange				= 350,
		--[[ enable me later when using LUS
		deathanim = {
			["z"] = {angle = -30, speed = 10},
		},]]
	},
	sfxtypes = { -- remove once using LUS
		explosionGenerators = {
			"custom:MG_MUZZLEFLASH",
		},
	},
}


return lowerkeys({
	["RUSTender15t"] = RUS_Tender15t,
})
