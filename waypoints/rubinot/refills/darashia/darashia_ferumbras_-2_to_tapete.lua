COORDS = {
  { x = 33316,       y = 32333, z = 13,    wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },
  { x = 33319,       y = 32331, z = 13,    wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
  { x = 33321,       y = 32328, z = 13,    wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
  { q = 33322,       c = 32328, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { findedId = 1956, q = 33322, c = 32326, b = 13,                     type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 33323,       c = 32323, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33326,       c = 32322, b = 12,    type = 'WAIT_PZ',           wait = 'SINGLE_STEP_DELAY', },
  { q = 33326,       c = 32322, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { q = 33326,       c = 32322, b = 12,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  { findedId = 600,  q = 33327, c = 32320, b = 12,                     type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 33319,       c = 32317, b = 13,    type = 'NODE',              wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33319,
    c = 32317,
    b = 13,
    type = 'SETTINGS_OFF',
    wait = 'SINGLE_STEP_DELAY',
  },
  { q = 33319,       c = 32317, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { q = 33319,       c = 32317, b = 13,    type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  { findedId = 1949, q = 33317, c = 32315, b = 13,        type = 'ENTER_TP',          wait = 'SINGLE_STEP_DELAY', },
  {
    findedId = 22157,
    q = 33271,
    c = 32395,
    b = 7,
    type = 'TAKE_DECISION',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      -- wait(math.random(800, 1200))
      local pos = playerC:getPosition()

      if pos.z == 8 then
        return "leave-from-8"
      end

      if pos.z == 9 then
        return "leave-from-9"
      end
    end
  },

  { q = 33275,       c = 32392, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "leave-from-8" },
  { q = 33275,       c = 32390, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,       c = 32393, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,       c = 32393, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findedId = 1947, q = 33271, c = 32395, b = 8,               type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,       c = 32388, b = 7,     type = 'FIND_LABEL', wait = 'SINGLE_STEP_DELAY',   findLabel = "leave-hunt-dynamic-floor" },

  { q = 33275,       c = 32392, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "leave-from-9" },
  { q = 33275,       c = 32390, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,       c = 32393, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,       c = 32393, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findedId = 1947, q = 33271, c = 32395, b = 9,               type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },

  { q = 33271,       c = 32394, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "leave-hunt-dynamic-floor" },

  { q = 33271,       c = 32394, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33272,       c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33273,
    c = 32396,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'SINGLE_STEP_DELAY',
    direction = 1,
  },
  { q = 33276, c = 32396, b = 7, type = 'NODE', wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33277,
    c = 32396,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'SINGLE_STEP_DELAY',
    direction = 1,
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
  },
  { q = 33272, c = 32389, b = 7, type = 'NODE',                wait = 'SINGLE_STEP_DELAY', },
  {
    q = 33270,
    c = 32390,
    b = 7,
    type = 'OPEN_DOOR',
    wait = 'SINGLE_STEP_DELAY',
    direction = 3,
  },
  { q = 33269, c = 32390, b = 7, type = 'NODE',                wait = 'SINGLE_STEP_DELAY', },
  { x = 33268, y = 32394, z = 7, type = 'NODE', },
  { x = 33268, y = 32398, z = 7, type = 'NODE', },
  { x = 33268, y = 32402, z = 7, type = 'NODE', },
  { x = 33268, y = 32406, z = 7, type = 'NODE', },
  { x = 33268, y = 32410, z = 7, type = 'NODE', },
  { x = 33272, y = 32413, z = 7, type = 'NODE', },
  { x = 33276, y = 32413, z = 7, type = 'NODE', },
  { x = 33276, y = 32417, z = 7, type = 'NODE', },
  { x = 33276, y = 32421, z = 7, type = 'NODE', },
  { x = 33276, y = 32425, z = 7, type = 'NODE', },
  { x = 33276, y = 32429, z = 7, type = 'NODE', },
  { x = 33276, y = 32433, z = 7, type = 'NODE', },
  { x = 33272, y = 32435, z = 7, type = 'NODE', },
  { x = 33268, y = 32435, z = 7, type = 'NODE', },
  { x = 33264, y = 32435, z = 7, type = 'NODE', },
  { x = 33263, y = 32439, z = 7, type = 'NODE', },
  { x = 33264, y = 32441, z = 7, type = 'NODE', },
  { x = 33265, y = 32441, z = 7, type = 'UPSTAIRS_DOWNSTAIRS', },
  { x = 33266, y = 32440, z = 6, type = 'NODE', },
  { x = 33268, y = 32440, z = 6, type = 'NODE', },
  { x = 33268, y = 32440, z = 6, type = 'NODE', },
}
