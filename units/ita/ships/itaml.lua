local ITA_ML = Boat:New{
	name					= "Landing Craft, Assault",
	description				= "Infantry Landing Craft",
	acceleration			= 0.9,
	brakeRate				= 0.5,
	buildCostMetal			= 800,
	category 				= "LARGESHIP SHIP MINETRIGGER",
	buildTime				= 800,
	corpse					= "ITAML_dead",
	iconType				= "landingship",
	mass					= 1550,
	maxDamage				= 1550,
	maxReverseVelocity		= 0.685,
	maxVelocity				= 2,
	movementClass			= "BOAT_LandingCraftSmall",
	objectName				= "ITAML.s3o",
	transportCapacity		= 22,
	transportMass			= 1300,
	transportSize			= 1,
	turnRate				= 100,	
	weapons = {	
		[1] = {
			name				= "BredaM1931AA",
			onlyTargetCategory	= "AIR",
			mainDir				= [[0 0 1]],
			maxAngleDif			= 150,
		},
		[2] = {
			name				= "BredaM1931",
			onlyTargetCategory	= "INFANTRY OPENVEH SOFTVEH DEPLOYED SHIP LARGESHIP",
			mainDir				= [[0 0 1]],
			maxAngleDif			= 150,
		}
	},
	customparams = {
		smokegenerator		=	1,
		smokeradius		=	120,
		smokeduration		=	320,
		smokecooldown		=	130,
		smokeceg		=	"SMOKESHELL_Medium",
		soundCategory			= "ITA/Boat",
		transportsquad			= "ita_platoon_ml",
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
	["ITAML"] = ITA_ML,
})
