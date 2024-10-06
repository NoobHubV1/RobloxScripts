local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local GetEmerald = function(Color)
        firetouchinterest(game.Players.LocalPlayer.Character.Head, workspace.ChaosEmeralds:FindFirstChild(Color, true), 0)
end

local GetAllEmeralds = function()
        GetEmerald("Blue")
        GetEmerald("Yellow")
        GetEmerald("Red")
        GetEmerald("Cyan")
        GetEmerald("Purple")
        GetEmerald("White")
        GetEmerald("Green")
end

local function GetAllRings()
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
if v:IsA('Part') then
        local saved = v.CFrame
        v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
        task.wait(0.03)
        v.CFrame = saved
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
