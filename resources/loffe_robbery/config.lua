Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {500, 1500}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {750, 1800}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1728.39, 6416.77, 35.04-0.98), heading = 241.7, money = {250, 500}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1696.95, 4923.16, 42.06-0.98), heading = 323.57, money = {250, 500}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1958.96, 3741.33, 32.34-0.98), heading = 299.0, money = {400, 750}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.56, 2711.25, 38.16-0.98), heading = 182.15, money = {400, 750}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.55, 2669.64, 42.16-0.98), heading = 96.48, money = {400, 750}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3244.18, 999.78, 12.83-0.98), heading = 355.14, money = {300, 800}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3040.52, 583.69, 7.91-0.98), heading = 12.65, money = {200, 600}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-2965.99, 391.25, 15.04-0.98), heading = 87.79, money = {300, 800}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1819.25, 793.92, 138.08-0.98), heading = 132.64, money = {750, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2555.3, 380.62, 108.23-0.98), heading = 356.23, money = {750, 1200}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(372.72, 328.2, 103.57-0.98), heading = 257.38, money = {750, 1800}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1486.23, -377.42, 40.16-0.98), heading = 131.28, money = {750, 1500}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.51, -908.55, 12.33-0.98), heading = 32.56, money = {750, 1600}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1133.87, -983.01, 46.42-0.98), heading = 276.71, money = {500, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-47.03, -1759.12, 29.42-0.98), heading = 51.9, money = {500, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}


}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}
