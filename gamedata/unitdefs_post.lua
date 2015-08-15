-- Include table utilities
VFS.Include("LuaRules/Includes/utilities.lua", nil, VFS.ZIP)

-- Setup modoptions
local modOptions
if (Spring.GetModOptions) then
	modOptions = Spring.GetModOptions()
end
modOptions = modOptions or {}

-- Auto-generate sortie, squad & queuable-morph units
VFS.Include("gamedata/unitdefs_autogen.lua")

-- have to implement squad file preloading here, because it's needed for transport stuff
local squadDefs = VFS.Include("luarules/configs/squad_defs_loader.lua")


local GMBuildOptions = {}
local GM_UD

-- Process ALL the units!
for name, ud in pairs(UnitDefs) do
	-- Convert all customparams subtables back into strings for Spring
	if ud.customparams then
		for k, v in pairs (ud.customparams) do
			if type(v) == "table" or type(v) == "boolean" then
				ud.customparams[k] = table.serialize(v)
			end
		end
	else
		ud.customparams = {}
	end
	--MODOPTION CONTROLS
    if (modOptions.scoremode) then
        if (modOptions.scoremode ~= 'disabled') then
            if (ud.customparams) then
                if (not ud.customparams.flagcaprate) then
                    if (not ud.customparams.flag and ud.weapons ~= nil) then
                        ud.customparams.flagcaprate = 1
                    end
                end
            end
        end
    end

    if (modOptions.command_mult) then
        if (ud.extractsmetal) then
            if (modOptions.command_mult == '0') then --Very Low Command
                ud.extractsmetal = (0.25 * ud.extractsmetal)
            end
            if (modOptions.command_mult == '1') then --Low Command
                ud.extractsmetal = (0.5 * ud.extractsmetal)
            end
            if (modOptions.command_mult == '2') then --Normal Command
                ud.extractsmetal = (1 * ud.extractsmetal)
            end
            if (modOptions.command_mult == '3') then --High Command
                ud.extractsmetal = (1.5 * ud.extractsmetal)
            end
            if (modOptions.command_mult == '4') then --Very High Command
                ud.extractsmetal = (2.5 * ud.extractsmetal)
            end
        end
    end

    if (modOptions.command_storage and (tonumber(modOptions.command_storage) > 0)) then
        if (ud.metalstorage) then
            ud.metalstorage = 0
        end
    end
 --END MODOPTION CONTROLS

 --BEGIN UNIT PROCESSING
	local LoSMult = 0.6
    local decloakDistMult = 0.6
    local infSpeedMult = 0.5

    --sets base values for detection radii
    --index 1 = los, 2 = airlos, 3 = radar, 4 = seismic
    local detection = {
        BUILDING    = {300, 2000, 650, 0},
        INFANTRY    = {650, 2000, 650, 1400},
        SOFTVEH     = {300, 2000, 950, 0},
        OPENVEH     = {600, 2000, 1250, 0},
        HARDVEH     = {150, 1000, 650, 0},
        SHIP        = {400, 2500, 950, 0},
        DEPLOYED    = {650, 2000, 650, 1400},
    }

    --set detection values per unit category (with some special casing for
    --cloaked inf)
    ud.activatewhenbuilt = true
    for category, detectValues in pairs(detection) do
        local catStart, catEnd = string.find(ud.category, category);
        if catStart ~= nil then
            local cat = string.sub(ud.category, catStart, catEnd)
            if detection[cat] then
                ud.sightdistance = detection[cat][1] * LoSMult
                ud.airsightdistance = detection[cat][2] * LoSMult
                ud.radardistance = detection[cat][3] * LoSMult
                ud.seismicdistance = detection[cat][4] * LoSMult
                if ud.cloakcost then
                    ud.sightdistance = ud.sightdistance * 0.5
                    ud.radardistance = 0
                end
            end
        end
    end


	if ud.customparams then
		if ud.customparams.feartarget then
			if (ud.maxvelocity) then
				ud.maxvelocity = ud.maxvelocity * infSpeedMult
				ud.crushresistance = 12
			end
		end
	end
	if ud.mincloakdistance then
		ud.mincloakdistance = ud.mincloakdistance * decloakDistMult
	end


	--new sensor stuff!
    --set radar/LoS for infantry (the only units with seismic distances)
    --[[
	if (ud.seismicdistance) and (tonumber(ud.seismicdistance) > 0) then
		if tonumber(ud.sightdistance ) > 600 then
			ud.sightdistance = 650 * LoSMult
			ud.radardistance = 950 * LoSMult
		else
			ud.radardistance = 800 * LoSMult
		end
		ud.seismicdistance = 1400 * LoSMult
		--slightly hackish; works out so that all cloaked units don't get radar
		--but observs get it while decloaked.
		if ud.cloakcost == nil then
			ud.activatewhenbuilt = true
		end

	end

    ]]--
	--end first chunk of new sensor stuff!

	--more new sensor stuff
    --decide if stationary units should be stealth or not
	if not ud.maxvelocity then
		ud.stealth = false
		if (ud.customparams) then
			if (ud.customparams.hiddenbuilding == '1') then
			    ud.stealth = true
			end
		end
	end
	--end more new sensor stuff

    -- reclaimability
    local reclaimable = not ud.maxvelocity
    reclaimable = reclaimable and not (ud.customparams and ud.customparams.feartarget)
    reclaimable = reclaimable and not (ud.customparams and ud.customparams.weaponswithammo)
    ud.reclaimable = reclaimable

    --ship things
	if ud.floater then
		ud.turninplace = false
		ud.turninplacespeedlimit = (tonumber(ud.maxvelocity) or 0) * 0.5
		--new sensor stuff
		ud.stealth = false
		--end new sensor stuff
	end
	-- ammo storage
	if (ud.energystorage) then
		-- this is to exclude things like builders having 0.01 storage
		if tonumber(ud.energystorage)>1 then
			if not (ud.description) then
				ud.description = "log. storage: "..ud.energystorage
			end
			ud.description = ud.description.." (log. storage: "..ud.energystorage..")"
		end
	end
	-- ammo users, add ammo-related description
	if (ud.customparams) then
		if (ud.customparams.weaponcost) and (ud.customparams.maxammo) then
			local newDescrLine = "max. ammo: "..ud.customparams.maxammo..", log. per shot: "..ud.customparams.weaponcost..", total: "..(ud.customparams.weaponcost*ud.customparams.maxammo)
			if not (ud.description) then
				ud.description = newDescrLine
			end
			ud.description = ud.description.." ("..newDescrLine..")"

		end
		if ud.customparams.armor_front and (tonumber(ud.maxvelocity) or 0) > 0 then
			ud.usepiececollisionvolumes = true
		end
	end

	if tonumber(ud.maxvelocity or 0) > 0 and (not ud.canfly) and tonumber(ud.footprintx) > 1 then
		-- Make all vehicles push resistant, except con vehicles, so they vacate build spots
		if (not ud.builder) then
			ud.pushresistant = true
		end
		ud.turninplacespeedlimit = (tonumber(ud.maxvelocity) or 0) * 0.5
		--new sensor stuff
		ud.stealth = false
		ud.activatewhenbuilt = true
		--end new sensor stuff
		if (not ud.damageModifier) then
		ud.damageModifier = 0.75
		end
		--local seisSig = tonumber(ud.mass) / 1000 -- 10x smaller than default
		--if seisSig < 1 then seisSig = 1 end
		ud.seismicsignature = 1 --seisSig

		--set health
		local powerBase = modOptions.power_base or 3.25
		local scaleFactor = modOptions.scale_factor or 50

        --a crazy default value so we see it when it happens
        if (not ud.mass) then
			Spring.Log('unitdefs post', 'error', ud.name .. ' has no mass value')
            ud.mass = 99999999
        end
		local logMass = math.log10(ud.mass)
		local cp = ud.customparams
		if not (cp and (cp.mother or cp.child)) then -- exclude composites
			ud.maxdamage = (powerBase ^ logMass)*scaleFactor
		end

		if cp.mother then
			ud.maxdamage = ud.mass * 2
		end
	end

	if (modOptions.unit_los_mult) then
		if ud.sightdistance then
			ud.sightdistance = (modOptions.unit_los_mult * ud.sightdistance)
		end

		if ud.airsightdistance then
			ud.airsightdistance = (modOptions.unit_los_mult * ud.airsightdistance)
		end
--		if ud.radardistance then
--			ud.radardistance = (modOptions.unit_los_mult * ud.radardistance)
--		end
		if ud.seismicdistance then
			ud.seismicdistance = (modOptions.unit_los_mult * ud.seismicdistance)
		end
	end
	if (modOptions.unit_radar_mult) then
		if ud.radardistance then
			ud.radardistance = (modOptions.unit_radar_mult * ud.radardistance)
		end
	end

	ud.transportbyenemy = false
	ud.collisionvolumetest = 1

	-- transport squad stuff
	-- units which bring other units into game with them should have their cost and buildtime increased accordingly
	if ud.customparams and ud.customparams.transportsquad then
		local squadName = ud.customparams.transportsquad
		if squadName then
			local squadDef = squadDefs[squadName]
			if squadDef then
				local addedCost = 0
				local totalMass = 0
				local capacity = 0
                if squadDef.buildCostMetal then
                    addedCost = squadDef.buildCostMetal
                end
				for i, unitName in ipairs(squadDef.members) do
					local newUD = UnitDefs[unitName]
					if newUD then
						if not squadDef.buildCostMetal then
							addedCost = addedCost + newUD.buildcostmetal
						end
						totalMass = totalMass + newUD.mass
						capacity = capacity + 1
					else
						Spring.Log('unitdefs post', 'error', "Bad unitdef " .. unitName .. " in squad " .. squadName)
					end
				end
				if addedCost > 0 then
					ud.buildcostmetal = ud.buildcostmetal + addedCost
					ud.buildtime = ud.buildcostmetal
					Spring.Log('unitdefs post', 'info', "Added cargo cost to transport: "..ud.name.." +"..addedCost)
				end
				if tonumber(ud.transportcapacity) < capacity then
					ud.transportcapacity = capacity
					Spring.Log('unitdefs post', 'warning', ud.name.." transportCapacity was increased to " .. capacity)
				end
				if tonumber(ud.transportmass) < totalMass then
					ud.transportmass = totalMass
					Spring.Log('unitdefs post', 'warning', ud.name.." transportMass was increased to " .. totalMass)
				end
			else
				Spring.Log('unitdefs post', 'error', "Squad def name not found in loaded table: "..squadName)
			end
		else
			Spring.Log('unitdefs post', 'error', "Squad unit not found in squad def files: "..squadName)
		end
	end
	-- sounds
	local soundCat = ud.customparams.soundcategory
	if soundCat then
		soundCat = "sounds/" .. soundCat:lower() -- e.g. "rus_boat"
		local fullPath = {}
		for word in soundCat:gmatch("%a+") do
			table.insert(fullPath, word)
		end
		local keys = {"select", "ok", "arrived", "cant", "underattack"}
		local sounds = {}
		for _, key in pairs(keys) do
			sounds[key] = {}
			for i = #fullPath, 2, -1 do
				local path = table.concat(fullPath, "/", 1, i)
				local available = VFS.DirList(path, "*_" .. key .. "*")
				if #available > 0 then
					for index, item in pairs(available) do
						sounds[key][index] = item:sub(8, -5) -- cut off "sounds/" and file extension
					end
					break
				end
			end
		end
		ud.sounds = sounds
	end
	if ud.weapons then
		for _, weapon in pairs(ud.weapons) do
			if weapon.name:lower():find("tracer") or weapon.name:lower():find("noweapon") then
				weapon.name = "TracerHack"
			end
		end
	end
	
	-- add the unit to gamemaster buildoptions
	GMBuildOptions[#GMBuildOptions + 1] = name
	if name == "gmtoolbox" then GM_UD = ud end
end

GM_UD["buildoptions"] = GMBuildOptions

VFS.Include("gamedata/unitdefs_post_dependency.lua")
