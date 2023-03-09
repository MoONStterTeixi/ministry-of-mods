Config = {}

Config.Settings = {
    SyncTimer = 0, -- How long before before the server forces a sync (Seconds)
    RandomWeatherTimer = 300, -- How long before the server changes the weather (Secon1ds)
    MinutesPerSync = 0, -- Every sync adds the given number to minutes
}

Config.Time = { -- False values ignore the variable/setting (meaning it doesn't set anything)
    FreezeTime = false, -- Forces the Time & Date to freeze
    UseOSTime = false, -- if you want to use OS time (ignores all time settings below)
    hour = false, -- Must be between 1 & 23
    minute = false, -- Must be between 1 & 59
    second = false, -- Must be between 1 & 59
    year = false, -- Anything 4 digits long(?)
    month = false, -- Must be between 1 & 12
    day = false, -- Must be between 1 & 31 (Even if feburary has 28 days, it will be corrected automatically)
}

Config.Weather = { -- False values ignore the variable/setting (meaning it doesn't set anything)
    FreezeWeather = false, -- Forces the Weather to freeze
    season = false, -- Must be a number in the SeasonTypes below (EXAMPLE: season = 2)
    weather = false, -- Must be text, reference the WeatherTypes below (EXAMPLE: weather = "Overcast_Heavy_Winter_01",)
}

--[[
    Do not touch anything below unless you know what you are doing!
]]

Config.SeasonTable = {2,2,4,4,4,1,1,1,3,3,3,2}

Config.SeasonTypes = {
    [1] = "Summer",
    [2] = "Winter",
    [3] = "Fall",
    [4] = "Spring",
}

Config.Seasons = {
    Summer = {
        Clear = 50,
        Rainy = 10,
        Overcast = 20,
        Misty = 5,
        Snowy = 0,
        Sanctuary = 0,
        Other = 0,
    },
    Winter = {
        Clear = 10,
        Rainy = 5,
        Overcast = 30,
        Misty = 20,
        Snowy = 35,
        Sanctuary = 0,
        Other = 0,
    },
    Fall = {
        Clear = 20,
        Rainy = 40,
        Overcast = 15,
        Misty = 10,
        Snowy = 0,
        Sanctuary = 0,
        Other = 0,
    },
    Spring = {
        Clear = 30,
        Rainy = 30,
        Overcast = 20,
        Misty = 10,
        Snowy = 0,
        Sanctuary = 0,
        Other = 0,
    }
}

Config.WeatherTypes = {
    Clear = {"Clear", "LightClouds_01"},
    Rainy = {"LightRain_01", "Rainy", "FIG_07_Storm", "Stormy_01", "StormyLarge_01", "TestStormShort"},
    Overcast = {"Overcast_01", "Overcast_Heavy_01", "Overcast_Heavy_Winter_01", "Overcast_Windy_01", "Winter_Overcast_01", "Winter_Overcast_Windy_01", "Summer_Overcast_Heavy_01"},
    Misty = {"Misty_01", "MistyOvercast_01", "Winter_Misty_01"},
    Snowy = {"Snow_01", "Snow_Const", "SnowLight_01", "SnowShort"},
    Sanctuary = {"Sanctuary_Bog", "Sanctuary_Coastal", "Sanctuary_Forest", "Sanctuary_Grasslands"},
    Other = {"Announce", "Astronomy", "Default_PHY", "ForbiddenForest_01", "HighAltitudeOnly", "Intro_01", "MKT_Nov11", "TestWind"}
}
