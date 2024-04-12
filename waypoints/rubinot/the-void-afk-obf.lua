local huntName                    = "the-void-afk"
local isSimpleScript              = false
local uniqueId                    = "asdasdkoasjjasihd12c"

local PLAYER_CREATURE             = Creature.new(Player.getId())
local PLAYER_VOCATION             = PLAYER_CREATURE:getVocation()
local EK                          = Enums.Vocations.KNIGHT
local defaultValues               = {
  MAX_MONSTER_TO_STOP = PLAYER_VOCATION == EK and 8 or 8,
  MIN_MONSTER_TO_BACK = PLAYER_VOCATION == EK and 0 or 3,
  MONSTER_MEDIUM_LIFE_PERCENTAGE = PLAYER_VOCATION == EK and 0 or 10,
  RUN_AWAY_WITH_MONSTER_COUNT = 25,
  MONSTER_COUNT_AREA = 7,
  MAX_STEP_DELAY = 2000,
  SINGLE_STEP_DELAY = 100,
}

local IGNORE_MONSTER_LIST         = {
  ["hive pore"] = true,
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
sellItemList=[23529,23542,23510,16121,23507,23508,23518,23506,16119,16124,23502,23505,23504,23520,16126,16125,23516,23519,23511,23503,23514,23523,23515,16120,23531,23543,23533,23544,3073,8092,44608,44605,8043,44602,3033,3029,3030,3039,3041,44611,3036]
]]

local OTHER_CONFIG                = [[
-- En-us: Try to avoid lost monsters? Leave 0 to ignore, 1 to try --
-- Pt-br: Tentar evitar dar lost nos monstros? Deixe 0 para ignorar, 1 para tentar --
avoidLost=0

-- En-us: Must loot corpses around you? --
-- Leave 1 to loot, leave 0 to not loot

-- Pt-br: Deve pegar loot ao seu redor? --
-- Deixe 1 para lootar, deixe 0 para nao lootar
lootCorpses=0

-- En-us: Delay to loot corpses --
-- Pt-br: Delay para pegar loot --
-- rubinOT = 0, ixodusOT = 250
lootCorpsesDelay=0

-- En-us: Amount of monster to stop in programmed box --
-- Pt-br: Quantidade de monstros para parar na box programada --
MONSTER_TO_START_BOX=4

-- En-us: Amount of monster to leave in programmed box --
-- Pt-br: Quantidade de monstros para sair da box programada --
MONSTER_TO_LEAVE_BOX=2

]]

local SHARED_SUPPLY_CONFIGS       = {
  AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
  RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
  DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=200\nDIAMOND_ARROW_MAX=1500\n",
  RUNES =
  "AVALANCHE_MIN=0\nAVALANCHE_MAX=0\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=150\nSTONE_SHOWER_MAX=700\nSD_MIN=0\nSD_MAX=0\n",
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
        "SUPREME_HEALTH_POTION_MIN=100\nSUPREME_HEALTH_POTION_MAX=500\nULTIMATE_HEALTH_POTION_MIN=0\nULTIMATE_HEALTH_POTION_MAX=0\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
        "STRONG_MANA_POTION_MIN=200\nSTRONG_MANA_POTION_MAX=2000\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
    RUNES = "",
  },
  [Enums.Vocations.PALADIN] = {
    POTIONS =
    "ULTIMATE_SPIRIT_POTION_MIN=25\nULTIMATE_SPIRIT_POTION_MAX=150\nGREAT_SPIRIT_POTION_MIN=100\nGREAT_SPIRIT_POTION_MAX=500\nGREAT_MANA_POTION_MIN=150\nGREAT_MANA_POTION_MAX=700\n",
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

  { q = 33162, c = 32637, b = 8, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33162, c = 32637, b = 8, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'start' },
  {
    q = 33162,
    c = 32637,
    b = 8,
    type = 'TARGET',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,
    label = ''
  },
  {
    q = 33161,
    c = 32638,
    b = 8,
    type = 'NODE',
    wait = 'SINGLE_STEP_DELAY',
  },
  {
    q = 33161,
    c = 32638,
    b = 8,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 33161,        c = 32637, b = 8,     type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  {
    q = 33161,
    c = 32637,
    b = 8,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 33158,        c = 32637, b = 8,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { findedId = 23154, q = 33158, c = 32634, b = 8,         type = 'ENTER_TP',          wait = 'SINGLE_STEP_DELAY', },

  { q = 32130,        c = 31357, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32130,        c = 31354, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32133,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32136,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32139,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32142,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32145,        c = 31354, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32146,        c = 31357, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32146,        c = 31360, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32146,        c = 31363, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32143,        c = 31365, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32141,        c = 31368, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  { q = 32141,        c = 31368, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8,              action = nil, label = '' },
  {
    q = 32141,
    c = 31368,
    b = 12,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32140, c = 31369, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32140,
    c = 31369,
    b = 12,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
    label = ''
  },
  { q = 32133, c = 31370, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32130, c = 31370, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32127, c = 31370, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32124, c = 31370, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32121, c = 31368, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32120, c = 31368, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32120,
    c = 31368,
    b = 12,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32119, c = 31367, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32119,
    c = 31367,
    b = 12,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
    label = ''
  },
  { q = 32118, c = 31366, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32117, c = 31363, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32115, c = 31360, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32115, c = 31357, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32114, c = 31354, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32113, c = 31351, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32114, c = 31349, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32114,
    c = 31349,
    b = 12,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32114, c = 31348, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32114, c = 31348, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32114,
    c = 31348,
    b = 12,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  {
    q = 32114,
    c = 31347,
    b = 12,
    type = 'USE_ROPE',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32112, c = 31346, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32111, c = 31345, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32108, c = 31343, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32105, c = 31342, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32102, c = 31341, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32100, c = 31341, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32100,
    c = 31341,
    b = 11,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32100, c = 31340, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32100,
    c = 31340,
    b = 11,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32101, c = 31338, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32101, c = 31335, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32103, c = 31332, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32106, c = 31331, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32109, c = 31330, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32112, c = 31330, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32112,
    c = 31330,
    b = 11,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32115, c = 31331, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32115,
    c = 31331,
    b = 11,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32117, c = 31334, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32120, c = 31335, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32123, c = 31337, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32123, c = 31340, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32126, c = 31340, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32129, c = 31341, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32132, c = 31343, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32135, c = 31344, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32136, c = 31347, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32139, c = 31346, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32141, c = 31343, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32144, c = 31344, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32145, c = 31341, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32144, c = 31340, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32144,
    c = 31340,
    b = 11,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32145, c = 31339, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32145,
    c = 31339,
    b = 11,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32145, c = 31338, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32146, c = 31335, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32143, c = 31333, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32141, c = 31330, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32141, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32138, c = 31326, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32135, c = 31325, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32132, c = 31326, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32131, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32131,
    c = 31327,
    b = 11,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32132, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32132,
    c = 31327,
    b = 11,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32135, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32138, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32141, c = 31327, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32142, c = 31330, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32142, c = 31333, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32145, c = 31333, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32146, c = 31336, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32145, c = 31339, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32144, c = 31343, b = 11, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32144,
    c = 31343,
    b = 11,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 23364,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32144, c = 31349, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32145, c = 31352, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32145, c = 31354, b = 12, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32145,
    c = 31354,
    b = 12,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 32143,        c = 31353, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  {
    q = 32143,
    c = 31353,
    b = 12,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32142,        c = 31353, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32139,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32136,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32133,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32130,        c = 31352, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32129,        c = 31355, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32129,        c = 31358, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 32130,        c = 31361, b = 12,    type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { findedId = 23154, q = 32131, c = 31361, b = 12,        type = 'ENTER_TP',        wait = 'SINGLE_STEP_DELAY', },

  { q = 33158,        c = 32636, b = 8,     type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 33161,        c = 32638, b = 8,     type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  { q = 33161,        c = 32638, b = 8,     type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8,              action = nil, label = '' },
  {
    q = 33161,
    c = 32638,
    b = 8,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      values.MONSTER_COUNT_AREA = 5
    end,
    label = ''
  },
  { q = 33161, c = 32637, b = 8, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33161,
    c = 32637,
    b = 8,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 33161, c = 32637, b = 8, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33161,
    c = 32637,
    b = 8,
    type = 'CHECK_SUPPLY',
    wait = "FAST_STEP_DELAY",
  },
  { q = 33161, c = 32637, b = 8, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = 'leave' },
  { q = 33166, c = 32638, b = 8, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 33168, c = 32638, b = 8, type = 'USE_ROPE', wait = 'SINGLE_STEP_DELAY', },

  { q = 33168, c = 32642, b = 7, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 33168,
    c = 32642,
    b = 7,
    type = 'TARGET',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(false)
      wait(50)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
    label = ''
  },
  { q = 33169, c = 32650, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33169, c = 32658, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33169, c = 32666, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33169, c = 32674, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33169, c = 32682, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32690, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32698, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32706, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32714, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32722, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32730, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32738, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33160, c = 32741, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33154, c = 32749, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33152, c = 32757, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32761, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32762, b = 7, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 2, action = nil, label = '' },
  { q = 33153, c = 32765, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32765, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32766, b = 6, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 2, action = nil, label = '' },
  { q = 33153, c = 32773, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33145, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33137, c = 32783, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33129, c = 32783, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33121, c = 32784, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33113, c = 32789, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33105, c = 32789, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33098, c = 32797, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33098, c = 32805, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33097, c = 32813, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33097, c = 32821, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33096, c = 32829, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33093, c = 32837, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33093, c = 32845, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33091, c = 32853, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33090, c = 32861, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33088, c = 32869, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33084, c = 32877, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33084, c = 32877, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33084,
    c = 32877,
    b = 7,
    type = 'LADDER',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Game
          .useItemFromGround(33084, 32877, 7)
    end,
    label = ''
  },

  { q = 33082, c = 32879, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33082,
    c = 32879,
    b = 6,
    type = 'CHECK_PZ',
    wait = "FAST_STEP_DELAY",
  },
  { q = 33082, c = 32879, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'find-safe-place' },
  { q = 33082, c = 32883, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33082,
    c = 32883,
    b = 6,
    type = 'WAIT_PZ',
    wait = "FAST_STEP_DELAY",
  },
  { q = 33092, c = 32883, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'leave-without-pz' },
  { q = 33094, c = 32884, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33094, c = 32884, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 33094,
    c = 32884,
    b = 6,
    type = 'TRAVEL',
    wait = "FAST_STEP_DELAY",
    city = "Port hope"
  },
  { q = 32527, c = 32784, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32535, c = 32777, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32542, c = 32785, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32550, c = 32785, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32557, c = 32777, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32557, c = 32769, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32565, c = 32767, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32573, c = 32768, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32578, c = 32767, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32578,
    c = 32767,
    b = 6,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 482,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32579, c = 32760, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32582, c = 32752, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32590, c = 32751, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32595, c = 32747, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32370,
    c = 32240,
    b = 7,
    type = 'USE_ITEM',
    wait = "FAST_STEP_DELAY",
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

  { q = 32597,        c = 32749, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32605,        c = 32752, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32606,        c = 32760, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32614,        c = 32762, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32617,        c = 32754, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32625,        c = 32751, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32629,        c = 32750, b = 7,     type = 'STAND',     wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32629,        c = 32749, b = 7,     type = 'MOVE',      wait = "FAST_STEP_DELAY",     direction = 0,              action = nil, label = '' },
  { q = 32632,        c = 32746, b = 6,     type = 'STAND',     wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32632,        c = 32746, b = 6,     type = 'STAND',     wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  {
    q = 32632,
    c = 32746,
    b = 6,
    type = 'REFILL_DISTANCE',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32631, c = 32743, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32632, c = 32739, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32632, c = 32739, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32632,
    c = 32739,
    b = 6,
    type = 'DEPOSIT',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32626, c = 32742, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32626,
    c = 32742,
    b = 6,
    type = 'LADDER',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Game
          .useItemFromGround(32626, 32742, 6)
    end,
    label = ''
  },
  { q = 32624, c = 32741, b = 5, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32624, c = 32741, b = 5, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32624,
    c = 32741,
    b = 5,
    type = 'REFILL_ALL',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32625, c = 32742, b = 5, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32626, c = 32742, b = 5, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 1, action = nil, label = '' },
  { q = 32625, c = 32748, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32625, c = 32749, b = 6, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 2, action = nil, label = '' },
  { q = 32624, c = 32751, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32617, c = 32759, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32609, c = 32763, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32601, c = 32763, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32593, c = 32763, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32585, c = 32764, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32578, c = 32766, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32578,
    c = 32766,
    b = 7,
    type = 'LADDER',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Game
          .useItemFromGround(32578, 32766, 7)
    end,
    label = ''
  },
  { q = 32577, c = 32767, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32569, c = 32768, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32561, c = 32767, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32556, c = 32775, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32556, c = 32783, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32548, c = 32786, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32540, c = 32779, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32532, c = 32778, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32527, c = 32784, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32527, c = 32784, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32527,
    c = 32784,
    b = 6,
    type = 'TRAVEL',
    wait = "FAST_STEP_DELAY",
    city = "Ankrahmun",
  },
  { q = 33092, c = 32883, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33084, c = 32878, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33085, c = 32877, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33084, c = 32877, b = 6, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 3, action = nil, label = '' },
  { q = 33088, c = 32870, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33088, c = 32862, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33089, c = 32854, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33092, c = 32846, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33092, c = 32838, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33092, c = 32830, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33097, c = 32822, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33097, c = 32814, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33098, c = 32806, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33098, c = 32798, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33098, c = 32790, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33106, c = 32789, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33107, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33115, c = 32776, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33123, c = 32771, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33131, c = 32771, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33139, c = 32769, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33147, c = 32769, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32767, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32766, b = 7, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 0, action = nil, label = '' },
  { q = 33153, c = 32763, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32762, b = 6, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 0, action = nil, label = '' },
  { q = 33153, c = 32761, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33153, c = 32753, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33155, c = 32745, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33157, c = 32737, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33158, c = 32729, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33163, c = 32721, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33164, c = 32713, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33164, c = 32705, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33164, c = 32697, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33165, c = 32689, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32681, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32673, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32665, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32657, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32649, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33166, c = 32641, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33167, c = 32638, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 33168, c = 32638, b = 7, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 1, action = nil, label = '' },
  { q = 33163, c = 32637, b = 8, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
}

WAYPOINTS       = parse(WAYPOINTS)

LOAD_DATA       = {
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
