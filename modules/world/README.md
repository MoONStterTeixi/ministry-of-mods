# World Module

This module regulates the world

**Warning:** freezeing time and weather isn't actually stopping the game engines weather/time.
What this does is freezes the math I am doing on the server side and does not add further to the server side table of world information.
When the game sync's it pulls the table of information and sets that information to the world.
Having a sync time of 0 is untested with others, but as a solo player there is no issue.

## For Developers

### Exports
```LUA
    Exports.world.syncWorld()
    Exports.world.getWorldData()
    Exports.world.setWorldData(table)
    Exports.world.freezeTime(bool)
    Exports.world.freezeWeather(bool)
```

### Examples
```LUA
    local ExampleTable = {
        hour = 12,
        minute = 43,
        --second = 12,
        day = 24,
        --month = 4,
        year = 1000,
        --season = 1,
        --weather = "Astronomy"
    }

    Exports.world.setWorldData(ExampleTable)

    Exports.world.syncWorld() -- Forces the world to sync between players

    -- EXAMPLE: If FreezeTime is on and you execute the trigger below, it will turn it off and vice versa. Same applies to Freeze Weather. Can include a BOOL to force a state.
    Exports.world.freezeTime(true) -- Forces the time to unfreeze
    Exports.world.freezeWeather() -- Forces the weather to freeze
    Exports.world.getWorldData() -- Get the current world's data
```