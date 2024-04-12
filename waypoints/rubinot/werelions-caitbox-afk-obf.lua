local huntName                    = "werelion-caitbox-afk"
local isSimpleScript              = false
local uniqueId                    = "kopPOPOkasdkoq12931290"

local PLAYER_CREATURE             = Creature.new(Player.getId())
local PLAYER_VOCATION             = PLAYER_CREATURE:getVocation()
local EK                          = Enums.Vocations.KNIGHT
local defaultValues               = {
  MAX_MONSTER_TO_STOP = PLAYER_VOCATION == EK and 8 or 99,
  MIN_MONSTER_TO_BACK = PLAYER_VOCATION == EK and 0 or 3,
  MONSTER_MEDIUM_LIFE_PERCENTAGE = PLAYER_VOCATION == EK and 0 or 10,
  RUN_AWAY_WITH_MONSTER_COUNT = 25,
  MONSTER_COUNT_AREA = 7,
  MAX_STEP_DELAY = 2000,
  SINGLE_STEP_DELAY = 100,
}

local IGNORE_MONSTER_LIST         = {
  ["lion"] = true,
  ["cobra"] = true,
  ["nomad"] = true,
}

local STOP_WHEN_MONSTER_ON_SCREEN = { -- Lista de monstro que você deseja parar o script até ele morrer/sair da tela
  -- Coloque o nome do monstro assim
  -- "dark torturer", "demon", "dragon lord", etc...
  ["plunder patriarch"] = true,
}

local LOOT_LIST_CONFIG            = [[
-- En-us: List of items to sell --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: Digite aqui sua lista de itens para vender --
-- Nao de enter e nem deixe espacos apos a "virgula"

- Ex/e.g: [3079,3081,3082,3083,3084,3085,3086,3087] --
sellItemList=[3037,3033,3028,3032,3030,3029,9057,21182,3034,8084,21158,21178,21179,21180,21183,3065,21164,3038,3032,9057,21144,21197,21755,21170,3026,3027,3279,5880,8896,8899,21167,7452,21103,21171,21196,21182,953,3371,8063,44602,3370,44608,3360,3381,21165,44605,3382,44611,813,3272,7452,10392,8042,821,828,7413,3297,7454,3037,7456,3026,34008,44608,25737,3028,22193,16127,16125,33945,16121,5944,9691,3017,676,675,3027,3077,22083,3385,33781,24391,7418,7413,7407,812,10389,7454,7451,7387,3049,16120,16126,20062,5925,5880,20201,5895,20198,20199,9058,16123,5951,3116]
]]

local OTHER_CONFIG                = [[
-- En-us: Try to avoid lost monsters? Leave 0 to ignore, 1 to try --
-- Pt-br: Tentar evitar dar lost nos monstros? Deixe 0 para ignorar, 1 para tentar --
avoidLost=1

-- En-us: Must loot corpses around you? --
-- Leave 1 to loot, leave 0 to not loot

-- Pt-br: Deve pegar loot ao seu redor? --
-- Deixe 1 para lootar, deixe 0 para nao lootar
lootCorpses=0

-- En-us: Delay to loot corpses --
-- Pt-br: Delay para pegar loot --
-- rubinOT = 0, ixodusOT = 250
lootCorpsesDelay=0

-- En-us: Minimum monster to caitbox --
-- Pt-br: Minimo de monstros para caitbox --
MONSTER_TO_CAITBOX=1

]]

local SHARED_SUPPLY_CONFIGS       = {
  AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
  RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
  DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=200\nDIAMOND_ARROW_MAX=1000\n",
  RUNES =
  "AVALANCHE_MIN=150\nAVALANCHE_MAX=700\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=0\nSTONE_SHOWER_MAX=0\nSD_MIN=0\nSD_MAX=0\n",
}

local MAGE_CONFIGS                = {
  POTIONS =
  "ULTIMATE_MANA_POTION_MIN=150\nULTIMATE_MANA_POTION_MAX=700\nGREAT_MANA_POTION_MIN=0\nGREAT_MANA_POTION_MAX=0\n",
  RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "GREEN_PLASMA_MIN=0\nGREEN_PLASMA_MAX=0\n",
  AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "GREEN_PLASMA_COLLAR_MIN=0\nGREEN_PLASMA_COLLAR_MAX=0\n",
  RUNES = SHARED_SUPPLY_CONFIGS.RUNES .. "UH_MIN=0\nUH_MAX=0\n",
}

local SUPPLY_CONFIGS              = {
  [Enums.Vocations.KNIGHT] = {
    POTIONS =
        "SUPREME_HEALTH_POTION_MIN=0\nSUPREME_HEALTH_POTION_MAX=0\nULTIMATE_HEALTH_POTION_MIN=0\nULTIMATE_HEALTH_POTION_MAX=0\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
        "STRONG_MANA_POTION_MIN=0\nSTRONG_MANA_POTION_MAX=0\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
    RUNES = "",
  },
  [Enums.Vocations.PALADIN] = {
    POTIONS =
    "ULTIMATE_SPIRIT_POTION_MIN=25\nULTIMATE_SPIRIT_POTION_MAX=75\nGREAT_SPIRIT_POTION_MIN=100\nGREAT_SPIRIT_POTION_MAX=300\nGREAT_MANA_POTION_MIN=150\nGREAT_MANA_POTION_MAX=300\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "BLUE_PLASMA_MIN=0\nBLUE_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "BLUE_PLASMA_COLLAR_MIN=0\nBLUE_PLASMA_COLLAR_MAX=0\n",
    RUNES = SHARED_SUPPLY_CONFIGS.RUNES,
  },
  [Enums.Vocations.SORCERER] = MAGE_CONFIGS,
  [Enums.Vocations.DRUID] = MAGE_CONFIGS,
}

local function prequire(m)
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

local DISCORD_LINK  = "https://discord.gg/wBf2mQDffN"

local DLL_NOT_FOUND =
    "DLL not found, please open a ticket in our discord\nDLL nao encontrada, por favor abra um ticket em nosso discord: " ..
    DISCORD_LINK

local socket        = prequire("socket.http")
if not socket then
  Client.showMessage(DLL_NOT_FOUND)
  error(DLL_NOT_FOUND)
end

local function parse(w)
  local wq = {}
  for i = 1, #w do
    table.insert(wq, {
      x           = w[i].q,
      y           = w[i].c,
      z           = w[i].b,
      type        = w[i].type,
      wait        = w[i].wait,
      direction   = w[i].direction or nil,
      action      = w[i].action or nil,
      label       = w[i].label or nil,
      findTileId  = w[i].findTileId or nil,
      useItemId   = w[i].useItemId or nil,
      city        = w[i].city or nil,
      distance    = w[i].distance or nil,
      isSameFloor = w[i].isSameFloor or nil,
    })
  end
  return wq
end

local WAYPOINTS = {
  { q = 33214, c = 32459, b = 8, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33214,
    c = 32459,
    b = 8,
    type = 'TARGET',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(false)
      wait(50)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
  },
  { q = 33214, c = 32459, b = 8, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33214,
    c = 32459,
    b = 8,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33213, c = 32454, b = 7, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33213,
    c = 32454,
    b = 7,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33212, c = 32452, b = 6, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32452,
    b = 6,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33215, c = 32452, b = 5, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33215,
    c = 32452,
    b = 5,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33212, c = 32452, b = 4, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32452,
    b = 4,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33215, c = 32452, b = 3, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33215,
    c = 32452,
    b = 3,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33212, c = 32451, b = 2, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32451,
    b = 2,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    isSameFloor = false,
    distance = 6,
  },
  { q = 33213, c = 32454, b = 1, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33212, c = 32454, b = 1, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32454,
    b = 1,
    type = 'USE_ITEM',
    wait = "SINGLE_STEP_DELAY",
    useItemId = 16277,
  },



  -- adventurer stone --
  { q = 32199,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32198,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32197,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'SELL',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'ENCHANT',   wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32294, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32293, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32286, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { findedId = 16791, q = 32209, c = 32281, b = 7,              type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32274, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { findedId = 44027, q = 32178, c = 32269, b = 8,              type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32174,        c = 32280, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32175,        c = 32277, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32275, b = 11,    type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32274, b = 11,    type = 'USE_FORGE', wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  { q = 32176,        c = 32277, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32279, b = 11,    type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32280, b = 11,    type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',   direction = 2 },

  { q = 32178,        c = 32272, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { findedId = 20494, q = 32178, c = 32275, b = 8,              type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32283, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32292, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32201,        c = 32298, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32299, b = 7,     type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',   direction = 5, },
  { q = 32202,        c = 32298, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32298, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32298, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32298, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32297, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32297, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32297, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32296, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32295, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32294, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32292, b = 6,     type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  -- adventurer stone --

  { q = 33213,        c = 32454, b = 1,     type = 'NODE',      wait = "SINGLE_STEP_DELAY", },
  {
    q = 33213,
    c = 32454,
    b = 1,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33216, c = 32452, b = 2, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33216,
    c = 32452,
    b = 2,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33212, c = 32453, b = 3, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32453,
    b = 3,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33215, c = 32454, b = 4, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33215,
    c = 32454,
    b = 4,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33212, c = 32454, b = 5, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33212,
    c = 32454,
    b = 5,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33215, c = 32454, b = 6, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  {
    q = 33215,
    c = 32454,
    b = 6,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 6,
    isSameFloor = false,
  },
  { q = 33213, c = 32453, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32452, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33218, c = 32445, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33218, c = 32438, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33222, c = 32431, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33225, c = 32429, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33632, c = 31883, b = 7, type = 'CHECK_PLAYER_IS_RP',    wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32429, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", label = 'go-to-refill-rp', },
  { q = 33233, c = 32429, b = 7, type = 'STAND',                 wait = "SINGLE_STEP_DELAY", },
  { q = 33233, c = 32429, b = 7, type = 'REFILL_DISTANCE',       wait = "SINGLE_STEP_DELAY", label = 'BUY_REFILL_DISTANCE', },
  { q = 33233, c = 32429, b = 7, type = 'STAND',                 wait = "SINGLE_STEP_DELAY", },
  { q = 33233, c = 32429, b = 7, type = 'CHECK_REFILL_DISTANCE', wait = "SINGLE_STEP_DELAY", },
  { q = 33233, c = 32429, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", label = 'CONTINUE_FROM_REFILL_DISTANCE', },
  { q = 33228, c = 32425, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", label = 'continue-from-rp-rfill', },
  { q = 33228, c = 32422, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33225, c = 32415, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32413, b = 7, type = 'NODE',                  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32413, b = 7, type = 'STAND',                 wait = "SINGLE_STEP_DELAY", },
  {
    q = 33230,
    c = 32412,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33230, 32412, 7, false, false, true, false)
      if not canWalk then Game.useItemFromGround(33230, 32412, 7) end
    end,
  },
  { q = 33230, c = 32408, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32407, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32407, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33230,
    c = 32406,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33230, 32406, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33230, 32406, 7) end
    end,
  },
  { q = 33228, c = 32401, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33225, c = 32398, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33225, c = 32398, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33224,
    c = 32398,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33224, 32398, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33224, 32398, 7) end
    end,
  },
  { q = 33221, c = 32398, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32399, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32399, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33221,
    c = 32400,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33221, 32400, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33221, 32400, 7) end
    end,
  },
  { q = 33221, c = 32402, b = 7, type = 'NODE',             wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32402, b = 7, type = 'STAND',            wait = "SINGLE_STEP_DELAY", },

  { q = 33221, c = 32402, b = 7, type = 'REFILL_ALL',       wait = "SINGLE_STEP_DELAY", label = 'BUY_REFILL_ALL', },
  { q = 33221, c = 32402, b = 7, type = 'STAND',            wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32402, b = 7, type = 'CHECK_REFILL_ALL', wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32402, b = 7, type = 'NODE',             wait = "SINGLE_STEP_DELAY", label = 'CONTINUE_FROM_REFILL_ALL', },

  { q = 33221, c = 32401, b = 7, type = 'NODE',             wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32401, b = 7, type = 'STAND',            wait = "SINGLE_STEP_DELAY", },
  {
    q = 33221,
    c = 32400,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33221, 32400, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33221, 32400, 7) end
    end,
  },
  { q = 33221, c = 32399, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33223, c = 32398, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33223, c = 32398, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33224,
    c = 32398,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33224, 32398, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33224, 32398, 7) end
    end,
  },
  { q = 33228, c = 32402, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32405, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32405, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33230,
    c = 32406,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33230, 32406, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33230, 32406, 7) end
    end,
  },
  { q = 33230, c = 32409, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32411, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33230, c = 32411, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33230,
    c = 32412,
    b = 7,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      local canWalk = Map.canWalk(33230, 32412, 7, false, false, false)
      if not canWalk then Game.useItemFromGround(33230, 32412, 7) end
    end,
  },
  { q = 33223, c = 32414, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32414, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33215, c = 32407, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33215, c = 32400, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33215, c = 32393, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32387, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33221, c = 32387, b = 7, type = 'STAND',   wait = "SINGLE_STEP_DELAY", },
  { q = 33627, c = 31892, b = 5, type = 'DEPOSIT', wait = 'FAST_STEP_DELAY', },
  { q = 33217, c = 32399, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33211, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33205, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33199, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33193, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33187, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33181, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33175, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33169, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33163, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32403, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32397, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32391, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32385, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32379, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32373, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32373, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32373, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32372, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32366, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33160, c = 32364, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33159, c = 32364, b = 7, type = 'FIND_TP', findTileId = 1952,          isSameFloor = false, wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32363, b = 6, type = 'MOVE',    wait = 'SINGLE_STEP_DELAY', direction = 0, },
  { q = 33158, c = 32363, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33157, c = 32362, b = 6, type = 'MOVE',    wait = 'SINGLE_STEP_DELAY', direction = 6, },
  { q = 33157, c = 32362, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33157, c = 32361, b = 6, type = 'MOVE',    wait = 'SINGLE_STEP_DELAY', direction = 0, },
  { q = 33157, c = 32360, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32363, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32363, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33141, c = 32357, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32352, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32352, b = 5, type = 'STAND',   wait = "SINGLE_STEP_DELAY", },
  {
    q = 33137,
    c = 32351,
    b = 5,
    type = 'USE_LEVER',
    wait = "SINGLE_STEP_DELAY",
    direction = 0,
    action = function()
      Game
          .useItemFromGround(33137, 32351, 5)
    end,
  },
  { q = 33117, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  {
    q = 33117,
    c = 32252,
    b = 10,
    type = 'TARGET',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,
  },
  { q = 33117, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32252, b = 10, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33125,
    c = 32252,
    b = 10,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 438,
    distance = 3,
    isSameFloor = false
  },
  { q = 33128, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'start' },
  { q = 33125, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33125,
    c = 32251,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b1"
      else
        return "c1"
      end
    end,
  },
  { q = 33125, c = 32249, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b1' },
  { q = 33122, c = 32249, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33118, c = 32249, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33118, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33118,
    c = 32251,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "bb1"
      else
        return "cc1"
      end
    end,
  },
  { q = 33118, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'bb1' },
  { q = 33118, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32254, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33125,
    c = 32251,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b1"
      else
        return "c1"
      end
    end,
  },
  { q = 33125, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c1' },
  { q = 33117, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'cc1' },
  { q = 33115, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33115, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33113, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33111, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33109, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32253, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32257, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32259, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32261, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32265, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32267, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33106, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33104, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33102, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33101,
    c = 32268,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b2"
      else
        return "c2"
      end
    end,
  },
  { q = 33101, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b2' },
  { q = 33101, c = 32270, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33099, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33099, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33097, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33096,
    c = 32272,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "bb2"
      else
        return "cc2"
      end
    end,
  },
  { q = 33096, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'bb2' },
  { q = 33095, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33093, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33093, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32270, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32269, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32266, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32266, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32264, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33095, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33100, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32265, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32266, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32267, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33101, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33101,
    c = 32268,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b2"
      else
        return "c2"
      end
    end,
  },
  { q = 33101, c = 32268, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c2' },
  { q = 33100, c = 32269, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32270, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33097, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32274, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32275, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'cc2' },
  { q = 33096, c = 32276, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32278, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32280, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33090, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33088, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33086, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33084, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33082, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33079, c = 32284, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33079, c = 32286, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33079, c = 32288, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33079, c = 32290, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32292, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32294, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32296, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32298, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32300, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32302, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32304, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32306, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32308, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33082, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33084, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33086, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33088, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33090, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33095, c = 32312, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32315, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33096,
    c = 32315,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b3"
      else
        return "c3"
      end
    end,
  },
  { q = 33098, c = 32315, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b3' },
  { q = 33098, c = 32317, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33093, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33091, c = 32317, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33093, c = 32316, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33095, c = 32315, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33096,
    c = 32314,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b3"
      else
        return "c3"
      end
    end,
  },
  { q = 33096, c = 32313, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c3' },
  { q = 33096, c = 32313, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32311, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33090, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33088, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33086, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33084, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33082, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32305, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32303, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33080, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33082, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33084, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33086, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33088, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33090, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33092, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33094, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33096, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33098, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33099, c = 32299, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33099, c = 32297, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33100, c = 32299, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33102, c = 32300, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33104, c = 32300, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33106, c = 32301, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33108, c = 32303, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33110, c = 32303, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33112, c = 32305, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33114, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33116, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33117,
    c = 32309,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b4"
      else
        return "c4"
      end
    end,
  },
  { q = 33117, c = 32311, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b4' },
  { q = 33117, c = 32311, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32313, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33119, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33121, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33124,
    c = 32314,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "bb4"
      else
        return "cc4"
      end
    end,
  },
  { q = 33124, c = 32314, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'bb4' },
  { q = 33124, c = 32312, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32312, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32310, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32308, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32308, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32308, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33121, c = 32308, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33118, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32307, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33117,
    c = 32309,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b4"
      else
        return "c4"
      end
    end,
  },
  { q = 33117, c = 32309, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c4' },
  { q = 33118, c = 32311, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32311, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32313, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32313, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32315, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32316, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'cc4' },
  { q = 33126, c = 32317, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33127, c = 32318, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33128, c = 32319, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32320, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32320, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33129,
    c = 32320,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b5"
      else
        return "c5"
      end
    end,
  },
  { q = 33129, c = 32321, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b5' },
  { q = 33129, c = 32323, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32325, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33131, c = 32326, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32327, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33135, c = 32328, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32328, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32326, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32324, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33135, c = 32322, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32320, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33131, c = 32318, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32318, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32320, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32320, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33129,
    c = 32320,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b5"
      else
        return "c5"
      end
    end,
  },
  { q = 33129, c = 32320, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c5' },
  { q = 33127, c = 32318, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32316, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32314, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32312, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32310, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32308, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32306, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32304, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33126, c = 32302, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33127, c = 32300, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32299, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33130, c = 32297, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33132, c = 32296, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32294, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32292, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33134, c = 32290, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33134, c = 32288, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33134, c = 32286, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33134, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33131, c = 32281, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33129, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33127, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33127, c = 32282, b = 11, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33126,
    c = 32282,
    b = 11,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    direction = 3,
    action = function()
      local canWalk = Map.canWalk(33126, 32282, 11, false, false, true)
      if not canWalk then Game.useItemFromGround(33126, 32282, 11) end
    end,
  },
  { q = 33125, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32280, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32278, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32277, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32277, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33118, c = 32277, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32279, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32281, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32283, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32285, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33118, c = 32287, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33120, c = 32287, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32286, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33123, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33124, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33125, c = 32282, b = 11, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33126,
    c = 32282,
    b = 11,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    direction = 1,
    action = function()
      local canWalk = Map.canWalk(33126, 32282, 11, false, false, true)
      if not canWalk then Game.useItemFromGround(33126, 32282, 11) end
    end,
  },
  { q = 33126, c = 32282, b = 11, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 33126, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33128, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33130, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33132, c = 32282, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33133, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33135, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33137, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33139, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33141, c = 32284, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33143, c = 32285, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33143, c = 32285, b = 11, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  {
    q = 33143,
    c = 32285,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b6"
      else
        return "c6"
      end
    end,
  },
  { q = 33143, c = 32283, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b6' },
  { q = 33144, c = 32281, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33144, c = 32279, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33146, c = 32278, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33148, c = 32278, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32277, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32277, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33150,
    c = 32277,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "bb6"
      else
        return "cc6"
      end
    end,
  },
  { q = 33152, c = 32277, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'bb6' },
  { q = 33154, c = 32277, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33156, c = 32278, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32280, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32282, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32284, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32286, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33158, c = 32288, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32290, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33155, c = 32290, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33153, c = 32291, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32291, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33149, c = 32291, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33147, c = 32291, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32289, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33144, c = 32287, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33143, c = 32285, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33143, c = 32285, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33143,
    c = 32285,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b6"
      else
        return "c6"
      end
    end,
  },
  { q = 33143, c = 32285, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'c6' },
  { q = 33143, c = 32283, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33143, c = 32281, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32280, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33146, c = 32278, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33148, c = 32277, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33149, c = 32275, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32274, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32274, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'cc6' },
  { q = 33151, c = 32272, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33153, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33155, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33159, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33161, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33162, c = 32270, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33159, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33155, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33153, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33151, c = 32271, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32269, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32267, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32265, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32263, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32261, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32259, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33149, c = 32257, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33147, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33147, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33147,
    c = 32255,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b7"
      else
        return "c7"
      end
    end,
  },
  { q = 33145, c = 32254, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'b7' },
  { q = 33143, c = 32252, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33142, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33142,
    c = 32251,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "bb7"
      else
        return "cc7"
      end
    end,
  },
  { q = 33142, c = 32250, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, label = 'bb7' },
  { q = 33143, c = 32248, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33145, c = 32247, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33147, c = 32247, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33149, c = 32247, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32249, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32251, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32253, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33150, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33148, c = 32256, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 33147, c = 32255, b = 11, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33147,
    c = 32255,
    b = 11,
    type = 'TAKE_DECISION',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      if MACHINE_UTILS.monsterCount >= (values.MONSTER_TO_CAITBOX or 1) then
        return "b7"
      else
        return "c7"
      end
    end,
  },
  { q = 33147, c = 32255, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", direction = 8,  label = 'c7' },
  { q = 33146, c = 32254, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33144, c = 32253, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33142, c = 32252, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33140, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33140, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", direction = 8,  label = 'cc7' },
  { q = 33138, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33136, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33134, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33132, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33132, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", },
  { q = 33555, c = 31925, b = 6,  type = 'CHECK_SUPPLY', wait = "SINGLE_STEP_DELAY", },
  { q = 33132, c = 32251, b = 11, type = 'NODE',         wait = "SINGLE_STEP_DELAY", label = 'leave' },
  {
    q = 33132,
    c = 32251,
    b = 11,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1958,
    distance = 6,
    isSameFloor = false,
  },

  { q = 33126, c = 32251, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33122, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32252, b = 10, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33117, c = 32252, b = 10, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 33116,
    c = 32252,
    b = 10,
    type = 'USE_LEVER',
    wait = "SINGLE_STEP_DELAY",
    direction = 3,
    action = function()
      Game
          .useItemFromGround(33116, 32252, 10)
    end,
  },
  { q = 33138, c = 32354, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  {
    q = 33138,
    c = 32354,
    b = 5,
    type = 'TARGET',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(false)
      wait(50)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
  },
  { q = 33141, c = 32361, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33148, c = 32363, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33154, c = 32361, b = 5, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
  { q = 33154, c = 32361, b = 5, type = 'FIND_TP', findTileId = 469,           isSameFloor = false, wait = "SINGLE_STEP_DELAY", },
  { q = 33157, c = 32362, b = 6, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },

  {
    q = 33157,
    c = 32362,
    b = 6,
    type = 'WAIT_PZ',
    wait = "SINGLE_STEP_DELAY",
  },
  { q = 33158, c = 32363, b = 6, type = 'MOVE',  wait = 'SINGLE_STEP_DELAY', direction = 5, },
  { q = 33158, c = 32363, b = 6, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 33159, c = 32364, b = 6, type = 'MOVE',  wait = 'SINGLE_STEP_DELAY', direction = 5, },
  { q = 33160, c = 32364, b = 7, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 33160, c = 32364, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33166, c = 32367, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33172, c = 32371, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33178, c = 32372, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33184, c = 32377, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33190, c = 32377, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33191, c = 32383, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33192, c = 32389, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33198, c = 32393, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33198, c = 32399, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33204, c = 32401, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33210, c = 32404, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32404, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32410, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32416, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32422, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32428, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33216, c = 32434, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33217, c = 32440, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33217, c = 32446, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32452, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32454, b = 7, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32454, b = 7, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32455, b = 7, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 2, },
  { q = 33214, c = 32458, b = 8, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 33214, c = 32458, b = 8, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },

}


WAYPOINTS = parse(WAYPOINTS)

LOAD_DATA = {
  huntName = huntName,
  isSimpleScript = isSimpleScript,
  defaultValues = defaultValues,
  uniqueId = uniqueId,
  WAYPOINTS = WAYPOINTS,
  STOP_WHEN_MONSTER_ON_SCREEN = STOP_WHEN_MONSTER_ON_SCREEN,
  IGNORE_MONSTER_LIST = IGNORE_MONSTER_LIST,
  OTHER_CONFIG = OTHER_CONFIG,
  LOOT_LIST_CONFIG = LOOT_LIST_CONFIG,
  SHARED_SUPPLY_CONFIGS = SHARED_SUPPLY_CONFIGS,
  SUPPLY_CONFIGS = SUPPLY_CONFIGS,
}
