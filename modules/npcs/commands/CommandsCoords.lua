require("Commands")
require("Permissions")

Commands:registerCommand("coords", function(playerId, args)
    -- player has perms, do stuff here
end, { Permissions.ADMIN, Permissions.MOD, Permissions.USER })
