local rusDefs = {
-- Upgrade Defs
 	rusvehicleyard = {
		{
			into = 'rusvehicleyard1',
			metal = 2000,
			energy = 0,
			time = 65,
			name = '  Light  \n  Armor  ',
			text = 'Makes Light Armor available in this yard',
			facing = true,
		},
	},
	rusgunyard = {
		{
			into = 'russpyard',
			metal = 4025,
			energy = 0,
			time = 115,
			name = '  Self  \n  Propelled  ',
			text = 'Makes Self-Propelled Artillery available in this yard',
			facing = true,
		},
		{
			into = 'russpyard1',
			metal = 5200,
			energy = 0,
			time = 150,
			name = '  Tank  \n  Destroyers  ',
			text = 'Makes Tank Destroyers available in this yard',
			facing = true,
		},
	},
	rustankyard = {
		{
			into = 'rustankyard1',
			metal = 4500,
			energy = 0,
			time = 60,
			name = '  Advanced  \n  Mediums  ',
			text = 'Makes Advanced Medium Armor available in this yard',
			facing = true,
		},
		{
			into = 'rustankyard2',
			metal = 4500,
			energy = 0,
			time = 60,
			name = '  Heavy  \n  Armor  ',
			text = 'Makes Heavy Armor available in this yard',
			facing = true,
		},
	},
	rusboatyard = {
		{
			into = 'rusboatyardlarge',
			metal = 6000,
			energy = 0,
			time = 80,
			name = '  Landing  \n  Fire  \n  Support  ',
			text = 'Makes Landing Fire Support Craft available in this yard',
			facing = true,
		},
	},
	  -- Machineguns
  rusmaxim =
  {
    into = 'rusmaxim_sandbag',
    tech = 0,
    time = 25,
    metal = 0,
    energy = 0,
    directional = true,
  },

  rusmaxim_sandbag =
  {
    into = 'rusmaxim',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
    -- Towed Guns
  rus61k_truck = 
  {
    into = 'rus61k_stationary',
    tech = 0,
    time = 35,
    metal = 0,
    energy = 0,
  },
  
  rus61k_stationary = 
  {
    into = 'rus61k_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
  ruszis2_truck = 
  {
    into = 'ruszis2_stationary',
    tech = 0,
    time = 5,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  ruszis2_stationary = 
  {
    into = 'ruszis2_truck',
    tech = 0,
    time = 5,
    metal = 0,
    energy = 0,
  },
  
  ruszis3_truck = 
  {
    into = 'ruszis3_stationary',
    tech = 0,
    time = 10,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  ruszis3_stationary = 
  {
    into = 'ruszis3_truck',
    tech = 0,
    time = 10,
    metal = 0,
    energy = 0,
  },
  
  rusm30_truck = 
  {
    into = 'rusm30_stationary',
    tech = 0,
    time = 35,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  rusm30_stationary = 
  {
    into = 'rusm30_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  -- Trucks / Trucksupplies
   ruszis5 =
  {
    into = 'rustrucksupplies',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
	rustrucksupplies=
  {
    into = 'ruszis5',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  -- Pontoon trucks
	ruspontoontruck =
  {
    into = 'rusboatyard',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
	facing = true,
  },
  --the Soviet supply storage truck they get at spawn
     russupplytruck =
  {
    into = 'russtorage',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
	facing = true,
  },
     russtorage =
  {
    into = 'russupplytruck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
	facing = true,
  },

}

return rusDefs
