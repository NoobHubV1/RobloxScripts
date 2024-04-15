local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

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

local function ChangeTeam(Team)
        if Team == game.Teams.Inmates then
                workspace.Remote.TeamEvent:FireServer("Bright orange")
        elseif Team == game.Teams.Guards then
                workspace.Remote.TeamEvent:FireServer("Bright blue")
        elseif Team == game.Teams.Criminals then
                workspace.Remote.TeamEvent:FireServer("Bright red")
        elseif Team == game.Teams.Neutral then
                workspace.Remote.TeamEvent:FireServer("Bright grey")
        end
end

local function TaseAll()local Oldt = Player.Team
			ChangeTeam(game.Teams.Guards)
			repeat task.wait() until Player.Backpack:FindFirstChild("Taser")
			wait(.7)
			local ohTable1 = {}
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v~= Player and v.Team ~= game.Teams.Guards then
					table.insert(ohTable1, {
						["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
						["Distance"] = -1,
						["Cframe"] = CFrame.new(),
						["Hit"] = v.Character.Head
					})
				end
			end
			local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Taser")
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(ohTable1, ohInstance2)
			task.spawn(function()
				game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack.Taser)
			end)
			wait(.7)
			ChangeTeam(Oldt)
end

local function LoadScriptTigerAdmin()
        loadstring(Game:HttpGetAsync(("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Tiger%20Admin.lua")))()
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

local PrisonLife = PhantomForcesWindow:NewSection("Tase All and Tiger Admin")

PrisonLife:CreateButton("Tase All", function()TaseAll()
end)

PrisonLife:CreateButton("Tiger Admin", function()LoadScriptTigerAdmin()
end)
