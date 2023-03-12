require("Commands")
require("Permissions")

Commands:registerCommand("ban", function(playerId, args)
    -- player has perms, do stuff here
end, { Permissions.ADMIN })
