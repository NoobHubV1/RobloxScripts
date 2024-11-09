print([[
  // Commands List:
         unload | Unload the script
         prefix [STRING] | Changed new prefix
         allcmds | tells you the ammount of commands tiger admin has
  \\
]])
local CommandsAmount = 0
CommandsAmount = CommandsAmount + 3
local States = {}
local API = {}
local lib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Notification%20Lib.lua'))()
local plr, Player = game.Players.LocalPlayer, game.Players.LocalPlayer
local Unloaded = false
local Prefix = ";"
function Create(class,parent,props)
  local new = Instance.new(class)
  for i,v in next, props do
    new[i] = v
  end
  new.Parent = parent
  return new
end
ScreenGui = Create("ScreenGui",plr.PlayerGui,{Name = "ScreenGui", ResetOnSpawn = false})
TextBox = Create("TextBox",ScreenGui,{Name = "TextBox", BackgroundColor3 = Color3.fromRGB(172, 172, 172), BackgroundTransparency = 0.400, Position = UDim2.new(0.0255349874, 0, 0.800595582, 0), Size = UDim2.new(0, 278, 0, 33), Font = "SourceSans", PlaceholderText = "Press "..Prefix.." To Enter", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 23.000, Draggable = true})
function API:Notif(name, content, color, time)
  lib:MakeNotification({
      Name = name,
      Content = content,
      Color = color,
      Time = time
  })
end
function API:Destroy(parent)
  parent:Destroy()
  parent:Remove()
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
    API:Destroy(ScreenGui)
    Unloaded = true
    API:Notif("Unload", 'Script is unloaded', Color3.fromRGB(55, 155, 255), 5)
  end
  if Command("prefix") then
    local New = args[2]
    if New and tostring(New) then
      local NewPrefix = tostring(New)
      Prefix = NewPrefix
      TextBox.PlaceholderText = "Press "..NewPrefix.." To Enter"
      API:Notif("Success", 'prefix set to '..NewPrefix, Color3.fromRGB(0, 255, 0), 3)
    end
  end
  if Command("allcmds") then
    API:Notif("Cmds", 'Septex Admin has '..tostring(CommandsAmount)..' commands.', Color3.fromRGB(0, 0, 205), 3)
  end
  if NotCommand("unload") and NotCommand("prefix") and NotCommand("allcmds") then
    API:Notif("Error", 'Not a valid command.', Color3.fromRGB(255, 0, 0), 3)
  end
end
game.Players.LocalPlayer.Chatted:Connect(PlayerChatted)
TextBox.FocusLost:Connect(function(EnterKey)
    if EnterKey and not Unloaded then
      if TextBox.Text:sub(1,#Prefix) ~= Prefix then
        PlayerChatted(Prefix..TextBox.Text)
        TextBox.Text = ''
      else
        PlayerChatted(TextBox.Text)
        TextBox.Text = ""
      end
    end
end)
API:Notif("Loads", 'Loaded Admin Commands.', Color3.fromRGB(255, 0, 0), 10)
