require("Commands")
require("Permissions")

Commands:registerCommand("kick", function(playerId, args)
    -- player has perms, do stuff here
end, { Permissions.ADMIN, Permissions.MOD })
