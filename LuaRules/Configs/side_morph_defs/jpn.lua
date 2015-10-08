local jpnDefs = {
  -- japan
   	jpnstorage = {
		{
			into = 'jpnstoragetunnel',
			metal = 3000,
			energy = 0,
			time = 80,
			name = '  Upgrade  ',
			text = 'Upgrades into a tunnel exit.',
			facing = true,
		},
	},	
	jpngunyard = {
		{
			into = 'jpnspyard',
			metal = 3000,
			energy = 0,
			time = 85,
			name = '  Self  \n  Propelled  ',
			text = 'Makes Self-Propelled Artillery available in this yard',
			facing = true,
		},
		{
			into = 'jpnatyard',
			metal = 3000,
			energy = 0,
			time = 85,
			name = '  Tank  \n  Destroyers  ',
			text = 'Makes Tank Destroyers available in this yard',
			facing = true,
		},
	},	
	jpnvehicleyard = {
		{
			into = 'jpnvehyard_tank',
			metal = 2000,
			energy = 0,
			time = 85,
			name = '  Light  \n  Tanks  ',
			text = 'Makes Light Tanks available in this yard',
			facing = true,
		},
		{
			into = 'jpnvehyard_landing',
			metal = 2000,
			energy = 0,
			time = 85,
			name = '  Landing  \n  Craft  ',
			text = 'Makes Landing Craft available in this yard',
			facing = true,
		},
	},
		jpnboatyard = {
		{
			into = 'jpnboatyardlarge',
			metal = 6000,
			energy = 0,
			time = 80,
			name = '  Landing \n Fire \n Support  ',
			text = 'Makes Landing Fire Support Craft available in this yard',
			facing = true,
		},
	},	
	jpntankyard = {
		{
			into = 'jpntankyard_medium',
			metal = 6000,
			energy = 0,
			time = 95,
			name = '  Medium  \n  Tanks  ',
			text = 'Makes Improved Medium Tanks available in this yard',
			facing = true,
		},
		{
			into = 'jpntankyard_support',
			metal = 4000,
			energy = 0,
			time = 60,
			name = '  Heavy  \n  Support  ',
			text = 'Makes Heavy Support Tanks available in this yard',
			facing = true,
		},
	},	

  jpnpontoontruck =
  {
    into = 'jpnboatyard',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
	facing = true,
  },

  jpnisuzutx40 =
  {
    into = 'jpntrucksupplies',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  
  jpntrucksupplies=
  {
    into = 'jpnisuzutx40',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  jpntype98_20mm_truck =
  {
    into = 'jpntype98_20mm_stationary',
    tech = 0,
    time = 35,
    metal = 0,
    energy = 0,
  },
  
  jpntype98_20mm_stationary =
  {
    into = 'jpntype98_20mm_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  jpntype1_47mm_truck =
  {
    into = 'jpntype1_47mm_stationary',
    tech = 0,
    time = 5,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  jpntype1_47mm_stationary =
  {
    into = 'jpntype1_47mm_truck',
    tech = 0,
    time = 5,
    metal = 0,
    energy = 0,
  },
  jpntype90_75mm_truck =
  {
    into = 'jpntype90_75mm_stationary',
    tech = 0,
    time = 25,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  jpntype90_75mm_stationary =
  {
    into = 'jpntype90_75mm_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
  jpntype91_105mm_truck =
  {
    into = 'jpntype91_105mm_stationary',
    tech = 0,
    time = 25,
    metal = 0,
    energy = 0,
    directional = true,
  },
  
  jpntype91_105mm_stationary =
  {
    into = 'jpntype91_105mm_truck',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
    jpntype92hmg =
  {
    into = 'jpntype92hmg_dugin',
    tech = 0,
    time = 25,
    metal = 0,
    energy = 0,
    directional = true,
  },

  jpntype92hmg_dugin =
  {
    into = 'jpntype92hmg',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },
    jpntype4mortar_mobile =
  {
    into = 'jpntype4mortar_stationary',
    tech = 0,
    time = 25,
    metal = 0,
    energy = 0,
    directional = true,
  },

  jpntype4mortar_stationary =
  {
    into = 'jpntype4mortar_mobile',
    tech = 0,
    time = 20,
    metal = 0,
    energy = 0,
  },

}

return jpnDefs
