-- Aircraft - Bombs

-- Bomb Base Class
local BombClass = Weapon:New{
  collideFriendly    = true,
  explosionSpeed     = 30,
  explosionGenerator = [[custom:HE_XXLarge]],
  heightBoostFactor  = 0,
  impulseFactor      = 0.01,
  leadlimit	     = 400,
  noSelfDamage	     = true,
  targetBorder		= 1,
  reloadtime         = 600,
  tolerance          = 5000,
  turret             = true,
  weaponType         = [[Cannon]],
  weaponVelocity     = 200,
  highTrajectory     = 0,
  customparams = {
    no_range_adjust	   = true,
    damagetype         = [[explosive]],
  },
}
-- Delayedbomb
local BasebombClass = BombClass:New{
  accuracy           = 2000,
  commandfire        = true,
  groundBounce	     = true,
  burnblow	     = false,
  collideEnemy     = false,
  model              = [[Bomb_Medium.S3O]],
  soundHitDry        = [[GEN_Explo_9]],
  bounceRebound	     = 0.1,
  bounceSlip	     = 0.1,
  numBounce	     = 20,
}

-- Implementations

-- 250Kg Bomb (Generic)
local Bomb = BasebombClass:New{
  areaOfEffect       = 200,
  commandfire        = true,
  edgeEffectiveness  = 0.1,
  name               = [[250kg Bomb]],
  range              = 500,
  damage = {
    default            = 30000,
  },
}

-- 160Kg Bomb (Generic)
local Bomb160kg = BasebombClass:New{
  areaOfEffect       = 160,
  name               = [[160kg Bomb]],
  model              = [[Bomb_Medium.S3O]],
  range              = 450,
  commandfire        = false,
    damage = {
    default            = 15000,
    },
}

-- 50Kg Bomb (Generic)
local Bomb50kg = BombClass:New{
  name               = [[50kg Bomb]],
  model              = [[Bomb_Medium.S3O]],
  size		     = 1,
  accuracy           = 200,
  tolerance          = 600,	
  areaOfEffect       = 76,
  heightMod		= 0.2,
  mygravity	= 0.05,
    damage = {
    default            = 7500,
	planes		= 5,
    },
  range              = 150,
  explosionGenerator = [[custom:HE_Large]],
  soundHit           = [[GEN_Explo_5]],
}

-- V1 Missile Explosions (GER)
local V1 = BombClass:New{
  areaOfEffect       = 202,
  name               = [[V1 Missile]],
  soundHitDry        = [[GEN_Explo_9]],
  damage = {
    default            = 28000,
  },
}

-- PTAB "Antitank Aviation Bomb" (RUS)
local PTAB = BombClass:New{
  areaOfEffect       = 24,
  burst              = 36,
  burstrate          = 0.1,
  edgeEffectiveness  = 0.5,
  explosionGenerator = [[custom:HE_medium]], -- overrides default
  model              = [[MortarShell.S3O]],
  weaponVelocity     = 150,
  name               = [[PTAB Anti-Tank Bomblets]],
  projectiles        = 8,
  range              = 500,
  soundHitDry        = [[GEN_Explo_3]],
  sprayangle         = 7000,
  customparams = {
    armor_hit_side     = [[top]],
    armor_penetration  = 65,
    damagetype         = [[shapedcharge]], -- overrides default
  },
  damage = {
    default            = 4896, -- Same damage as RPG43, but in fact it had nearly 3 time more weight of explosive than rpg43. Nerfed for balance.
    infantry           = 50, -- I have no idea how effective it should be vs infantry. Nerfed to avoid usages different of historical usage.
    lightBuildings     = 75, -- Nerfed to avoid usages different of historical usage. Still very effective vs storages.
    bunkers            = 500,
	},
  }
--  3.5kg Hollow Charge Bomblet (ITA)
local A_tkbomb = BombClass:New{
  areaOfEffect       = 26,
  burst              = 7,
  burstrate          = 0.15,
  edgeEffectiveness  = 0.5,
  explosionGenerator = [[custom:HE_medium]], -- overrides default
  model              = [[MortarShell.S3O]],
  weaponVelocity     = 250,
  name               = [[3.5kg Hollow Charge A-tk Anti-Tank Bomblets]],
  projectiles        = 3,
  range              = 500,
  soundHitDry        = [[GEN_Explo_3]],
  sprayangle         = 3000,
  customparams = {
    armor_hit_side     = [[top]],
    armor_penetration  = 70,
    damagetype         = [[shapedcharge]], -- overrides default
  },
  damage = {
    default            = 4406, 
    infantry           = 50, -- I have no idea how effective it should be vs infantry. Nerfed to avoid usages different of historical usage.
    lightBuildings     = 75, -- Nerfed to avoid usages different of historical usage. Still very effective vs storages.
    bunkers            = 500,
  }
}
--  12 kg anti-personnel Bomb Type F  (ITA)
local TypeF12kg = BasebombClass:New{
  areaOfEffect       = 94,
  explosionSpeed     = 8,
  impulseFactor      = 0.0,
  burst              = 2,
  burstrate          = 0.25,
  edgeEffectiveness  = 0.05,
  explosionGenerator = [[custom:HE_small]], -- overrides default
  weaponVelocity     = 250,
  name               = [[12kg Fragmentation Bomblets]],
  projectiles        = 2,
  range              = 500,
  model              = [[Bomb_small.S3O]],
  soundHitDry        = [[GEN_Explo_3]],
  sprayangle         = 3000,
  customparams = {
    damagetype         = [[explosive]], -- overrides default
  },
  damage = {
    default            = 600, 
  }
}
-- Return only the full weapons
return lowerkeys({
  Bomb = Bomb,
  Bomb160kg = Bomb160kg,
  Bomb50kg = Bomb50kg,
  PTAB = PTAB,
  A_tkbomb = A_tkbomb,
  TypeF12kg = TypeF12kg,
  V1 = V1,
})
