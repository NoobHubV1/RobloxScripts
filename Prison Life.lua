local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game:GetService("Players").LocalPlayer

local function GetCameraPosition()
	workspace["CurrentCamera"].CFrame
end

local function GiveItem(Item)
        if Item == "Shotgun" then
                workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["Remington 870"]})
        elseif Item == "Knife" then
                    workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.single["Crude Knife"]})
        elseif Item == "Hammer" then
                    workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.single["Hammer"]})
        elseif Item == "AK-47" then
                    workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["AK-47"]})
        elseif Item == "M9" then
                    workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["M9"]})
        elseif Item == "M4A1" then
                    workspace.Remote.ItemHandler:InvokeServer({Position=game:GetService("Players").LocalPlayer.Character.Head.Position,Parent=workspace.Prison_ITEMS.giver["M4A1"]})
        end
end

local function ConvertPosition(Position)
	if typeof(Position):lower() == "position" then
		return CFrame.new(Position)
	else
		return Position
	end
end

local function Loop(Times, calling)
	for i = 1, tonumber(Times) do
		calling()
	end
end

local function WaitForRespawn(Cframe)
	plr.Character:WaitForChild("HumanoidRootPart")

	local Cframe = ConvertPosition(Cframe)
	local CameraCframe = GetCameraPosition()
	coroutine.wrap(function()
		local a
		a = Player.CharacterAdded:Connect(function(NewCharacter)
			pcall(function()
				coroutine.wrap(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					API:Loop(5, function()
						workspace["CurrentCamera"].CFrame = CameraCframe
					end)
				end)()
				NewCharacter:WaitForChild("HumanoidRootPart")
				plr.Character.HumanoidRootPart.CFrame = Cframe
				if NoForce then
					task.spawn(function()
						NewCharacter:WaitForChild("ForceField"):Destroy()
					end)
				end
			end)
			a:Disconnect()
			Cframe = nil
		end)
		task.spawn(function()
			wait(2)
			if a then
				a:Disconnect()
			end
		end)
	end)()
end

local function ChangeTeam(Team)
        pcall(function()
		repeat task.wait() until game:GetService("Players").LocalPlayer.Character
		game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

		API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
	end)
	if TeamPath == game.Teams.Criminals then
		task.spawn(function()
			workspace.Remote.TeamEvent:FireServer("Bright orange")
		end)
		repeat API:swait() until Player.Team == game.Teams.Inmates and Player.Character:FindFirstChild("HumanoidRootPart")
		repeat
			API:swait()
			if firetouchinterest then
				firetouchinterest(plr.Character:FindFirstChildOfClass("Part"), game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1], 0)
				firetouchinterest(plr.Character:FindFirstChildOfClass("Part"), game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1], 1)
			end
			game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1].Transparency = 1
			game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1].CanCollide = false
			game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1].CFrame = API:GetPosition()
		until plr.Team == game:GetService("Teams").Criminals
		game:GetService("Workspace")["Criminals Spawn"]:GetChildren()[1].CFrame = CFrame.new(0, 3125, 0)
	else
		if TeamPath == game.Teams.Neutral then
			workspace['Remote']['TeamEvent']:FireServer("Bright grey")
		else
			if not TeamPath or not TeamPath.TeamColor then
				workspace['Remote']['TeamEvent']:FireServer("Bright orange")
			else
				workspace['Remote']['TeamEvent']:FireServer(TeamPath.TeamColor.Name)
			end
		end
	end
end
end

local function LoadScriptTigerAdmin()
        loadstring(Game:HttpGetAsync(("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Tiger%20Admin.lua")))()
end

local function Refresh()
	ChangeTeam(plr.Team)
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

PrisonLife:CreateToggle("Auto Respawn", function(State)Refresh(true)
		                                       task.spawn(function(State)
end)

PrisonLife:CreateButton("Tiger Admin", function()LoadScriptTigerAdmin()
end)
