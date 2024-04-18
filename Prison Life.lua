local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game:GetService("Players").LocalPlayer
local Remote = workspace.Remote
local StarterGui = game:GetService("StarterGui")

local Notify = function(Name, Content, Time)
	StarterGui:SetCore("SendNotification",{Title = Name;Text = Content;Time = Time;})
end

local function GiveItem(Item)
        if Item == "Shotgun" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["Remington 870"]})
        elseif Item == "Knife" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.single["Crude Knife"]})
        elseif Item == "Hammer" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.single["Hammer"]})
        elseif Item == "AK-47" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["AK-47"]})
        elseif Item == "M9" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["M9"]})
        elseif Item == "M4A1" then
                Remote.ItemHandler:InvokeServer({Position=plr.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["M4A1"]})
        end
end

local function GuardsFull()
	if game.Teams.Guards == 8 then
		Notify("Guards Team Full")
	end
end

local function ChangeTeam(Team)
        if Team == game.Teams.Inmates then
		Remote.TeamEvent:FireServer("Bright orange")
	elseif Team == game.Teams.Guards then
		Remote.TeamEvent:FireServer("Bright blue")
	elseif Team == game.Teams.Criminals then
		Remote.TeamEvent:FireServer("Bright red")
	elseif Team == game.Teams.Neutral then
		Remote.TeamEvent:FireServer("Bright grey")
	end
end

local function LoadScriptTigerAdmin()
        loadstring(Game:HttpGetAsync(("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Tiger%20Admin.lua")))()
end

local function Refresh()
	ChangeTeam(plr.Team)
end

local AutoRefresh = function(State)
	if plr.Character.Humanoid.Health == 0 then
		getgenv().RefreshLoop = State
		while RefreshLoop do
		Refresh(true)
		task.wait()
		end
	end
end

local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")

local PrisonLife = PhantomForcesWindow:NewSection("Item Gui")

PrisonLife:CreateDropdown("Item", {"Shotgun","AK-47","M9","M4A1","Knife","Hammer"}, 1, function(Value)SelectedItem = Value
end)

PrisonLife:CreateButton("Get Item", function()GiveItem(SelectedItem)
end)

local PrisonLife = PhantomForcesWindow:NewSection("Change Team")

PrisonLife:CreateTextbox("Team", function(Team)if Team == "Inmate" then
                                                      ChangeTeam(game.Teams.Inmates)
                                              elseif Team == "Guard" then
                                                      ChangeTeam(game.Teams.Guards)
                                              elseif Team == "Criminal" then
                                                      ChangeTeam(game.Teams.Criminals)
                                              elseif Team == "Neutral" then
                                                      ChangeTeam(game.Teams.Neutral)
                                              end
end)

local PrisonLife = PhantomForcesWindow:NewSection("Refresh and Tiger Admin")

PrisonLife:CreateButton("Refresh", function()Refresh(true)
end)

PrisonLife:CreateToggle("Auto Refresh", function(State)AutoRefresh(State)
end)

PrisonLife:CreateButton("Tiger Admin", function()LoadScriptTigerAdmin()
end)
