---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")


-- Helper function to apply multipliers and create material entries
local function generateGroupAlternatives(groupAlternativesTable, baseCount, groupType)
    local newGroupAlternativesTable = {};

    for _, itemTable in pairs(groupAlternativesTable) do
        table.insert(newGroupAlternativesTable, {[groupType] = itemTable.Item, Amount = BuildingMenu.round(baseCount * itemTable.Multiplier)});
    end

    -- BuildingMenu.debugPrint("[Building Menu DEBUG] newGroupAlternativesTable ", newGroupAlternativesTable);
    return unpack(newGroupAlternativesTable);
end


local function initBuildingMenuRecipes()
    local bigWallWoodCount = SandboxVars.BuildingMenuRecipes.bigWallWoodCount or 6
    local bigWallNailsCount = SandboxVars.BuildingMenuRecipes.bigWallNailsCount or 8

    local smallWallWoodCount = SandboxVars.BuildingMenuRecipes.smallWallWoodCount or 3
    local smallWallNailsCount = SandboxVars.BuildingMenuRecipes.smallWallNailsCount or 4


    local bigObjectsWoodCount = SandboxVars.BuildingMenuRecipes.bigObjectsWoodCount or 6
    local bigObjectsNailsCount = SandboxVars.BuildingMenuRecipes.bigObjectsNailsCount or 10

    local smallObjectsWoodCount = SandboxVars.BuildingMenuRecipes.smallObjectsWoodCount or 4
    local smallObjectsNailsCount = SandboxVars.BuildingMenuRecipes.smallObjectsNailsCount or 6


    local glassPaneCount = SandboxVars.BuildingMenuRecipes.glassPaneCount or 2

    local metalBarsCount = SandboxVars.BuildingMenuRecipes.metalBarsCount or 4

    local screwsCount = SandboxVars.BuildingMenuRecipes.screwsCount or 10

    local sheetMetalCountForWalls = SandboxVars.BuildingMenuRecipes.sheetMetalCountForWalls or 5
    local sheetMetalCountForDoors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4
    local sheetMetalCountForContainers = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4
    local sheetMetalCountForFixturesAndAppliances = SandboxVars.BuildingMenuRecipes.sheetMetalCountForFixturesAndAppliances or 4
    local sheetMetalCountForRoofingAndFloors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForRoofingAndFloors or 1


    local bigObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.bigObjectsCarpentrySkill or 5
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5
    local metalweldingXpPerLevel = SandboxVars.BuildingMenuRecipes.metalweldingXpPerLevel or 3.5
    local electricalXpPerLevel = SandboxVars.BuildingMenuRecipes.electricalXpPerLevel or 5.0


    local plankCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.plankCountForMilitaryCrate or 15
    local nailsCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.nailsCountForMilitaryCrate or 10
    local militaryCrateCarpentrySkill = SandboxVars.BuildingMenuRecipes.militaryCrateCarpentrySkill or 9


    
    BuildingMenu.SolarPanelRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = 4
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 20
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 3
            },
            {
                Material = "ISA.SolarPanel",
                Amount = 1
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
            }
        }
    }
    
    BuildingMenu.BatteryBankRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = 5
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 6
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 3
            },
            {
                Material = "Base.MetalBar",
                Amount = 4
            },
            {
                Material = "ISA.ISAInverter",
                Amount = 1
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
            }
        }
    }

    BuildingMenu.FailSafeRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = 5
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 6
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 3
            },
            {
                Material = "Base.MetalBar",
                Amount = 4
            },
            {
                Material = "ISA.ISAInverter",
                Amount = 1
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
            }
        }
    }
end

Events.OnInitGlobalModData.Add(function()
	initBuildingMenuRecipes()
end)