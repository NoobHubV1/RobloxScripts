if game.PlaceId ~= 155615604 and game:FindFirstChild("Septex_Admin") then
	return game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Septex Admin",Text = "Septex admin is already executed or game not support",Duration = 7})
end
print([[
  // Commands List:
         unload | Unload the script
         prefix [STRING] | Changed new prefix
         allcmds | tells you the ammount of commands tiger admin has
         refresh / re | Respawn Character and save position
         cmds / cmd | Show commands list
         inmate / in | Change team inmates
         guard / gu | Change team guards
         autore / autorespawn [on/off] | Auto Respawn Character (if died) and auto save Position
         autoremoveff / autorff [ON/OFF] | Auto Remove forcefield (if respawn)
         killaura [on/off] | Activate killaura
         whitelist / wl [PLAYER] | Whitelisted Player
         unwhitelist / unwl [PLAYER] | Blacklisted Player
         kill / oof / die [PLAYER,ALL,TEAM] | Kill a player(s)
	 olditemmethod / oldimethod [ON/OFF] | Teleport to grab item
	 damage / dmg [plr,all,team] [number] | damages a player(s)
	 autodumpcars / autoremovecars / autonocars [on/off] | Auto Dump Cars if command ";bring"
	 criminal / crim / makecrim [plr] | Make crim player
	 view [player] | View the player
	 unview [player] | Stopped view player
  \\
]])
local States = {}
      States.AutoRespawn = true
      States.AutoRemoveff = false
      States.KillAura = false
      States.OldItemMethod = false
      States.AutoDumpCars = false
local API = {}
      API.Whitelisted = {}
local lib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Notification%20Lib.lua'))()
local plr, Player = game.Players.LocalPlayer, game.Players.LocalPlayer
local Unloaded = false
local Prefix = ";"
local saved = workspace["Criminals Spawn"].SpawnLocation.CFrame
local bgp = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651)
local CommandsAmount = 0
CommandsAmount = CommandsAmount + 19
function Create(class,parent,props)
  local new = Instance.new(class)
  for i,v in next, props do
    new[i] = v
  end
  new.Parent = parent
  return new
end
ScreenGui = Create("ScreenGui",plr.PlayerGui,{Name = "ScreenGui", ResetOnSpawn = false})
TextBox = Create("TextBox",ScreenGui,{Name = "TextBox", BackgroundColor3 = Color3.fromRGB(172, 172, 172), BackgroundTransparency = 0.400, Position = UDim2.new(0.0255349874, 0, 0.800595582, 0), Size = UDim2.new(0, 278, 0, 33), Font = "SourceSans", PlaceholderText = "Press "..Prefix.." To Enter", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 23.000, Draggable = true, ClearTextOnFocus = false})
function API:Notif(name, content, color, time)
  lib:MakeNotification({
      Name = name,
      Content = content,
      Color = color,
      Time = time
  })
end
function API:swait()
	game:GetService("RunService").Stepped:Wait()
end
function API:Destroy(parent)
  parent:Destroy()
  parent:Remove()
end
function API:Chat(msg)
  game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "all")
end

function API:CreateBulletTable(Bullet, Hit)
  local Args = {}
  for i =1,Bullet do
		Args[#Args + 1] = {
			["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
			["Hit"] = Hit,
      ["Cframe"] = CFrame.new(),
		}
  end
  return Args
end
function API:FindPlayer(String,IgnoreError)
	if not String or String == plr or String == "me" then
		return plr
	if String == "random" then
		local random = game.Players:GetPlayers()[math.random(#game.Players:GetPlayers())]
		if random == game.Players.LocalPlayer then
			return
		end
		return random
	else
		String = String:gsub("%s+", "")
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			 if v.Name:lower():match("^" .. String:lower()) or v.DisplayName:lower():match("^" .. String:lower()) then
				return v
		         end
	        end
	        if not IgnoreError then
		         API:Notif("OK", "Player has left or is not in your current game.", Color3.fromRGB(255, 0, 0), 3)
	        end
	        return nil
	end
end
function API:ConvertPosition(Position)
	if typeof(Position):lower() == "position" then
		return CFrame.new(Position)
	else
		return Position
	end
end

function API:GetPart(Target)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	return Target.Character:FindFirstChild("HumanoidRootPart") or Target.Character:FindFirstChild("Head")
end
function API:GetPosition(Player)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	if Player then
		return API:GetPart(Player).CFrame
	elseif not Player then
		return API:GetPart(plr).CFrame
	end
end
function API:GetCameraPosition(Player)
	return workspace["CurrentCamera"].CFrame
end
function API:Loop(Times, calling)
	for i = 1, tonumber(Times) do
		calling()
	end
end
function API:MoveTo(Cframe)
	Cframe = API:ConvertPosition(Cframe)
	local Amount = 7
	if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
		Amount = 13
	end
	for i = 1, Amount do
		API:UnSit()
		Player.Character:WaitForChild("HumanoidRootPart").CFrame = Cframe
		API:swait()
	end
end
function API:WaitForRespawn(Cframe,NoForce)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local Cframe = API:ConvertPosition(Cframe)
	local CameraCframe = API:GetCameraPosition()
	coroutine.wrap(function()
		local a
		a = Player.CharacterAdded:Connect(function(NewCharacter)
			pcall(function()
				coroutine.wrap(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					API:Loop(2, function()
						workspace["CurrentCamera"].CFrame = CameraCframe
					end)
				end)()
				NewCharacter:WaitForChild("HumanoidRootPart")
				Cframe = API:ConvertPosition(Cframe)
				local Amount = 10
				if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
					Amount = 13
				end
				for i = 1, Amount do
					API:UnSit()
					NewCharacter:WaitForChild("HumanoidRootPart").CFrame = Cframe
					API:swait()
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
function API:ChangeTeam(TeamPath,NoForce,Pos)
	if TeamPath == game.Teams.Inmates then
		pcall(function()
		repeat task.wait() until game:GetService("Players").LocalPlayer.Character
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

			API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
		end)
		workspace.Remote.TeamEvent:FireServer("Bright orange")
	elseif TeamPath == game.Teams.Guards then
		if API:GuardsFull("b") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			repeat wait()
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			until plr.Team == game.Teams.Guards
		else
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright blue")
		end
	elseif TeamPath == game.Teams.Criminals then
		if Player.Team == game.Teams.Inmates then
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		elseif plr.Team == game.Teams.Guards then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		elseif Player.Team == game.Teams.Criminals then
		if API:GuardsFull("c") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		else
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright blue")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				API:WaitForRespawn(Pos or API:GetPosition(),NoForce)
			end)
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
				workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		end
		end
	elseif TeamPath == game.Teams.Neutral then
		workspace.Remote.TeamEvent:FireServer("Medium stone grey")
	end
end
function API:GuardsFull(a)
  if a == "b" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team == game.Teams.Guards
  elseif a == "c" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team ~= game.Teams.Guards
  end
end
function API:UnSit()
  game.Players.LocalPlayer.Character.Humanoid.Sit = false
end
function API:Refresh()
  API:ChangeTeam(plr.Team)
end
local ChangeState = function(Type,StateType)
  local Value = nil
	if Type and typeof(Type):lower() == "string" and (Type):lower() == "on" then
		Value = true
	elseif Type and typeof(Type):lower() == "string" and (Type):lower() == "off" then
		Value = false
	elseif typeof(Type):lower() == "boolean" then
		Value = Type
	else
		Value = not States[StateType]
	end
	States[StateType] = Value
	API:Notif('OK', StateType.." has been changed to "..tostring(Value), Color3.fromRGB(0, 255, 0), 3)
	return Value
end
function API:KillPlayer(Target,Bullet,Failed,DoChange)
  local Bullets = API:CreateBulletTable(Bullet, Target.Character.Head)
	if not Target or not Target.Character or not Target.Character:FindFirstChildOfClass("Humanoid") or Target.Character:FindFirstChildOfClass("Humanoid").Health <1 then
		return
	end
	repeat API:swait() until not Target.Character:FindFirstChildOfClass("ForceField")
	local CurrentTeam = nil
	if Target.Team == Player.Team then
		if Target.Team~= game.Teams.Criminals then
			CurrentTeam = Player.Team
			API:ChangeTeam(game.Teams.Criminals,true)
		elseif Target.Team == game.Teams.Criminals then
			CurrentTeam = Player.Team
			API:ChangeTeam(game.Teams.Inmates,true)
			plr.CharacterAdded:Wait() wait()
		end
  end
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	repeat API:swait() API:GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
	task.spawn(function()
      game.ReplicatedStorage.ShootEvent:FireServer(Bullets, Gun)
      game.ReplicatedStorage.ReloadEvent:FireServer(Gun)
  end)
	coroutine.wrap(function()
		wait(.7)
		pcall(function()
			if Target.Character:FindFirstChildOfClass("Humanoid").Health >1 and not Failed then
				API:KillPlayer(Target,Bullet,true)
			end
		end)
	end)()
	if CurrentTeam and not Player.Team == CurrentTeam and not DoChange then
		wait(.3)
		API:ChangeTeam(CurrentTeam,true)
  end
end
function API:GetGun(Item, Ignore)
	if States.OldItemMethod == false and not Unloaded then
		task.spawn(function()
			workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
				Position = Player.Character.Head.Position,
				Parent = workspace.Prison_ITEMS.giver:FindFirstChild(Item, true)
			})
		end)
	elseif States.OldItemMethod and not Unloaded then
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = API:GetPosition()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP.CFrame
			repeat task.wait()
				coroutine.wrap(function()
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			API:MoveTo(LastPosition)
		end
	end
end
function API:GetSingle(Item, Ignore)
	if States.OldItemMethod == false and not Unloaded then
		task.spawn(function()
			workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
				Position = Player.Character.Head.Position,
				Parent = workspace.Prison_ITEMS.single:FindFirstChild(Item, true)
			})
		end)
	elseif States.OldItemMethod and not Unloaded then
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = API:GetPosition()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP.CFrame
			repeat task.wait()
				coroutine.wrap(function()
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			API:MoveTo(LastPosition)
		end
	end
end
function API:killall(TeamToKill,Bullet)
	if TeamToKill == game.Teams.Neutral then
		local LastTeam = Player.Team
		local Args = {}
		if LastTeam ~= game.Teams.Criminals then
			API:ChangeTeam(game.Teams.Criminals)
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil and v.Team == game.Teams.Inmates or v.Team == game.Teams.Guards then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Bullet do
					        Args[#Args + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character.Head,
							["Cframe"] = CFrame.new(),
						}
					end
				end
			end
		end

		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() API:GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		pcall(function()
			game.ReplicatedStorage.ShootEvent:FireServer(Args, Gun)
			game.ReplicatedStorage.ReloadEvent:FireServer(Gun)
		end)
		API:ChangeTeam(game.Teams.Inmates)
		plr.CharacterAdded:Wait()
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Bullet do
					        Args[#Args + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character.Head,
							["Cframe"] = CFrame.new(),
						}
					end
				end
			end
		end
			
		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() API:GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		pcall(function()
			game.ReplicatedStorage.ShootEvent:FireServer(Args, Gun)
			game.ReplicatedStorage.ReloadEvent:FireServer(Gun)
		end)
	end
	if TeamToKill == game.Teams.Inmates or TeamToKill == game.Teams.Guards then
		if Player.Team ~= game.Teams.Criminals then
			API:ChangeTeam(game.Teams.Criminals)
		end
	elseif TeamToKill == game.Teams.Criminals then
		if Player.Team ~= game.Teams.Inmates then
			API:ChangeTeam(game.Teams.Inmates)
			plr.CharacterAdded:Wait() wait()
		end
	end
	if TeamToKill == game.Teams.Inmates or TeamToKill == game.Teams.Guards or TeamToKill == game.Teams.Criminals then
	local Args = {}
	for i,v in pairs(TeamToKill:GetPlayers()) do
		if v and v~=Player and  not table.find(API.Whitelisted,v) then
			for i =1,Bullet do
				Args[#Args + 1] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
					["Hit"] = v.Character.Head,
					["Cframe"] = CFrame.new(),
				}
			end
		end
	end
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	repeat task.wait() API:GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun

	pcall(function()
		game.ReplicatedStorage.ShootEvent:FireServer(Args, Gun)
		game.ReplicatedStorage.ReloadEvent:FireServer(Gun)
	end)
	end
end
function IsTeamCommandCheck(String)
	for i,v in pairs(game.Teams:GetChildren()) do
		if v and v.Name:lower() == String:lower() then
			return v
		end
	end
	return nil
end
function API:AllGuns()
	if bgp then
		repeat wait()
			API:GetGun("M4A1")
		until plr.Character:FindFirstChild("M4A1") or plr.Backpack:FindFirstChild("M4A1")
	end
	repeat wait()
		API:GetGun("Remington 870")
	until plr.Character:FindFirstChild("Remington 870") or plr.Backpack:FindFirstChild("Remington 870")
	repeat wait()
		API:GetGun('AK-47')
	until plr.Character:FindFirstChild("AK-47") or plr.Backpack:FindFirstChild("AK-47")
	repeat wait()
		API:GetGun("M9")
	until plr.Character:FindFirstChild("M9") or plr.Backpack:FindFirstChild("M9")
end
function API:AllItems()
	if bgp then
		repeat wait()
			API:GetGun("M4A1")
		until plr.Character:FindFirstChild("M4A1") or plr.Backpack:FindFirstChild("M4A1")
	end
	repeat wait()
		API:GetGun("Remington 870")
	until plr.Character:FindFirstChild("Remington 870") or plr.Backpack:FindFirstChild("Remington 870")
	repeat wait()
		API:GetGun('AK-47')
	until plr.Character:FindFirstChild("AK-47") or plr.Backpack:FindFirstChild("AK-47")
	repeat wait()
		API:GetGun("M9")
	until plr.Character:FindFirstChild("M9") or plr.Backpack:FindFirstChild("M9")
	repeat wait()
		API:GetSingle("Hammer")
	until plr.Character:FindFirstChild("Hammer") or plr.Backpack:FindFirstChild("Hammer")
	repeat wait()
		API:GetSingle("Crude Knife")
	until plr.Character:FindFirstChild("Crude Knife") or plr.Backpack:FindFirstChild("Crude Knife")
end
function API:bring(Target,TeleportTo,MoreTP,DontBreakCar)
	if not IsBringing and Target and Target.Character:FindFirstChildOfClass("Humanoid") and Target.Character:FindFirstChildOfClass("Humanoid").Health>0 and Target.Character:FindFirstChildOfClass("Humanoid").Sit == false then
		if not TeleportTo then
			TeleportTo = API:GetPosition()
		end
		local Orgin = API:GetPosition()
		local CarPad = workspace.Prison_ITEMS.buttons["Car Spawner"]
		local car = nil
		local Seat = nil
		local Failed = false
		local CheckForBreak = function()
			if not Target or not Target.Character:FindFirstChildOfClass("Humanoid") or Target.Character:FindFirstChildOfClass("Humanoid").Health<1 or Player.Character:FindFirstChildOfClass("Humanoid").Health<1 then
				Failed = true
				return true
			else
				return nil
			end
		end

		for i,v in pairs(game:GetService("Workspace").CarContainer:GetChildren()) do
			if v then
				if v:WaitForChild("Body"):WaitForChild("VehicleSeat").Occupant == nil then
					car = v
				end
			end
		end
		if not car then
			coroutine.wrap(function()
				if not car then
					car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
				end
			end)()
			repeat task.wait()
				game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[7]["Car Spawner"].CFrame)
				task.spawn(function()
					workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[7]["Car Spawner"])
				end)
				if CheckForBreak() then
					break
				end
			until car
		end
		car:WaitForChild("Body"):WaitForChild("VehicleSeat")
		car.PrimaryPart = car.Body.VehicleSeat
		Seat = car.Body.VehicleSeat
		repeat task.wait()
			Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
		until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
		wait() --// so it doesnt break
		repeat task.wait()
			if CheckForBreak() or not Player.Character:FindFirstChildOfClass("Humanoid") or Player.Character:FindFirstChildOfClass("Humanoid").Sit == false then
				break
			end
			car.PrimaryPart = car.Body.VehicleSeat
			if Target.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude >0 then
				car:SetPrimaryPartCFrame(Target.Character:GetPrimaryPartCFrame()*CFrame.new(0,-.2,-6))
			else
				car:SetPrimaryPartCFrame(Target.Character:GetPrimaryPartCFrame()*CFrame.new(0,-.2,-5))
			end
		until Target.Character:FindFirstChildOfClass("Humanoid").Sit == true
		if Failed then
			API:Notif("Error", 'Failed to bring the player!', Color3.fromRGB(255, 0, 0), 3)
			return
		end
		for i =1,10 do
			car:SetPrimaryPartCFrame(TeleportTo)
			task.wait()
		end
		wait(.1)
		task.spawn(function()
			if not Unloaded and States.AutoDumpCars and not DontBreakCar then
				repeat task.wait() until Target.Character:FindFirstChildOfClass("Humanoid").Sit == false
				repeat wait()
					Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
				until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
				for i =1,10 do
					car:SetPrimaryPartCFrame(CFrame.new(30, 30, 30))
					API:swait()
				end
				API:UnSit()
				API:MoveTo(Orgin)
			end
		end)
		if not Unloaded and not States.AutoDumpCars then
			API:UnSit()
			API:MoveTo(Orgin)
		end
	else
		API:Notif("Error", 'Player has died or is sitting or an unknown error.', Color3.fromRGB(255, 0, 0), 3)
	end
end
function PlayerChatted(Message)
  if Unloaded then return end
  local args = Message:split(" ")
  function Command(Cmd)
    return args[1] == Prefix..Cmd
  end
  function NotCommand(Cmd)
    return args[1] ~= Prefix..Cmd
  end
  if Command("unload") then
    API:Destroy(ScreenGui)
    Unloaded = true
    API:Notif("Unload", 'Script is unloaded', Color3.fromRGB(55, 155, 255), 5)
  end
  if Command("prefix") then
    local New = args[2]
    if New and tostring(New) then
      local NewPrefix = tostring(New)
      Prefix = NewPrefix
      TextBox.PlaceholderText = "Press "..NewPrefix.." To Enter"
      API:Notif("OK", 'prefix set to '..NewPrefix, Color3.fromRGB(0, 255, 0), 3)
    end
  end
  if Command("allcmds") then
    API:Notif("Cmds", 'Septex Admin has '..tostring(CommandsAmount)..' commands.', Color3.fromRGB(0, 0, 205), 3)
  end
  if Command("re") or Command("refresh") then
    API:Refresh()
    API:Notif("OK", "Respawn Character and save position", Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("cmds") or Command("cmd") then
    API:Notif("Cmds", "The commands are listed in the console! \n Press F9 to view or chat /console", Color3.fromRGB(0, 0, 205), 3)
  end
  if Command("inmate") or Command("in") then
    API:ChangeTeam(game.Teams.Inmates)
    API:Notif("OK", 'Change Team Inmates', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("guard") or Command("gu") then
    if not API:GuardsFull("c") then
      API:ChangeTeam(game.Teams.Guards)
      API:Notif("OK", 'Change Team Guards', Color3.fromRGB(0, 255, 0), 3)
    else
      API:Notif("Error", 'Guards Full!', Color3.fromRGB(255, 0, 0), 3)
    end
  end
  if Command("autore") or Command("autorespawn") then
    ChangeState(args[2],"AutoRespawn")
  end
  if Command("autoremoveff") or Command("autorff") then
    ChangeState(args[2],"AutoRemoveff")
  end
  if Command("killaura") then
    local value = ChangeState(args[2],"KillAura")
    if value then
      while wait() do
        if States.KillAura then
          for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= plr and not table.find(API.Whitelisted, v) then
              if v.Character.Humanoid.Health > 0 or not v.Character:FindFirstChild("ForceField") then
                game.ReplicatedStorage.meleeEvent:FireServer(v)
              end
            end
          end
        end
      end
    end
  end
  if Command("whitelist") or Command("wl") then
    local Player = API:FindPlayer(args[2])
    if not table.find(API.Whitelisted, Player.Name) then
      table.insert(API.Whitelisted, Player.Name)
      API:Notif("OK", 'Whitelisted '..Player.DisplayName, Color3.fromRGB(0, 255, 0), 3)
    else
      API:Notif("Error", 'Player is already whitelist!', Color3.fromRGB(255, 0, 0), 3)
    end
  end
  if Command("unwhitelist") or Command("unwl") then
    local Player = API:FindPlayer(args[2])
    if table.find(API.Whitelisted, Player.Name) then
      table.remove(API.Whitelisted,table.find(API.Whitelisted, Player.Name))
      API:Notif("OK", 'Blacklisted '..Player.DisplayName, Color.fromRGB(0, 255, 0), 3)
    else
      API:Notif("Error", 'Player is not already whitelist!', Color3.fromRGB(255, 0, 0), 3)
    end
  end
  if Command("kill") or Command("oof") or Command("die") then
    local Team = IsTeamCommandCheck(args[2])
    if args[2] == "all" or args[2] == 'others' or args[2] == "everyone" then
	API:killall(game.Teams.Neutral,10)
	API:Notif("OK", 'Killed '..args[2], Color3.fromRGB(0, 255, 0), 3)
    elseif Team == game.Teams.Inmates then
	API:killall(game.Teams.Inmates,10)
	API:Notif("OK", 'Killed inmates', Color3.fromRGB(0, 255, 0), 3)
    elseif Team == game.Teams.Guards then
	API:killall(game.Teams.Guards,10)
	API:Notif("OK", 'Killed guards', Color3.fromRGB(0, 255, 0), 3)
    elseif Team == game.Teams.Criminals then
	API:killall(game.Teams.Criminals,10)
	API:Notif("OK", 'Killed criminals', Color3.fromRGB(0, 255, 0), 3)
    else
	local Target = API:FindPlayer(args[2])
	if Target then
		API:KillPlayer(Target,10)
	end
    end
  end
  if Command("olditemmethod") or Command("oldimethod") then
    ChangeState(args[2],"OldItemMethod")
  end
  if Command("damage") or Command("dmg") then
	local Team = IsTeamCommandCheck(args[2])
	local bullet = tonumber(args[3])
    if args[2] == "all" or args[2] == 'others' or args[2] == "everyone" then
	if bullet ~= nil then
		API:killall(game.Teams.Neutral,bullet)
		API:Notif("OK", 'Damages '..args[2]..' '..bullet, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'No Damage Found', Color3.fromRGB(255, 0, 0), 3)
	end
    elseif Team == game.Teams.Inmates then
	if bullet ~= nil then
		API:killall(game.Teams.Inmates,bullet)
		API:Notif("OK", 'Damages inmates '..bullet, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'No Damage Found', Color3.fromRGB(255, 0, 0), 3)
	end
    elseif Team == game.Teams.Guards then
	if bullet ~= nil then
		API:killall(game.Teams.Guards,bullet)
		API:Notif("OK", 'Damages guards '..bullet, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'No Damage Found', Color3.fromRGB(255, 0, 0), 3)
	end
    elseif Team == game.Teams.Criminals then
	if bullet ~= nil then
		API:killall(game.Teams.Criminals,bullet)
		API:Notif("OK", 'Damages criminals '..bullet, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'No Damage Found', Color3.fromRGB(255, 0, 0), 3)
	end
    else
	local Target = API:FindPlayer(args[2])
	if Target then
		if bullet ~= nil then
			API:KillPlayer(Target,bullet)
			API:Notif("OK", 'Damages '..Target.DisplayName..' '..bullet, Color3.fromRGB(0, 255, 0), 3)
		else
			API:Notif("Error", 'No Damage Found', Color3.fromRGB(255, 0, 0), 3)
		end
	end
    end
  end
  if Command("autodumpcars") or Command('autoremovecars') or Command("autonocars") then
    ChangeState(args[2],"AutoDumpCars")
  end
  if Command("criminal") or Command("crim") or Command("makecrim") then
	if args[2] then
		local Target = API:FindPlayer(args[2])
		if Target then
			if Target.Team ~= game.Teams.Criminals then
				API:bring(Target, saved)
				API:Notif("OK", 'Made '..Target.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
			else
				API:Notif("Error", Target.DisplayName..' is criminal.', Color3.fromRGB(255, 0, 0), 3)
			end
		end
	else
		if Player.Team ~= game.Teams.Criminals then
			API:ChangeTeam(game.Teams.Criminals)
			API:Notif("OK", 'Made '..plr.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
		else
			API:Notif("Error", Player.DisplayName..' is criminal.', Color3.fromRGB(255, 0, 0), 3)
		end
	end
  end
  if Command("view") then
	local Player = API:FindPlayer(args[2])
	if not table.find(API.ViewingPlayer, Player.Name) then
		table.insert(API.ViewingPlayer, Player.Name)
		API:Notif("OK", 'Viewing '..Player.DisplayName, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'Player is already viewing!', Color3.fromRGB(255, 0, 0), 3)
	end
  end
  if Command("unview") then
	local Player = API:FindPlayer(args[2])
	if table.find(API.ViewingPlayer, Player.Name) then
		table.remove(API.ViewingPlayer,table.find(API.ViewingPlayer, Player.Name))
		API:Notif("OK", 'Stopped viewing '..Player.DisplayName, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'Player is not already viewing!', Color3.fromRGB(255, 0, 0), 3)
	end
  end
  if NotCommand("unload") and NotCommand("prefix") and NotCommand("allcmds") and NotCommand('re') and NotCommand("refresh") and NotCommand("cmds") and NotCommand("cmd") and NotCommand("inmate") and NotCommand("in") and NotCommand("guard") and NotCommand("gu") and NotCommand("autore") and NotCommand("autorespawn") and NotCommand("autoremoveff") and NotCommand("autorff") and NotCommand("killaura") and NotCommand("whitelist") and NotCommand("wl") and NotCommand("unwhitelist") and NotCommand("unwl") and NotCommand("kill") and NotCommand("oof") and NotCommand("die") and NotCommand("olditemmethod") and NotCommand("oldimethod") and NotCommand("damage") and NotCommand("dmg") and NotCommand("autodumpcars") and NotCommand("autoremovecars") and NotCommand('autonocars') and NotCommand("crim") and NotCommand("criminal") and NotCommand("makecrim") and NotCommand("view") and NotCommand("unview") then
    API:Notif("Error", 'Not a valid command.', Color3.fromRGB(255, 0, 0), 3)
  end
end
local Cooldown = true
game.Players.LocalPlayer.Chatted:Connect(function(chat)
	if not Cooldown then
		Cooldown = true
		wait(.1)
		PlayerChatted(chat)
		wait(.5)
		for i = 1,3 do
			Cooldown = false
		end
	end
end)
plr.CharacterAdded:Connect(function(NewChar)
    if Unloaded then return end
    repeat API:swait() until NewChar
    NewChar:WaitForChild('Head')
    NewChar:WaitForChild("HumanoidRootPart")
    NewChar:WaitForChild("Humanoid").BreakJointsOnDeath = not States.AutoRespawn
    NewChar:WaitForChild("Humanoid").Died:Connect(function()
        if States.AutoRespawn and not Unloaded then
          API:Refresh()
        end
    end)
    if Unloaded then return end
    if States.AutoRemoveff then
      NewChar:WaitForChild("ForceField"):Destroy()
    end
end)
-- main loop
spawn(function()
	while wait() do -- fast loop
		-- 
	end
end)
TextBox.FocusLost:Connect(function(EnterKey)
    if EnterKey and not Unloaded then
      if TextBox.Text:sub(1,#Prefix) ~= Prefix then
        PlayerChatted(Prefix..TextBox.Text)
        TextBox.Text = ''
      else
        PlayerChatted(TextBox.Text)
        TextBox.Text = ""
      end
    end
end)
API:Notif("Loads", 'Loaded Admin Commands.', Color3.fromRGB(255, 0, 0), 10)
API:Refresh()
Cooldown = false
