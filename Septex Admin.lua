local plr,Player = game.Players.LocalPlayer,game.Players.LocalPlayer
local Prefix = ";"

function Notif(Title, Text, Time)
  game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time,})
end

function PC(Message)
  local args = Message:split(" ")
  function Command(Cmd)
    return args[1] == Prefix..Cmd
  end
  if Command("cmds") then
    Notif("Notify", "Text", 3)
  end
end

Player.Chatted:Connect(PC)

Notif("Loads", "Loaded Admin Commands", 5)
