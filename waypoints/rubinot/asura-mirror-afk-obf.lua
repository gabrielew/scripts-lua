local huntName                    = "asura-mirror-afk"
local isSimpleScript              = false
local uniqueId                    = "asuramirror_completo1231232"

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
sellItemList=[3034,21158,21178,21179,21180,21183,3065,21164,21144,21197,21755,21170,3026,3027,3279,5880,8896,8899,21167,7452,21103,21171,21196,953,3371,8063,44602,3370,44608,3360,3381,21165,44605,3382,44611,813,3272,7452,10392,8042,821,828,3297,7454,7456,3026,34008,44608,25737,22193,16127,16125,33945,16121,5944,9691,3017,676,675,3027,3077,22083,3385,33781,24391,7418,7407,812,10389,7454,7451,7387,3049,16120,16126,20062,5925,5880,20201,5895,20198,20199,9058,16123,5951,3116,44605,14089,3039,14087,14086,14083,14088,282,281,14082,3010,3036,9058,14077,14225,14076,3027,14078,14080,3279,3391,21981,8061,826,21974,3071,3016,6299,21975,3567,3026,3016,8043,3369,8082,3029,675,6499,3067,3369,8074,7404,5911,3041,10304,3028,3029,9056,44602,44611,10282,7421,44608,676,23505,23502,23506,23515,16125,23519,16124,16120,23520,23503,23504,16119,16126,23508,23531,16121,23507,23518,23510,23516,23511,23533,23523,828,23514,8092,16124,23543,3073,822,3370,7452,3360,3342,28823,5944,28822,14089,14087,14086,14083,3038,14088,282,281,14082,3010,3036,9058,14077,14225,14076,3027,14078,14080,3279,3391,11657,3320,3065,3067,7407,14040,7386,16118,3324,32227,8094,8092,32774,32773,32698,32703,3073,22866,22867,22736,22727,22726,22731,3414,3420,3364,3554,3281,3037,14088,282,281,14082,3010,3036,9058,14077,3030,3033,9057,3032,14225,14076,3027,14078,14080,3279,8084,3391,3055,3326,7413,7449,14089,14087,14086,14083,3038,3037,14088,282,281,14082,3010,3036,9058,14077,3030,3033,9057,3032,14225,14076,3027,14sa078,14080,3279,8084,3391,3055,3326,7413,7449,21981,8061,826,21974,3071,3016,6299,21975,3567,3026,3016,8043,3369,8082,3029,675,6499,3067,3369,8074,7404,5911,3041,10304,3282,3574,8083,3054,3724,3403,3085,3069,3007,7439,3078]
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
MONSTER_TO_START_BOX=2

-- En-us: Amount of monster to leave in programmed box --
-- Pt-br: Quantidade de monstros para sair da box programada --
MONSTER_TO_LEAVE_BOX=0

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
  { q = 32816, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'start' },
  {
    q = 32816,
    c = 32751,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  {
    q = 32816,
    c = 32751,
    b = 9,
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
  { q = 32815, c = 32750, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32815,
    c = 32750,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  {
    q = 32815,
    c = 32749,
    b = 9,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 21973,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32815, c = 32748, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32817, c = 32745, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32819, c = 32742, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32822, c = 32740, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32822, c = 32737, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32821, c = 32735, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32821,
    c = 32735,
    b = 10,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32822, c = 32736, b = 10, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 32822,
    c = 32736,
    b = 10,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32822, c = 32740, b = 10, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32819, c = 32742, b = 10, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32818, c = 32745, b = 10, type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32814, c = 32748, b = 10, type = 'USE_ROPE', wait = 'SINGLE_STEP_DELAY', },
  { q = 32815, c = 32750, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32818, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32821, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32824, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32827, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32830, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32833, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32836, c = 32751, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32837, c = 32754, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32837, c = 32757, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32839, c = 32760, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32842, c = 32760, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32845, c = 32760, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32848, c = 32760, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32851, c = 32759, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32851, c = 32756, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32851, c = 32753, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32851, c = 32750, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32851, c = 32750, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 32851,
    c = 32750,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32851, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32851,
    c = 32751,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32851, c = 32753, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32851, c = 32756, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32851, c = 32759, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32848, c = 32760, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32845, c = 32760, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32845, c = 32763, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32845, c = 32766, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32845, c = 32769, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32846, c = 32772, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32849, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32852, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32855, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32858, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32861, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32864, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32867, c = 32773, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32869, c = 32770, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32869, c = 32767, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32869, c = 32764, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32869, c = 32764, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32869,
    c = 32764,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32870, c = 32764, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32870,
    c = 32764,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32872, c = 32764, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32875, c = 32764, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32875,
    c = 32764,
    b = 9,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 21973,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32876, c = 32762, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32876,
    c = 32762,
    b = 10,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32875, c = 32764, b = 10, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32875,
    c = 32764,
    b = 10,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32875, c = 32764, b = 10, type = 'USE_ROPE', wait = 'SINGLE_STEP_DELAY', },
  { q = 32872, c = 32765, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32869, c = 32765, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32869, c = 32768, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32869, c = 32771, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32866, c = 32773, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32863, c = 32773, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32860, c = 32773, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32857, c = 32773, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32854, c = 32773, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32776, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32779, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32782, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32785, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32788, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32853, c = 32790, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32856, c = 32792, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32859, c = 32792, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32862, c = 32792, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32865, c = 32792, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32867, c = 32793, b = 9,  type = 'NODE',     wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 32867,
    c = 32793,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32866, c = 32793, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32866,
    c = 32793,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32862, c = 32793, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32859, c = 32793, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32856, c = 32793, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32853, c = 32794, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32852, c = 32797, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32852, c = 32800, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32849, c = 32801, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32846, c = 32801, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32843, c = 32801, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32840, c = 32801, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32840, c = 32801, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32840,
    c = 32801,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32837, c = 32803, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32839,
    c = 32803,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32834, c = 32804, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32831, c = 32804, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32828, c = 32804, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32825, c = 32803, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32824, c = 32800, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32824, c = 32797, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32824, c = 32794, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32823, c = 32793, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32823,
    c = 32793,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32822, c = 32792, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 32822,
    c = 32792,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32820, c = 32792, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32817, c = 32792, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32814, c = 32791, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32814, c = 32788, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32814, c = 32785, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32814, c = 32781, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32819, c = 32780, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32822, c = 32780, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32825, c = 32780, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32825, c = 32780, b = 9, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32825,
    c = 32780,
    b = 9,
    type = 'CHANGE_THING',
    wait = "SINGLE_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32827, c = 32777, b = 9, type = 'NODE', wait = "SINGLE_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32827,
    c = 32777,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "SINGLE_STEP_DELAY",
  },
  { q = 32827, c = 32765, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32827, c = 32762, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32827, c = 32759, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32826, c = 32756, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32826, c = 32753, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32825, c = 32750, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32822, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32819, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32816, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  { q = 32816, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY",   direction = 8, action = nil, label = '' },
  {
    q = 32816,
    c = 32751,
    b = 9,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 5
      end
    end,
    label = ''
  },
  { q = 32815, c = 32752, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32815,
    c = 32752,
    b = 9,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32813, c = 32753, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32814, c = 32751, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32814,
    c = 32751,
    b = 9,
    type = 'TAKE_DECISION',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      if values.CHOSE_ROUTE == 1 then
        return "extra_box"
      else
        return "checkCap"
      end
    end,
    label = ''
  },
  { q = 32813, c = 32753, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'extra_box' },
  {
    q = 32813,
    c = 32754,
    b = 9,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 775,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32953, c = 32671, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32953, c = 32674, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32954, c = 32677, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32954, c = 32680, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32952, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32949, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32946, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32943, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32940, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32937, c = 32683, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32934, c = 32682, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32934, c = 32679, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32934, c = 32676, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32935, c = 32673, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32938, c = 32674, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32941, c = 32674, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32944, c = 32674, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32947, c = 32674, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32948, c = 32673, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32948,
    c = 32673,
    b = 7,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      values.MAX_MONSTER_TO_STOP = values.MONSTER_TO_START_BOX
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 6
      end
    end,
    label = ''
  },
  { q = 32949, c = 32673, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32949,
    c = 32673,
    b = 7,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32950, c = 32673, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32953, c = 32671, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32953, c = 32670, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32953,
    c = 32669,
    b = 7,
    type = 'USE_LEVER',
    wait = "FAST_STEP_DELAY",
    direction = 0,
    action = function()
      Game
          .useItemFromGround(32953, 32669, 7)
    end,
    label = ''
  },
  { q = 32816, c = 32751, b = 9, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'checkCap' },
  {
    q = 32816,
    c = 32751,
    b = 9,
    type = 'CHECK_SUPPLY',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32813, c = 32754, b = 9, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = 'leave' },
  {
    q = 32813,
    c = 32754,
    b = 9,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 775,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32947, c = 32672, b = 7, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32947,
    c = 32672,
    b = 7,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 5257,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32947, c = 32674, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32949, c = 32682, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32949, c = 32686, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32949,
    c = 32685,
    b = 6,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 469,
    distance = 6,
    isSameFloor = false,
  },

  { q = 32949, c = 32690, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32949,
    c = 32690,
    b = 7,
    type = 'TARGET',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Engine.enableEquipment(true)
      wait(50)
      Engine.enableTargeting(false)
      wait(50)
      Engine.enableMagicShooter(false)
    end,
    label = ''
  },
  {
    q = 32949,
    c = 32690,
    b = 7,
    type = 'CHANGE_THING',
    wait = "FAST_STEP_DELAY",
    action = function()
      values.MAX_MONSTER_TO_STOP = 99
      values.MIN_MONSTER_TO_BACK = values.MONSTER_TO_LEAVE_BOX
      if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
        values.MONSTER_COUNT_AREA = 3
      else
        values.MONSTER_COUNT_AREA = 6
      end
    end,
    label = ''
  },

  { q = 32952, c = 32698, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32955, c = 32706, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32960, c = 32714, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32954, c = 32722, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32954, c = 32730, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32951, c = 32738, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32948, c = 32746, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32944, c = 32754, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32936, c = 32760, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32928, c = 32764, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32920, c = 32765, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32912, c = 32767, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32904, c = 32766, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32896, c = 32765, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32888, c = 32760, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32880, c = 32757, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32872, c = 32755, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32864, c = 32755, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32856, c = 32752, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32848, c = 32752, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32840, c = 32753, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32832, c = 32755, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32824, c = 32758, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32816, c = 32761, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32808, c = 32760, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32800, c = 32765, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32792, c = 32769, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32784, c = 32769, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32776, c = 32775, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32768, c = 32775, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32760, c = 32779, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32752, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32744, c = 32782, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32736, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32728, c = 32780, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32720, c = 32781, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32712, c = 32779, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32704, c = 32778, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32696, c = 32778, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32688, c = 32778, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32679, c = 32778, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32679, c = 32778, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32679,
    c = 32778,
    b = 7,
    type = 'TRAVEL',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    city = "center",
  },
  { q = 32628, c = 32765, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32620, c = 32762, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32612, c = 32762, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32604, c = 32762, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32596, c = 32762, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32595, c = 32754, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32592, c = 32747, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32592,
    c = 32749,
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
  { q = 32605,        c = 32751, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32613,        c = 32744, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32621,        c = 32750, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  { q = 32629,        c = 32750, b = 7,     type = 'NODE',      wait = "FAST_STEP_DELAY",     direction = 8,              action = nil, label = '' },
  {
    q = 32629,
    c = 32750,
    b = 7,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 1975,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32632, c = 32747, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32632,
    c = 32747,
    b = 6,
    type = 'REFILL_DISTANCE',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32632, c = 32740, b = 6, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32632, c = 32740, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32632,
    c = 32740,
    b = 6,
    type = 'DEPOSIT',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32630, c = 32742, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32630,
    c = 32742,
    b = 6,
    type = 'LADDER',
    wait = "FAST_STEP_DELAY",
    direction = 8,
    action = function()
      Game
          .useItemFromGround(32630, 32742, 6)
    end,
    label = ''
  },
  { q = 32624, c = 32741, b = 5, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32624,
    c = 32741,
    b = 5,
    type = 'REFILL_ALL',
    wait = "FAST_STEP_DELAY",
  },
  { q = 32626, c = 32741, b = 5, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32626,
    c = 32741,
    b = 5,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 482,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32627, c = 32746, b = 6, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32627,
    c = 32745,
    b = 6,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 469,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32629, c = 32754, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32629, c = 32759, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32629, c = 32767, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32629, c = 32769, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32629,
    c = 32769,
    b = 7,
    type = 'TRAVEL',
    wait = "FAST_STEP_DELAY",
    city = "east",
  },
  { q = 32679, c = 32777, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32679,
    c = 32777,
    b = 7,
    type = 'TRAVEL',
    wait = "FAST_STEP_DELAY",
    city = "mountain",
  },
  { q = 32987, c = 32729, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32980, c = 32727, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32974, c = 32719, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32966, c = 32716, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32962, c = 32708, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32959, c = 32700, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32949, c = 32691, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32814,
    c = 32753,
    b = 9,
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
    q = 32949,
    c = 32690,
    b = 7,
    type = 'CHANGE_THING_BACK',
    wait = "FAST_STEP_DELAY",
    label = ''
  },
  {
    q = 32949,
    c = 32691,
    b = 7,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 1947,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32948, c = 32681, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32947, c = 32673, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32945, c = 32672, b = 6, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32945,
    c = 32672,
    b = 6,
    type = 'FIND_TP',
    wait = "FAST_STEP_DELAY",
    findTileId = 8690,
    distance = 6,
    isSameFloor = false,
  },
  { q = 32949, c = 32672, b = 7, type = 'NODE',  wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  { q = 32953, c = 32670, b = 7, type = 'STAND', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
  {
    q = 32953,
    c = 32669,
    b = 7,
    type = 'USE_LEVER',
    wait = "FAST_STEP_DELAY",
    direction = 0,
    action = function()
      Game
          .useItemFromGround(32953, 32669, 7)
    end,
    label = ''
  },
  { q = 32814, c = 32753, b = 9, type = 'NODE', wait = "FAST_STEP_DELAY", direction = 8, action = nil, label = '' },
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
