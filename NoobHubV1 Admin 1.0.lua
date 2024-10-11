local Players = game.Players
local plr,Player = Players.LocalPlayer,Players.LocalPlayer
local Unloaded = false
local Prefix = ";"
local API = {}

function API:Notify(Title, Message, Time)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title,
		Text = Message,
		Duration = Time,
	})
end

function API:PlayerChatted(Message)
	local args = Message:split(" ")
	if args[1] == Prefix.."cmds" then
		API:Notify("Cmds", Prefix.."kill", 5)
	end
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if Unloaded then
		return
	end
	API:PlayerChatted(msg)
end)
API:Notify("Loads", "Loaded Admin Commands", 5)
