COORDS = {
    { x = 32310, y = 32210, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32310, y = 32210, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'TRAVEL',              npc = { "Captain Bluebear" }, city = { "yalahar" }, },
    { x = 32816, y = 31272, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32815, y = 31272, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },

    {
        x = 32815,
        y = 31272,
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
    { x = 32815, y = 31272, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE',        label = 'start2', },

    { x = 32814, y = 31272, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32813, y = 31272, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },
    { x = 32812, y = 31268, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32812, y = 31264, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32812, y = 31260, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32816, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32820, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32824, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32827, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'HUR_DOWN',            direction = 1, },
    { x = 32828, y = 31259, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32832, y = 31257, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32836, y = 31257, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32840, y = 31254, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32841, y = 31250, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32842, y = 31246, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31243, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31240, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32852, y = 31236, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31232, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31228, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31224, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31220, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31216, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31212, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31208, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31204, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31200, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31196, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31192, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31188, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32857, y = 31184, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31180, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31176, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31172, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31172, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32845, y = 31170, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32843, y = 31166, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32839, y = 31165, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31163, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31159, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31158, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31157, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31155, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1956, },
    { x = 32834, y = 31154, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31153, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1956, },
    { x = 32834, y = 31152, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31147, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31145, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          findTileId = 469, },
    { x = 32834, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31143, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          findTileId = 469, },
    { x = 32834, y = 31142, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31138, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31134, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32834, y = 31130, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32836, y = 31126, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32840, y = 31124, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32844, y = 31123, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31122, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32852, y = 31122, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31123, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31126, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31128, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31130, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 855, },
    { x = 32860, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31133, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          findTileId = 469, },
    { x = 32860, y = 31134, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31134, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },
    { x = 32860, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE',                label = 'start', },
    { x = 32860, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'SETTINGS_ON', },
    { x = 32860, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },
    { x = 32861, y = 31138, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32861,
        y = 31138,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 4
        end,
    },
    { x = 32862, y = 31139, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31139, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32862, y = 31140, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31141, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31142, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31143, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31144, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31145, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31146, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31147, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31148, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31148, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31148, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31149, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31149, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32857, y = 31149, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31149, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32855, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32853, y = 31149, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31148, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },
    { x = 32853, y = 31147, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31147, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31146, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31146, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31145, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31145, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32855,
        y = 31145,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32855, y = 31144, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31144, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32855, y = 31144, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31143, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32856, y = 31145, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32856,
        y = 31145,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32856, y = 31144, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31144, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32856, y = 31144, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31143, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32857, y = 31144, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32856, y = 31144, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32856,
        y = 31144,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32855, y = 31144, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31144, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32855, y = 31144, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31143, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32855, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32855,
        y = 31144,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32856, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32856, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31143, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32856, y = 31144, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32856,
        y = 31144,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 5
        end,
    },
    { x = 32855, y = 31144, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31144, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32855, y = 31143, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31143, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32856, y = 31142, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32856,
        y = 31142,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32855, y = 31142, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31142, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32855, y = 31142, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31143, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32855, y = 31142, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32855,
        y = 31142,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32856, y = 31142, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31142, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32856, y = 31142, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31143, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32856, y = 31142, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32856,
        y = 31142,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32855, y = 31142, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31142, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32855, y = 31142, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31143, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32855, y = 31142, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32855,
        y = 31142,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32854, y = 31142, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31142, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32854, y = 31143, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31144, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31145, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31146, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31148, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32853, y = 31149, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31149, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32855, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32857, y = 31149, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31149, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32859, y = 31149, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31150, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32861,
        y = 31151,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 4
        end,
    },
    { x = 32862, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },

    { x = 32862, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },

    { x = 32863, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32864, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32865, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32866, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32870, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32871, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32872, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32873, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31154, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31155, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31156, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31157, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },
    { x = 32874, y = 31156, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31155, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },
    { x = 32874, y = 31154, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },
    { x = 32874, y = 31152, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31151, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },

    { x = 32873, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },

    { x = 32873, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32873,
        y = 31150,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32872, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32872, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32871, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32870, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31147, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32867, y = 31148, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31149, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31150, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31151, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31152, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31153, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32867,
        y = 31153,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32867, y = 31154, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31154, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32867, y = 31155, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31156, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31156, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31157, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31158, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31159, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32867, y = 31160, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31159, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31158, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31157, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31156, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31155, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32869,
        y = 31155,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32869, y = 31154, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31154, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32869, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31152, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31151, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31150, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31148, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31147, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32868, y = 31148, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31148, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32870, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32870,
        y = 31147,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32869, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32869, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32867, y = 31147, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32867,
        y = 31147,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 3
        end,
    },
    { x = 32867, y = 31146, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31146, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32868, y = 31146, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31147, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32868, y = 31146, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31147, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32867, y = 31146, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31146, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31147, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31148, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32868,
        y = 31148,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32868, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31149, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32868, y = 31150, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31150, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31151, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31152, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31154, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31155, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31155, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32869,
        y = 31155,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32869, y = 31156, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31156, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32868, y = 31156, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31157, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31159, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32869, y = 31158, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31157, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31156, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31155, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31154, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32869,
        y = 31154,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32868, y = 31153, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31153, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32868, y = 31152, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31151, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31150, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31149, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31148, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31147, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32867, y = 31146, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31146, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31147, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32870, y = 31147, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32871, y = 31148, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32871,
        y = 31148,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32871, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32871, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },

    { x = 32871, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },

    { x = 32872, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32873, y = 31149, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31150, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31151, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32874, y = 31152, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31153, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32874, y = 31154, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31155, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32874, y = 31156, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31157, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32874, y = 31158, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31158, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31157, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31156, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31155, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31154, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32875, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32874, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32873, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32872, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32871, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32870, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32869, y = 31153, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32868, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32867, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32866, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32865, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32864, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32863, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31152, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31151, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31150, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31149, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31148, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31147, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31146, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31145, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31144, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31143, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31142, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32862, y = 31141, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31140, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31139, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31138, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32857, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },

    { x = 32855, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_OFF', },

    { x = 32854, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32854,
        y = 31136,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 4
        end,
    },
    { x = 32853, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32852, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32851, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32849, y = 31137, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31137, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32847, y = 31137, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31137, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 5257, },
    { x = 32845, y = 31137, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32845, y = 31136, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1947, },
    { x = 32845, y = 31135, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31134, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32846,
        y = 31134,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32846, y = 31133, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31133, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32846, y = 31132, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31131, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31131, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31130, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31130, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31130, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32849, y = 31131, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32849,
        y = 31131,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32849, y = 31132, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31132, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32848, y = 31132, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31131, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32848, y = 31132, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32848,
        y = 31132,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32847, y = 31132, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31132, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32846, y = 31132, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31131, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32847, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32847,
        y = 31132,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32848, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32848, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31131, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 8932, },
    { x = 32848, y = 31132, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32848,
        y = 31132,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 4
        end,
    },
    { x = 32847, y = 31132, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31132, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32847, y = 31131, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31131, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32848, y = 31130, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32848,
        y = 31130,
        z = 6,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32847, y = 31130, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31130, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32847, y = 31130, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31131, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32847, y = 31130, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32847,
        y = 31130,
        z = 5,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32848, y = 31130, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31130, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32848, y = 31130, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31131, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32848, y = 31130, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32848,
        y = 31130,
        z = 4,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32849, y = 31129, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31129, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32848, y = 31129, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31130, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 8657, },
    { x = 32849, y = 31129, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32849,
        y = 31129,
        z = 3,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 7
        end,
    },
    { x = 32850, y = 31129, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31129, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32850, y = 31130, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31131, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31132, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31133, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31133, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32849, y = 31134, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31134, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31135, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32847, y = 31135, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32845, y = 31136, z = 3, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32845, y = 31137, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31137, z = 4, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32847, y = 31137, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32848, y = 31137, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32849, y = 31137, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31137, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',        findTileId = 469, },
    { x = 32851, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32852, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31137, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32855, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    {
        x = 32855,
        y = 31136,
        z = 7,
        wait = 'SINGLE_STEP_DELAY',
        type = 'CHANGE_THING',
        action = function()
            values.monsters_to_stop = (values.monsters_to_stop_in_forced_boxes or 2)
            values.monsters_to_back = (values.monsters_to_leave_from_forced_boxes or 0)
            values.player_vision_area = 4
        end,
    },
    { x = 32856, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'CHANGE_THING_BACK', },
    { x = 32857, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    {
        x = 32857,
        y = 31136,
        z = 7,
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
    { x = 32857, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE',                label = 'leave-task', },
    { x = 32858, y = 31136, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31135, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31135, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31135, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31134, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },

    { x = 32861, y = 31133, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 855, },


    { x = 32861, y = 31132, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31131, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          direction = 0, },
    { x = 32861, y = 31129, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32861, y = 31128, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'RUN_MODE_ON', },
    { x = 32857, y = 31126, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31122, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32846, y = 31120, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32842, y = 31120, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32837, y = 31130, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32836, y = 31134, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31138, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31141, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31142, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31143, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1954, },
    { x = 32835, y = 31144, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31145, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'UPSTAIRS_DOWNSTAIRS', findTileId = 1954, },
    { x = 32835, y = 31146, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31150, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31152, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31153, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          findTileId = 469, },
    { x = 32835, y = 31154, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32835, y = 31155, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'ENTER_HOLE',          findTileId = 469, },
    { x = 32835, y = 31156, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32836, y = 31160, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32840, y = 31161, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32842, y = 31165, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32850, y = 31173, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32854, y = 31175, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32856, y = 31179, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32857, y = 31183, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31187, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31191, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32858, y = 31195, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31199, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31203, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31207, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31211, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31215, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31219, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32860, y = 31223, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32859, y = 31227, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32857, y = 31231, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32853, y = 31233, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32851, y = 31237, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32844, y = 31247, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32841, y = 31251, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32837, y = 31253, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32833, y = 31258, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32829, y = 31260, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32829, y = 31260, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32828, y = 31260, z = 7, wait = 'SINGLE_STEP_DELAY', type = 'HUR_UP',              direction = 3, },
    { x = 32827, y = 31260, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32817, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32813, y = 31259, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32811, y = 31263, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32811, y = 31267, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32813, y = 31271, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32814, y = 31271, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },

    { x = 32814, y = 31271, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE',        label = 'leave-task2', },

    { x = 32815, y = 31271, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32817, y = 31274, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32817, y = 31275, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'OPEN_DOOR',           direction = 2, },
    { x = 32816, y = 31276, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32815, y = 31277, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'NODE', },
    { x = 32815, y = 31277, z = 6, wait = 'SINGLE_STEP_DELAY', type = 'LADDER',              findTileId = 1968, },
    { x = 32817, y = 31278, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'STAND', },
    { x = 32817, y = 31278, z = 5, wait = 'SINGLE_STEP_DELAY', type = 'TRAVEL',              npc = { "Karith" },   city = { "thais" }, },

}
