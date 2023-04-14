local ns = select(2, ...)
local L = ns.L

local Auras = {}
ShadowUF:RegisterModule(Auras, "plugins_auras", L["auras"])


local function sortAuras(auras, aurasType, unitType)

end


local function updateButton(button, config)

    button.icon:SetVertexColor(1, 1, 1, 1)

end


function Auras:OnConfigurationLoad()

    ShadowUF.Config.auraTable.args.plugins_auras = {
        type = "group",
        name = L["auras"],
        order = 10,
        args = {
            opacity = {
                order = 0,
                type = "range",
                name = L["opacity"],
                desc = L["opacityDesc"],
                min = 0, max = 1, step = 0.05,
                isPercent = true,
                arg = "plugins_auras.$parentparent.opacity",
            },
            grayscale = {
                order = 1,
                type = "range",
                name = L["grayscale"],
                desc = L["grayscaleDesc"],
                min = 0, max = 1, step = 0.05,
                isPercent = true,
                arg = "plugins_auras.$parentparent.grayscale",
            },
            noStealable = {
                order = 2,
                type = "toggle",
                name = L["noStealable"],
                desc = L["noStealableDesc"],
                arg = "plugins_auras.$parentparent.noStealable",
            },
            noBoss = {
                order = 2,
                type = "toggle",
                name = L["noBoss"],
                desc = L["noBossDesc"],
                arg = "plugins_auras.$parentparent.noBoss",
            },
            sortAuras = {
                order = 4,
                type = "toggle",
                name = L["sortAuras"],
                desc = L["sortAurasDesc"],
                arg = "plugins_auras.$parentparent.sortAuras",
            },
        },
    }

end


function Auras:OnInitialize()

    local defaults = {
        opacity = 1,
        grayscale = 1,
        noStealable = true,
        noBoss = true,
        sortAuras = false,
    }

    for _, unit in pairs(ShadowUF.unitList) do
        ShadowUF.db.profile.units[unit].plugins_auras.buffs = ShadowUF.db.profile.units[unit].plugins_auras.buffs or defaults
        ShadowUF.db.profile.units[unit].plugins_auras.debuffs = ShadowUF.db.profile.units[unit].plugins_auras.debuffs or defaults
    end

end


function Auras:OnLayoutApplied(frame, config)

    if (config.auras.buffs.enabled) then
		frame.auras.buffs.maxAuras = 1024
	end

	if (config.auras.debuffs.enabled) then
		frame.auras.debuffs.maxAuras = 1024
	end

end
