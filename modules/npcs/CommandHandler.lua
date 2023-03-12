require("Commands")

RegisterForEvent("chatmessage", function(player, message)
    if not isCommand(message) then return end
    local command = GetCommand(message)
    if not command then return end
    command.execute(player, GetArguments(message))
end)

function GetArguments(message)
    local args = message:split()
    table.remove(args, 1)
    return args
end

function GetCommand(message)
    local args = message:split()
    return Commands.getCommand(args[1])
end

function IsCommand(message)
    return message:sub(0, 1) == Config.Prefix
end
