-- Smallarms - Infantry Grenades

-- Grenade Base Class
local GrenadeClass = Weapon:New{
  canAttackGround    = false,
  explosionSpeed     = 30,
  groundBounce       = true,
  id                 = 31, -- used?
  impulseFactor      = 0,
  model              = [[MortarShell.S3O]],
  targetBorder       = 1,
  tolerance          = 10000,
  turret             = true,
  --weaponTimer        = 5,
  weaponType         = [[Cannon]],
  weaponVelocity     = 200,
}

-- Anti-Personel Grenade Class
local APGrenadeClass = GrenadeClass:New{
  edgeEffectiveness  = 0.05,
  explosionGenerator = [[custom:HE_Small]],
  movingAccuracy     = 300,
  bounceRebound      = 0.15,
  bounceSlip         = 0.1,
  numBounce	     = 10,
  collideEnemy     = false,
  collideFriendly  = false,
  range              = 180,
  reloadtime         = 8,
  soundHitDry        = [[GEN_Explo_Grenade]],
  customparams = {
    armor_penetration  = 30, -- more than AT nades??
    damagetype         = [[grenade]],
  },
  damage = {
    default            = 1450,
  },
}

-- Anti-Tank Grenade Class
local ATGrenadeClass = GrenadeClass:New{
  edgeEffectiveness  = 0.5,
  explosionGenerator = [[custom:HE_Medium]],
  movingAccuracy     = 300,
  range              = 230,
  reloadTime         = 5,
  predictBoost       = 0.5,
  soundHitDry        = [[GEN_Explo_3]],
  customparams = {
    damagetype         = [[shapedcharge]],
  },
}

-- Smoke Grenade Class
local SmokeGrenadeClass = GrenadeClass:New{
  areaOfEffect       = 20,
  canAttackGround    = true,
  commandFire        = true,
  range              = 200,
  reloadTime         = 15,
  customparams = {
    nosmoketoggle      = true,
	smokeradius        = 160,
	smokeduration      = 25,
	smokeceg           = [[SMOKESHELL_Small]],
  },
  damage = {
    default = 10,
  } ,
}

-- Implementations
-- AP Nades
-- No. 69 Mills Bomb (GBR)
local No69 = APGrenadeClass:New{
  accuracy           = 142,
  areaOfEffect       = 20,
  name               = [[No. 69 Hand Grenade]],
}

-- Model 24 (GER)
local Model24 = APGrenadeClass:New{
  accuracy           = 125,
  areaOfEffect       = 15,
  edgeEffectiveness  = 0.5, -- intended?
  name               = [[Model 24 Stielhandgranate]],
  range              = 200,
  reloadtime         = 6.5, -- intended?
  weaponVelocity     = 210, -- intended?
  damage = {
    default            = 1725,
  },
}

-- Mk. 2 (USA)
local Mk2 = APGrenadeClass:New{
  accuracy           = 177,
  areaOfEffect       = 25,
  name               = [[Mk. 2 Hand Grenade]],
  weaponVelocity     = 310, -- intended?
}

-- F1 (RUS)
-- this is new, currently unused, stas copied from No.69
local F1 = APGrenadeClass:New{
  accuracy           = 142,
  areaOfEffect       = 20,
  name               = [[F-1 Hand Grenade]],
}

-- OTO Model 35 (ITA)
local OTO_model35 = APGrenadeClass:New{
  accuracy           = 102,
  areaOfEffect       = 19,
  name               = [[italian Grenade]],
  range              = 200,
  customparams = {
    armor_penetration  = 25, 
  },
  damage = {
    default            = 880,
  },
}

-- Type 99 AP Grenade (JPN)
local Type99Grenade = APGrenadeClass:New{
  accuracy           = 122,
  areaOfEffect       = 19,
  name               = [[Type 99 Grenade]],
}



-- AT nades
-- RPG-43 AT Nade (RUS)
local RPG43 = ATGrenadeClass:New{
  accuracy           = 100,
  areaOfEffect       = 12,
  name               = [[RPG-43 Anti-Tank Grenade]],
  customparams = {
    armor_penetration  = 75,
  },
  damage = {
    default            = 4896,
  },  
}

-- Model 42 AT Grenade (ITA)
local BredaMod42 = ATGrenadeClass:New{
  areaOfEffect       = 31,
  name               = [[Breda Anti-Tank Grenade]],
  reloadtime         = 9,
  damage = {
    default            = 2780,
  },
    customparams = {
    damagetype         = [[explosive]],
    howitzer	= true,
  },
}

-- L-type heavy AT grenade (ITA)
local L_type_grenade = ATGrenadeClass:New{
  areaOfEffect       = 33,
  name               = [[Italian Anti-Tank Stickgrenade]],
  reloadtime         = 12, 
  damage = {
    default            = 4080,
  },
    customparams = {
    damagetype         = [[explosive]],
    howitzer	= true,
  },
}

-- Type 3 AT Grenade (JPN)
local Type3AT = ATGrenadeClass:New{
  accuracy           = 100,
  areaOfEffect       = 12,
  name               = [[Type 3 Anti-Tank Grenade]],
  customparams = {
    armor_penetration  = 70,
  },
  damage = {
    default            = 4206,
  },  
}

-- Smoke nades
-- No. 77 WP (GBR)
local No77 = SmokeGrenadeClass:New{
  accuracy           = 1421,
  name               = [[No. 77 Smoke Grenade]],
}

-- Other nades
local Molotov = GrenadeClass:New{
  areaOfEffect       = 40,
  canattackground    = true, -- intended?
  cegTag             = [[Flametrail]],
  explosionGenerator = [[custom:Molotov]],
  explosionSpeed     = 0.01, -- needed?
  fireStarter        = 100,
  groundBounce       = false,
  name               = [["Molotov Cocktail"]],
  range              = 180,
  reloadTime         = 10,
  tolerance          = 200,
  weaponVelocity     = 260,
  customparams = {
	damagetype         = [[fire]],
	fearaoe            = 1,
	fearid             = 1,
	damagetime         = 25,
	ceg                = [[Molotov]],
  },
  damage = {
    default            = 15,
	lightbuildings     = 400,
  },  
}

-- Return only the full weapons
return lowerkeys({
  -- AP nades
  No69 = No69,
  Model24 = Model24,
  Mk2 = Mk2,
  F1 = F1,
  OTO_model35 = OTO_model35,
  Type99Grenade = Type99Grenade,
  -- AT nades
  RPG43 = RPG43,
  BredaMod42 = BredaMod42,
  L_type_grenade = L_type_grenade,
  Type3AT = Type3AT,
  -- Smoke nades
  No77 = No77,
  -- Other
  Molotov = Molotov,
})
