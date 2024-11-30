local library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Arceus%20X%20V3%20Lib.lua"))()
local plr = game.Players.LocalPlayer

library:SetTitle("Strong Fighter Simulator")
library:SetTitleColor(0, 255, 255)

function MoveTo(args)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = args
end

library:AddToggle("Auto Strenght", function(value)
    AutoStrenght = value
end)

library:AddToggle("Auto Rebirth", function(v)
    AutoRebirth = v
end)

library:AddToggle("Auto Upgrade", function(value)
    AutoUpgrade = value
end)

library:AddDropdown("Choose", {"Spawn","King","X2","X5","X10","X15","X20","X25"}, function(Select)
        if Select == "Spawn" then
            MoveTo(CFrame.new(-1306.71472, 0.942407429, 1658.36853, 0.99956882, 3.65776351e-08, -0.029361859, -3.4868048e-08, 1, 5.8736763e-08, 0.029361859, -5.76876467e-08, 0.99956882))
        elseif Select == "King" then
            MoveTo(CFrame.new(-1304.70605, 9.85108948, 1804.30896, 0.998135924, -2.54152643e-10, 0.0610299334, -8.66027874e-11, 1, 5.58076962e-09, -0.0610299334, -5.57565194e-09, 0.998135924))
        elseif Select == "X2" then
            MoveTo(CFrame.new(-1736.53589, -1.5559845, 1041.85071, 0.0946496502, -6.67552058e-09, 0.995510638, -2.26122214e-08, 1, 8.85551454e-09, -0.995510638, -2.33488784e-08, 0.0946496502))
        elseif Select == "X5" then
            MoveTo(CFrame.new(-799.582031, 0.683622718, 1075.20898, 0.950199604, -1.28795961e-07, 0.311641902, 1.16111281e-07, 1, 5.92573137e-08, -0.311641902, -2.0121135e-08, 0.950199604))
        elseif Select == "X10" then
            MoveTo(CFrame.new(-472.657684, 0.983762205, 249.994171, 0.99916625, -3.74218345e-09, -0.0408262126, 2.21373631e-09, 1, -3.7483094e-08, 0.0408262126, 3.73614668e-08, 0.99916625))
        elseif Select == "X15" then
            MoveTo(CFrame.new(-1310.50745, -0.228616774, 2492.10132, 0.996218026, 2.25072494e-09, 0.0868884325, 3.24163563e-09, 1, -6.30705443e-08, -0.0868884325, 6.31136743e-08, 0.996218026))
        elseif Select == "X20" then
            MoveTo(CFrame.new(-479.43042, 0.385480106, 1953.31824, -0.0867149532, 1.26581465e-08, 0.996233165, 9.05689246e-10, 1, -1.2627174e-08, -0.996233165, -1.92687144e-10, -0.0867149532))
        elseif Select == "X25" then
            MoveTo(CFrame.new(-2203.92773, 0.063425988, 1969.69458, 0.991446972, 4.35445707e-10, 0.130510196, -1.22796506e-09, 1, 5.99199579e-09, -0.130510196, -6.10100814e-09, 0.991446972))
        end
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
