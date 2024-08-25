--MADE BY NOOBHUBV1

local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game.Players.LocalPlayer

local function Tween(Obj, Prop, New, Time)
	if not Time then
		Time = .5
	end
	local TweenService = game:GetService("TweenService")
	local info = TweenInfo.new(
		Time, 
		Enum.EasingStyle.Quart, 
		Enum.EasingDirection.Out, 
		0, 
		false,
		0
	)
	local propertyTable = {
		[Prop] = New,
	}

	TweenService:Create(Obj, info, propertyTable):Play()
end

local function Notif(Text,Dur)
	task.spawn(function()
		if not Dur then
			Dur = 1.5
		end
		local Notif = Instance.new("ScreenGui")
		local Frame_1 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		Notif.Parent = (game:GetService("CoreGui") or gethui())
		Notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame_1.Parent = Notif
		Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame_1.BackgroundTransparency=1
		Frame_1.BorderSizePixel = 0
		Frame_1.Position = UDim2.new(0, 0, 0.0500000007, 0)
		Frame_1.Size = UDim2.new(1, 0, 0.100000001, 0)
		TextLabel.Parent = Frame_1
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.TextTransparency =1
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Highway
		TextLabel.Text = Text or "Text not found"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 21.000
		Tween(Frame_1,"BackgroundTransparency",0.350,.5)
		Tween(TextLabel,"TextTransparency",0,.5)
		wait(Dur+.7)
		Tween(Frame_1,"BackgroundTransparency",1,.5)
		Tween(TextLabel,"TextTransparency",1,.5)
		wait(.7)
		Notif:Destroy()
	end)
	return
end

local function GrabItem(Item)
        local savedcf = plr.Character.HumanoidRootPart.Position
        if Item == "Virus" then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-73.71356964111328, -15.50000286102295, -58.679542541503906)
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

local function KillZombies()
         --Equip Gun to Make Kill all work
--- and Execute this script rapidly to Make all player in zombie died
--- enjoy
local player = game.Players.LocalPlayer
for i,v in ipairs(game.Players:GetPlayers()) do
  if v.Name ~= player.Name then
    local BH = v.Character.Humanoid or v.Character:FindFirstChild("Humanoid")
    local BK = v.Character.HumanoidRootPart or v.Character:FindFirsrChild("HumanoidRootPart")
    local args = {
    [1] = BH,
    [2] = BK,
    [3] = 10,
    [4] = Vector3.new(0.9932631850242615, 0.018498189747333527, 0.11439403146505356),
    [5] = 2,
    [6] = 0,
    [7] = false
    }
    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").GunScript_Server.InflictTarget:FireServer(unpack(args))
  end
        end
end

local AutoKill = function(State)
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild("Pistol"))
        task.wait(0.3)
        getgenv().Loop = State
        while Loop do
        KillZombies()
        task.wait()
        end
end

local function LoadHttps(Https)
	loadstring(game:HttpGet(Https))()
end

local function ChangeTeamBring()
        LoadHttps("https://raw.githubusercontent.com/NoobHubV1/FE/main/Zombie%20Lab%20Change%20Team%20(Bring%20Plr).lua")
end

local function ChangeTeamGoto()
	LoadHttps("https://raw.githubusercontent.com/NoobHubV1/FE/main/Zombie%20Lab%20Change%20Team%20(Goto%20Plr).lua")
end

local SelectedMode = function(Mode)
	if Mode == "Bring" then
		ChangeTeamBring()
	elseif Mode == "Goto" then
		ChangeTeamGoto()
	end
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

local Section = Window:NewSection("Zombie")

Section:CreateToggle("Auto Kill Zombies", function(Value)AutoKill(Value)
end)

local Section = Window:NewSection("Others")

Section:CreateDropdown("Mode", {"Bring","Goto"}, 1, function(Value)Arg2 = Value
end)

Section:CreateButton("Cure/Virus Player", function()SelectedMode(Arg2)
end)

Notif("(Zombie Lab) Script Loaded!",5)
