local Prefix = ";"
local function Create(class,parent,props)
  local new = Instance.new(class)
  for i,v in next, props do
    new[i] = v
  end
  new.Parent = parent
  return new
end
ScreenGui = Create("ScreenGui",game.CoreGui,{Name = "ScreenGui", ResetOnSpawn = false})
TextBox = Create('TextBox',ScreenGui,{Name = "TextBox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.400, Size = UDim2.new(0, 278, 0, 33), Font = "SourceSans",
    PlaceholderText = "Press "..Prefix.." To Enter", TextSize = 23.000, TextColor3 = Color3.fromRGB(255, 255, 255), Draggable = true, Text = ""})

local Players = game.Players
local plr, Player = Players.LocalPlayer, Players.LocalPlayer
local Unloaded = false
local chatevents = game.ReplicatedStorage.DefaultChatSystemChatEvents
local API = {}
      API.Functions = {}

function API:Notif(Title, Text, Time)
  game:GetService("StarterGui"):SetCore("SendNotification",{Title = Title, Text = Text, Icon = game:GetService("Players"):GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420), Duration = Time})
end
function API:addFunction(func)
  table.insert(API.Functions, func)
end
API:Notif("Loaded", 'Loaded Admin Commands', 3)
