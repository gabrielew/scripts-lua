COORDS = {
    { x = 32310, y = 32210, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32310, y = 32210, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'TRAVEL',       npc = { "Captain Bluebear" }, city = { "port hope" }, },
    { x = 32527, y = 32784, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32530, y = 32786, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32531, y = 32787, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },

    {
        x = 32531,
        y = 32787,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHECK_TASK_RUBINOT',
        action = function()
            if MACHINE_UTILS.commands:get('task_rubinot') then
                return
                'leave-task2'
            else
                return 'start2'
            end
        end,
    },
    { x = 32531, y = 32787, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE',        label = 'start2', },


    { x = 32531, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32531, y = 32789, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },
    { x = 32535, y = 32792, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32539, y = 32792, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32543, y = 32792, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32543, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32547, y = 32787, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32551, y = 32787, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32553, y = 32791, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32556, y = 32795, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32556, y = 32799, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32560, y = 32802, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32561, y = 32804, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32562, y = 32805, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',   findTileId = 482, },
    { x = 32562, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32566, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32570, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32574, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32578, y = 32804, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32582, y = 32804, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32586, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32590, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32598, y = 32805, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32602, y = 32806, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32804, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32804, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },
    { x = 32605, y = 32803, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32606, y = 32802, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',   findTileId = 17239, },
    { x = 32606, y = 32802, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32803, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32605,
        y = 32803,
        z = 8,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32604, y = 32803, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32803, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32604, y = 32805, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32807, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32809, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32811, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32603, y = 32813, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32602, y = 32813, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32601, y = 32814, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 17239, },
    { x = 32603, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32603, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE',              label = 'start', },
    { x = 32603, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'SETTINGS_ON', },
    { x = 32603, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },
    { x = 32604, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32604,
        y = 32814,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32605, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32605, y = 32816, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32607, y = 32816, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32609, y = 32816, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32609, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32611, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32613, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32615, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32617, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32619, y = 32818, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32619, y = 32820, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32620, y = 32822, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32621, y = 32822, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32621,
        y = 32822,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32621, y = 32823, z = 9,  wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32621, y = 32823, z = 9,  wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32623, y = 32823, z = 9,  wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32823, z = 9,  wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 17239, },
    { x = 32625, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32625,
        y = 32823,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32626, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32626, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32628, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32628, y = 32825, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32628, y = 32827, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32628, y = 32829, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32626, y = 32829, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32830, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32832, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32834, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32836, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32624, y = 32838, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32623, y = 32838, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32623,
        y = 32838,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32622, y = 32838, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32622, y = 32838, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32620, y = 32839, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32618, y = 32840, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32616, y = 32840, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32615, y = 32842, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32613, y = 32843, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32612, y = 32843, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32612,
        y = 32843,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32611, y = 32843, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32611, y = 32843, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32610, y = 32841, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32839, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32837, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32835, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32833, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32831, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32829, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32827, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32611, y = 32825, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32821, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32819, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32817, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32815, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32814, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32610,
        y = 32814,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32610, y = 32813, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32813, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32610, y = 32811, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32610, y = 32809, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32608, y = 32808, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32608, y = 32806, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32608, y = 32804, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32607, y = 32803, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32607,
        y = 32803,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32607, y = 32802, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32607, y = 32802, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32607, y = 32800, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32607, y = 32798, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32798, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32603, y = 32799, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32601, y = 32800, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32599, y = 32800, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32597, y = 32801, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32597, y = 32803, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32805, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32807, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32809, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32811, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32813, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32815, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32816, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32594,
        y = 32816,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32594, y = 32817, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32817, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32595, y = 32819, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32821, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32825, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32598, y = 32825, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32599, y = 32825, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32599,
        y = 32825,
        z = 10,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32599, y = 32824, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32599, y = 32824, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32598, y = 32823, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32598, y = 32822, z = 10, wait = 'SINGLE_STEP_DELAY', type = 'USE_ROPE',          findTileId = 17238, },
    { x = 32597, y = 32824, z = 9,  wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32597,
        y = 32824,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32596, y = 32824, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32824, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32595, y = 32826, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32828, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32830, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32832, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32834, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32835, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32594,
        y = 32835,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32594, y = 32834, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32834, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32592, y = 32834, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32592, y = 32832, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32592, y = 32830, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32829, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32827, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32825, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32823, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32821, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32819, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32594, y = 32817, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32596, y = 32816, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32598, y = 32815, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32599, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32600, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32600,
        y = 32813,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32601, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32601, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32602, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    {
        x = 32602,
        y = 32813,
        z = 9,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHECK_TASK_RUBINOT',
        action = function()
            if MACHINE_UTILS.commands:get('task_rubinot') then
                return
                'leave-task'
            else
                return 'start'
            end
        end,
    },
    { x = 32602, y = 32813, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE',     label = 'leave-task', },
    { x = 32602, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32601, y = 32814, z = 9, wait = 'SINGLE_STEP_DELAY', type = 'USE_ROPE', findTileId = 17238, },
    { x = 32603, y = 32814, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32603,
        y = 32814,
        z = 8,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32604, y = 32814, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32814, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32604, y = 32812, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32810, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32808, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32806, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32605, y = 32804, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32605,
        y = 32804,
        z = 8,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32606, y = 32804, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32606, y = 32804, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32606, y = 32803, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32606, y = 32802, z = 8, wait = 'SINGLE_STEP_DELAY', type = 'USE_ROPE',          findTileId = 17238, },
    { x = 32606, y = 32803, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32604, y = 32803, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32603, y = 32803, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },
    { x = 32599, y = 32802, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32595, y = 32802, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32593, y = 32798, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32591, y = 32794, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32591, y = 32793, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32591, y = 32792, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'LADDER',            findTileId = 1968, },
    { x = 32591, y = 32793, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32587, y = 32792, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32583, y = 32789, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32579, y = 32789, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32575, y = 32789, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32571, y = 32789, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32567, y = 32790, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32563, y = 32790, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32559, y = 32790, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32555, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32551, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32547, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32543, y = 32790, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32539, y = 32791, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32535, y = 32791, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32532, y = 32790, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32532, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },

    { x = 32532, y = 32788, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE',        label = 'leave-task2', },

    { x = 32532, y = 32787, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32527, y = 32784, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32527, y = 32784, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'TRAVEL',            npc = { "Charles" }, city = { "thais" }, },

}