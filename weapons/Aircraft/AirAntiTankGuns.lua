-- Aircraft - Aircraft Anti-Tank Cannon

-- AirAntiTankGun Base Class
-- Currently assumes that we would not want to give such weapons HE
local AirATGunClass = Weapon:New{
  accuracy           = 300,
  avoidFriendly      = false,
  canattackground    = false,
  leadlimit	     = 400,
  heightBoostFactor  = 0,
  collisionSize      = 4,
  collideFriendly    = false,
  colormap           = [[ap_colormap.png]],
  edgeEffectiveness  = 0.1,
  explosionGenerator = [[custom:AP_Small]],
  explosionSpeed     = 100,
  gravityaffected    = true,
  impactonly         = 1,
  impulseFactor      = 0,
  intensity          = 0.25, -- probably not used with a colormap
  noSelfDamage       = true,
  rgbColor           = [[1.0 0.0 0.0]],
  separation         = 2,
  size               = 1,
  soundHitDry        = [[GEN_Explo_1]],
  stages             = 50,
  targetMoveError    = 0.1,
  tolerance          = 600,
  turret             = true,
  dynDamageInverted  = true,
  weaponType         = [[Cannon]],
  customparams = {
    no_range_adjust    = true,
    damagetype         = [[kinetic]],
  },
}

-- Implementations

-- Bordkanone BK 37 (GER)
local BK37mmAP = AirATGunClass:New{
  areaOfEffect       = 6,
  --burst              = 1,
  --burstrate          = 0.375,
  name               = [[BK-37 37mm Semi-Automatic Cannon]],
  range              = 800,
  reloadtime         = 0.35,
  soundStart         = [[US_37mm]],
  weaponVelocity     = 1768,
  customparams = {
    --constant penetration since aircraft engagement range can't be realistically controlled
    armor_penetration_1000m = 50,
    armor_penetration_100m = 70,
  },
  damage = {
    default            = 825,
  },
}

-- Ho-401 57mm HEAT (JPN)
local Ho40157mm = AirATGunClass:New{
  areaOfEffect       = 12,
  name               = [[Ho-401 57 mm HEAT]],
  range              = 660,
  reloadTime         = 0.95,
  soundStart         = [[RUS_45mm]],
  weaponVelocity     = 918,
  customparams = {
    armor_penetration  = 55,
    damagetype         = [[shapedcharge]],
  },
  damage = {
    default            = 2641,
  },
}

-- Return only the full weapons
return lowerkeys({
  BK37mmAP = BK37mmAP,
  Ho40157mm = Ho40157mm,
})
