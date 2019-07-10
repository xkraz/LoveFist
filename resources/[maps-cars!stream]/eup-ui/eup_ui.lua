-- NJD EUP UI
local outfits = {
    ['Male Default Outfit'] = {
        category = 'EMT',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 0, 1, 1 },
         -- { 3, 86, 1 },
            { 3, 1, 1 },
            { 4, 26, 1 },
            --{ 6, 52, 1 },
            { 6, 44, 2 },
            { 7, 127, 1 },
            { 8, 58, 1 },
            { 9, 3, 1 },
            { 10, 59, 2 },
			{ 11, 251, 2 },
			{ 14, 4, 1 },
        },
    },
	
	['Male Default Outfit with gloves'] = {
        category = 'EMT',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 0, 1, 1 },
         -- { 3, 86, 1 },
            { 3, 86, 1 },
            { 4, 26, 1 },
            --{ 6, 52, 1 },
            { 6, 44, 2 },
            { 7, 127, 1 },
            { 8, 58, 1 },
            { 9, 3, 1 },
            { 10, 59, 2 },
			{ 11, 251, 2 },
			{ 14, 4, 1 },
        },
    },
	
	['Male Shorts Outfit'] = {
        category = 'EMT',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 0, 1, 1 },
         -- { 3, 86, 1 },
            { 3, 1, 1 },
            { 4, 16, 4 },
            --{ 6, 52, 1 },
            { 6, 44, 2 },
            { 7, 127, 1 },
            { 8, 58, 1 },
            { 9, 3, 1 },
            { 10, 59, 2 },
			{ 11, 251, 2 },
			{ 14, 4, 1 },
        },
    },
	['Male Shorts Outfit with gloves'] = {
        category = 'EMT',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 0, 1, 1 },
         -- { 3, 86, 1 },
            { 3, 86, 1 },
            { 4, 16, 4 },
            --{ 6, 52, 1 },
            { 6, 44, 2 },
            { 7, 127, 1 },
            { 8, 58, 1 },
            { 9, 3, 1 },
            { 10, 59, 2 },
			{ 11, 251, 2 },
			{ 14, 4, 1 },
        },
    },
    ['Female Default Outfit'] = {
        category = 'EMT',
        ped = 'mp_f_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 1, 1, 1 },
          -- { 3, 15, 1 },
            { 3, 15, 1 },
            { 4, 65, 2 },
            { 6, 28, 1 },
            { 7, 97, 1 },
            { 8, 3, 1 },
            { 9, 3, 1 },
            { 10, 67, 2 },
            { 11, 259, 2 },
			{ 14, 19, 1 },
        },
    },
	
	['Female Default Outfit with gloves'] = {
        category = 'EMT',
        ped = 'mp_f_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
          --  { 1, 1, 1 },
          -- { 3, 15, 1 },
            { 3, 169, 1 },
            { 4, 65, 2 },
            { 6, 28, 1 },
            { 7, 97, 1 },
            { 8, 3, 1 },
            { 9, 3, 1 },
            { 10, 67, 2 },
            { 11, 259, 2 },
			{ 14, 19, 1 },
        },
    },

}
local function setOutfit(outfit)
    local ped = PlayerPedId()

    RequestModel(outfit.ped)

    while not HasModelLoaded(outfit.ped) do
        Wait(0)
    end

    if GetEntityModel(ped) ~= GetHashKey(outfit.ped) then
        SetPlayerModel(PlayerId(), outfit.ped)
    end

    ped = PlayerPedId()

    for _, comp in ipairs(outfit.components) do
       SetPedComponentVariation(ped, comp[1], comp[2] - 1, comp[3] - 1, 0)
    end

    for _, comp in ipairs(outfit.props) do
        if comp[2] == 0 then
            ClearPedProp(ped, comp[1])
        else
            SetPedPropIndex(ped, comp[1], comp[2] - 1, comp[3] - 1, true)
        end
    end
end

local categoryOutfits = {}

for name, outfit in pairs(outfits) do
    if not categoryOutfits[outfit.category] then
        categoryOutfits[outfit.category] = {}
    end

    categoryOutfits[outfit.category][name] = outfit
end

local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('Kylies Outfits', 'Pick your outfit!')

for name, list in pairs(categoryOutfits) do
    local subMenu = menuPool:AddSubMenu(mainMenu, name)

    for id, outfit in pairs(list) do
        outfit.item = NativeUI.CreateItem(id, 'Select this outfit.')
        subMenu:AddItem(outfit.item)
    end

    subMenu.OnItemSelect = function(sender, item, index)
        -- find the outfit
        for _, outfit in pairs(list) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

RegisterCommand('emt', function()
    mainMenu:Visible(not mainMenu:Visible())
end, false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)