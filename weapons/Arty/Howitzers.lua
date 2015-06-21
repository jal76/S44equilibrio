-- Artillery - Light Howitzers

-- Howitzer Base Class
local HowitzerClass = Weapon:New{
  avoidFeature		 = false,
  collisionSize      = 4,
  edgeEffectiveness  = 0.15,
  explosionGenerator = [[custom:HE_Large]],
  explosionSpeed     = 30,
  gravityAffected    = true,
  impulseFactor      = 0,
  intensity          = 0.1,
  leadLimit          = 0.05,
  noSelfDamage       = true,
  rgbColor           = [[0.5 0.5 0.0]],
  separation         = 2,
  size               = 1,
  soundStart         = [[GEN_105mm]],
  soundHitDry        = [[GEN_Explo_4]],
  stages             = 50,
  targetMoveError    = 0.75,
  tolerance          = 3000,
  turret             = true,
  weaponType         = [[Cannon]],
  weaponVelocity     = 1200,
  customparams = {
    damagetype         = [[explosive]],
    howitzer           = 1,
    cegflare           = "MEDIUM_MUZZLEFLASH",
  },
}

-- HE Round Class
local HowitzerHEClass = Weapon:New{
  name               = [[HE Shell]],
  customparams = {
    fearaoe            = 210,
    fearid             = 501,
  },
}

-- Smoke Round Class
local HowitzerSmokeClass = Weapon:New{
  areaOfEffect       = 30,
  name               = [[Smoke Shell]],
  customparams = {
    smokeradius        = 250,
    smokeduration      = 40,
    smokeceg           = [[SMOKESHELL_Medium]],
  },
  damage = {
    default = 100,
  } ,
}

-- Implementations

-- QF 25pdr Gun (GBR)
local QF25Pdr = HowitzerClass:New{
  accuracy           = 720,
  areaOfEffect       = 94,
  edgeEffectiveness  = 0.2, -- overrides default
  name               = [[Ordnance QF 25pdr Gun Mk. II]],
  range              = 7780,
  reloadtime         = 7.2,
  damage = {
    default            = 1088,
  },
}
local QF25PdrHE = QF25Pdr:New(HowitzerHEClass, true)
local QF25PdrSmoke = QF25Pdr:New(HowitzerSmokeClass, true)

-- 10.5cm LeFH 18/40 (GER)
local LeFH18 = HowitzerClass:New{
  accuracy           = 1050,
  areaOfEffect       = 129,
  name               = [[10.5cm LeFH 18/40]],
  range              = 7200,
  reloadtime         = 11.25,
  damage = {
    default            = 4200,
  },
}
local LeFH18HE = LeFH18:New(HowitzerHEClass, true)
local LeFH18Smoke = LeFH18:New(HowitzerSmokeClass, true)

-- M2 105mm Howitzer (USA)
local M2 = HowitzerClass:New{
  accuracy           = 1050,
  areaOfEffect       = 131,
  name               = [[10.5cm LeFH 18/40]],
  range              = 7200,
  reloadtime         = 11.25,
  damage = {
    default            = 4360,
  },
}
local M2HE = M2:New(HowitzerHEClass, true)
local M2Smoke = M2:New(HowitzerSmokeClass, true)

-- M-30 122mm Howitzer (RUS)
local M30122mm = HowitzerClass:New{
  accuracy           = 1150,
  areaOfEffect       = 154,
  name               = [[M-30 122mm Howitzer]],
  range              = 6965,
  reloadtime         = 15,
  damage = {
    default            = 7200,
  },
}
local M30122mmHE = M30122mm:New(HowitzerHEClass, true):New{
  customparams = {
    fearaoe            = 250,
  }
}
local M30122mmSmoke = M30122mm:New(HowitzerSmokeClass, true)

-- 100m howitzer L22 (ITA)
local Obice100mmL22 = HowitzerClass:New{
  accuracy           = 1050,
  areaOfEffect       = 115,
  name               = [[Obice 100mm/22 M14]],
  soundStart         = [[ITA_100mm]],
  range              = 7200,
  reloadtime         = 10.25,
  damage = {
    default            = 3800,
  },
}
local Obice100mmL22he = Obice100mmL22:New(HowitzerHEClass, true)
local Obice100mmL22smoke = Obice100mmL22:New(HowitzerSmokeClass, true)

--  100mm Howitzer L17 (ITA)
local Obice100mmL17 = HowitzerClass:New{
  accuracy           = 1150,
  areaOfEffect       = 115,
  name               = [[Obice 100mm/17 M14]],
  soundStart         = [[ITA_100mm]],
  range              = 6000,
  reloadtime         = 9.25,
  damage = {
    default            = 3800,
  },
}
local Obice100mmL17HE = Obice100mmL17:New(HowitzerHEClass, true)
local Obice100mmL17Smoke = Obice100mmL17:New(HowitzerSmokeClass, true)

-- Type 91 105m howitzer L/24 (JPN)
local Type91105mmL24 = HowitzerClass:New{
  accuracy           = 1000,
  areaOfEffect       = 125,
  name               = [[Type 91 105mm/24]],
  range              = 7200,
  reloadtime         = 11.25,
  damage = {
    default            = 4050,
  },
}
local Type91105mmL24HE = Type91105mmL24:New(HowitzerHEClass, true)
local Type91105mmL24Smoke = Type91105mmL24:New(HowitzerSmokeClass, true)

-- Return only the full weapons
return lowerkeys({
  QF25PdrHE = QF25PdrHE,
  QF25PdrSmoke = QF25PdrSmoke,
  LeFH18HE = LeFH18HE,
  LeFH18Smoke = LeFH18Smoke,
  M2HE = M2HE,
  M2Smoke = M2Smoke,
  M30122mmHE = M30122mmHE,
  M30122mmSmoke = M30122mmSmoke,
  Obice100mmL22he = Obice100mmL22he,
  Obice100mmL22smoke = Obice100mmL22smoke,
  Obice100mmL17HE = Obice100mmL17HE,
  Obice100mmL17Smoke = Obice100mmL17Smoke,
  Type91105mmL24HE = Type91105mmL24HE,
  Type91105mmL24Smoke = Type91105mmL24Smoke,
})
