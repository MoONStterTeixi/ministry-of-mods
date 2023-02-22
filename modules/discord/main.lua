local authorImage = nil

function LogToDiscord(name, title, color, message, tagEveryone)
    local colorMath = math.floor(color.r) * 65536 + math.floor(color.g) * 256 + math.floor(color.b)
    local body = nil

    if tagEveryone then
        body = "@everyone"
    end

    local webhook = Config.WebhookTable[name] or Config.WebhookTable['default']
    local data = json.encode({
        ["username"] = webhook.botName,
        ["avatar_url"] = webhook.botImage,
        ["content"] = body,
        ["embeds"] = {{
            ["title"] = title,
            ["description"] = message,
            ["color"] = colorMath,
            ["footer"] = {
                ["text"] = os.date('%c')
            },
            ["author"] = {
                ["name"] = "Ministry of Mods",
                ["icon_url"] = authorImage,
            },
        }}
    })
    print(webhook.webhook, data)

    --[[local succes, response = pcall(function()
		return --REQUIRED HTTP REQUEST
	end)
	if not succes then
		print(response)
	end]]
end

Exports("LogToDiscord", function(name, title, color, message, tagEveryone)
    LogToDiscord(name, title, color, message, tagEveryone)
end)