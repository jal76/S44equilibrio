-- Smallarms - Machineguns

-- MachineGun Base Class
local MGClass = Weapon:New{
  areaOfEffect       = 1,
  avoidFeature       = true,
  avoidFriendly      = false,
  burnblow           = false,
  collideFeature     = true,
  collideFriendly    = false,
  collisionSize      = 2.5,
  explosionGenerator = [[custom:Bullet]],
  fireStarter        = 1,
  impactonly         = 1,
  interceptedByShieldType = 8,
  noSelfDamage       = true,
  size               = 1e-10,
  soundTrigger       = true,
  sprayAngle         = 350,
  tolerance          = 600,
  turret             = true,
  weaponType         = [[LaserCannon]],
  weaponVelocity     = 1500,
  customparams = {
    damagetype         = [[smallarm]],
    fearaoe            = 45,
    fearid             = 301,
    cegflare           = "MG_MUZZLEFLASH",
    flareonshot        = true,
  },
  damage = {
    default            = 33,
  },
}

local HeavyMGClass = MGClass:New{
  burst              = 8,
  burstRate          = 0.1,
  interceptedByShieldType = 16,
  movingAccuracy     = 500,
  targetMoveError    = 0.25,
  tolerance          = 700, -- needed?
  weaponVelocity     = 3000,
  customparams = {
    fearid             = 401,
  },
  damage = {
    default            = 50,
  },
}

-- Implementations
-- Rifle Calibre (~8mm) MG's
-- BESA
local BESA = MGClass:New{
  burst              = 8,
  burstRate          = 0.109,
  movingAccuracy     = 7111,
  name               = [[BESA]],
  range              = 900,
  reloadTime         = 2.8,
  soundStart         = [[GBR_BREN]],
  soundTrigger       = false, -- overrides default
  sprayAngle         = 410, --?
}

-- Bren Mk. 2 (GBR)
local Bren = MGClass:New{
  burst              = 5,
  burstRate          = 0.109,
  movingAccuracy     = 7111,
  name               = [[Bren Gun]],
  range              = 735,
  reloadTime         = 2.5,
  soundStart         = [[GBR_BREN]],
  soundTrigger       = false, -- overrides default
}

-- MG34 (GER)
local MG34 = MGClass:New{
  accuracy           = 100, --?
  burst              = 10,
  burstRate          = 0.069,
  movingAccuracy     = 2666,
  name               = [[Maschinengewehr 34]],
  range              = 945,
  reloadTime         = 2.55,
  soundStart         = [[GER_MG34]],
  sprayAngle         = 300, -- ?
}

-- MG42 (GER)
local MG42 = MGClass:New{
  accuracy           = 100, --?
  burst              = 11,
  burstRate          = 0.0175,
  movingAccuracy     = 7111,
  name               = [[Maschinengewehr 42]],
  range              = 850,
  reloadTime         = 2.55,
  soundStart         = [[GER_MG42]],
  sprayAngle         = 530,
}
-- Deployed MG42
local MG42_Deployed = MG42:New{
  range              = 1040,
  sprayAngle         = 360,
}
-- Anti Air MG42
local MG42AA = MG42:New{
  accuracy	     = 400,
  canAttackGround    = false,
  predictBoost       = 0.25,
  movingAccuracy     = 800,
  reloadTime         = 5.1,
  range              = 930,
  sprayAngle         = 460,
  customparams = { 
    no_range_adjust    = true,
    fearid             = 701,
  }
}

-- DP (RUS)
local DP = MGClass:New{
  burst              = 5,
  burstRate          = 0.12,
  movingAccuracy     = 1777, -- this looks like backwards 7111?
  name               = [[DP]],
  range              = 700,
  reloadTime         = 2.25,
  soundStart         = [[RUS_DP]],
}
-- DT
local DT = DP:New{
  movingAccuracy     = 300,
  range              = 910,
  reloadTime         = 3,
  sprayAngle         = 250,
}

-- Maxim (RUS)
local Maxim = MGClass:New{
  burst              = 14,
  burstRate          = 0.115,
  name               = [[M1910 Maxim]],
  range              = 1270,
  reloadTime         = 2.7,
  soundStart         = [[RUS_Maxim]],
}
-- Maxim AA
local MaximAA = Maxim:New{
  accuracy	     = 400,
  burst              = 10,
  canAttackGround    = false,
  movingAccuracy     = 800,
  reloadTime         = 4.2,
  predictBoost       = 0.25,
  range              = 820,
  sweepFire		=true,
  weaponType         = [[Cannon]],
  colormap           = [[ap_colormap.png]],
  size               = 1,
	rgbColor           = [[1.0 0.75 0.0]],
  customparams = {
    no_range_adjust    = true,
    fearid             = 701,
  }
}
-- ShKAS1941 (RUS)
local ShKAS1941 = MGClass:New{
  burst              = 9,
  burstRate          = 0.09,
  name               = [[ShKAS1941]],
  range              = 870,
  sprayAngle         = 960,
  reloadTime         = 2.2,
  soundStart         = [[RUS_DP]],
}
-- Vickers (GBR)
local Vickers = Maxim:New{
  name               = [[Vickers, .303 Mark 1]],
  sprayAngle         = 300, -- ?
}

-- M1919 Browning (USA)
local M1919A4Browning = MGClass:New{
  burst              = 7,
  burstRate          = 0.14,
  movingAccuracy     = 6222,
  name               = [[M1919A4 Browning .30 caliber machinegun]],
  range              = 820,
  reloadTime         = 3,
  soundStart         = [[US_30Cal]],
  sprayAngle         = 460,
}
-- Deployed Browning
local M1919A4Browning_Deployed = M1919A4Browning:New{
  range              = 1020,
  sprayAngle         = 400,
}

-- Breda 30 (ITA)
local Breda30 = MGClass:New{
  burst              = 3,
  burstrate          = 0.1,
  movingAccuracy     = 2667,
  name               = [[Breda 30 Light Machine Gun]],
  range              = 675,
  reloadtime         = 2.6,
  soundStart         = [[ITA_Breda30]],
  sprayAngle         = 260,
}

-- Breda M37 (ITA)
local BredaM37 = MGClass:New{
  burst              = 9,
  burstRate          = 0.16,
  movingAccuracy     = 6222,
  name               = [[Breda M37 Heavy Machinegun]],
  range              = 1090,
  reloadTime         = 3.1,
  soundStart         = [[ITA_M37]],
  sprayAngle         = 260,
}

-- Breda M38 (ITA)
local BredaM38 = MGClass:New{
  burst              = 7,
  burstRate          = 0.16,
  movingAccuracy     = 6222,
  name               = [[Breda M38 mounted Machinegun]],
  range              = 870,
  reloadTime         = 3.2,
  soundStart         = [[ITA_M37]],
  sprayAngle         = 320,
}

-- 7.7mm Breda SAFAT Air MG (ITA)
local BredaSafat03 = MGClass:New{
  burst				 = 6,
  burstRate          = 0.05,
  canAttackGround    = false,
  leadlimit	     = 400,
  name               = [[7.7mm Breda SAFAT]],
  range              = 825,
  heightBoostFactor  = 0,
  reloadTime         = 0.55,
  sprayAngle        = 900,
  soundStart         = [[ITA_Breda30]],
  customparams = {
    no_range_adjust    = true,
  }
}

-- Type 97, also used for Type 99 (JPN)
local Type97MG = MGClass:New{
  burst              = 6,
  burstRate          = 0.1,
  movingAccuracy     = 6222,
  name               = [[Type 97 7.7mm Machinegun]],
  range              = 870,
  reloadTime         = 2.8,
  soundStart         = [[JPN_Type99_LMG]],
  sprayAngle         = 320,
}

-- Type 92 (JPN)
local Type92MG = MGClass:New{
  burst              = 8,
  burstRate          = 0.073,
  movingAccuracy     = 6222,
  name               = [[Type 97 7.7mm Machinegun]],
  range              = 1100,
  reloadTime         = 2.8,
  soundStart         = [[JPN_Type98_HMG]],
  sprayAngle         = 320,
} 

-- 7.7mm TE-4 Air MG (JPN)
local TE4 = MGClass:New{
  accuracy	     = 400,
  burst		     = 6,
  burstRate          = 0.15,
  canAttackGround    = false,
  name               = [[7.7mm TE-4 Machinegun]],
  range              = 925,
  predictBoost       = 0.2,
  reloadTime         = 3,
  soundStart         = [[JPN_TE4_MG]],
  customparams = {
    no_range_adjust    = true,
    fearid             = 701,
  }
}


-- Large calibre (12.7mm) MG's
-- Vickers 50 cal (GBR)
local Twin05CalVickers = HeavyMGClass:New{
  name               = [[Twin Vickers .50 Caliber Heavy Machine Gun]],
  range              = 875,
  reloadTime         = 2.2,
  soundStart         = [[US_50CAL]],
}

-- DShK (RUS)
local DShK = HeavyMGClass:New{
  name               = [[DShK 12.7mm Heavy Machine Gun]],
  range              = 1300,
  reloadTime         = 3,
  soundStart         = [[RUS_DShK]],
}
-- Twin DShK
local Twin_DShK = DShK:New{
  reloadTime         = 1.4, -- why not 1.5?
}
-- BeresinUBS
local BeresinUBS = HeavyMGClass:New{
  reloadTime         = 0.7,
  name               = [[BeresinUBS 12.7mm Machine Gun]],
  burst             = 6,
  burstRate         = 0.088,
  sprayAngle        = 1050,
    no_range_adjust    = true,
  soundStart         = [[RUS_BeresinUBS]],
}

-- M2 Browning  (USA)
local M2Browning = HeavyMGClass:New{
  name               = [[M2 Browning .50 Caliber Heavy Machine Gun]],
  burst				 = 3,
  range              = 880,
  reloadTime         = 2,
  soundStart         = [[US_50CAL]],
}
-- M2 Browning AA
local M2BrowningAA = M2Browning:New{
  accuracy	     = 400,
  burst              = 6,
  canAttackGround    = false,
  movingAccuracy     = 1200,
  predictBoost       = 0.25,
  range              = 920,
  sprayAngle        = 550,
  reloadTime         = 1.8,
  customparams = {
    no_range_adjust    = true,
    fearid             = 701,
  }
}
-- M2 Browning Aircraft
local M2BrowningAMG = M2Browning:New{
  burst             = 9,
  burstRate         = 0.085,
  range             = 900,
  leadlimit	    = 400,
  heightBoostFactor = 0,
  reloadTime        = 0.9,
  soundStart        = [[US_50CALAir]],
  sprayAngle        = 1050,
  tolerance         = 1100, --?
  customparams = {
    no_range_adjust    = true,
  }
}

-- Breda M1931 (ITA)
local BredaM1931 = HeavyMGClass:New{
  name               = [[Breda M1931 13mm Heavy Machine Gun]],
  range              = 880,
  reloadTime         = 4,
  soundStart         = [[US_50CAL]],
  sprayAngle         = 300,
}

--Breda M1931 AA
local BredaM1931AA = BredaM1931:New{
  accuracy	     = 400,
  burst              = 6,
  burstRate          = 0.109,
  canAttackGround    = false,
  movingAccuracy     = 800,
  predictBoost       = 0.25,
  range              = 1050,
  reloadTime         = 3,
  sprayAngle         = 300,
  customparams = {
    no_range_adjust    = true,
    fearid             = 701,
  }
}

-- .50 Caliber Breda SAFAT Air MG (ITA)
local BredaSafat05 = HeavyMGClass:New{
  burst				 = 6,
  burstRate          = 0.125,
  canAttackGround    = false,
  name               = [[.50 Caliber Breda SAFAT]],
  range              = 900,
  leadlimit	     = 400,
  heightBoostFactor  = 0,
  reloadTime         = 1.2,
  sprayAngle        = 1050,
  soundStart         = [[ITA_breda12_7mm]],
  customparams = {
    no_range_adjust    = true,
  }
}


-- Type 93 (JPN)
local Type93HMG = HeavyMGClass:New{
  name               = [[Type 93 13mm Heavy Machine Gun]],
  range              = 880,
  reloadTime         = 4,
  soundStart         = [[US_50CAL]],
  sprayAngle         = 300,
}

-- Type 93 AA
local Type93AA = Type93HMG:New{
  accuracy	     = 400,
  burst              = 6,
  burstRate          = 0.109,
  movingAccuracy     = 800,
  predictBoost       = 0.25,
  range              = 1050,
  reloadTime         = 3,
  sprayAngle         = 300,
  customparams = {
    no_range_adjust    = true,
    fearid             = 701,
  }
}

-- Type 1 Ho-103 12.7mm Air MG (JPN)
local Type1Ho103 = HeavyMGClass:New{
  burst			= 8,
  burstRate          = 0.085,
  canAttackGround    = false,
  name               = [[Type1 Ho-103 12.7mm]],
  range              = 800,
  leadlimit	     = 400,
  heightBoostFactor  = 0,
  reloadTime         = 0.8,
  soundStart         = [[US_50CALAir]],
  sprayAngle         = 1050,
  customparams = {
    no_range_adjust    = true,
  }
}




-- Return only the full weapons
return lowerkeys({
  -- 8mm
  BESA = BESA,
  Bren = Bren,
  Vickers = Vickers,
  MG34 = MG34,
  MG42 = MG42,
  MG42_Deployed = MG42_Deployed,
  MG42AA = MG42AA,
  DP = DP,
  DT = DT,
  Maxim = Maxim,
  MaximAA = MaximAA,
  ShKAS1941 = ShKAS1941,
  M1919A4Browning = M1919A4Browning,
  M1919A4Browning_Deployed = M1919A4Browning_Deployed,
  Breda30 = Breda30,
  BredaM37 = BredaM37,
  BredaM38 = BredaM38,
  BredaSafat03 = BredaSafat03,
  Type97MG = Type97MG,
  Type92MG = Type92MG,
  TE4 = TE4,
  -- 13mm
  Twin05CalVickers = Twin05CalVickers,
  DShK = DShK,
  Twin_DShK = Twin_DShK,
  BeresinUBS = BeresinUBS,
  M2Browning = M2Browning,
  M2BrowningAA = M2BrowningAA,
  M2BrowningAMG = M2BrowningAMG,
  BredaM1931 = BredaM1931,
  BredaM1931AA = BredaM1931AA,
  BredaSafat05 = BredaSafat05,
  Type93HMG = Type93HMG,
  Type93AA = Type93AA,
  Type1Ho103 = Type1Ho103,
})
