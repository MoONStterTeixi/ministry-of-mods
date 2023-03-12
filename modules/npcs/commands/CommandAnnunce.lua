require("Commands")
require("Permissions")

Commands:registerCommand("announce", function(playerId, args)
    -- player has perms, do stuff here
end, { Permissions.ADMIN, Permissions.MOD })
