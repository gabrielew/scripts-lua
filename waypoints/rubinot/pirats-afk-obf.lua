local huntName                    = "pirats-afk"
local isSimpleScript              = false
local uniqueId                    = "piratsafkDYWGYD"

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
sellItemList=[813,818,820,3575,35573,35596,3284,3318,7449,3304,3370,8043,35574,8084]
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
  "AVALANCHE_MIN=0\nAVALANCHE_MAX=0\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=0\nTHUNDERSTORM_MAX=0\nSTONE_SHOWER_MIN=100\nSTONE_SHOWER_MAX=500\nSD_MIN=0\nSD_MAX=0\n",
}

local MAGE_CONFIGS                = {
  POTIONS =
  "ULTIMATE_MANA_POTION_MIN=0\nULTIMATE_MANA_POTION_MAX=0\nGREAT_MANA_POTION_MIN=100\nGREAT_MANA_POTION_MAX=500\n",
  RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "GREEN_PLASMA_MIN=0\nGREEN_PLASMA_MAX=0\n",
  AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "GREEN_PLASMA_COLLAR_MIN=0\nGREEN_PLASMA_COLLAR_MAX=0\n",
  RUNES = SHARED_SUPPLY_CONFIGS.RUNES .. "UH_MIN=0\nUH_MAX=0\n",
}

local SUPPLY_CONFIGS              = {
  [Enums.Vocations.KNIGHT] = {
    POTIONS =
        "SUPREME_HEALTH_POTION_MIN=0\nSUPREME_HEALTH_POTION_MAX=0\nULTIMATE_HEALTH_POTION_MIN=100\nULTIMATE_HEALTH_POTION_MAX=500\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
        "STRONG_MANA_POTION_MIN=100\nSTRONG_MANA_POTION_MAX=700\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
    RUNES = "",
  },
  [Enums.Vocations.PALADIN] = {
    POTIONS =
    "ULTIMATE_SPIRIT_POTION_MIN=0\nULTIMATE_SPIRIT_POTION_MAX=0\nGREAT_SPIRIT_POTION_MIN=50\nGREAT_SPIRIT_POTION_MAX=250\nGREAT_MANA_POTION_MIN=150\nGREAT_MANA_POTION_MAX=700\n",
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
  { q = 33840, c = 31228, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', label = 'start', },
  { q = 33840, c = 31231, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33843, c = 31232, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33846, c = 31232, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33849, c = 31232, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33852, c = 31232, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33854, c = 31235, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33857, c = 31237, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33858, c = 31240, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33861, c = 31242, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33864, c = 31242, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33867, c = 31245, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33867, c = 31248, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33866, c = 31251, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33869, c = 31251, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33870, c = 31254, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33873, c = 31255, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33876, c = 31255, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33879, c = 31255, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33882, c = 31255, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33885, c = 31255, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33885, c = 31258, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33888, c = 31260, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33891, c = 31259, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33894, c = 31259, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33897, c = 31257, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33900, c = 31257, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33903, c = 31256, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33903, c = 31253, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33904, c = 31250, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33905, c = 31247, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33908, c = 31245, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33911, c = 31244, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33914, c = 31244, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33917, c = 31244, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31243, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31243, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33925, c = 31240, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33925, c = 31237, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33925, c = 31234, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33925, c = 31231, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31228, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31225, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31222, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31220, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31217, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31214, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31211, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31209, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31206, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33923, c = 31203, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33924, c = 31200, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33921, c = 31197, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33920, c = 31194, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33917, c = 31192, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33915, c = 31189, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33912, c = 31189, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33909, c = 31189, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33906, c = 31190, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33903, c = 31190, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33900, c = 31191, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33897, c = 31191, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33894, c = 31191, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33891, c = 31188, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33888, c = 31188, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33885, c = 31188, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33882, c = 31188, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33879, c = 31189, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33876, c = 31189, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33873, c = 31191, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33870, c = 31191, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33868, c = 31194, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33865, c = 31194, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33862, c = 31194, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33859, c = 31196, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33856, c = 31196, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33855, c = 31199, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33852, c = 31199, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33851, c = 31202, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33850, c = 31205, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33848, c = 31208, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33847, c = 31211, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33847, c = 31214, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33844, c = 31216, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33844, c = 31219, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33843, c = 31222, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33842, c = 31225, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33840, c = 31228, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33841, c = 31227, b = 6, type = 'STAND',        wait = 'SINGLE_STEP_DELAY', },
  { q = 33841, c = 31227, b = 6, type = 'CHECK_SUPPLY', wait = 'SINGLE_STEP_DELAY', },
  { q = 33841, c = 31227, b = 6, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', label = 'leave', },
  { q = 33839, c = 31225, b = 6, type = 'FIND_TP',      wait = 'SINGLE_STEP_DELAY', findTileId = 11707, distance = 6, isSameFloor = false, },
  { q = 33838, c = 31222, b = 5, type = 'NODE',         wait = 'SINGLE_STEP_DELAY', },
  { q = 33838, c = 31222, b = 5, type = 'FIND_TP',      wait = 'SINGLE_STEP_DELAY', findTileId = 34111, distance = 6, isSameFloor = true, },
  { q = 33761, c = 31274, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33763, c = 31281, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33769, c = 31288, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33776, c = 31294, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33782, c = 31301, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33780, c = 31308, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33782, c = 31315, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33780, c = 31322, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33782, c = 31329, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33782, c = 31336, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33775, c = 31339, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  { q = 33774, c = 31347, b = 7, type = 'STAND',        wait = 'FAST_STEP_DELAY', },
  { q = 33774, c = 31347, b = 7, type = 'NODE',         wait = 'FAST_STEP_DELAY', },
  {
    q = 33774,
    c = 31348,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 2,
    action = function()
      Game.useItemFromGround(33774, 31348, 7)
    end,
  },
  { q = 32949, c = 32031, b = 7, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  {
    q = 32950,
    c = 32031,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'FAST_STEP_DELAY',
    direction = 1,
    action = function()
      local canWalk = Map.canWalk(32950, 32031, 7, false, false, true, false)
      if not canWalk then Game.useItemFromGround(32950, 32031, 7) end
    end,
  },
  { q = 32955, c = 32033, b = 7, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  {
    q = 32955,
    c = 32034,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'FAST_STEP_DELAY',
    direction = 2,
    action = function()
      local canWalk = Map.canWalk(32955, 32034, 7, false, false, true, false)
      if not canWalk then Game.useItemFromGround(32955, 32034, 7) end
    end,
  },
  { q = 32956,        c = 32036, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32957,        c = 32036, b = 7,     type = 'MOVE',                  wait = 'FAST_STEP_DELAY',     direction = 1, },
  { q = 32954,        c = 32038, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32045, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32052, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32059, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32066, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32077, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32953,        c = 32077, b = 6,     type = 'MOVE',                  wait = 'FAST_STEP_DELAY',     direction = 3, },
  { q = 32962,        c = 32076, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32962,        c = 32076, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32962,        c = 32076, b = 7,     type = 'USE_ITEM',              wait = 'FAST_STEP_DELAY',     useItemId = 16277, },

  -- adventurer stone --
  { q = 32199,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32198,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32197,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32297, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32192,        c = 32297, b = 7,     type = 'SELL',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32193,        c = 32295, b = 7,     type = 'ENCHANT',               wait = 'SINGLE_STEP_DELAY', },
  { q = 32194,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32195,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32196,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32294, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32293, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32286, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32283, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { findedId = 16791, q = 32209, c = 32281, b = 7,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32274, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32271, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { findedId = 44027, q = 32178, c = 32269, b = 8,                          type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 32174,        c = 32280, b = 11,    type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32175,        c = 32277, b = 11,    type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32275, b = 11,    type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32274, b = 11,    type = 'USE_FORGE',             wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  { q = 32176,        c = 32277, b = 11,    type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32278, b = 11,    type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32279, b = 11,    type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32176,        c = 32280, b = 11,    type = 'MOVE',                  wait = 'SINGLE_STEP_DELAY',   direction = 2 },

  { q = 32178,        c = 32272, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32178,        c = 32273, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { findedId = 20494, q = 32178, c = 32275, b = 8,                          type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32283, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32291, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32292, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32294, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32295, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32296, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32297, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32297, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32201,        c = 32298, b = 7,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32202,        c = 32299, b = 7,     type = 'MOVE',                  wait = 'SINGLE_STEP_DELAY',   direction = 5, },
  { q = 32202,        c = 32298, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32203,        c = 32298, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32204,        c = 32298, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32205,        c = 32298, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32206,        c = 32297, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32207,        c = 32297, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32208,        c = 32297, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32296, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32295, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32294, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32293, b = 6,     type = 'STAND',                 wait = 'SINGLE_STEP_DELAY', },
  { q = 32209,        c = 32292, b = 6,     type = 'MOVE',                  wait = 'SINGLE_STEP_DELAY',   direction = 0, },
  -- adventurer stone --
  { q = 32954,        c = 32077, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32077, b = 7,     type = 'FIND_TP',               wait = 'FAST_STEP_DELAY',     findTileId = 1967,                       distance = 6, isSameFloor = false, },
  { q = 32963,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32970,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32976,        c = 32080, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32973,        c = 32080, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32973,        c = 32080, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32973,        c = 32080, b = 6,     type = 'REFILL_RUNES',          wait = 'FAST_STEP_DELAY',     label = 'BUY_REFILL_RUNES', },
  { q = 32973,        c = 32080, b = 6,     type = 'CHECK_REFILL_RUNES',    wait = 'FAST_STEP_DELAY', },
  { q = 32973,        c = 32080, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'CONTINUE_FROM_REFILL_RUNES', },
  { q = 32971,        c = 32085, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32971,        c = 32085, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32971,        c = 32085, b = 6,     type = 'REFILL_POTIONS',        wait = 'FAST_STEP_DELAY',     label = 'BUY_REFILL_POTIONS', },
  { q = 32971,        c = 32085, b = 6,     type = 'CHECK_REFILL_POTIONS',  wait = 'FAST_STEP_DELAY', },
  { q = 32971,        c = 32085, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'CONTINUE_FROM_REFILL_POTIONS', },
  { q = 32977,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32984,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32991,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32998,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33005,        c = 32073, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33006,        c = 32066, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33006,        c = 32059, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33013,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33019,        c = 32054, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33019,        c = 32054, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 33019,        c = 32054, b = 6,     type = 'DEPOSIT',               wait = 'FAST_STEP_DELAY', },
  { q = 33006,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32999,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32992,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32985,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32978,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32971,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32964,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32957,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32053, b = 6,     type = 'CHECK_PLAYER_IS_RP',    wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'go-to-refill-rp', },
  { q = 32954,        c = 32046, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32039, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32032, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32025, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32020, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32020, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32020, b = 6,     type = 'TRAVEL',                wait = 'FAST_STEP_DELAY',     city = 'thais', },
  { q = 32310,        c = 32210, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'TRAVEL',                wait = 'FAST_STEP_DELAY',     city = 'roshamuul', },
  { q = 33494,        c = 32567, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33501,        c = 32564, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33508,        c = 32562, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33515,        c = 32560, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33522,        c = 32559, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33525,        c = 32560, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33524,        c = 32561, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 33524,        c = 32561, b = 7,     type = 'REFILL_DISTANCE',       wait = 'FAST_STEP_DELAY',     label = 'BUY_REFILL_DISTANCE', },
  { q = 33524,        c = 32561, b = 7,     type = 'CHECK_REFILL_DISTANCE', wait = 'FAST_STEP_DELAY', },
  { q = 33524,        c = 32561, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'CONTINUE_FROM_REFILL_DISTANCE', },
  { q = 33515,        c = 32560, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33508,        c = 32562, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33501,        c = 32562, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33494,        c = 32565, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33493,        c = 32567, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 33493,        c = 32567, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 33493,        c = 32567, b = 7,     type = 'TRAVEL',                wait = 'FAST_STEP_DELAY',     city = 'Thais', },
  { q = 32310,        c = 32210, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  { q = 32310,        c = 32210, b = 6,     type = 'TRAVEL',                wait = 'FAST_STEP_DELAY',     city = 'Venore', },
  { q = 32954,        c = 32022, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32955,        c = 32036, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32954,        c = 32053, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'continue-from-rp-rfill', },
  { q = 32955,        c = 32036, b = 6,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
  { q = 32956,        c = 32036, b = 6,     type = 'FIND_TP',               wait = 'FAST_STEP_DELAY',     findTileId = 413,                        distance = 6, isSameFloor = false, },
  { q = 32955,        c = 32035, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
  {
    q = 32955,
    c = 32034,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      local canWalk = Map.canWalk(32955, 32034, 7, false, false, true, false)
      if not canWalk then Game.useItemFromGround(32955, 32034, 7) end
    end,
  },
  { q = 32951, c = 32031, b = 7, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  {
    q = 32950,
    c = 32031,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'FAST_STEP_DELAY',
    direction = 3,
    action = function()
      local canWalk = Map.canWalk(32950, 32031, 7, false, false, true, false)
      if not canWalk then Game.useItemFromGround(32950, 32031, 7) end
    end,
  },
  { q = 32941, c = 32031, b = 7, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  { q = 32941, c = 32031, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  {
    q = 32941,
    c = 32030,
    b = 7,
    type = 'USE_LEVER',
    wait = 'FAST_STEP_DELAY',
    direction = 0,
    action = function()
      Game.useItemFromGround(32941, 32030, 7)
    end,
  },
  { q = 33782, c = 31342, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  { q = 33790, c = 31346, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  { q = 33796, c = 31352, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  { q = 33799, c = 31356, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },

  { q = 33799, c = 31358, b = 7, type = 'STAND', wait = 'FAST_STEP_DELAY', },
  { q = 33800, c = 31358, b = 7, type = 'MOVE',  wait = 'FAST_STEP_DELAY', direction = 1, },
  { q = 33803, c = 31390, b = 7, type = 'NODE',  wait = 'FAST_STEP_DELAY', },
  {
    q = 33803,
    c = 31390,
    b = 7,
    type = 'LADDER',
    wait = 'FAST_STEP_DELAY',
    action = function()
      local playerPos = Map.getCameraPosition()
      local lastPlayerPos = playerPos
      while lastPlayerPos.z == playerPos.z do
        wait(500)
        Game.useItemFromGround(33803, 31390, 7)
        playerPos = Map.getCameraPosition()
      end
    end,
  },
  { q = 33791, c = 31383, b = 6, type = 'NODE',   wait = 'FAST_STEP_DELAY', },
  { q = 33791, c = 31383, b = 6, type = 'STAND',  wait = 'FAST_STEP_DELAY', },
  { q = 33791, c = 31383, b = 6, type = 'TRAVEL', wait = 'FAST_STEP_DELAY', city = 'sails', },
  { q = 33791, c = 31383, b = 6, type = 'TRAVEL', wait = 'FAST_STEP_DELAY', city = 'safe', },
  { q = 33838, c = 31224, b = 5, type = 'STAND',  wait = 'FAST_STEP_DELAY', },
  { q = 33838, c = 31225, b = 5, type = 'MOVE',   wait = 'FAST_STEP_DELAY', direction = 2, },
  { q = 33840, c = 31226, b = 6, type = 'NODE',   wait = 'FAST_STEP_DELAY', },

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
