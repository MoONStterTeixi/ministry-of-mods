require("Command")

local registeredCommands = {}

function Commands:registerCommand(commandName, callback, permissions)
    registeredCommands[commandName] = Command.new(commandName, callback, permissions)
end

function Commands:getCommand(commandName)
    return registeredCommands[commandName];
end