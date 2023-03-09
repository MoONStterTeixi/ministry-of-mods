local PlayersTable = {}

local PlayerGenders = {
    [0] = Locale.gen_m,
    [1] = Locale.gen_f,
    [2] = Locale.gen_u,
}

local PlayerHouses = {
    [0] = Locale.house_g,
    [1] = Locale.house_h,
    [2] = Locale.house_r,
    [3] = Locale.house_s,
    [4] = Locale.house_u,
}

local DATA_FILE = "/data/playerdata.json"

local playerData = {}

--[[
    Functions
]]

function loadPlayerData(Player)
    local data = LoadData(_RESOURCE, DATA_FILE)
    if data then
        local pIdentifiers = {discord = Player.discord_id, steam = Player.steam_id, epic = Player.epic_id}
        for i,v in ipairs(data) do
            local dIdentifiers = v.identifiers
            local matchFound = false
            for a,b in pairs(pIdentifiers) do
                if dIdentifiers[a] and dIdentifiers[a] == b then
                    playerData[Player.connection] = data[i]
                    playerData[Player.connection].lastPlayed = os.time()
                    matchFound = true
                    break
                end
            end
            if matchFound then
                for a,b in pairs(pIdentifiers) do
                    if not playerData[Player.connection].identifiers[a] then
                        playerData[Player.connection].identifiers[a] = b
                        savePlayerData(Player)
                    end
                end
                break
            end
        end
        if not playerData[Player.connection] then
            playerData[Player.connection] = {
                house = Player.house,
                gender = Player.gender,
                lastPlayed = os.time(),
                identifiers = pIdentifiers
            }
            savePlayerData(Player)
        end
    end
end

function savePlayerData(Player)
    if playerData[Player.connection] then
        local data = LoadData(_RESOURCE, DATA_FILE)
        if data then
            local pIdentifiers = playerData[Player.connection].identifiers
            local found = false
            for i, v in ipairs(data) do
                local dIdentifiers = v.identifiers
                local matchFound = false
                for a,b in pairs(pIdentifiers) do
                    if dIdentifiers[a] and dIdentifiers[a] == b then
                        matchFound = true
                        break
                    end
                end
                if matchFound then
                    data[i] = playerData[Player.connection]
                    found = true
                    break
                end
            end
            if not found then
                table.insert(data, playerData[Player.connection])
            end
            SaveData(_RESOURCE, DATA_FILE, data)
            return true
        end
    end
    return false
end

function onPlayerJoin(Player)
    loadPlayerData(Player)
    Exports.world.syncWorld()
end

function onPlayerLeave(Player)
    local playerID = tostring(Player.id)
    savePlayerData(Player)
    playerData[playerID] = nil
end

function getPlayerData(Player)
    local playerID = tostring(Player.id)
    return playerData[playerID]
end

function onlinePlayers()
    local count = 0
    for _ in pairs(playerData) do
        count = count + 1
    end
    return count
end

function countHouses()
    local houses = {}
    for _, data in pairs(playerData) do
        local house = data.house
        if house then
            houses[PlayerHouses[house]] = (houses[PlayerHouses[house]] or 0) + 1
        end
    end
    return houses
end

function countGenders()
    local genders = {}
    for _, data in pairs(playerData) do
        local gender = data.gender
        genders[PlayerGenders[gender]] = (genders[PlayerGenders[gender]] or 0) + 1
    end
    return genders
end

--[[
    Exports
]]

Exports("getPlayerData", getPlayerData)
Exports("onlinePlayers", onlinePlayers)
Exports("countHouses", countHouses)
Exports("countGenders", countGenders)

--[[
    Events
]]

RegisterForEvent("player_joined", function(Player)
    onPlayerJoin(Player)
end)

RegisterForEvent("player_left", function(Player)
    onPlayerLeave(Player)
end)