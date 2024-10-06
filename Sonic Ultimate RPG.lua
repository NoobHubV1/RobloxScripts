local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local GetEmerald = function(Color)
        local LastP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ChaosEmeralds:FindFirstChild(Color, true).CFrame
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastP
end

local GetAllEmeralds = function()
        GetEmerald("Blue")
        wait(.5)
        GetEmerald("Yellow")
        wait(.5)
        GetEmerald("Cyan")
        wait(.5)
        GetEmerald("Purple")
        wait(.5)
        GetEmerald("Green")
        wait(.5)
        GetEmerald("White")
        wait(.5)
        GetEmerald("Red")
end

local function GetAllRings()
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
if v:IsA('Part') then
        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Part"), v, 0)
end
end
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Get")

Section:CreateDropdown("Emerald Color", {"Blue","Cyan","Green","Purple","Red","White","Yellow"}, 1, function(Value)SelectedEmeraldsColor = Value
end)

Section:CreateButton("Get Emerald", function()GetEmerald(SelectedEmeraldsColor)
end)

Section:CreateButton("Get Rings", function()firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Part"), game.Workspace.Rings, 0)
end)

local Section = Window:NewSection("All")

Section:CreateButton("Get All Emeralds", function()GetAllEmeralds()
end)

Section:CreateButton("Get All Rings", function()GetAllRings()
end)
