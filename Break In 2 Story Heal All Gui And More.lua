-- Place Check
if game.PlaceId ~= 13864667823 then
	if game.PlaceId == 14775231477 or game.PlaceId == 13864661000 then

local Library = loadstring(game:HttpGetAsync(("https://github.com/bloodball/-back-ups-for-libs/raw/main/wizard")))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local ScriptLoaded = false

local function UnequipAllTools()for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Backpack
			end
		end
end

local function GiveItem(Item)if Item == "Armor" then
		                     Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
	                     elseif Item == "Diamond Crowbar" then
		                     Events:WaitForChild("Vending"):FireServer(3, "Crowbar3", "Weapons", LocalPlayer, 1)
	                     elseif Item == "Crowbar 1" or Item == "Crowbar 2" or Item == "Bat" or Item == "Wrench" or Item == "Pitchfork" or Item == "Hammer" or Item == "Broom" then
		                     Events:WaitForChild("Vending"):FireServer(3, tostring(Item:gsub(" ", "")), "Weapons", LocalPlayer, 1)
	                     else
		                     Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
	                     end
end

local Loop = function(State, Calling, Value, Time)
	getgenv().Loop = State
	while Loop do
		Calling(Value)
	        task.wait(Time)
	end
end

local function UnequipItem(Item)
	LocalPlayer.Character:WaitForChild(tostring(Item:gsub(" ", ""))).Parent = LocalPlayer.Backpack
end

local function RemoveItem(Item)
	LocalPlayer.Backpack:WaitForChild(tostring(Item:gsub(" ", ""))):Destroy()
end

local function EquipItem(Item)
	LocalPlayer.Backpack:WaitForChild(tostring(Item:gsub(" ", ""))).Parent = LocalPlayer.Character
end

local function HealTheNoobs()
	Events.HealTheNoobs:FireServer()
end

local function HealAllPlayers()
	UnequipAllTools()
        task.wait(.1)
        GiveItem("Golden Apple")
        task.wait(.1)
        EquipItem("Golden Apple")
        task.wait(.1)
        HealTheNoobs()
end

local function HealYourself()
	GiveItem("Pizza")
        Events.Energy:FireServer(25, "Pizza")
end

local function Heal(Heal)
	if Heal == "Heal All Players" then
		HealAllPlayers()
	elseif Heal == "Heal Yourself" then
		HealYourself()
	end
end

function Tween(Obj, Prop, New, Time)
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

function Notify(Text,Dur)
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
Notify("(Heal All Gui And More) Loading Script.",2)

                                                 wait(3)

Notify("(Heal All Gui And More) Loading Script..",2)

                                                 wait(3)

Notify("(Heal All Gui And More) Loading Script...",2)

                                                 wait(3)

local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")

local BreakIn2 = PhantomForcesWindow:NewSection("Item Gui")

BreakIn2:CreateDropdown("Item", {"Crowbar 1","Crowbar 2","Diamond Crowbar","Bat","Wrench","Pitchfork","Hammer","Broom","Armor","Med Kit","Key","Gold Key","Golden Apple","Pizza","Gold Pizza","Cookie","Lollipop","Louise","Apple","Bottle","Bloxy Cola","Expired Bloxy Cola","Rainbow Pizza","Rainbow Pizza Box","Crowbar","Battery","Ladder","Book","Phone"}, 9, function(Item)if Item == "Book" or Item == "Phone" then
				                                                                                                                                                                                                                                                                                                                                                       Notify("Warning", Item .. " Wont Work Unless You Own The Corresponding Gamepass.", 7)
		                                                                                                                                                                                                                                                                                                                                                               end
		                                                                                                                                                                                                                                                                                                                                                               SelectedItem = Item
end)

BreakIn2:CreateTextbox("Item Textbox", function(Item)if Item == "Book" or Item == "Phone" then
				                     Notify("Warning", Item .. " Wont Work Unless You Own The Corresponding Gamepass.", 7)
		                             end
		                             ItemTextbox = Item
end)

BreakIn2:CreateButton("Get Item Textbox", function()GiveItem(ItemTextbox)
end)

BreakIn2:CreateButton("Get Item Dropdown", function()GiveItem(SelectedItem)
end)

local BreakIn2 = PhantomForcesWindow:NewSection("Selected Heal")

BreakIn2:CreateDropdown("Selected Heal", {"Heal All Players","Heal Yourself"}, 1, function(Value)SelectedHeal = Value
end)

BreakIn2:CreateButton("Heal", function()Heal(SelectedHeal)
end)

BreakIn2:CreateToggle("Loop Heal", function(Value)Loop(Value, Heal, SelectedHeal, WaitTime)
end)

BreakIn2:CreateTextbox("Wait Time Loop Heal", function(Amount)WaitTime = Amount
end)

local BreakIn2 = PhantomForcesWindow:NewSection("Equip Item")

BreakIn2:CreateTextbox("Equip Item", function(Value)EquipItemTextbox= Value
end)

BreakIn2:CreateButton("Equip", function()EquipItem(EquipItemTextbox)
end)

local BreakIn2 = PhantomForcesWindow:NewSection("Unequip Item")

BreakIn2:CreateTextbox("Unequip Item", function(Value)UnequipItemTextbox = Value
end)

BreakIn2:CreateButton("Unequip", function()UnequipItem(UnequipItemTextbox)
end)

local BreakIn2 = PhantomForcesWindow:NewSection("Remove Item")

BreakIn2:CreateTextbox("Remove Item", function(Value)RemoveItemTextbox = Value
end)

BreakIn2:CreateButton("Remove", function(Value)RemoveItem(RemoveItemTextbox)
end)

Notify("(Heal All Gui And More) Loaded Script!",5)
ScriptLoaded = true
