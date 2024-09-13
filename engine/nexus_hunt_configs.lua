local HUNT_CONFIG = {
    -- En-us: Amount to stop and kill the BOX
    -- Pt-br: Quantidade para parar e matar a BOX
    monsters_to_stop = 10,

    -- En-us: Amount to walk after kill the box
    -- Pt-br: Quantidade par voltar a andar apos matar box
    monsters_to_back = 5,

    -- En-us: Monster medium life percentage to walk after started box
    -- Pt-br: Porcentagem media de vida do monstro para andar apos iniciar a box
    monsters_box_life_percentage = 25,

    -- En-us: Run away with this amount of monsters
    -- Pt-br: Sai correndo com essa quantidade de bichos
    monsters_to_run = 25,

    -- En-us: Area that the player 'count' how many monsters are on the screen
    -- Pt-br: Area que o player 'conta' quantos monstros tem na tela
    player_vision_area = 6,

    -- En-us: MAX step delay from one step to another
    -- Pt-br: Tempo MAXIMO de um passo ao outro
    max_walk_delay = 1000,

    -- En-us: Time of each step, this value is multiplied by the amount of monsters on the screen
    -- Pt-br: Tempo de cada passo, esse valor se multiplica pela quantidade de bichos em tela
    walk_delay = 70,

    -- En-us: Anti-ks system, try not stop to kill the monsters around another player, leave true to try or false to kill
    -- Pt-br: Sistema anti-ks, tenta nao parar para matar os monstros em volta de outro player, deixe true para tentar ou false para matar
    anti_ks = false,

    -- En-us: Bot is paused if your mana is below this value (in percentage)
    -- Pt-br: Bot eh pausado caso sua esteja abaixo deste valor (em porcentagem)
    player_mana_to_stop_walk = 0,

    -- En-us: Bot is started if your mana is above this value (in percentage)
    -- Pt-br: Bot e iniciado caso sua esteja acima deste valor (em porcentagem)
    player_mana_to_start_walk = 0,

    -- En-us: If higher than 0 shows a list of players that you killed
    -- Pt-br: Se maior que 0 mostra uma lista de players que voce matou
    max_frags = 0,

    -- En-us: Frag time to display in hud
    -- Pt-br: Tempo de frag para exibir na hud
    each_frag_time = 15,

    -- En-us: Pause target, magic shooter and cavebot if reached max_frags? p.s: max_frags must be greather than 0
    -- Leave false to not or true to pause
    -- Pt-br: Pausar target, magic shooter e cavebot se atingir max_frags? obs.: max_frags deve ser maior que 0
    -- Deixe false para nao ou true para pausar
    pause_script_if_reached_max_frags = false,

    -- En-us: Pause script when has player on screen, leave false to not pause or true to pause
    -- Pt-br: Pausar script quando tiver player na tela, deixe false para nao pausar ou true para pausar
    pause_script_if_player_on_screen = false,

    -- [Lure Settings] --

    -- En-us: Try to avoid lost in monsters, leave true to try or false to not
    -- Pt-br: Tentar evitar lost em monstros, deixe true para tentar ou false para nao
    lure_monsters = true,

    -- En-us: Minimum monster count to start avoid lost
    -- Pt-br: Quantidade minima de monstros para comecar a evitar lost
    minimum_monsters_to_wait_lure = 2,

    -- En-us: Minimum number of blocked tiles/mobs around your character to force walk and avoid getting stuck/trapped. This considers tiles and mobs in a 2x2 area
    -- Pt-br: Numero minimo de tiles/mobs bloqueados ao redor do seu personagem para forcar andar e evitar ficar preso. Isso considera tiles e mobs em uma area 2x2
    near_monsters_to_run = 4,

    -- [Lure Settings] --

    -- [Complete/Afk Scripts] --

    -- [Anti-PK System] --

    -- En-us: Try to run to PZ if someone is attacking you, leave true to try or false to not
    -- Pt-br: Tentar correr para o PZ se alguem estiver te atacando, deixe true para tentar ou false para nao
    try_run_to_pz_if_pk_attack = false,

    -- En-us: Time in minutes to back on script after pause from 'try_run_to_pz_if_pk_attack (must be true)', if 0 will not back --
    -- Pt-br: Tempo em minutos para voltar no script apos pausa do 'try_run_to_pz_if_pk_attack (deve estar true)', se 0 nao voltara --
    wait_in_pz_after_pause_from_pk_attack = 0,

    -- [Anti-PK System] --

    -- [Refill Settings] --

    -- En-us: Your loot pouch id
    -- Pt-br: Seu id da loot pouch
    loot_pouch_id = 23721,

    -- En-us: Cap to leave hunt on check supplies point
    -- Pt-br: Cap para sair da hunt no ponto de checagem de supplies
    cap_to_leave = 500,

    refills = {
        potions = {
            { id = 236,   category = "potions", name = "Strong Health Potion",   leave_hunt = 0, buy = 0, },
            { id = 237,   category = "potions", name = "Strong Mana Potion",     leave_hunt = 0, buy = 0, },
            { id = 239,   category = "potions", name = "Great Health Potion",    leave_hunt = 0, buy = 0, },
            { id = 238,   category = "potions", name = "Great Mana Potion",      leave_hunt = 0, buy = 0, },
            { id = 23375, category = "potions", name = "Supreme health potion",  leave_hunt = 0, buy = 0, },
            { id = 23374, category = "potions", name = "Ultimate spirit potion", leave_hunt = 0, buy = 0, },
            { id = 7643,  category = "potions", name = "Ultimate health potion", leave_hunt = 0, buy = 0, },
            { id = 7642,  category = "potions", name = "Great spirit potion",    leave_hunt = 0, buy = 0, },
            { id = 23373, category = "potions", name = "Ultimate mana potion",   leave_hunt = 0, buy = 0, },
        },

        runes = {
            { id = 3161, category = "runes", name = "Avalanche rune",        leave_hunt = 0, buy = 0 },
            { id = 3202, category = "runes", name = "Thunderstorm rune",     leave_hunt = 0, buy = 0 },
            { id = 3175, category = "runes", name = "Stone shower rune",     leave_hunt = 0, buy = 0 },
            { id = 3191, category = "runes", name = "Great fireball rune",   leave_hunt = 0, buy = 0 },
            { id = 3155, category = "runes", name = "Sudden death rune",     leave_hunt = 0, buy = 0 },
            { id = 3160, category = "runes", name = "Ultimate healing rune", leave_hunt = 0, buy = 0 },
        },

        distance = {
            { id = 35901, category = "distance", name = "Diamond arrow", leave_hunt = 0, buy = 0 },
            { id = 35902, category = "distance", name = "Spectral Bolt", leave_hunt = 0, buy = 0 },
        },
    },

    -- [Refill Settings] --

    -- [Death Settings] --

    -- En-us: Max amount of deaths (recommend only in server that have the command '!bess')
    -- Pt-br: Quantidade maxima de mortes (recomendo somente em server que possuem o comando '!bess')
    max_player_deaths = 0,

    -- En-us: Time of wait for death in minutes
    -- Pt-br: Tempo de espera por morte em minutos
    wait_in_temple_after_death = 0,

    -- En-us: Auto bless, true only if the server have the command !bless, else false
    -- Pt-br: Deixe true somente se o servidor possuir o comando !bless, caso contrario, deixe false
    auto_say_bless = false,

    -- [Death Settings] --

    -- [Loot Corpses System] --

    -- En-us: Must loot corpses around you 1x1?
    -- Leave true to loot, leave 0 to not loot

    -- Pt-br: Deve pegar loot ao seu redor 1x1? --
    -- Deixe true para lootar, deixe 0 para nao lootar
    loot_corpses = false,

    -- En-us: Delay to loot corpses
    -- Pt-br: Delay para pegar loot
    -- rubinOT = 0, ixodusOT = 250
    loot_corpses_delay = 0,

    -- [Loot Corpses System] --

    -- [Hunt Mechanics] --

    -- En-us: Amount of monsters to run in circle. p.s: Only if your script has this functionality
    -- Pt-br: Quantidade de monstros para correr em circulo. obs.: Apenas se seu script tiver essa funcionalidade
    monsters_to_caitbox = 0,

    -- En-us: Amount of monsters to stop in forced boxes. ps.: Only if your script has this functionality
    -- Pt-br: Quantidade de monstros para parar em boxes forcadas. obs.: Apenas se seu script tiver essa funcionalidade
    monsters_to_stop_in_forced_boxes = 0,

    -- En-us: Amount of monsters to stop in forced boxes. ps.: Only if your script has this functionality
    -- Pt-br: Quantidade de monstros para parar em boxes forcadas. obs.: Apenas se seu script tiver essa funcionalidade
    monsters_to_leave_from_forced_boxes = 0,

    -- En-us: The way of script to walk, 0 = MAP CLICK, 1 = ARROW_KEYS
    -- Pt-br: A forma do script andar, 0 = MAP CLICK, 1 = ARROW_KEYS
    walk_mode = 0,

    -- [Hunt Mechanics] --

    -- [Hud Configs] --

    -- En-us: Position X from the configs hud
    -- Pt-br: Posicao X da hud de configs
    hud_configs_pos_x = 100,

    -- En-us: Position Y from the configs hud
    -- Pt-br: Posicao Y da hud de configs
    hud_configs_pos_y = 100,

    -- En-us: Show all supplies in refill menu
    -- Pt-br: Mostrar todos os supplies no menu de refill
    hud_show_all_supplies_in_refill_menu = false,

    -- En-us: Show multiplier value in refill menu
    -- Pt-br: Mostrar valor do multiplicador no menu de refill
    hud_refill_multiplier_count = 50,

    -- En-us: Position X from the frag huds
    -- Pt-br: Posicao X das huds de frags
    hud_frags_pos_x = 100,

    -- En-us: Position Y from the frag huds
    -- Pt-br: Posicao Y das huds de frags
    hud_frags_pos_y = 100,

    -- En-us: Position X from the status huds
    -- Pt-br: Posicao X das huds de status
    hud_status_pos_x = 100,

    -- En-us: Position Y from the status huds
    -- Pt-br: Posicao Y das huds de status
    hud_status_pos_y = 100,

    -- [Hud Configs] --

    -- [Complete/Afk Scripts] --

    -- [Others] --

    -- En-us: Play alert sound if receive private message
    -- Pt-br: Tocar som de alerta se receber mensagem privada
    alert_private_message = false,

    is_boss_script = false,

    -- En-us: If 0, will hunt dinamically, if 1 will hunt luring
    -- Pt-br: Se 0, ira cacar dinamicamente, se 1 ira cacar lurando
    hunt_mode = 0,

    --En-us: If true, will automatically walk in fungus and use fire bomb (if have) to stop fear status
    --Pt-br: Se true, ira andar automaticamente em fungos e usar fire bomb (se tiver) para parar o status de fear
    gnomprona_hunt = false

    -- [Others] --

}

return HUNT_CONFIG