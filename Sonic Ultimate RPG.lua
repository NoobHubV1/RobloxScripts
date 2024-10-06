local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local function Loop(State, calling, time)
        getgenv().Loop = State
        while Loop do
        calling()
        task.wait(time)
        end
end

local GetEmerald = function(Color)
        local LastP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ChaosEmeralds:FindFirstChild(Color, true).CFrame
        wait(0.075)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastP
end

local GetAllEmeralds = function()
        GetEmerald("Blue")
        wait(.15)
        GetEmerald("Yellow")
        wait(.15)
        GetEmerald("Cyan")
        wait(.15)
        GetEmerald("Purple")
        wait(.15)
        GetEmerald("Green")
        wait(.15)
        GetEmerald("White")
        wait(.15)
        GetEmerald("Red")
end

local function GetAllRings()
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
if v:IsA('Part') then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Get Emerald")

Section:CreateDropdown("Emerald Color", {"Blue","Cyan","Green","Purple","Red","White","Yellow"}, 1, function(Value)SelectedEmeraldsColor = Value
end)

Section:CreateButton("Get Emerald", function()GetEmerald(SelectedEmeraldsColor)
end)

local Section = Window:NewSection("Get All")

Section:CreateButton("Get All Emeralds", function()GetAllEmeralds()
end)

Section:CreateButton("Get All Rings", function()GetAllRings()
end)

local Section = Window:NewSection("Loop Get All")

Section:CreateToggle("Loop Get All Rings", function(Value)Loop(Value, GetAllRings, 0)
end)
