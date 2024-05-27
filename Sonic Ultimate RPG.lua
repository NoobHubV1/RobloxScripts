local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local function Loop(State, calling, time)
        getgenv().Loop = State
        while Loop do
        calling()
        task.wait(time)
        end
end

local GetAllEmeralds = function()
        game.Workspace.ChaosEmeralds.Blue.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.Cyan.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.Green.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.Purple.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.Red.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.White.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Workspace.ChaosEmeralds.Yellow.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end

local function GetAllRings()
        for i,v in pairs(game:GetService("Workspace").Rings:GetDescendants()) do
if v:IsA('Part') then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
end

local GetEmerald = function(Color)
        if Color == "Blue" then
                 Workspace.ChaosEmeralds.Blue.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "Cyan" then
                 Workspace.ChaosEmeralds.Cyan.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "Green" then
                 Workspace.ChaosEmeralds.Green.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "Purple" then
                 Workspace.ChaosEmeralds.Purple.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "Red" then
                 Workspace.ChaosEmeralds.Red.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "White" then
                 Workspace.ChaosEmeralds.White.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif Color == "Yellow" then
                 Workspace.ChaosEmeralds.Yellow.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
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
