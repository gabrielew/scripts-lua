local huntName                    = "hive-insectoid-afk-v2"
local isSimpleScript              = false
local uniqueId                    = "JIODSUH1273278XSA1"

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
sellItemList=[16126,23508,23531,16121,23507,23518,23510,23516,23511,23533,23523,828,23514,8092,16124,23543,3073,822,3370,7452,3360,3342,28823,5944,28822,14089,14087,14086,14083,3038,14088,282,281,14082,3010,3036,9058,14077,14225,14076,3027,14078,14080,3279,3391,11657,3320,3065,3067,7407,14040,7386,16118,3324,32227,8094,8092,32774,32773,32698,32703,3073,22866,22867,22736,22727,22726,22731,3414,3420,3364,3554,3281,3037,14088,282,281,14082,3010,3036,9058,14077,3030,3033,9057,3032,14225,14076,3027,14078,14080,3279,8084,3391,3055,3326,7413,7449]

-- En-us: List of items to deposit --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: Digite aqui sua lista de itens para depositar --
-- Nao de enter e nem deixe espacos apos a "virgula"
depositItemList=[14079,14081,7440]
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

]]

local SHARED_SUPPLY_CONFIGS       = {
  AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
  RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
  DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=200\nDIAMOND_ARROW_MAX=1500\n",
  RUNES =
  "AVALANCHE_MIN=0\nAVALANCHE_MAX=0\nGFB_MIN=150\nGFB_MAX=700\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=0\nSTONE_SHOWER_MAX=0\nSD_MIN=0\nSD_MAX=0\n",
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
  { q = 33447, c = 31320, b = 9, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 33447, c = 31320, b = 9, type = 'STAND', wait = "SINGLE_STEP_DELAY", label = 'temple' },
  {
    q = 33447,
    c = 31320,
    b = 9,
    type = 'USE_ITEM',
    wait = "SINGLE_STEP_DELAY",
    useItemId = 16277,
  },

  -- adventurer stone --
  { q = 32199,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32198,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32197,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32297, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'SELL',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'ENCHANT',          wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32294, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32293, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32286, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { findedId = 16791, q = 32209, c = 32281, b = 7,                     type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32274, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { findedId = 44027, q = 32178, c = 32269, b = 8,                     type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32174,        c = 32280, b = 11,    type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32175,        c = 32277, b = 11,    type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32275, b = 11,    type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32274, b = 11,    type = 'USE_FORGE',        wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  { q = 32176,        c = 32277, b = 11,    type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32279, b = 11,    type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32280, b = 11,    type = 'MOVE',             wait = 'SINGLE_STEP_DELAY',   direction = 2 },

  { q = 32178,        c = 32272, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { findedId = 20494, q = 32178, c = 32275, b = 8,                     type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32283, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32292, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32296, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32297, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32297, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32201,        c = 32298, b = 7,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32299, b = 7,     type = 'MOVE',             wait = 'SINGLE_STEP_DELAY',   direction = 5, },
  { q = 32202,        c = 32298, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32298, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32298, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32298, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32297, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32297, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32297, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32296, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32295, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32294, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32292, b = 6,     type = 'MOVE',             wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  -- adventurer stone --


  { q = 33447,        c = 31318, b = 9,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33447,        c = 31318, b = 9,     type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY',   findTileId = 1956,                  distance = 2, isSameFloor = false, },
  { q = 33450,        c = 31313, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33450,        c = 31313, b = 8,     type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY',   findTileId = 10145,                 distance = 6, isSameFloor = true, },
  { q = 33450,        c = 31313, b = 8,     type = 'FIND_DEPOT',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33451,        c = 31311, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33452,        c = 31309, b = 8,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33452,        c = 31309, b = 8,     type = 'DEPOSIT',          wait = 'SINGLE_STEP_DELAY', },
  { q = 33449,        c = 31314, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33449,        c = 31318, b = 8,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33449,        c = 31318, b = 8,     type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY',   findTileId = 1954,                  distance = 6, isSameFloor = false, },
  { q = 33450,        c = 31317, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33453,        c = 31314, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33459,        c = 31310, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33460,        c = 31309, b = 7,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33460,        c = 31309, b = 7,     type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY',   findTileId = 1956,                  distance = 6, isSameFloor = false, },
  { q = 33459,        c = 31302, b = 6,     type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33459,        c = 31302, b = 6,     type = 'REFILL_ALL',       wait = 'SINGLE_STEP_DELAY',   label = 'BUY_REFILL_ALL', },
  { q = 33459,        c = 31302, b = 6,     type = 'CHECK_REFILL_ALL', wait = 'SINGLE_STEP_DELAY', },
  { q = 33459,        c = 31302, b = 6,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY',   label = 'CONTINUE_FROM_REFILL_ALL', },
  { q = 33458,        c = 31299, b = 6,     type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33458,
    c = 31299,
    b = 6,
    type = 'TARGET',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      Engine.enableEquipment(false)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
  },

  { q = 33458, c = 31299, b = 6, type = 'FIND_TP', wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 3, isSameFloor = false, },
  { q = 33457, c = 31296, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31291, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31286, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33460, c = 31281, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33465, c = 31277, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33470, c = 31275, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33475, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33480, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33485, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33490, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33495, c = 31273, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33500, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33505, c = 31276, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 31275, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33515, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33520, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31274, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33527, c = 31269, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33528, c = 31264, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33533, c = 31260, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31257, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33548, c = 31251, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },

  { q = 33548, c = 31249, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33548,
    c = 31249,
    b = 7,
    type = 'TARGET',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,
  },

  { q = 33548, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', label = 'start' },
  { q = 33554, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33556, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33558, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33560, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33562, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33564, c = 31245, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33566, c = 31244, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33567, c = 31242, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33567, c = 31240, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33569, c = 31239, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33571, c = 31239, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33573, c = 31239, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },

  { q = 33572, c = 31237, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33570, c = 31236, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33568, c = 31236, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33566, c = 31236, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33565, c = 31234, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33564, c = 31232, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33564, c = 31230, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33564, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33566, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33568, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33570, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33572, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33574, c = 31226, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33575, c = 31224, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33575, c = 31222, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33577, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33580, c = 31221, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33583, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31223, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31229, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31223, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33586, c = 31219, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33587, c = 31217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33589, c = 31217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31216, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31216, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33593, c = 31217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31219, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31219, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31219, b = 7, type = 'FIND_TP', wait = 'SINGLE_STEP_DELAY', findTileId = 13341, distance = 6, isSameFloor = false, },
  { q = 33596, c = 31216, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31216, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31218, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31220, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31222, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31224, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31225, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33598, c = 31226, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33599, c = 31227, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33601, c = 31226, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33603, c = 31225, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33605, c = 31224, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33607, c = 31224, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33609, c = 31224, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33610, c = 31226, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33610, c = 31228, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33610, c = 31230, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31233, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31234, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31235, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31237, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33608, c = 31239, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33606, c = 31239, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33604, c = 31239, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33604, c = 31241, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33602, c = 31242, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33600, c = 31242, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33600, c = 31242, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33598, c = 31242, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31244, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31246, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31248, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31250, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33597, c = 31252, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31251, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33593, c = 31250, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31248, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33589, c = 31248, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33588, c = 31246, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33588, c = 31244, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33590, c = 31243, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31241, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33592, c = 31239, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31239, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31237, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33595, c = 31235, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33596, c = 31235, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33596, c = 31233, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33592, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33590, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33588, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33586, c = 31231, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31233, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33583, c = 31233, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33581, c = 31233, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33579, c = 31232, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33579, c = 31231, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33578, c = 31230, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33578, c = 31228, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33578, c = 31226, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33580, c = 31225, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33581, c = 31223, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33583, c = 31222, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33583, c = 31220, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33583, c = 31218, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31218, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33585, c = 31218, b = 6, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33587, c = 31217, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33589, c = 31216, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31215, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33593, c = 31215, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31215, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33594, c = 31215, b = 6, type = 'FIND_TP', wait = 'SINGLE_STEP_DELAY', findTileId = 469,   distance = 6, isSameFloor = false, },
  { q = 33595, c = 31218, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33593, c = 31217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31216, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33591, c = 31216, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33589, c = 31216, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33587, c = 31216, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33586, c = 31218, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33586, c = 31220, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33586, c = 31222, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33584, c = 31222, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33582, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33580, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33580, c = 31221, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 33578, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33576, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33574, c = 31222, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33573, c = 31224, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33573, c = 31226, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33571, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33569, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33567, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33565, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33563, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33561, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33559, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33557, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33555, c = 31225, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33554, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33552, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33550, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33548, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33546, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33544, c = 31228, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33543, c = 31230, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33543, c = 31232, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33541, c = 31233, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33539, c = 31233, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31233, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31233, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33533, c = 31232, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 31231, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 31229, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31227, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31226, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31224, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31223, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31221, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31219, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33536, c = 31217, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31215, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33533, c = 31214, b = 7, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33533,
    c = 31214,
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
  { q = 33532, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31214, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33529, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33529, c = 31214, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33527, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31215, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33522, c = 31217, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31219, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31217, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31215, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31213, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31211, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31211, b = 7, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 13341, distance = 6, isSameFloor = false, },
  { q = 33519, c = 31207, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31208, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31209, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31210, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33527, c = 31210, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33529, c = 31210, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 31209, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33533, c = 31209, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31209, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31209, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31209, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31209, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33537,
    c = 31209,
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
  { q = 33537, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31211, b = 6, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31213, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31215, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31217, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31219, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31221, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31221, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33533, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33531, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33529, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33527, c = 31222, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31222, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31223, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31222, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33519, c = 31223, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33517, c = 31222, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33515, c = 31221, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33513, c = 31221, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33511, c = 31219, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 31217, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 31215, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33509, c = 31213, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33508, c = 31212, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33507, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33505, c = 31210, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33503, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33501, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33499, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33497, c = 31211, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33495, c = 31210, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33494, c = 31208, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33493, c = 31206, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33492, c = 31206, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33492,
    c = 31206,
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
  { q = 33491, c = 31206, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33491, c = 31206, b = 6, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33489, c = 31207, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33487, c = 31206, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33486, c = 31204, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33485, c = 31202, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33483, c = 31201, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33483, c = 31201, b = 6, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 13341, distance = 6, isSameFloor = false, },
  { q = 33485, c = 31198, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },

  { q = 33490, c = 31199, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33490, c = 31199, b = 5, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33490,
    c = 31199,
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
  { q = 33489, c = 31198, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33489, c = 31198, b = 5, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33484, c = 31198, b = 5, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33484, c = 31198, b = 5, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
  { q = 33485, c = 31201, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33489, c = 31207, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33492, c = 31207, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33492, c = 31205, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33493, c = 31203, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33493, c = 31203, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33493, c = 31201, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33494, c = 31199, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31198, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33497, c = 31196, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33499, c = 31196, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33501, c = 31197, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33503, c = 31197, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33503, c = 31197, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33505, c = 31196, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33507, c = 31196, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33509, c = 31196, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33511, c = 31198, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33512, c = 31200, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33512, c = 31200, b = 6, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33513, c = 31202, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33513, c = 31204, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33514, c = 31206, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33516, c = 31206, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33517, c = 31207, b = 6, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33517, c = 31207, b = 6, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
  { q = 33522, c = 31212, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31207, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31204, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31202, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31200, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31198, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31194, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33527, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33521, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33519, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33517, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33515, c = 31193, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33508, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33506, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33506, c = 31197, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33504, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33502, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33500, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33498, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31197, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33496,
    c = 31197,
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
  { q = 33496, c = 31198, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31198, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31199, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31201, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33497, c = 31205, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33497,
    c = 31205,
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
  { q = 33496, c = 31205, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31205, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31201, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31199, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31199, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33496, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33498, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33500, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33502, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33504, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33506, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33506, c = 31197, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33508, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33510, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33512, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33514, c = 31197, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33516, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33518, c = 31195, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33520, c = 31195, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33522, c = 31196, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31198, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31199, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33523,
    c = 31199,
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
  { q = 33523, c = 31201, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31201, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31203, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31205, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31207, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31209, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33523, c = 31211, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33522, c = 31213, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31215, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33524, c = 31215, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33524,
    c = 31215,
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
  { q = 33525, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31214, b = 7, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
  { q = 33529, c = 31214, b = 7, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31214, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31215, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33536, c = 31216, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33536, c = 31218, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31220, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33537, c = 31222, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31223, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31225, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31226, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31228, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31230, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33532, c = 31232, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33534, c = 31234, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33536, c = 31234, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33538, c = 31234, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33540, c = 31234, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33542, c = 31235, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33544, c = 31235, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33546, c = 31236, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33548, c = 31237, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33550, c = 31239, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33551, c = 31241, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33551, c = 31243, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33550, c = 31243, b = 7, type = 'CHECK_SUPPLY',      wait = 'SINGLE_STEP_DELAY', },
  { q = 33550, c = 31243, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', label = 'leave', },

  { q = 33546, c = 31256, b = 7, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33546,
    c = 31256,
    b = 7,
    type = 'TARGET',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      Engine.enableEquipment(false)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
  },
  { q = 33545, c = 31262, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33540, c = 31262, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33535, c = 31262, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33530, c = 31262, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33525, c = 31263, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33520, c = 31264, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33515, c = 31265, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33512, c = 31270, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33507, c = 31271, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33502, c = 31271, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33497, c = 31271, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33492, c = 31272, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33487, c = 31274, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33482, c = 31275, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33477, c = 31275, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33472, c = 31278, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33467, c = 31278, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33462, c = 31278, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33459, c = 31283, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33458, c = 31288, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31293, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31294, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31294, b = 7, type = 'CHECK_PZ', wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31294, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', label = 'find-safe-place', },
  { q = 33453, c = 31298, b = 7, type = 'STAND',    wait = 'SINGLE_STEP_DELAY', },
  { q = 33453, c = 31298, b = 7, type = 'WAIT_PZ',  wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31294, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', label = 'leave-without-pz', },
  { q = 33457, c = 31296, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33457, c = 31296, b = 7, type = 'FIND_TP',  wait = 'SINGLE_STEP_DELAY', findTileId = 1954,          distance = 3, isSameFloor = false, },
  { q = 33460, c = 31303, b = 6, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33460, c = 31306, b = 6, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33460, c = 31306, b = 6, type = 'FIND_TP',  wait = 'SINGLE_STEP_DELAY', findTileId = 469,           distance = 6, isSameFloor = false, },
  { q = 33460, c = 31310, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33455, c = 31316, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33449, c = 31321, b = 7, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33449, c = 31321, b = 7, type = 'FIND_TP',  wait = 'SINGLE_STEP_DELAY', findTileId = 6129,          distance = 6, isSameFloor = false, },
  { q = 33447, c = 31319, b = 8, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  { q = 33447, c = 31319, b = 8, type = 'FIND_TP',  wait = 'SINGLE_STEP_DELAY', findTileId = 6130,          distance = 6, isSameFloor = false, },
  { q = 33447, c = 31318, b = 9, type = 'NODE',     wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33447,
    c = 31318,
    b = 9,
    type = 'FIND_LABEL',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      return "temple"
    end,
  },


  {
    q = 33447,
    c = 31318,
    b = 9,
    type = 'TARGET',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
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
