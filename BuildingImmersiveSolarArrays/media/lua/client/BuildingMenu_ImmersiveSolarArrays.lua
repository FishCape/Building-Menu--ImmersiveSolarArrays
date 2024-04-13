---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")
require("BuildingMenu_Recipes")

function addSolarToMenu()
    local pertSolar = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Generator",
            "Tooltip_Generator",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SolarPanelRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "VehicleWorkOnTire",
                noNeedHammer = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "solarmod_tileset_01_8"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Generator",
            "Tooltip_Generator",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SolarPanelRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = false,
                canPassThrough = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "solarmod_tileset_01_6", northSprite = "solarmod_tileset_01_7"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Generator",
            "Tooltip_Generator",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SolarPanelRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "solarmod_tileset_01_9", northSprite = "solarmod_tileset_01_10"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Generator",
            "Tooltip_Generator",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.BatteryBankRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "solarmod_tileset_01_0"}
        )
    }
    BuildingMenu.addObjectsToCategories(
    "Solar",
    getText("Electronics"),
    "solarmod_tileset_01_8",
    getText("All"),
    "solarmod_tileset_01_8",
    pertSolar
    )
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.woodWallsSubCategory then
        addSolarToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)