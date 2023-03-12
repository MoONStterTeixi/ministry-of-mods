function Command:new(commandName, callback, permissions)
    return {
        commandName = commandName,
        callback = callback,
        permissions = permissions
    }
end

function Command:build(command)
    return {
        commandName = command.commandName,
        callback = command.callback,
        permissions = command.permissions
    }
end

function Command:checkPrmissions(player)
    return true
end

function Command:execute(player, args)
    if not self.checkPrmissions(player) then return end
    self.callback(player, args)
end
