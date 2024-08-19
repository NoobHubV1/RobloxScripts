local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game.Players.LocalPlayer

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
    game:GetService("Players").LocalPlayer.Character.Pistol.GunScript_Server.InflictTarget:FireServer(unpack(args))
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

local function VirusPlayer()
        -- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Frame.Position = UDim2.new(0.0799492374, 0, 0.483815432, 0)
Frame.Size = UDim2.new(0, 292, 0, 171)
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Virus Player script"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.157534242, 0, 0.350877196, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 109, 0, 39)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "VIRUS"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

local plr = game.Players.LocalPlayer

local function GetPlayer(String)
        if not String then return end
	local Yes = {}
	for _, Player in ipairs(game.Players:GetPlayers()) do
		if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
			table.insert(Yes, Player)
		end
	end
	if #Yes > 0 then
		return Yes[1]
	elseif #Yes < 1 then
		return nil
	end
end

local function GiveVirus()
        game.ReplicatedStorage.Events.GiveVirus:FireServer()
end

function ClickTool(Tool)
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == Tool then v.Parent = game.Players.LocalPlayer.Character end
if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
end
	end
end

TextButton.MouseButton1Click:Connect(function()
GiveVirus()
local Target = TextBox.Text
for i = 1, 20 do
plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild("Virus"))
plr.Character.HumanoidRootPart.CFrame = GetPlayer(Target).Character.HumanoidRootPart.CFrame * CFrame.new(-1, 0, 1)
ClickTool("Virus")
task.wait()
end
task.wait(1)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedcf)
end)
end

local function CurePlayer()
        -- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Frame.Position = UDim2.new(0.0799492374, 0, 0.483815432, 0)
Frame.Size = UDim2.new(0, 292, 0, 171)
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Cure Player script"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.157534242, 0, 0.350877196, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 109, 0, 39)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "CURE"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

local plr = game.Players.LocalPlayer

local function GetPlayer(String)
        if not String then return end
	local Yes = {}
	for _, Player in ipairs(game.Players:GetPlayers()) do
		if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
			table.insert(Yes, Player)
		end
	end
	if #Yes > 0 then
		return Yes[1]
	elseif #Yes < 1 then
		return nil
	end
end

local function GiveCure()
        game.ReplicatedStorage.Events.GiveCure:FireServer()
end

function ClickTool(Tool)
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v.ToolTip == Tool then v.Parent = game.Players.LocalPlayer.Character end
if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
end
	end
end

TextButton.MouseButton1Click:Connect(function()
GiveCure()
local savedcf = plr.Character.HumanoidRootPart.Position
local Target = TextBox.Text
for i = 1, 20 do
plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild("Cure"))
plr.Character.HumanoidRootPart.CFrame = GetPlayer(Target).Character.HumanoidRootPart.CFrame * CFrame.new(-1, 0, 1)
ClickTool("Cure")
task.wait()
end
task.wait(1)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedcf)
end)
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

Section:CreateButton("Virus All", function()VirusAll()
end)

Section:CreateToggle("Auto Grab All Items", function(val)AutoGrabAll(val)
end)

local Section = Window:NewSection("Zombie")

Section:CreateToggle("Auto Kill Zombies", function(Value)AutoKill(Value)
end)

local Section = Window:NewSection("Others")

Section:CreateButton("Virus Player", function()VirusPlayer()
end)

Section:CreateButton("Cure Player", function()CurePlayer()
end)
