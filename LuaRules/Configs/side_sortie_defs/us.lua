local usSorties = {
	us_sortie_recon = {
		members = {
			"usl4",
		},
		delay = 15,
		name = "Recon Sortie",
		description = "1 x L-4 Grasshopper",
		buildCostMetal = 1000,
		buildPic = "USL4.png",
		buildTime = 1000,
	},

	us_sortie_interceptor = {
		members = {
			"usp51dmustang",
			"usp51dmustang",
			"usp51dmustang",
			"usp51dmustang",
		},
		delay = 15,
		weight = 1,
		name = "Interceptor Sortie",
		description = "4 x P-51D Mustang",
		buildCostMetal = 4325,
		buildPic = "USP51DMustang.png",
		buildTime = 4325,
	},

	us_sortie_fighter_bomber = {
		members = {
			"usp47thunderbolt",
			"usp47thunderbolt",
		},
		delay = 45,
		weight = 1,
		name = "Fighter-Bomber Sortie",
		description = "2 x P-47D Thunderbolt",
		buildCostMetal = 6750,
		buildPic = "USP47Thunderbolt.png",
		buildTime = 6750,
	},

	us_sortie_attack = {
		members = {
			"usp51dmustangga",
			"usp51dmustangga",
		},
		delay = 45,
		weight = 1,
		name = "Attack Sortie",
		description = "2 x P-51D-25 Mustang",
		buildCostMetal = 5000,
		buildPic = "USP51DMustangGA.png",
		buildTime = 5000,
	},

	us_sortie_paratrooper = {
		members = {
			"usc47",
		},
		delay = 45,
		weight = 1,
		alwaysAttack = 1,
		name = "Paratrooper Drop",
		description = "16 x Garand Rifle, 4 x Thompson SMG, 4 x BAR, 2 x Browning .30 Cal Machinegun, 2 x Bazooka, Delivered By C-47",
		buildCostMetal = 4275,
		buildPic = "USC47.png",
		buildTime = 4275,
	},
}

return usSorties
