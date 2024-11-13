local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local GetEmerald = function(Color)
        local LastPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.ChaosEmeralds:FindFirstChild(Color, true).CFrame
        task.wait(.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastPosition
end

local GetAllEmeralds = function()
        for i,v in pairs(game.workspace.ChaosEmeralds:GetChildren()) do
                local Oldc = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                task.wait(.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Oldc
        end
end

local function GetAllRings()
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
                if v:IsA('Part') then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head, v, 0)
                end
        end
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Get")

Section:CreateDropdown("Emerald Color", {"Blue","Cyan","Green","Purple","Red","White","Yellow"}, 1, function(Value)SelectedEmeraldsColor = Value
end)

Section:CreateButton("Get Emerald", function()GetEmerald(SelectedEmeraldsColor)
end)

local Section = Window:NewSection("All")

Section:CreateButton("Get All Emeralds", function()GetAllEmeralds()
end)

Section:CreateButton("Get All Rings", function()GetAllRings()
end)
