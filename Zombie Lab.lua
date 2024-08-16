local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game.Players.LocalPlayer

local function GrabItem(Item)
        local savedcf = plr.Character.HumanoidRootPart.Position
        if Item == "Virus" then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-80.16571044921875, -11.020002365112305, -52.87663650512695)
                task.wait()
                game:GetService("ReplicatedStorage").Events.GiveVirus:FireServer()
                task.wait(0.3)
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedcf)
        elseif Item == "Cure" then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-44.5850944519043, 5.999998569488525, -11.800223350524902)
                task.wait()
                game:GetService("ReplicatedStorage").Events.GiveCure:FireServer()
                task.wait(0.3)
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedcf)
        end
end

local GrabAll = function()
        GrabItem("Virus")
        task.wait(0.3)
        GrabItem("Cure")
end

local function AutoGrabVirus(State)
        getgenv().Loop = State
        while Loop do
        if game.Players.LocalPlayer.Character:FindFirstChild("Virus") or game.Players.LocalPlayer.Backpack:FindFirstChild("Virus") then
        -- nothing
        else
        GrabItem("Virus")
        end
        task.wait()
        end
end

local function AutoGrabCure(State)
        getgenv().Loop = State
        while Loop do
        if game.Players.LocalPlayer.Character:FindFirstChild("Cure") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cure") then
        -- nothing
        else
        GrabItem("Cure")
        end
        task.wait()
        end
end

local AutoGrabAll = function(Value)
        AutoGrabCure(Value)
        task.wait(0.4)
        AutoGrabVirus(Value)
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Main")

Section:CreateDropdown("Item", {"Virus","Cure"}, 1, function(val)SelectedItem = val
end)

Section:CreateButton("Grab Item", function()GrabItem(SelectedItem)
end)

Section:CreateToggle("Auto Grab Virus", function(val)AutoGrabVirus(val)
end)

Section:CreateToggle("Auto Grab Cure", function(val)AutoGrabCure(val)
end)

Section:CreateButton("Grab All Items", function()GrabAll()
end)

Section:CreateToggle("Auto Grab All Items", function(val)AutoGrabAll(val)
end)
