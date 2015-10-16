-- Artillery - Rocket Artillery

-- Rocket Artillery Base Class
local ArtyRocketClass = Weapon:New{
  avoidFeature		 = false,
  cegTag             = [[RocketTrail]],
  commandfire        = true,
  edgeEffectiveness  = 0.1,
  explosionSpeed     = 30,
  flightTime         = 10,
  gravityaffected    = true,
  impulseFactor      = 0,
  model              = [[KatyushaRocket.S3O]],
  reloadtime         = 45,
  soundHitDry        = [[GEN_Explo_5]],
  soundTrigger       = false,
  startVelocity      = 10,
  targetMoveError    = 0.1,
  tolerance          = 2000,
  trajectoryHeight   = 0.5,
  turret             = true,
  weaponAcceleration = 2000,
  weaponTimer        = 1,
  weaponType         = [[MissileLauncher]],
  weaponVelocity     = 1400,
  customparams = {
    armor_hit_side     = [[top]],
    damagetype         = [[explosive]],
    fearaoe            = 200,
    fearid             = 501,
    howitzer           = 1,
	cegflare           = "dirt_backblast",
	flareonshot        = true,
  },
}

-- Implementations

-- Nebelwerfer 41 150mm (GER)
local Nebelwerfer41 = ArtyRocketClass:New{
  areaOfEffect       = 184,
  burst              = 6,
  burstrate          = 0.8,
  explosionGenerator = [[custom:HE_XLarge]],
  name               = [[Nebelwerfer 41 150mm unguided artillery rocket]],
  range              = 4770,
  soundStart         = [[GER_Nebelwerfer]],
  wobble             = 1300,
  damage = {
    default            = 5525,
  },
}

-- M-13 132mm (RUS)
local M13132mm = ArtyRocketClass:New{
  areaOfEffect       = 122,
  burst              = 16,
  burstrate          = 0.6,
  explosionGenerator = [[custom:HE_Large]],
  name               = [[M-13 132mm unguided artillery rocket]],
  range              = 4555,
  soundStart         = [[RUS_Katyusha]],
  wobble             = 1500,
  damage = {
    default            = 5525,
  },
}

-- M-8 82mm (RUS)
local m8rocket82mm = ArtyRocketClass:New{
  areaOfEffect       = 60,
  burst              = 8,
  burstrate          = 0.3,
  explosionGenerator = [[custom:HE_Large]],
  name               = [[M-8 82mm unguided artillery rocket]],
  range              = 2965,
  soundStart         = [[RUS_Katyusha]],
  wobble             = 1618,
  damage = {
    default            = 980,
  },
}

-- Beach Barrage Rocket
local BBR_Rack = ArtyRocketClass:New{
	areaOfEffect	= 100,
	burst		= 12,
	burstrate	= 0.5,
	explosionGenerator = [[custom:HE_Large]],
  	model              = [[Rocket_HVAR.S3O]],
	name               = [[4.5" Beach Barrage Rocket Mk 7 Launcher]],
	range              = 950,
  	startVelocity      = 600,
	tolerance          = 1500,
	soundStart         = [[GER_Panzerschrek]],
	wobble             = 2000,
	damage = {
		default            = 2500,
	},
}

-- Type 4 200mm rocket mortar (JPN)
local Type4RocketMortarHE = ArtyRocketClass:New{
  areaOfEffect       = 203,
  reloadtime         = 20,
  explosionGenerator = [[custom:HE_XLarge]],
  name               = [[Type 4 200mm unguided artillery rocket]],
  range              = 3200,
  soundStart         = [[GER_Nebelwerfer]],
  wobble             = 1300,
  damage = {
    default            = 6000,
  },
}

local Type4RocketMortarSmoke = ArtyRocketClass:New{
  areaOfEffect       = 30,
  reloadtime         = 20,
  customparams = {
    smokeradius        = 350,
    smokeduration      = 50,
    smokeceg           = [[SMOKESHELL_Medium]],
  },
  name               = [[Type 4 200mm unguided artillery smoke rocket]],
  range              = 3200,
  soundStart         = [[GER_Nebelwerfer]],
  wobble             = 1300,
  damage = {
    default            = 100,
  },
}

-- Return only the full weapons
return lowerkeys({
  Nebelwerfer41 = Nebelwerfer41,
  M13132mm = M13132mm,
  m8rocket82mm = m8rocket82mm,
  BBR_Rack = BBR_Rack,
  Type4RocketMortarHE = Type4RocketMortarHE,
  Type4RocketMortarSmoke = Type4RocketMortarSmoke,
})
