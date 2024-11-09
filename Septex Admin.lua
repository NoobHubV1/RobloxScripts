local Prefix = ";"
local States = {}
local API = {}
local lib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Notification%20Lib.lua'))()
local plr, Player = game.Players.LocalPlayer, game.Players.LocalPlayer
local Unloaded = false

function API:Notif(name, content, color, time)
  lib:MakeNotification({
      Name = name,
      Content = content,
      Color = color,
      Time = time
  })
end

function PlayerChatted(Message)
  if Unloaded then return end
  local args = Message:split(" ")
  function Command(Cmd)
    return args[1] == Prefix..Cmd
  end
  function NotCommand(Cmd)
    return args[1] ~= Prefix..Cmd
  end
  if Command("unload") then
    Unloaded = true
    API:Notif("Unload", 'Script is unloaded', Color3.fromRGB(55, 155, 255), 5)
  end
  if NotCommand("unload") then
    API:Notif("Error", 'Not a valid command.', Color3.fromRGB(255, 0, 0), 3)
  end
end
game.Players.LocalPlayer.Chatted:Connect(PlayerChatted)
API:Notif("Loads", 'Loaded Admin Commands.', Color3.fromRGB(255, 0, 0), 10)
