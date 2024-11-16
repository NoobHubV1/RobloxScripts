local library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Arceus%20X%20V3%20Lib.lua"))()
local plr = game.Players.LocalPlayer

library:SetTitle("Strong Fighter Simulator")
library:SetTitleColor(0, 255, 255)

library:AddToggle("Auto Strenght", function(value)
    AutoStrenght = value
end)

library:AddToggle("Auto Rebirth", function(v)
    AutoRebirth = v
end)

library:AddToggle("Auto Upgrade", function(value)
    AutoUpgrade = value
end)

spawn(function()
    while wait() do
      if AutoStrenght then
        if plr.Character:FindFirstChildOfClass("Tool") then
          plr.Character:FindFirstChildOfClass("Tool"):Activate()
        end
      end
      if AutoRebirth then
          game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Rebirth_Rebirth", {})
      end
      if AutoUpgrade then
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Damage_Multiplier")
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Health_Multiplier")
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Walk_Speed")
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Jump_Power")
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Pet_Space")
        game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer("S_Controller_Upgrades_Upgrade", "Pet_Inventory")
      end
    end
end)

library:SetTheme("Default")
library:SetIcon("rbxassetid://130557575680376")
