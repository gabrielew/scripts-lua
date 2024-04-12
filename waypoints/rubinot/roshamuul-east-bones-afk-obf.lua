local huntName                    = "roshamuul-east-bones-afk"
local isSimpleScript              = false
local uniqueId                    = "roshamuuleastbonesafkUDHWa"

local PLAYER_CREATURE             = Creature.new(Player.getId())
local PLAYER_VOCATION             = PLAYER_CREATURE:getVocation()
local EK                          = Enums.Vocations.KNIGHT
local defaultValues               = {
  MAX_MONSTER_TO_STOP = PLAYER_VOCATION == EK and 8 or 10,
  MIN_MONSTER_TO_BACK = PLAYER_VOCATION == EK and 0 or 3,
  MONSTER_MEDIUM_LIFE_PERCENTAGE = PLAYER_VOCATION == EK and 0 or 10,
  RUN_AWAY_WITH_MONSTER_COUNT = 25,
  MONSTER_COUNT_AREA = 7,
  MAX_STEP_DELAY = 2000,
  SINGLE_STEP_DELAY = 100,
}

local IGNORE_MONSTER_LIST         = {
  ["hive pore"] = true,
  ["ladybug"] = true,
  ["lesser swarmer"] = true,
  ["swarmer"] = true,
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
sellItemList=[239,812,813,3029,3030,3034,3049,3065,3079,3111,3125,3265,3418,3421,3483,3578,3582,5880,5895,5925,7368,7387,7404,7407,7413,7414,7418,7451,7454,9057,9058,10389,16120,16123,16126,20062,20198,20199,20201,44602,44605,44608,44611]

-- En-us: List of items to deposit --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: Digite aqui sua lista de itens para depositar --
-- Nao de enter e nem deixe espacos apos a "virgula"
depositItemList=[14079,14081,7440]
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

-- En-us: drop item list --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: lista de itens para dropar --
-- Nao de enter e nem deixe espacos apos a "virgula"
dropItemList=[20055]

-- En-us: use bones, leave 1 to yes, else 0 --
-- Pt-br: usar bones, deixe 1 para sim, senao 0 --
USE_BONES=1

]]

local SHARED_SUPPLY_CONFIGS       = {
  AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
  RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
  DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=200\nDIAMOND_ARROW_MAX=1500\n",
  RUNES =
  "AVALANCHE_MIN=150\nAVALANCHE_MAX=700\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=0\nSTONE_SHOWER_MAX=0\nSD_MIN=0\nSD_MAX=0\n",
}

local MAGE_CONFIGS                = {
  POTIONS =
  "ULTIMATE_MANA_POTION_MIN=150\nULTIMATE_MANA_POTION_MAX=700\nGREAT_MANA_POTION_MIN=150\nGREAT_MANA_POTION_MAX=500\n",
  RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "GREEN_PLASMA_MIN=0\nGREEN_PLASMA_MAX=0\n",
  AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "GREEN_PLASMA_COLLAR_MIN=0\nGREEN_PLASMA_COLLAR_MAX=0\n",
  RUNES = SHARED_SUPPLY_CONFIGS.RUNES .. "UH_MIN=0\nUH_MAX=0\n",
}

local SUPPLY_CONFIGS              = {
  [Enums.Vocations.KNIGHT] = {
    POTIONS =
        "SUPREME_HEALTH_POTION_MIN=0\nSUPREME_HEALTH_POTION_MAX=0\nULTIMATE_HEALTH_POTION_MIN=100\nULTIMATE_HEALTH_POTION_MAX=300\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
        "STRONG_MANA_POTION_MIN=150\nSTRONG_MANA_POTION_MAX=700\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
    RUNES = "",
  },
  [Enums.Vocations.PALADIN] = {
    POTIONS =
    "ULTIMATE_SPIRIT_POTION_MIN=150\nULTIMATE_SPIRIT_POTION_MAX=750\nGREAT_SPIRIT_POTION_MIN=0\nGREAT_SPIRIT_POTION_MAX=0\nGREAT_MANA_POTION_MIN=150\nGREAT_MANA_POTION_MAX=700\n",
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
  { q = 32369, c = 32238, b = 7, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 32369, c = 32238, b = 7, type = 'STAND', wait = 'SINGLE_STEP_DELAY', label = "temple" },

  {
    q = 32369,
    c = 32238,
    b = 7,
    type = 'USE_ITEM',
    wait = "FAST_STEP_DELAY",
    useItemId = 16277,
  },


  -- adventurer stone --
  { q = 32199,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32198,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32197,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32297, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'SELL',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'ENCHANT',                wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32294, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32293, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32286, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { findedId = 16791, q = 32209, c = 32281, b = 7,                           type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32274, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { findedId = 44027, q = 32178, c = 32269, b = 8,                           type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32174,        c = 32280, b = 11,    type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32175,        c = 32277, b = 11,    type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32275, b = 11,    type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32274, b = 11,    type = 'USE_FORGE',              wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  { q = 32176,        c = 32277, b = 11,    type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32279, b = 11,    type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32280, b = 11,    type = 'MOVE',                   wait = 'SINGLE_STEP_DELAY',   direction = 2 },

  { q = 32178,        c = 32272, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { findedId = 20494, q = 32178, c = 32275, b = 8,                           type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32283, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32292, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32296, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32297, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32297, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32201,        c = 32298, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32299, b = 7,     type = 'MOVE',                   wait = 'SINGLE_STEP_DELAY',   direction = 5, },
  { q = 32202,        c = 32298, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32298, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32298, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32298, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32297, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32297, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32297, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32296, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32295, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32294, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32292, b = 6,     type = 'MOVE',                   wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  -- adventurer stone --

  { q = 32369,        c = 32235, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32234, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32228, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32222, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32216, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32214, b = 7,     type = 'PRE_CHECK_REFILL_RUNES', wait = 'SINGLE_STEP_DELAY',   label = 'BUY_PRE_CHECK_REFILL_RUNES', },
  { q = 32369,        c = 32214, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY',   label = 'need-to-refill-runes', },

  { q = 32369,        c = 32210, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32204, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32198, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32192, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32186, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32375,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32381,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32387,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32393,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32399,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32405,        c = 32182, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32411,        c = 32181, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32411,        c = 32175, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32413,        c = 32171, b = 7,     type = 'STAND',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32413,        c = 32171, b = 7,     type = 'REFILL_RUNES',           wait = 'SINGLE_STEP_DELAY',   label = 'BUY_REFILL_RUNES', },
  { q = 32413,        c = 32171, b = 7,     type = 'CHECK_REFILL_RUNES',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32413,        c = 32171, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY',   label = 'CONTINUE_FROM_REFILL_RUNES', },
  { q = 32410,        c = 32181, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32404,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32398,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32392,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32386,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32380,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32374,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32183, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32189, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32195, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32201, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32207, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32368,        c = 32213, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY', },
  { q = 32369,        c = 32214, b = 7,     type = 'NODE',                   wait = 'SINGLE_STEP_DELAY',   label = 'not-need-to-refill-runes', }, { q = 32363, c = 32214, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 32360, c = 32214, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32354, c = 32214, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32346, c = 32219, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32345, c = 32226, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32344, c = 32228, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 32344, c = 32228, b = 7, type = 'DEPOSIT', wait = 'SINGLE_STEP_DELAY', },
  { q = 32342, c = 32223, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32338, c = 32218, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32327, c = 32217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32324, c = 32214, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32321, c = 32211, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32321, c = 32211, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  {
    q = 32321,
    c = 32211,
    b = 7,
    type = 'LADDER',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      local playerPos = Map.getCameraPosition()
      local lastPlayerPos = playerPos
      while lastPlayerPos.z == playerPos.z do
        wait(500)
        Game.useItemFromGround(32321, 32211, 7)
        playerPos = Map.getCameraPosition()
      end
    end,
  },
  { q = 32318, c = 32211, b = 6, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32316, c = 32210, b = 6, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32315, c = 32210, b = 6, type = 'MOVE',             wait = 'SINGLE_STEP_DELAY', direction = 3, },
  { q = 32315, c = 32210, b = 6, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32314, c = 32210, b = 6, type = 'MOVE',             wait = 'SINGLE_STEP_DELAY', direction = 3, },
  { q = 32310, c = 32209, b = 6, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32310, c = 32209, b = 6, type = 'TRAVEL',           wait = 'SINGLE_STEP_DELAY', city = 'Roshamuul', },
  { q = 33496, c = 32565, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33503, c = 32562, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 32562, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33515, c = 32560, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32560, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32560, b = 7, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32560, b = 7, type = 'FIND_NPC',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 32560, b = 7, type = 'REFILL_ALL',       wait = 'SINGLE_STEP_DELAY', label = 'BUY_REFILL_ALL', },
  { q = 33524, c = 32560, b = 7, type = 'CHECK_REFILL_ALL', wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32560, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', label = 'CONTINUE_FROM_REFILL_ALL', },

  { q = 33523, c = 32554, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 32551, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 32551, b = 7, type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY', findTileId = 16694,                 distance = 6, isSameFloor = false, },
  { q = 33524, c = 32544, b = 6, type = 'NODE',             wait = 'FAST_STEP_DELAY', },
  {

    q = 33524,
    c = 32544,
    b = 6,
    type = 'TARGET',
    wait = 'FAST_STEP_DELAY',
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,
  },
  { q = 33527, c = 32534, b = 6, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  { q = 33529, c = 32528, b = 6, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  { q = 33529, c = 32528, b = 6, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  {
    q = 33529,
    c = 32528,
    b = 6,
    type = 'CHANGE_THING',
    wait = 'FAST_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
  },
  { q = 33529, c = 32527, b = 6, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33529, c = 32527, b = 6, type = 'CHANGE_THING_BACK', wait = 'FAST_STEP_DELAY', },
  { q = 33529, c = 32527, b = 6, type = 'FIND_TP',           wait = 'FAST_STEP_DELAY', findTileId = 1956, distance = 6, isSameFloor = false, },
  { q = 33531, c = 32520, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33537, c = 32516, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33537, c = 32508, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33537, c = 32500, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33538, c = 32491, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33539, c = 32488, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33539, c = 32488, b = 5, type = 'STAND',             wait = 'FAST_STEP_DELAY', },
  {
    q = 33539,
    c = 32488,
    b = 5,
    type = 'CHANGE_THING',
    wait = 'FAST_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
  },
  { q = 33539, c = 32487, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  { q = 33539, c = 32487, b = 5, type = 'CHANGE_THING_BACK', wait = 'FAST_STEP_DELAY', },
  { q = 33539, c = 32485, b = 5, type = 'NODE',              wait = 'FAST_STEP_DELAY', },

  { q = 33539, c = 32485, b = 5, type = 'FIND_TP',           wait = 'FAST_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
  { q = 33539, c = 32478, b = 6, type = 'NODE',              wait = 'FAST_STEP_DELAY', },
  {
    q = 33539,
    c = 32478,
    b = 6,
    type = 'TARGET',
    wait = 'FAST_STEP_DELAY',
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,
  },
  { q = 33539, c = 32478, b = 6, type = 'FIND_TP', wait = 'FAST_STEP_DELAY', findTileId = 469, distance = 4, isSameFloor = false, },
  { q = 33539, c = 32473, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33545, c = 32473, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33551, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33557, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33563, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33569, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33575, c = 32476, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33581, c = 32473, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33587, c = 32474, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33593, c = 32477, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33599, c = 32477, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33605, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33611, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33617, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33623, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33629, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33632, c = 32478, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33633, c = 32475, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33633, c = 32473, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33634, c = 32471, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33634, c = 32469, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33635, c = 32467, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33637, c = 32467, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33638, c = 32465, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33640, c = 32464, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33641, c = 32462, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33643, c = 32461, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33645, c = 32460, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', label = 'start' },
  { q = 33647, c = 32459, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  { q = 33648, c = 32459, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b1"
      else
        return "c1"
      end
    end,
  },
  { q = 33648, c = 32459, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b1' },
  { q = 33650, c = 32455, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33653, c = 32453, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33654,
    c = 32453,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33654, 32453, 7)
    end,
  },

  { q = 33651, c = 32458, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33654, c = 32461, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33657, c = 32462, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33658,
    c = 32462,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33658, 32462, 7)
    end,
  },
  { q = 33651, c = 32463, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c1' },
  { q = 33649, c = 32464, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b2"
      else
        return "c2"
      end
    end,
  },
  { q = 33645, c = 32464, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b2' },
  { q = 33644, c = 32466, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33644,
    c = 32467,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 2,
    action = function()
      Game
          .useItemFromGround(33644, 32467, 7)
    end,
  },
  { q = 33649, c = 32471, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c2' },
  { q = 33648, c = 32475, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33650, c = 32477, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b3"
      else
        return "c3"
      end
    end,
  },
  { q = 33648, c = 32478, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b3' },
  { q = 33647, c = 32481, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33647,
    c = 32482,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 2,
    action = function()
      Game
          .useItemFromGround(33647, 32482, 7)
    end,
  },
  { q = 33653, c = 32479, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33657, c = 32481, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33658,
    c = 32481,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33658, 32481, 7)
    end,
  },
  { q = 33656, c = 32475, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c3' },
  { q = 33661, c = 32474, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b4"
      else
        return "c4"
      end
    end,
  },
  { q = 33662, c = 32473, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b4' },
  { q = 33662, c = 32471, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33662,
    c = 32470,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      Game
          .useItemFromGround(33662, 32470, 7)
    end,
  },
  { q = 33665, c = 32471, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33666,
    c = 32472,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 5,
    action = function()
      Game
          .useItemFromGround(33666, 32472, 7)
    end,
  },
  { q = 33664, c = 32476, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c4' },
  { q = 33669, c = 32476, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33669, c = 32476, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b5"
      else
        return "c5"
      end
    end,
  },
  { q = 33669, c = 32476, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b5' },
  { q = 33672, c = 32474, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33673,
    c = 32473,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 7,
    action = function()
      Game
          .useItemFromGround(33673, 32473, 7)
    end,
  },
  { q = 33676, c = 32476, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33677,
    c = 32476,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33677, 32476, 7)
    end,
  },
  { q = 33672, c = 32480, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c5' },
  { q = 33672, c = 32483, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33676, c = 32488, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b6"
      else
        return "c6"
      end
    end,
  },
  { q = 33676, c = 32488, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b6' },
  { q = 33678, c = 32487, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33679,
    c = 32486,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 7,
    action = function()
      Game
          .useItemFromGround(33679, 32486, 7)
    end,
  },
  { q = 33680, c = 32488, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33681,
    c = 32489,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 5,
    action = function()
      Game
          .useItemFromGround(33681, 32489, 7)
    end,
  },
  { q = 33684, c = 32488, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33685,
    c = 32487,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 7,
    action = function()
      Game
          .useItemFromGround(33685, 32487, 7)
    end,
  },
  { q = 33687, c = 32488, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33688,
    c = 32488,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33688, 32488, 7)
    end,
  },
  { q = 33691, c = 32486, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33689, c = 32487, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'c6' },
  { q = 33691, c = 32486, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', }, { q = 33695, c = 32486, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b7"
      else
        return "c7"
      end
    end,
  },
  { q = 33695, c = 32487, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', label = 'b7' },
  { q = 33697, c = 32490, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33698,
    c = 32491,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 5,
    action = function()
      Game
          .useItemFromGround(33698, 32491, 7)
    end,
  },
  { q = 33696, c = 32486, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  { q = 33696, c = 32483, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33696,
    c = 32482,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      Game
          .useItemFromGround(33696, 32482, 7)
    end,
  },
  { q = 33703, c = 32479, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33703,
    c = 32478,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      Game
          .useItemFromGround(33703, 32478, 7)
    end,
  },
  { q = 33704, c = 32481, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33705,
    c = 32481,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      Game
          .useItemFromGround(33705, 32481, 7)
    end,
  },
  { q = 33707, c = 32483, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33707,
    c = 32482,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      Game
          .useItemFromGround(33707, 32482, 7)
    end,
  },
  { q = 33708, c = 32486, b = 7, type = 'NODE', wait = 'FAST_STEP_DELAY', },
  {
    q = 33707,
    c = 32487,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 4,
    action = function()
      Game
          .useItemFromGround(33707, 32487, 7)
    end,
  },

  { q = 33707, c = 32492, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33707, c = 32493, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33707, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33706, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33705, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33704, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33704, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33703, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33703, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33702, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33702, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33701, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33700, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33700, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33699, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33699, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33698, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33697, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33696, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33695, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33694, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33694, c = 32490, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', label = "c7" },
  { q = 33694, c = 32491, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33694, c = 32492, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33694, c = 32493, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32493, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33693, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33691, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33687, c = 32502, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33687, c = 32503, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33687, c = 32504, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32504, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32505, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32506, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32507, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32508, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32509, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32510, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32511, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33686, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33685, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33685, c = 32513, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33684, c = 32513, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33684, c = 32514, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33684, c = 32515, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33684, c = 32516, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32516, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32517, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32518, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32519, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32520, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32521, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32522, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32523, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33683, c = 32524, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32524, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32525, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32523, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32522, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32521, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33682, c = 32520, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33681, c = 32519, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33680, c = 32518, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33679, c = 32517, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33678, c = 32516, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33677, c = 32515, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33676, c = 32514, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33676, c = 32513, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33675, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33674, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33673, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33672, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33671, c = 32512, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33670, c = 32511, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33669, c = 32511, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33668, c = 32510, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33667, c = 32509, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33666, c = 32509, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33665, c = 32508, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33664, c = 32507, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33663, c = 32507, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33662, c = 32507, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33663, c = 32501, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b8"
      else
        return "c8"
      end
    end,
  },
  { q = 33663, c = 32501, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', label = "b8" },
  { q = 33662, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33661, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33660, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33658, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33658, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33657,
    c = 32500,
    b = 7,
    type = 'USE_LEVER',
    wait = 'SINGLE_STEP_DELAY',
    direction = 3,
    action = function()
      Game
          .useItemFromGround(33657, 32500, 7)
    end,
  },
  { q = 33659, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33659, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33658,
    c = 32493,
    b = 7,
    type = 'USE_LEVER',
    wait = 'SINGLE_STEP_DELAY',
    direction = 6,
    action = function()
      Game
          .useItemFromGround(33658, 32493, 7)
    end,
  },
  { q = 33660, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33661, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33662, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33663, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33664, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33665, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33666, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33667, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33668, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33669, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33669, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33670,
    c = 32499,
    b = 7,
    type = 'USE_LEVER',
    wait = 'SINGLE_STEP_DELAY',
    direction = 5,
    action = function()
      Game
          .useItemFromGround(33670, 32499, 7)
    end,
  },
  { q = 33668, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33667, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33666, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33665, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33664, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33663, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33662, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33661, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33660, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33660, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', label = "c8" },
  { q = 33659, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33658, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33657, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33656, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33655, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33654, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33654, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33653, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33653, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33651, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33651, c = 32501, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33650, c = 32501, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33649, c = 32500, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33648, c = 32499, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33647, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33645, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33642, c = 32498, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33642, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33643, c = 32497, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33643, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33644, c = 32496, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33644, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33645, c = 32495, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33645, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32494, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32493, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32492, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32491, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33647, c = 32491, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33647, c = 32490, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33647, c = 32489, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33648, c = 32489, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33648, c = 32488, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33649, c = 32488, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33650, c = 32488, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33650, c = 32487, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33650, c = 32486, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33651, c = 32486, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33651, c = 32485, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32485, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32484, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32483, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33653, c = 32483, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33652, c = 32481, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33651, c = 32480, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33650, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33649, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33648, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33647, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33646, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33648,
    c = 32459,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'FAST_STEP_DELAY',
    action = function()
      if tonumber(values.USE_BONES) == 1 then
        return "b9"
      else
        return "c9"
      end
    end,
  },
  { q = 33646, c = 32479, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', label = "b9" },
  { q = 33646, c = 32481, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33647,
    c = 32482,
    b = 7,
    type = 'USE_LEVER',
    wait = 'SINGLE_STEP_DELAY',
    direction = 5,
    action = function()
      Game.useItemFromGround(33647, 32482, 7)
    end,
  },
  { q = 33641, c = 32481, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33638, c = 32484, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33637,
    c = 32485,
    b = 7,
    type = 'USE_LEVER',
    wait = 'SINGLE_STEP_DELAY',
    direction = 4,
    action = function()
      Game.useItemFromGround(33637, 32485, 7)
    end,
  },
  { q = 33642, c = 32478, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', label = "c9" },
  { q = 33642, c = 32478, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33641, c = 32478, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33640, c = 32477, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33639, c = 32477, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33638, c = 32477, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33637, c = 32476, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33636, c = 32475, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32474, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32473, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32472, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32471, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32470, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32469, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32468, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32467, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32466, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32465, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32464, b = 7, type = 'STAND',        wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32464, b = 7, type = 'CHECK_SUPPLY', wait = 'SINGLE_STEP_DELAY', },
  { q = 33635, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', label = 'leave', },
  { q = 33630, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33625, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33620, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33615, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33610, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33605, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33600, c = 32463, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 32464, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33590, c = 32467, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 32468, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33582, c = 32473, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33577, c = 32473, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33572, c = 32473, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33568, c = 32478, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33563, c = 32479, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33558, c = 32479, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33553, c = 32478, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33548, c = 32476, b = 7, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 32474, b = 7, type = 'STAND',        wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33539,
    c = 32474,
    b = 7,
    type = 'CHANGE_THING',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
  },
  { q = 33539, c = 32475, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 32475, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 32475, b = 7, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 1954, distance = 6, isSameFloor = false, },
  { q = 33539, c = 32479, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 32481, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 32481, b = 6, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 1954, distance = 6, isSameFloor = false, },
  { q = 33537, c = 32492, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 32492, b = 5, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33537,
    c = 32492,
    b = 5,
    type = 'CHANGE_THING',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
  },
  { q = 33537, c = 32494, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 32494, b = 5, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 32500, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 32508, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 32518, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 32520, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 32521, b = 5, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
  { q = 33528, c = 32528, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33526, c = 32535, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33526, c = 32535, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33526,
    c = 32535,
    b = 6,
    type = 'CHANGE_THING',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 2
      values.MIN_MONSTER_TO_BACK = 0
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
  },
  { q = 33525, c = 32536, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 32536, b = 6, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32541, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32546, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 32546, b = 6, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
  { q = 33521, c = 32555, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33522,
    c = 32553,
    b = 7,
    type = 'FIND_LABEL',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      return "go-thais"
    end,
  },


  --backthais
  { q = 33520, c = 32559, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', label = "go-thais" },
  {
    q = 33520,
    c = 32559,
    b = 7,
    type = 'TARGET',
    wait = 'FAST_STEP_DELAY',
    action = function()
      Engine.enableEquipment(false)
      wait(50)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
  },
  { q = 33511, c = 32562, b = 7, type = 'WAIT_PZ', wait = 'SINGLE_STEP_DELAY', },
  { q = 33511, c = 32562, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33502, c = 32562, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 32564, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33495, c = 32567, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33495, c = 32567, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33495, c = 32567, b = 7, type = 'TRAVEL',  wait = 'SINGLE_STEP_DELAY', city = 'Thais', },

  { q = 32314, c = 32210, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 32315, c = 32210, b = 6, type = 'MOVE',    wait = 'SINGLE_STEP_DELAY', direction = 1, },
  { q = 32315, c = 32210, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 32319, c = 32211, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32319, c = 32211, b = 6, type = 'FIND_TP', wait = 'SINGLE_STEP_DELAY', findTileId = 369,  distance = 6, isSameFloor = false, },
  { q = 32324, c = 32214, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32333, c = 32215, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32344, c = 32215, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32358, c = 32215, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32369, c = 32215, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32369, c = 32223, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32369, c = 32231, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 32369, c = 32235, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  {
    q = 32369,
    c = 32235,
    b = 7,
    type = 'FIND_LABEL',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      return "temple"
    end,
  },

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
