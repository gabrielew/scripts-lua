COORDS = {
  { x = 33268,        y = 32441, z = 6,     type = 'NODE', },
  { x = 33266,        y = 32441, z = 6,     type = 'NODE', },
  { x = 33265,        y = 32441, z = 6,     type = 'ENTER_HOLE', },
  { x = 33265,        y = 32442, z = 7,     type = 'NODE', },
  { x = 33263,        y = 32438, z = 7,     type = 'NODE', },
  { x = 33267,        y = 32435, z = 7,     type = 'NODE', },
  { x = 33271,        y = 32435, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32435, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32431, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32427, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32423, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32419, z = 7,     type = 'NODE', },
  { x = 33275,        y = 32415, z = 7,     type = 'NODE', },
  { x = 33271,        y = 32413, z = 7,     type = 'NODE', },
  { x = 33268,        y = 32409, z = 7,     type = 'NODE', },
  { x = 33268,        y = 32405, z = 7,     type = 'NODE', },
  { x = 33268,        y = 32401, z = 7,     type = 'NODE', },
  { x = 33268,        y = 32397, z = 7,     type = 'NODE', },
  { x = 33268,        y = 32393, z = 7,     type = 'NODE', },
  { x = 33269,        y = 32390, z = 7,     type = 'NODE', },

  -- doors to -1
  { q = 33270,        c = 32390, b = 7,     type = 'OPEN_DOOR',  wait = 'SINGLE_STEP_DELAY', direction = 1, },
  { q = 33272,        c = 32390, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33276,        c = 32389, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33277,        c = 32389, b = 7,     type = 'OPEN_DOOR',  wait = 'SINGLE_STEP_DELAY', direction = 1, },
  { q = 33278,        c = 32392, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33278,        c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33277,        c = 32396, b = 7,     type = 'OPEN_DOOR',  wait = 'SINGLE_STEP_DELAY', direction = 3, },
  { q = 33275,        c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33274,        c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33273,        c = 32396, b = 7,     type = 'OPEN_DOOR',  wait = 'SINGLE_STEP_DELAY', direction = 3, },
  { q = 33272,        c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33272,        c = 32396, b = 7,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findedId = 22157, q = 33271, c = 32395, b = 7,               type = 'ENTER_HOLE',        wait = 'SINGLE_STEP_DELAY', },
  {
    findedId = 22157,
    q = 33271,
    c = 32395,
    b = 8,
    type = 'TAKE_DECISION',
    wait = 'SINGLE_STEP_DELAY',
    action = function()
      -- wait(math.random(800, 1200))
      local pos = playerC:getPosition()
      if pos.z == 8 then
        return "continue-from-8"
      end

      if pos.z == 9 then
        return "continue-from-9"
      end
    end
  },

  { q = 33275,         c = 32392, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "continue-from-8" },
  { q = 33275,         c = 32390, b = 8,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findTileId = 1949, q = 33275, c = 32388, b = 8,               type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33322,         c = 32319, b = 13,    type = 'FIND_LABEL', wait = 'SINGLE_STEP_DELAY',   findLabel = "enter-hunt-tp" },

  { q = 33275,         c = 32392, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "continue-from-9" },
  { q = 33275,         c = 32390, b = 9,     type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33275,         c = 32389, b = 9,     type = 'STAND',      wait = 'SINGLE_STEP_DELAY', },
  { findTileId = 1949, q = 33275, c = 32388, b = 9,               type = 'ENTER_TP',            wait = 'SINGLE_STEP_DELAY', },
  { q = 33322,         c = 32319, b = 13,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY',   label = "enter-hunt-tp" },

  { q = 33324,         c = 32320, b = 13,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33324,         c = 32320, b = 13,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findedId = 1950,   q = 33327, c = 32320, b = 13,              type = 'UPSTAIRS_DOWNSTAIRS', wait = 'SINGLE_STEP_DELAY', },
  { q = 33324,         c = 32323, b = 12,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33324,         c = 32324, b = 12,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { q = 33324,         c = 32324, b = 12,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  { findedId = 469,    q = 33323, c = 32326, b = 12,              type = 'ENTER_HOLE',          wait = 'SINGLE_STEP_DELAY', },
  { q = 33321,         c = 32329, b = 13,    type = 'NODE',       wait = 'SINGLE_STEP_DELAY', },
  -- doors to -1
}
