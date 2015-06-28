local usDefs = {
-- Upgrade Defs
   	usstorage = {
		{
			into = 'usstoragelarge',
			metal = 6000,
			energy = 0,
			time = 80,
			name = '  Upgrade  ',
			text = 'Upgrades into a large storage shed.',
			facing = true,
		},
	},	
	usvehicleyard = {
		{
			into = 'usvehicleyard1',
			metal = 2000,
			energy = 0,
			time = 65,
			name = '  Light  \n  Armor  ',
			text = 'Makes Light Armor available in this yard',
			facing = true,
		},
	},
	usgunyard = {
		{
			into = 'usspyard',
			metal = 3250,
			energy = 0,
			time = 85,
			name = '  Self  \n  Propelled  ',
			text = 'Makes Self-Propelled Artillery available in this yard',
			facing = true,
		},
		{
			into = 'usspyard1',
			metal = 5250,
			energy = 0,
			time = 150,
			name = '  Tank  \n  Destroyers  ',
			text = 'Makes Tank Destroyers available in this yard',
			facing = true,
		},
	},
	ustankyard = {
		{
			into = 'ustankyard1',
			metal = 4500,
			energy = 0,
			time = 60,
			name = '  Advanced  \n  Mediums  ',
			text = 'Makes Advanced Medium Armor available in this yard',
			facing = true,
		},
		{
			into = 'ustankyard2',
			metal = 4500,
			energy = 0,
			time = 60,
			name = '  Heavy  \n  Armor  ',
			text = 'Makes Heavy Armor available in this yard',
			facing = true,
		},
	},
	usboatyard = {
		{
			into = 'usboatyardlarge',
			metal = 6000,
			energy = 0,
			time = 80,
			name = '  Landing  \n  Fire  \n  Support  ',
			text = 'Makes Landing Fire Support Craft available in this yard',
			facing = true,
		},
	},
	  -- Machineguns
  usgimg =
  {
    into = 'usgimg_sandbag',
    tech = 0,
    time = 12,
    metal = 0,
    energy = 0,
    directional = true,
  },
  

  usgimg_sandbag =
  {
    into = 'usgimg',
    tech = 0,
    time = 12,
    metal = 0,
    energy = 0,
  },

  us101stmg =
  {
    into = 'us101stmg_sandbag',
    tech = 0,
    time = 12,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
    us101stmg_sandbag =
  {
    into = 'us101stmg',
    tech = 0,
    time = 12,
    metal = 0,
    energy = 0,
  },
    -- Towed Guns
  usm5gun_truck = 
  {
    into = 'usm5gun_stationary',
    tech = 0,
    time = 10,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  usm5gun_stationary = 
  {
    into = 'usm5gun_truck',
    tech = 0,
    time = 10,
    metal = 0,
    energy = 0,
  },
  
  usm2gun_truck = 
  {
    into = 'usm2gun_stationary',
    tech = 0,
    time = 35,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  usm2gun_stationary = 
  {
    into = 'usm2gun_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
 
     usm1bofors_truck = 
  {
    into = 'usm1bofors_stationary',
    tech = 0,
    time = 35,
    metal = 0,
    energy = 0,
  },
  
    usm1bofors_stationary = 
  {
    into = 'usm1bofors_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  -- Trucks / Trucksupplies
  usgmctruck =
  {
    into = 'ustrucksupplies',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
	ustrucksupplies =
  {
    into = 'usgmctruck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
    usdukw =
  {
    into = 'usdukwsupplies',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
  	usdukwsupplies =
  {
    into = 'usdukw',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  -- Pontoon trucks
    uspontoontruck =
  {
    into = 'usboatyard',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
	facing = true,
  },

}

return usDefs
