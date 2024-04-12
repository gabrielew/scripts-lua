local huntName                    = "true-asura-afk"
local isSimpleScript              = false
local uniqueId                    = "trueasuraafkaodkaowdPorthoped"

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
  ["elephat"] = true,
  ["crocodile"] = true,
  ["tarantula"] = true,
  ["parrot"] = true,
  ["panda"] = true,
  ["snake"] = true,
  ["cobra"] = true,
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
sellItemList=[238,239,678,785,817,818,821,826,827,3007,3015,3016,3017,3026,3027,3028,3029,3029,3030,3030,3031,3032,3033,3034,3035,3036,3037,3038,3039,3041,3043,3054,3065,3067,3069,3071,3078,3116,3280,3281,3282,3318,3369,3371,3403,3413,3567,3574,3582,3724,4871,5910,5911,5914,5925,5944,6299,6499,6553,6558,7368,7404,7414,7421,7426,7439,7452,7642,7643,8043,8061,8074,8082,8083,8895,8896,9039,9057,9057,9058,9636,9637,10304,16131,21974,21975,21981,null,25759,44602,44605,44608,44611]
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

-- En-us: Amount of monster to stop in programmed box --
-- Pt-br: Quantidade de monstros para parar na box programada --
MONSTER_TO_START_BOX=2

-- En-us: Amount of monster to leave in programmed box --
-- Pt-br: Quantidade de monstros para sair da box programada --
MONSTER_TO_LEAVE_BOX=0

]]

local SHARED_SUPPLY_CONFIGS       = {
  AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
  RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
  DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=400\nDIAMOND_ARROW_MAX=2000\n",
  RUNES =
  "AVALANCHE_MIN=150\nAVALANCHE_MAX=1000\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=0\nSTONE_SHOWER_MAX=0\nSD_MIN=0\nSD_MAX=0\n",
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
        "SUPREME_HEALTH_POTION_MIN=150\nSUPREME_HEALTH_POTION_MAX=700\nULTIMATE_HEALTH_POTION_MIN=0\nULTIMATE_HEALTH_POTION_MAX=0\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
        "STRONG_MANA_POTION_MIN=350\nSTRONG_MANA_POTION_MAX=1000\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
    RUNES = "",
  },
  [Enums.Vocations.PALADIN] = {
    POTIONS =
    "ULTIMATE_SPIRIT_POTION_MIN=150\nULTIMATE_SPIRIT_POTION_MAX=700\nGREAT_SPIRIT_POTION_MIN=0\nGREAT_SPIRIT_POTION_MAX=0\nGREAT_MANA_POTION_MIN=200\nGREAT_MANA_POTION_MAX=1000\n",
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
    if w[i].multiplier then
      w[i].q = w[i].q * w[i].multiplier
      w[i].c = w[i].c * w[i].multiplier
      w[i].b = w[i].b * w[i].multiplier
    end
    table.insert(wq, {
      x           = w[i].q / 80,
      y           = w[i].c / 80,
      z           = w[i].b / 80,
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
  { multiplier = 80, q = 32595, c = 32746, b = 7, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32595, c = 32745, b = 7, type = 'STAND', wait = 'SINGLE_STEP_DELAY', label = 'temple' },

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
  { findedId = 16791, q = 32209, c = 32281, b = 7,              type = 'ENTER_HOLE',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32274, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { findedId = 44027, q = 32178, c = 32269, b = 8,              type = 'ENTER_TP',              wait = 'SINGLE_STEP_DELAY', },
  { q = 32174,        c = 32280, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32175,        c = 32277, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32275, b = 11,    type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32274, b = 11,    type = 'USE_FORGE', wait = 'SINGLE_STEP_DELAY',     direction = 0, },
  { q = 32176,        c = 32277, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32279, b = 11,    type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32280, b = 11,    type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',     direction = 2 },

  { q = 32178,        c = 32272, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { findedId = 20494, q = 32178, c = 32275, b = 8,              type = 'UPSTAIRS_DOWNSTAIRS',   wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32283, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32292, b = 7,     type = 'NODE',      wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32296, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32297, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32201,        c = 32298, b = 7,     type = 'STAND',     wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32299, b = 7,     type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',     direction = 5, },
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
  { q = 32209,        c = 32292, b = 6,     type = 'MOVE',      wait = 'SINGLE_STEP_DELAY',     direction = 0, },
  -- adventurer stone --


  --refill

  { multiplier = 80,  q = 32596, c = 32748, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32601, c = 32752, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32605, c = 32757, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32610, c = 32761, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32615, c = 32761, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32617, c = 32756, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32617, c = 32751, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32622, c = 32751, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32624, c = 32751, b = 7,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32624, c = 32751, b = 7,              type = 'FIND_TP',               wait = 'SINGLE_STEP_DELAY', findTileId = 1975,                       distance = 6, isSameFloor = false, },
  { multiplier = 80,  q = 32629, c = 32746, b = 6,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32629, c = 32746, b = 6,              type = 'CHECK_PLAYER_IS_RP',    wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32629, c = 32746, b = 6,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', label = 'go-to-refill-rp', },

  { multiplier = 80,  q = 32632, c = 32746, b = 6,              type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32632, c = 32746, b = 6,              type = 'REFILL_DISTANCE',       wait = 'SINGLE_STEP_DELAY', label = 'BUY_REFILL_DISTANCE', },
  { multiplier = 80,  q = 32632, c = 32746, b = 6,              type = 'CHECK_REFILL_DISTANCE', wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32632, c = 32746, b = 6,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', label = 'CONTINUE_FROM_REFILL_DISTANCE', },
  { multiplier = 80,  q = 32632, c = 32743, b = 6,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80,  q = 32629, c = 32746, b = 6,              type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', label = 'continue-from-rp-rfill', }, { multiplier = 80, q = 32632, c = 32739, b = 6, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32632, c = 32739, b = 6, type = 'DEPOSIT', wait = 'SINGLE_STEP_DELAY', },

  { multiplier = 80, q = 32630, c = 32742, b = 6, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  {
    q = 32630,
    c = 32742,
    b = 6,
    type = 'LADDER',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      local playerPos = Map.getCameraPosition()
      local lastPlayerPos = playerPos
      while lastPlayerPos.z == playerPos.z do
        wait(500)
        Game.useItemFromGround(32630, 32742, 6)
        playerPos = Map.getCameraPosition()
      end
    end,
  },
  { multiplier = 80, q = 32628, c = 32741, b = 5, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32621, c = 32742, b = 5, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32621, c = 32742, b = 5, type = 'REFILL_ALL',       wait = 'SINGLE_STEP_DELAY', label = 'BUY_REFILL_ALL', },
  { multiplier = 80, q = 32621, c = 32742, b = 5, type = 'CHECK_REFILL_ALL', wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32621, c = 32742, b = 5, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', label = 'CONTINUE_FROM_REFILL_ALL', },
  { multiplier = 80, q = 32625, c = 32742, b = 5, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32625, c = 32742, b = 5, type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY', findTileId = 482,                   distance = 6, isSameFloor = false, },
  { multiplier = 80, q = 32625, c = 32747, b = 6, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32625, c = 32747, b = 6, type = 'FIND_TP',          wait = 'SINGLE_STEP_DELAY', findTileId = 469,                   distance = 6, isSameFloor = false, },
  { multiplier = 80, q = 32628, c = 32753, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32628, c = 32758, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32628, c = 32764, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32628, c = 32769, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },

  { multiplier = 80, q = 32628, c = 32769, b = 7, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
  { multiplier = 80, q = 32628, c = 32769, b = 7, type = 'TRAVEL',           wait = 'SINGLE_STEP_DELAY', city = 'east', },

  --end-refill

  {
    q = 2614320,
    c = 2622240,
    b = 560,
    type = 'TALK',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      MUST_WAIT = true
      Game.talk("hi", Enums.TalkTypes.TALKTYPE_SAY)
      wait(500)
      Game.talk("passage", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
      wait(500)
      Game.talk("mountain", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
      wait(500)
      Game.talk("yes", Enums.TalkTypes.TALKTYPE_PRIVATE_PN)
      wait(1000)
      MUST_WAIT = false
    end,
  },
  { q = 2638880, c = 2618320, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2638320, c = 2618000, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2638000, c = 2617680, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2637920, c = 2617120, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2637840, c = 2616720, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2637680, c = 2616400, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2637360, c = 2616080, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2636480, c = 2616000, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2636000, c = 2615600, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2615360, b = 560, type = 'NODE',            wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2615360, b = 560, wait = "FAST_STEP_DELAY", type = "CHANGE_THING_BACK", label = 'back-to-original' },

  { q = 2635920, c = 2615360, b = 560, wait = "FAST_STEP_DELAY", type = "CHANGE_THING_BACK", label = 'back-to-original' },
  {
    q = 2636000,
    c = 2615280,
    b = 560,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 1947,
    distance = 6,
    isSameFloor = false,
  },
  { q = 2635920, c = 2614880, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 2635920,
    c = 2614880,
    b = 480,
    type = 'TARGET',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(true)
      Engine.enableTargeting(true)
      wait(50)
      Engine.enableMagicShooter(true)
    end,

  },
  { q = 2635840, c = 2614640, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2635840, c = 2614480, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2635840, c = 2614320, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2635760, c = 2614080, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2635680, c = 2613840, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2635680, c = 2613840, b = 480, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 2635680,
    c = 2613840,
    b = 480,
    type = 'FIND_TP',
    wait = "SINGLE_STEP_DELAY",
    findTileId = 8690,
    distance = 6,
    isSameFloor = false,
  },
  { q = 2635600, c = 2613600, b = 560, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2636000, c = 2613760, b = 560, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2636240, c = 2613600, b = 560, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  { q = 2636240, c = 2613600, b = 560, type = 'NODE', wait = "SINGLE_STEP_DELAY", },
  {
    q = 2636240,
    c = 2613520,
    b = 560,
    type = 'USE_LEVER',
    wait = "SINGLE_STEP_DELAY",
    action = function()
      Game.useItemFromGround(32953, 32669, 7)
    end,
  },
  { q = 2625200, c = 2620240, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625360, c = 2620080, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625600, c = 2620080, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626080, c = 2620000, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626400, c = 2620080, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626640, c = 2620080, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2620080, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2620240, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2620480, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2620720, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627200, c = 2620800, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627360, c = 2620800, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627520, c = 2621040, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627520, c = 2621360, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627680, c = 2621760, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627920, c = 2621840, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628160, c = 2622000, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2622240, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2622480, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2622800, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2623200, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628480, c = 2623440, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628720, c = 2623440, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2623360, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2623440, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2623760, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624000, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624320, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624560, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624640, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624720, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624720, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  {
    q = 2629120,
    c = 2624800,
    b = 720,
    type = 'OPEN_DOOR',
    wait = "SINGLE_STEP_DELAY",
    direction = 2,
    action = function()
      local doorIds = { 1632, 33271, 1671, 1672, 1668, 1669, 4912, 28519 }
      local things = Map.getThings(32864, 32810, 9)
      if #things > 0 then
        for i = 1, #things do
          local thing = things[i]
          if thing.id then
            for j = 1, #doorIds do
              if thing.id == doorIds[j] then
                Game.useItemOnGround(28477, 32864, 32810, 9)
                break
              end
            end
          end
        end
      end
    end,
  },

  { q = 2629120, c = 2624800, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2624880, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2625120, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2628800, c = 2625360, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2628800, c = 2625600, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629040, c = 2625680, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629280, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629280, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629360, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629360, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629440, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629440, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629520, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629520, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629600, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629600, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629680, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629680, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629760, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629760, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629840, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629840, c = 2625760, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2629920, c = 2625760, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2629920, c = 2625680, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2625680, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630320, c = 2625680, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630400, c = 2625520, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630400, c = 2625360, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630400, c = 2625120, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630560, c = 2624800, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624640, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624560, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624560, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624560, b = 720, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624480, b = 720, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 0,             label = 'descer-andar-1' },
  { q = 2630560, c = 2624560, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630240, c = 2624400, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2624160, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2623920, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629840, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629520, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629200, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628880, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628560, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628560, c = 2623360, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628560, c = 2623120, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628320, c = 2623040, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628080, c = 2623040, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627760, c = 2623040, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627440, c = 2623040, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2622880, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627120, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626640, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626400, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626240, c = 2622640, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626000, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625840, c = 2622800, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2622800, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2623120, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625600, c = 2623280, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2623440, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625280, c = 2623600, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625120, c = 2623760, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2624000, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625200, c = 2624320, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625360, c = 2624480, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2624720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2624960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2625120, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625280, c = 2625200, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625200, c = 2625200, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'start' },
  { q = 2625120, c = 2625200, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'monster-4' },
  { q = 2625120, c = 2625200, b = 800, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2625200, b = 800, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 3,             label = 'descer-2' },
  { q = 2625280, c = 2625280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'back-to-original' },
  { q = 2625680, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625920, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'back-to-original' },
  { q = 2626160, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626320, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626480, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626640, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626800, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627120, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627440, c = 2625440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627600, c = 2625440, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2627200, c = 2625440, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2626800, c = 2625360, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2626560, c = 2625360, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2626240, c = 2625360, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625920, c = 2625360, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2625200, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2625040, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624800, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624640, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624480, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624320, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624160, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625840, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626000, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626160, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626320, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626480, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626640, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626800, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627120, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627440, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627600, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627760, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627920, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628080, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628320, c = 2624240, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2628480, c = 2624080, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628080, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627920, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627760, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627600, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627440, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2624080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623920, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623760, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2623120, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627280, c = 2622960, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627120, c = 2622880, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626960, c = 2622880, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622720, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622560, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622400, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621920, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621760, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621120, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2620960, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2620800, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626800, c = 2620880, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621040, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621200, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621360, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2621520, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626720, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626560, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626400, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626240, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626080, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625920, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625600, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625280, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625120, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2621440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2621280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2621120, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2620960, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2620800, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2620640, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2620480, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2620320, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2620640, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2620800, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2620960, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2621120, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2621280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2621440, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624800, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624640, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624480, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2621600, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2621760, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2621920, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622080, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622400, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622560, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622720, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2622880, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623040, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623200, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623360, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623520, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623680, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2623840, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2624000, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624320, c = 2624160, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624480, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624640, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624800, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2624960, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625120, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625280, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625600, c = 2624240, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624400, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624560, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624720, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2624880, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2625040, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2625200, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625520, c = 2625280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625360, c = 2625280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625200, c = 2625280, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625200, c = 2625200, b = 880, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625200, c = 2625200, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625120, c = 2625200, b = 880, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 3, },
  { q = 2625120, c = 2625200, b = 880, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2625200, b = 880, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 3, },
  { q = 2625200, c = 2625200, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'monster-4' },
  { q = 2625440, c = 2625040, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625440, c = 2624800, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  {
    q = 2625440,
    c = 2624800,
    b = 800,
    type = 'CHECK_SUPPLY',
    wait = "SINGLE_STEP_DELAY",
  },
  { q = 2625440, c = 2624560, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625280, c = 2624320, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'leave' },
  { q = 2625120, c = 2624160, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2624080, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2624000, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2624000, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625040, c = 2623920, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", label = 'back-to-original' },
  { q = 2625120, c = 2623760, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625360, c = 2623520, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625520, c = 2623360, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625680, c = 2623120, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2622880, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2622880, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2625760, c = 2622880, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626000, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626240, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626480, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2626880, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627120, c = 2622720, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627440, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627520, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627600, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2627920, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628240, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628480, c = 2622960, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628480, c = 2623280, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628480, c = 2623520, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2628800, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629120, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629360, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629600, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629760, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2629840, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630080, c = 2623680, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2623840, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2624080, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2624160, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630160, c = 2624320, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630320, c = 2624480, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630560, c = 2624400, b = 800, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630560, c = 2624400, b = 800, type = 'STAND', wait = "SINGLE_STEP_DELAY", },
  { q = 2630640, c = 2624400, b = 800, type = 'MOVE',  wait = "SINGLE_STEP_DELAY", direction = 1, },
  { q = 2630480, c = 2624560, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630480, c = 2624720, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630480, c = 2624880, b = 720, type = 'NODE',  wait = "SINGLE_STEP_DELAY", },
  { q = 2630400, c = 2625120, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2630400, c = 2625360, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2630400, c = 2625680, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2630240, c = 2625760, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629920, c = 2625760, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629760, c = 2625760, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629760, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629680, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629680, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629600, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629600, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629520, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629520, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629440, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629440, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629360, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629360, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629280, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629280, c = 2625760, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2629200, c = 2625760, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY",   direction = 3, },
  { q = 2629120, c = 2625680, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628800, c = 2625440, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2625120, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624960, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624880, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624880, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  {
    q = 2629120,
    c = 2624800,
    b = 720,
    type = 'OPEN_DOOR',
    wait = "FAST_STEP_DELAY",
    action = function()
      local doorIds = { 1632, 33271, 1671, 1672, 1668, 1669, 4912, 28519, }
      local things = Map.getThings(32864, 32810, 9)
      if #things > 0 then
        for i = 1, #things do
          local thing = things[i]
          if thing.id then
            for j = 1, #doorIds do
              if thing.id == doorIds[j] then
                Game.useItemOnGround(28477, 32864, 32810, 9)
                break
              end
            end
          end
        end
      end
    end,

  },
  { q = 2629120, c = 2624800, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624720, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624640, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624480, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2624160, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2623920, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629120, c = 2623680, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629040, c = 2623440, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628800, c = 2623440, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628480, c = 2623440, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2623440, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2623200, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2622960, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2622640, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2622400, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2622160, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2622000, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628000, c = 2621840, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627840, c = 2621840, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627520, c = 2621680, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627520, c = 2621360, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627520, c = 2621120, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627520, c = 2620960, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627200, c = 2620800, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626960, c = 2620640, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626960, c = 2620320, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626960, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626480, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626160, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2625840, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2625520, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2625200, c = 2620080, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },

  { q = 2624960, c = 2620000, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624800, c = 2620320, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624880, c = 2620320, b = 720, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624880, c = 2620320, b = 720, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2624960, c = 2620320, b = 720, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 1, },
  { q = 2636240, c = 2613680, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2636080, c = 2613680, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2636000, c = 2613680, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2635840, c = 2613680, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2635680, c = 2613680, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2635600, c = 2613600, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2635600, c = 2613600, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },
  { q = 2635520, c = 2613600, b = 560, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 3, },
  { q = 2635440, c = 2613680, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635600, c = 2613840, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635760, c = 2613920, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635760, c = 2614160, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635840, c = 2614320, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2614560, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2614720, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2614880, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2614960, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2615040, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2615040, b = 480, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2615120, b = 480, type = 'MOVE',  wait = "FAST_STEP_DELAY", direction = 2, },
  { q = 2635840, c = 2615280, b = 560, type = 'STAND', wait = "FAST_STEP_DELAY", },

  --- hunt UKpwXifSEn thais ---
  {
    multiplier = 1,
    q = 32949,
    c = 32692,
    b = 7,
    type = 'CHANGE_THING',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      values.MAX_MONSTER_TO_STOP = 99
      values.MIN_MONSTER_TO_BACK = 0
      values.MONSTER_COUNT_AREA = 1
    end,
  },
  {
    q = 2635920,
    c = 2615360,
    b = 560,
    type = 'TARGET',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,

  },
  { q = 2635920, c = 2615360, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY",   label = 'monster-1' },
  { q = 2636160, c = 2615840, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636480, c = 2616160, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636880, c = 2616400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636960, c = 2616720, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636960, c = 2616960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636800, c = 2617280, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636800, c = 2617680, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY",   label = 'monster-1' },
  { q = 2636560, c = 2617920, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636640, c = 2618400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636480, c = 2618720, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2636160, c = 2618800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2618960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635920, c = 2619200, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635840, c = 2619520, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2635440, c = 2619760, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY",   label = 'monster-1' },
  { q = 2635280, c = 2619920, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2634960, c = 2620080, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2634720, c = 2620240, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2634240, c = 2620320, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2634080, c = 2620720, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2634160, c = 2620960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2633760, c = 2621120, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2633360, c = 2621360, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2633040, c = 2621440, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2632640, c = 2621360, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2632080, c = 2621200, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2631600, c = 2621040, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2631280, c = 2620880, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2630720, c = 2620800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2630320, c = 2620560, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629920, c = 2620400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2629280, c = 2620400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628800, c = 2620400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2628160, c = 2620240, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627760, c = 2620160, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2627040, c = 2620240, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626480, c = 2620400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2626080, c = 2620800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2625520, c = 2621040, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2625280, c = 2621280, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624960, c = 2621200, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624640, c = 2621360, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2624320, c = 2621520, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2623760, c = 2621520, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2623200, c = 2621520, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2622640, c = 2621600, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2622320, c = 2621920, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2621760, c = 2622000, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2621440, c = 2621920, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2621040, c = 2622000, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2620800, c = 2622320, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2620320, c = 2622480, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2620000, c = 2622560, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2619440, c = 2622560, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2619120, c = 2622400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2618720, c = 2622400, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614960, c = 2622720, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614960, c = 2622640, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614880, c = 2622880, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614640, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614480, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2614160, c = 2622720, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2613680, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2612880, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2612400, c = 2622880, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2611840, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2611120, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2610640, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2610080, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2609440, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2608880, c = 2622800, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2608240, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },
  { q = 2607840, c = 2622960, b = 560, type = 'NODE',  wait = "FAST_STEP_DELAY", },

  { q = 2615040, c = 2622880, b = 560, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 2614480, c = 2622960, b = 560, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 2614400, c = 2622960, b = 560, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 2614000, c = 2622960, b = 560, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 2613600, c = 2622960, b = 560, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
  { q = 2613200, c = 2622960, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2612800, c = 2622960, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2612400, c = 2622720, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2612000, c = 2622720, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2611600, c = 2622640, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2611200, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2610800, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2610400, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2610000, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2609600, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2609200, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2608800, c = 2623120, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2608400, c = 2623120, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2608000, c = 2623040, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2607600, c = 2623040, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2607200, c = 2622800, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2606800, c = 2622720, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2606240, c = 2622720, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2606000, c = 2622720, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2605760, c = 2622960, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  { q = 2605760, c = 2622960, b = 560, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
  {
    q = 2605760,
    c = 2622960,
    b = 560,
    type = 'LADDER',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      local playerPos = Map.getCameraPosition()
      local lastPlayerPos = playerPos
      while lastPlayerPos.z == playerPos.z do
        wait(500)
        Game.useItemFromGround(32572, 32787, 7)
        playerPos = Map.getCameraPosition()
      end
    end,
  },
  { q = 2605760, c = 2623040, b = 480, type = 'STAND',   wait = 'SINGLE_STEP_DELAY', },
  { q = 2605760, c = 2623040, b = 480, type = 'WAIT_PZ', wait = 'SINGLE_STEP_DELAY', },
  { q = 2605840, c = 2623120, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606240, c = 2623120, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606560, c = 2622720, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606560, c = 2622320, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606560, c = 2621920, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606400, c = 2621520, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606320, c = 2621360, b = 480, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606320, c = 2621360, b = 480, type = 'FIND_TP', wait = 'SINGLE_STEP_DELAY', findTileId = 482, distance = 6, isSameFloor = false, },
  { q = 2606320, c = 2621200, b = 560, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606720, c = 2620880, b = 560, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2606720, c = 2620400, b = 560, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2607200, c = 2620160, b = 560, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  { q = 2607360, c = 2620000, b = 560, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
  {
    q = 2607360,
    c = 2620000,
    b = 560,
    type = 'FIND_LABEL',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      return "temple"
    end,
  },



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
