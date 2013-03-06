
--[[--

定义了所有的静态对象

]]

local MapConstants = require("app.map.MapConstants")

local StaticObjectsProperties = {}

local defines = {}

----------------------------------------

local object = {
    classId      = "static",
    framesName   = "IncreaseHp%04d.png",
    framesBegin  = 1,
    framesLength = 28,
    framesTime   = 1.0 / 28,
    radius       = 60,
    scale        = 2.0,
    offsetY      = 20,
    zorder       = 30000,
    viewZOrdered = false,
}
defines["IncreaseHp"] = object

----------------------------------------

local object = {
    classId     = "static",
    imageName   = "#Building01.png",
    radius      = 60,
    offsetX     = -10,
    offsetY     = 35,
    decorations = {"Building01Destroyed"},
    campId      = MapConstants.ENEMY_CAMP,
}
defines["Building01"] = object

----------------------------------------

local object = {
    classId     = "static",
    imageName   = {"#EnemyTower0101.png", "#EnemyTower0102.png"},
    radius      = 32,
    offsetX     = {-15, -16, -16},
    offsetY     = {3, 3, 2},
    towerId     = "Tower01L01",
    decorations = {"EnemyTower01Destroyed"},
    behaviors   = {"TowerBehavior"},
    fireOffsetX = {0, 0, 0},
    fireOffsetY = {24, 24, 24},
    campId      = MapConstants.ENEMY_CAMP,
}
defines["EnemyTower01"] = object

----------------------------------------

local object = {
    classId       = "static",
    imageName     = "#EnemyShip01.png",
    radius        = 40,
    radiusOffsetY = 30,
    offsetY       = 33,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["EnemyShip01"] = object

----------------------------------------

function StaticObjectsProperties.getAllIds()
    local keys = table.keys(defines)
    table.sort(keys)
    return keys
end

function StaticObjectsProperties.get(defineId)
    assert(defines[defineId], format("StaticObjectsProperties.get() - invalid defineId %s", tostring(defineId)))
    return clone(defines[defineId])
end

function StaticObjectsProperties.isExists(defineId)
    return defines[defineId] ~= nil
end

return StaticObjectsProperties