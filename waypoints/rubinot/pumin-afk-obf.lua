local huntName              = "pumin-afk"
local isSimpleScript        = false
local uniqueId              = "KOPDASDKOPqwoekqePUMIN"

local PLAYER_CREATURE       = Creature.new(Player.getId())
local PLAYER_VOCATION       = PLAYER_CREATURE:getVocation()
local RP                    = Enums.Vocations.PALADIN
local EK                    = Enums.Vocations.KNIGHT
local defaultValues         = {
    MAX_MONSTER_TO_STOP = PLAYER_VOCATION == EK and 8 or 10,
    MIN_MONSTER_TO_BACK = PLAYER_VOCATION == EK and 0 or 5,
    MONSTER_MEDIUM_LIFE_PERCENTAGE = PLAYER_VOCATION == EK and 0 or 25,
    RUN_AWAY_WITH_MONSTER_COUNT = 25,
    MONSTER_COUNT_AREA = PLAYER_VOCATION == EK and 5 or 6,
    MAX_STEP_DELAY = 2000,
    SINGLE_STEP_DELAY = 100,
    FAST_STEP_DELAY = 0,
}

MACHINE_UTILS, values       = {}, {}
local WAYPOINTS             = {
    { q = 33470, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33470, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', label = 'start', },
    { q = 33465, c = 32798, b = 8, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33470,
        c = 32799,
        b = 8,
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

    { q = 33472, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33474, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33476, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33478, c = 32799, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33480, c = 32795, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33482, c = 32792, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33483, c = 32790, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33483, c = 32788, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33482, c = 32786, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33481, c = 32784, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32782, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33478, c = 32780, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33473, c = 32780, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33471, c = 32780, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33469, c = 32780, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33463, c = 32781, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33461, c = 32779, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33459, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33457, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33455, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33453, c = 32777, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33451, c = 32777, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33449, c = 32777, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33447, c = 32777, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33443, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33441, c = 32778, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33439, c = 32779, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33439, c = 32781, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33439, c = 32783, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33439, c = 32785, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33440, c = 32787, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33442, c = 32789, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33443, c = 32791, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32792, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32794, b = 8, type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32795, b = 8, type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33445,
        c = 32795,
        b = 8,
        type = 'CHANGE_THING',
        wait = 'SINGLE_STEP_DELAY',
        action = function()
            values.MAX_MONSTER_TO_STOP = 4
            values.MIN_MONSTER_TO_BACK = 3
            if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
                values.MONSTER_COUNT_AREA = 3
            else
                values.MONSTER_COUNT_AREA = 5
            end
        end,
    },
    { q = 33447, c = 32796, b = 8, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33447, c = 32796, b = 8, type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
    { q = 33452, c = 32801, b = 8, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33452, c = 32801, b = 8, type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY', findTileId = 469, distance = 6, isSameFloor = false, },
    { q = 33449, c = 32808, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33447, c = 32808, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32808, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33443, c = 32806, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33441, c = 32805, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33440, c = 32803, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33438, c = 32803, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33436, c = 32803, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33436, c = 32801, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33436, c = 32799, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33436, c = 32797, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33437, c = 32795, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33439, c = 32794, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33441, c = 32793, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33443, c = 32793, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33445, c = 32793, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33446, c = 32791, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33446, c = 32789, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33448, c = 32788, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33448, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33450, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33456, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33458, c = 32787, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33460, c = 32787, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33462, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33464, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33466, c = 32786, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33468, c = 32787, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33470, c = 32789, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33471, c = 32791, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33473, c = 32793, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33475, c = 32794, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33477, c = 32795, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32796, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32798, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32800, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32802, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32804, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33479, c = 32806, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33477, c = 32806, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33473, c = 32806, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33466, c = 32806, b = 9, type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33466, c = 32806, b = 9, type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33466,
        c = 32806,
        b = 9,
        type = 'CHANGE_THING',
        wait = 'SINGLE_STEP_DELAY',
        action = function()
            values.MAX_MONSTER_TO_STOP = 4
            values.MIN_MONSTER_TO_BACK = 2
            if PLAYER_VOCATION == Enums.Vocations.KNIGHT then
                values.MONSTER_COUNT_AREA = 3
            else
                values.MONSTER_COUNT_AREA = 5
            end
        end,
    },
    { q = 33465,       c = 32806, b = 9,     type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33465,       c = 32806, b = 9,     type = 'CHANGE_THING_BACK', wait = 'SINGLE_STEP_DELAY', },
    { q = 33461,       c = 32807, b = 9,     type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
    { q = 33460,       c = 32807, b = 9,     type = 'MOVE',              wait = 'SINGLE_STEP_DELAY',   direction = 3, },
    { q = 33450,       c = 32807, b = 9,     type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33450,       c = 32807, b = 9,     type = 'FIND_TP',           wait = 'SINGLE_STEP_DELAY',   findTileId = 1956,          distance = 6, isSameFloor = false, },
    { q = 33455,       c = 32800, b = 8,     type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
    { q = 33455,       c = 32799, b = 8,     type = 'MOVE',              wait = 'SINGLE_STEP_DELAY',   direction = 0, },
    { q = 33470,       c = 32799, b = 8,     type = 'STAND',             wait = 'SINGLE_STEP_DELAY', },
    { q = 33470,       c = 32799, b = 8,     type = 'CHECK_SUPPLY',      wait = 'FAST_STEP_DELAY', },
    { q = 33470,       c = 32799, b = 8,     type = 'NODE',              wait = 'FAST_STEP_DELAY',     label = 'leave', },
    { q = 33466,       c = 32798, b = 8,     type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33466,       c = 32798, b = 8,     type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1949, q = 33463, c = 32798, b = 8,                      type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
    { q = 33297,       c = 32401, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33297,       c = 32395, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33297,       c = 32389, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33300,       c = 32383, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33302,       c = 32377, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33308,       c = 32372, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32371, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32371, b = 14,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1956, q = 33309, c = 32369, b = 14,                     type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32366, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32360, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33307,       c = 32354, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33301,       c = 32353, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33299,       c = 32347, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33303,       c = 32341, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32339, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33315,       c = 32334, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33321,       c = 32329, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33322,       c = 32328, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33322,       c = 32328, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1956, q = 33322, c = 32326, b = 13,                     type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33323,       c = 32323, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33326,       c = 32322, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { q = 33326,       c = 32322, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    { findedId = 600,  q = 33327, c = 32320, b = 12,                     type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33319,       c = 32317, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33319,
        c = 32317,
        b = 13,
        type = 'TARGET',
        wait = 'SINGLE_STEP_DELAY',
        action = function()
            Engine.enableEquipment(false)
            Engine.enableTargeting(false)
            wait(50)
            Engine.enableMagicShooter(false)
        end,
    },

    { q = 33319,       c = 32317, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33319,       c = 32317, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1949, q = 33317, c = 32315, b = 13,        type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,       c = 32390, b = 8,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,       c = 32393, b = 8,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,       c = 32393, b = 8,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33271, c = 32395, b = 8,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33271,       c = 32394, b = 7,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33272,       c = 32396, b = 7,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33273,
        c = 32396,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 1,
        action = function()
            local canWalk = Map.canWalk(33273, 32396, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33273, 32396, 7) end
        end,
    },
    { q = 33276, c = 32396, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33277,
        c = 32396,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 1,
        action = function()
            local canWalk = Map.canWalk(33277, 32396, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33277, 32396, 7) end
        end,
    },
    { q = 33278, c = 32395, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33278, c = 32392, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33278, c = 32389, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33277,
        c = 32389,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 3,
        action = function()
            local canWalk = Map.canWalk(33277, 32389, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33277, 32389, 7) end
        end,
    },
    { q = 33272,       c = 32389, b = 7,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33270,
        c = 32390,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 3,
        action = function()
            local canWalk = Map.canWalk(33270, 32390, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33270, 32390, 7) end
        end,
    },
    { q = 33269,       c = 32390, b = 7,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },

    { q = 33253,       c = 32393, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33245,       c = 32400, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33244,       c = 32408, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33236,       c = 32415, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33229,       c = 32423, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33224,       c = 32431, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33220,       c = 32439, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33217,       c = 32447, b = 7,     type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33213,       c = 32452, b = 7,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33212, c = 32453, b = 7,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33212,       c = 32452, b = 6,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33215, c = 32453, b = 6,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33215,       c = 32452, b = 5,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33212, c = 32453, b = 5,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33212,       c = 32452, b = 4,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33215, c = 32453, b = 4,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33215,       c = 32452, b = 3,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33212, c = 32452, b = 3,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33212,       c = 32451, b = 2,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947, q = 33216, c = 32451, b = 2,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33214,       c = 32452, b = 1,     type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 32370,
        c = 32240,
        b = 7,
        type = 'USE_ITEM',
        wait = "FAST_STEP_DELAY",
        useItemId = 16277,
    },

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

    { q = 33214,        c = 32452, b = 1,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33216, c = 32451, b = 1,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33216,        c = 32452, b = 2,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33212, c = 32452, b = 2,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33213,        c = 32453, b = 3,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33215, c = 32453, b = 3,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33214,        c = 32454, b = 4,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33212, c = 32453, b = 4,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33213,        c = 32454, b = 5,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33215, c = 32453, b = 5,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33214,        c = 32454, b = 6,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 438,   q = 33212, c = 32453, b = 6,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33212,        c = 32454, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33212,        c = 32454, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 437,   q = 33213, c = 32455, b = 7,                          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33214,        c = 32456, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33215,        c = 32461, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33219,        c = 32462, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33219,        c = 32462, b = 8,     type = 'FIND_TP',               wait = 'SINGLE_STEP_DELAY',   findTileId = 10145,                      distance = 6, isSameFloor = true, },
    { q = 33219,        c = 32462, b = 8,     type = 'FIND_DEPOT',            wait = 'SINGLE_STEP_DELAY', },
    { q = 33219,        c = 32462, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33217,        c = 32459, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33215,        c = 32458, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33215,        c = 32458, b = 8,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1947,  q = 33215, c = 32455, b = 8,                          type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },

    { q = 33215,        c = 32449, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
    { q = 33230,        c = 32429, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY', },
    { q = 33230,        c = 32429, b = 7,     type = 'CHECK_PLAYER_IS_RP',    wait = 'FAST_STEP_DELAY', },
    { q = 33230,        c = 32429, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'go-to-refill-rp', },
    { q = 33230,        c = 32429, b = 7,     type = 'STAND',                 wait = 'FAST_STEP_DELAY', },
    { q = 33230,        c = 32429, b = 7,     type = 'REFILL_DISTANCE',       wait = 'FAST_STEP_DELAY',     label = 'BUY_REFILL_DISTANCE', },
    { q = 33230,        c = 32429, b = 7,     type = 'CHECK_REFILL_DISTANCE', wait = 'FAST_STEP_DELAY', },
    { q = 33230,        c = 32429, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'CONTINUE_FROM_REFILL_DISTANCE', },
    { q = 33230,        c = 32429, b = 7,     type = 'NODE',                  wait = 'FAST_STEP_DELAY',     label = 'continue-from-rp-rfill', },
    { q = 33229,        c = 32425, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33230,        c = 32419, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    { q = 33231,        c = 32415, b = 7,     type = 'NODE',                  wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33231,
        c = 32412,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 0,
        action = function()
            local canWalk = Map.canWalk(33231, 32412, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33231, 32412, 7) end
        end,
    },
    { q = 33231, c = 32410, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33231,
        c = 32407,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        action = function()
            local canWalk = Map.canWalk(33231, 32407, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33231, 32407, 7) end
        end,
    },
    { q = 33227, c = 32403, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33226, c = 32401, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33224,
        c = 32398,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 3,
        action = function()
            local canWalk = Map.canWalk(33224, 32398, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33224, 32398, 7) end
        end,
    },
    { q = 33222, c = 32398, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33221,
        c = 32400,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 2,
        action = function()
            local canWalk = Map.canWalk(33221, 32400, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33221, 32400, 7) end
        end,
    },
    { q = 33221, c = 32402, b = 7, type = 'NODE',             wait = 'SINGLE_STEP_DELAY', },
    { q = 33221, c = 32402, b = 7, type = 'STAND',            wait = 'SINGLE_STEP_DELAY', },
    { q = 33221, c = 32402, b = 7, type = 'REFILL_ALL',       wait = "SINGLE_STEP_DELAY", label = 'BUY_REFILL_ALL', },
    { q = 33221, c = 32402, b = 7, type = 'STAND',            wait = "SINGLE_STEP_DELAY", },
    { q = 33221, c = 32402, b = 7, type = 'CHECK_REFILL_ALL', wait = "SINGLE_STEP_DELAY", },
    { q = 33221, c = 32402, b = 7, type = 'NODE',             wait = "SINGLE_STEP_DELAY", label = 'CONTINUE_FROM_REFILL_ALL', }, { q = 33221, c = 32402, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33221,
        c = 32400,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 0,
        action = function()
            local canWalk = Map.canWalk(33221, 32400, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33221, 32400, 7) end
        end,
    },
    { q = 33222, c = 32398, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33224,
        c = 32398,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 1,
        action = function()
            local canWalk = Map.canWalk(33224, 32398, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33224, 32398, 7) end
        end,
    },
    { q = 33225, c = 32400, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33228, c = 32403, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33230,
        c = 32406,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 2,
        action = function()
            local canWalk = Map.canWalk(33230, 32406, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33230, 32406, 7) end
        end,
    },
    { q = 33230, c = 32410, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33230,
        c = 32412,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 2,
        action = function()
            local canWalk = Map.canWalk(33230, 32412, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33230, 32412, 7) end
        end,
    },
    { q = 33229, c = 32414, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },

    { q = 33216, c = 32414, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
    { q = 33215, c = 32407, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
    { q = 33215, c = 32400, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
    { q = 33215, c = 32393, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
    { q = 33221, c = 32387, b = 7, type = 'NODE',    wait = "SINGLE_STEP_DELAY", },
    { q = 33221, c = 32387, b = 7, type = 'STAND',   wait = "SINGLE_STEP_DELAY", },
    { q = 33627, c = 31892, b = 5, type = 'DEPOSIT', wait = 'FAST_STEP_DELAY', },
    { q = 33231, c = 32387, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
    { q = 33243, c = 32387, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
    { q = 33263, c = 32393, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
    { q = 33269, c = 32390, b = 7, type = 'NODE',    wait = 'FAST_STEP_DELAY', },
    { q = 33268, c = 32390, b = 7, type = 'NODE',    wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33270,
        c = 32390,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 1,
        action = function()
            local canWalk = Map.canWalk(33270, 32390, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33270, 32390, 7) end
        end,
    },
    { q = 33273, c = 32389, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33277,
        c = 32389,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 1,
        action = function()
            local canWalk = Map.canWalk(33277, 32389, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33277, 32389, 7) end
        end,
    },
    { q = 33278, c = 32393, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33277,
        c = 32396,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 3,
        action = function()
            local canWalk = Map.canWalk(33277, 32396, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33277, 32396, 7) end
        end,
    },
    { q = 33276,        c = 32396, b = 7,     type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33273,
        c = 32396,
        b = 7,
        type = 'OPEN_DOOR',
        wait = 'SINGLE_STEP_DELAY',
        direction = 3,
        action = function()
            local canWalk = Map.canWalk(33273, 32396, 7, false, false, true, false)
            if not canWalk then Game.useItemFromGround(33273, 32396, 7) end
        end,
    },
    { q = 33272,        c = 32396, b = 7,     type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 22157, q = 33271, c = 32395, b = 7,          type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,        c = 32392, b = 8,     type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,        c = 32390, b = 8,     type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33275,        c = 32390, b = 8,     type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1949,  q = 33275, c = 32388, b = 8,          type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
    { q = 33322,        c = 32319, b = 13,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33324,        c = 32320, b = 13,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33324,        c = 32320, b = 13,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1950,  q = 33327, c = 32320, b = 13,         type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
    { q = 33324,        c = 32323, b = 12,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33324,        c = 32324, b = 12,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { q = 33324,        c = 32324, b = 12,    type = 'NODE',  wait = 'SINGLE_STEP_DELAY', },
    { findedId = 469,   q = 33323, c = 32326, b = 12,         type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
    { q = 33321,        c = 32329, b = 13,    type = 'STAND', wait = 'SINGLE_STEP_DELAY', },
    {
        q = 33321,
        c = 32329,
        b = 13,
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
    { q = 33320,       c = 32331, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33314,       c = 32335, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33308,       c = 32340, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33302,       c = 32343, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33298,       c = 32349, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33303,       c = 32355, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33306,       c = 32361, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32367, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32367, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33309,       c = 32367, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 469,  q = 33309, c = 32369, b = 13,        type = 'ENTER_HOLE',        wait = 'SINGLE_STEP_DELAY', },
    { q = 33306,       c = 32373, b = 14,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33303,       c = 32379, b = 14,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33303,       c = 32382, b = 14,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { q = 33301,       c = 32383, b = 14,    type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33300,       c = 32383, b = 14,    type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33297,       c = 32391, b = 14,    type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33297,       c = 32399, b = 14,    type = 'NODE', wait = 'FAST_STEP_DELAY', },
    { q = 33297,       c = 32401, b = 14,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
    { findedId = 1949, q = 33297, c = 32403, b = 14,        type = 'ENTER_TP',          wait = 'SINGLE_STEP_DELAY', },

    { q = 33470,       c = 32799, b = 8,     type = 'NODE', wait = 'SINGLE_STEP_DELAY' },
}

local LOOT_LIST_CONFIG      = [[
-- En-us: List of items to sell --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: Digite aqui sua lista de itens para vender --
-- Nao de enter e nem deixe espacos apos a "virgula"

- Ex/e.g: [3079,3081,3082,3083,3084,3085,3086,3087] --
sellItemList=[22726,3039,3732,5909,3055,3071,3073,6299,8094,8082,3320,22867,7383,22727,3041,10310,3036,22729,3366,3010,3037,3033,3028,3032,3030,3029,9057,21182,3034,8084,21158,21178,21179,21180,21183,3065,21164,3038,3032,9057,21144,21197,21755,21170,3026,3027,3279,5880,8896,8899,21167,7452,21103,21171,21196,21182,953,3371,8063,44602,3370,44608,3360,3381,21165,44605,3382,44611,813,3272,7452,10392,8042,821,828,7413,3297,7454,3037,7456,3026,34008,44608,25737,3028,22193,16127,16125,33945,16121,5944,9691,3017,676,675,3027,3077,22083,3385,33781,24391,7418,7413,7407,812,10389,7454,7451,7387,3049,16120,16126,20062,5925,5880,20201,5895,20198,20199,9058,16123,5951,3116]

-- En-us: list of items to put in depot --
-- Do not press enter and do not leave spaces after the "comma"

-- Pt-br: Digite aqui sua lista de itens para colocar no depot --
-- Nao de enter e nem deixe espacos apos a "virgula"
s
- Ex/e.g: [3079,3081,3082,3083,3084,3085,3086,3087] --
depositItemList=[22728,22730,22866]

-- En-us: list of items to drop on ground if looted --
-- Do not press enter and do not leave spaces after the "comma"

]]

local OTHER_CONFIG          = [[
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

-- En-us: Drop items list --
-- Do not press enter and do not leave spaces after the "comma"
-- Pt-br: Digite aqui sua lista de itens para dropar no chao se looteados --
-- Nao de enter e nem deixe espacos apos a "virgula"
dropItemList=[]

]]

local SHARED_SUPPLY_CONFIGS = {
    AMULETS = "SSA_MIN=0\nSSA_MAX=0\n",
    RINGS = "MIGHT_MIN=0\nMIGHT_MAX=0\nPRISMATIC_MIN=0\nPRISMATIC_MAX=0\nENERGY_MIN=0\nENERGY_MAX=0\n",
    DISTANCE = "-- ARROWS --\nDIAMOND_ARROW_MIN=200\nDIAMOND_ARROW_MAX=2000\n",
    RUNES =
    "AVALANCHE_MIN=0\nAVALANCHE_MAX=0\nGFB_MIN=0\nGFB_MAX=0\nTHUNDERSTORM_MIN=150\nTHUNDERSTORM_MAX=1000\nSTONE_SHOWER_MIN=0\nSTONE_SHOWER_MAX=0\nSD_MIN=0\nSD_MAX=0\n",
}

local MAGE_CONFIGS          = {
    POTIONS =
    "ULTIMATE_MANA_POTION_MIN=0\nULTIMATE_MANA_POTION_MAX=0\nGREAT_MANA_POTION_MIN=0\nGREAT_MANA_POTION_MAX=0\n",
    RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "GREEN_PLASMA_MIN=0\nGREEN_PLASMA_MAX=0\n",
    AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "GREEN_PLASMA_COLLAR_MIN=0\nGREEN_PLASMA_COLLAR_MAX=0\n",
    RUNES = SHARED_SUPPLY_CONFIGS.RUNES .. "UH_MIN=0\nUH_MAX=0\n",
}

local SUPPLY_CONFIGS        = {
    [Enums.Vocations.KNIGHT] = {
        POTIONS =
            "SUPREME_HEALTH_POTION_MIN=150\nSUPREME_HEALTH_POTION_MAX=1000\nULTIMATE_HEALTH_POTION_MIN=0\nULTIMATE_HEALTH_POTION_MAX=0\nGREAT_HEALTH_POTION_MIN=0\nGREAT_HEALTH_POTION_MAX=0\n" ..
            "STRONG_MANA_POTION_MIN=200\nSTRONG_MANA_POTION_MAX=2000\n",
        RINGS = SHARED_SUPPLY_CONFIGS.RINGS .. "RED_PLASMA_MIN=0\nRED_PLASMA_MAX=0\n",
        AMULETS = SHARED_SUPPLY_CONFIGS.AMULETS .. "RED_PLASMA_COLLAR_MIN=0\nRED_PLASMA_COLLAR_MAX=0\n",
        RUNES = "",
    },
    [Enums.Vocations.PALADIN] = {
        POTIONS =
        "ULTIMATE_SPIRIT_POTION_MIN=100\nULTIMATE_SPIRIT_POTION_MAX=700\nGREAT_SPIRIT_POTION_MIN=0\nGREAT_SPIRIT_POTION_MAX=0\nGREAT_MANA_POTION_MIN=100\nGREAT_MANA_POTION_MAX=2000\n",
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

local IGNORE_MONSTER_LIST         = {
    ["hive pore"] = true,
}

local STOP_WHEN_MONSTER_ON_SCREEN = { -- Lista de monstro que você deseja parar o script até ele morrer/sair da tela
    -- Coloque o nome do monstro assim
    -- "dark torturer", "demon", "dragon lord", etc...
    ["plunder patriarch"] = true,
}

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

WAYPOINTS = parse(WAYPOINTS)
LOAD_DATA = {
    huntName = huntName,
    isSimpleScript = isSimpleScript,
    defaultValues = defaultValues,
    uniqueId = uniqueId,
    WAYPOINTS = WAYPOINTS,
    STOP_WHEN_MONSTER_ON_SCREEN = STOP_WHEN_MONSTER_ON_SCREEN,
    OTHER_CONFIG = OTHER_CONFIG,
    IGNORE_MONSTER_LIST = IGNORE_MONSTER_LIST,
    LOOT_LIST_CONFIG = LOOT_LIST_CONFIG,
    SHARED_SUPPLY_CONFIGS = SHARED_SUPPLY_CONFIGS,
    SUPPLY_CONFIGS = SUPPLY_CONFIGS,
}
