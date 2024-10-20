print([[
// Commands list:
	unload | Unloaded script
	refresh / re | Refresh Character
	autorespawn / autore [on/off] | Auto Refresh Character (if died)
	kill / oof / die [plr,all,team] | Kill a player(s)
	whitelist [plr] | Whitelisted a player
	unwhitelist [plr] | Backlisted a player
	inmate | Change team inmates
	guard | Change team guards
	criminal | Change team criminals
	olditemmethod / oldimethod [ON/OFF] | Teleports to get item
	prefix [STRING] | prefix new
	pp | sus
	bring [plr] | Teleport player to you
	damage / dmg [plr,all,team] [Amount] | Damages a player(s)
	autoguns / aguns [on/off] | Auto Get All Guns if died
	autoitems / aitems [on/off] | Auto Get All items if died
	autoremoveff / autorff [ON/OFF] | Auto Remove forcefield if died
	autoguard / aguard [on/off] | Auto Team Guard
	killaura [ON/OFF] | Activate kill aura
	copychat [on/off] | Copy chat Everyone
	notify [on/off] | Notify player join and leave and pick up
	antifling [on/off] | Activate antifling
	infjump [ON/OFF] | Infinite jumps
	ff / forcefield [ON/OFF] | activate forcefield
	arrest [plr,all] | Arrests the targeted player
	meleekill [plr,all,team] | Teleports to kill player(s)
]])

local ScreenGui = Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
local TextBox = Instance.new("TextBox",ScreenGui)
TextBox.Name = "TextBox"
TextBox.BackgroundColor3 = Color3.fromRGB(172, 172, 172)
TextBox.BackgroundTransparency = 0.400
TextBox.Position = UDim2.new(0.0255349874, 0, 0.800595582, 0)
TextBox.Size = UDim2.new(0, 278, 0, 33)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Press ; To Enter"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 23.000
TextBox.ClearTextOnFocus = false
TextBox.Draggable = true

local plr,Player = game.Players.LocalPlayer,game.Players.LocalPlayer
local saved = workspace:FindFirstChild("Criminals Spawn").SpawnLocation.CFrame
local Prefix = ";"
local Unloaded = false
local States = {}
      States.AutoRespawn = true
      States.OldItemMethod = false
      States.AutoGuns = true
      States.AutoItems = false
      States.AutoRemoveff = false
      States.Autoguard = false
      States.Killaura = false
      States.CopyChat = false
      States.AntiFling = false
      States.ff = false
      States.loopkillinmates = false
      States.loopkillguards = false
      States.loopkillcriminals = false
local API = {}
      API.Whitelisted = {}
      API.ArrestOldP = {}
      API.Loopkilling = {}

function CreateBulletTable(Bullet, Target)
	local Args = {}
	for i =1,Bullet do
		Args[#Args + 1] = {
			["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
			["Hit"] = Target.Character:FindFirstChild("Head"),
		}
	end
end
function swait()
	game:GetService("RunService").Stepped:Wait()
end

function UnSit()
  plr.Character.Humanoid.Sit = false
end

function ConvertPosition(Position)
	if typeof(Position):lower() == "position" then
		return CFrame.new(Position)
	else
		return Position
	end
end

function GetPart(Target)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	return Target.Character:FindFirstChild("HumanoidRootPart") or Target.Character:FindFirstChild("Head")
end
function GetPosition(Player)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	if Player then
		return GetPart(Player).CFrame
	elseif not Player then
		return GetPart(plr).CFrame
	end
end
function GetCameraPosition(Player)
	return workspace["CurrentCamera"].CFrame
end
function Loop(Times, calling)
	for i = 1, tonumber(Times) do
		calling()
	end
end

function MoveTo(Cframe)
	Cframe = ConvertPosition(Cframe)
	local Amount = 1
	if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
		Amount = 1
	end
	for i = 1, Amount do
		UnSit()
		Player.Character:WaitForChild("HumanoidRootPart").CFrame = Cframe
	end
end
function WaitForRespawn(Cframe,NoForce)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local Cframe = ConvertPosition(Cframe)
	local CameraCframe = GetCameraPosition()
	coroutine.wrap(function()
		local a
		a = Player.CharacterAdded:Connect(function(NewCharacter)
			pcall(function()
				coroutine.wrap(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					Loop(2, function()
						workspace["CurrentCamera"].CFrame = CameraCframe
					end)
				end)()
				NewCharacter:WaitForChild("HumanoidRootPart")
				local Amount = 10
				if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
					Amount = 16
				end
				for i = 1, Amount do
					UnSit()
					NewCharacter:WaitForChild("HumanoidRootPart").CFrame = Cframe
					swait()
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
function GuardsFull(a)
  if a == "b" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team == game.Teams.Guards
  elseif a == "c" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team ~= game.Teams.Guards
  end
end
function ChangeTeam(TeamPath,NoForce,Pos)
	if TeamPath == game.Teams.Inmates then
		pcall(function()
		repeat task.wait() until game:GetService("Players").LocalPlayer.Character
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

			WaitForRespawn(Pos or GetPosition(),NoForce)
		end)
		workspace.Remote.TeamEvent:FireServer("Bright orange")
	elseif TeamPath == game.Teams.Guards then
		if GuardsFull("b") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			repeat wait()
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			until plr.Team == game.Teams.Guards
		else
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
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

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		elseif Player.Team == game.Teams.Criminals then
		if GuardsFull("c") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
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

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright blue")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
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
function Refresh()
  ChangeTeam(plr.Team)
end
function GetGun(Item, Ignore)
	if States.OldItemMethod == false and not Unloaded then
		task.spawn(function()
			if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
				workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
					Position = Player.Character.Head.Position,
					Parent = workspace.Prison_ITEMS.giver:FindFirstChild(Item, true)
			        })
			end
		end)
	else
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = GetPosition()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP.CFrame
			repeat task.wait()
				coroutine.wrap(function()
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			MoveTo(LastPosition)
		end
	end
end
function GetSingle(Item, Ignore)
	if States.OldItemMethod == false and not Unloaded then
		task.spawn(function()
			if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
				workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
					Position = Player.Character.Head.Position,
				        Parent = workspace.Prison_ITEMS.single:FindFirstChild(Item, true)
			        })
			end
		end)
	else
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = GetPosition()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP.CFrame
			repeat task.wait()
				coroutine.wrap(function()
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			MoveTo(LastPosition)
		end
	end
end
function KillPlayer(Target,Hit,Failed,DoChange)
	local Bullets = CreateBulletTable(Hit, Target)
	if not Target or not Target.Character or not Target.Character:FindFirstChildOfClass("Humanoid") or Target.Character:FindFirstChildOfClass("Humanoid").Health <1 then
		return
	end
	repeat swait() until not Target.Character:FindFirstChildOfClass("ForceField")
	local CurrentTeam = nil
	if Target.Team == Player.Team then
		if Target.Team~= game.Teams.Criminals then
			CurrentTeam = Player.Team
			ChangeTeam(game.Teams.Criminals,true)
		elseif Target.Team == game.Teams.Criminals then
			CurrentTeam = Player.Team
			ChangeTeam(game.Teams.Inmates,true)
			plr.CharacterAdded:Wait()
		end
	end

	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	repeat swait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
	task.spawn(function()
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Bullets, Gun)
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
	end)
	coroutine.wrap(function()
		wait(.7)
		pcall(function()
			if Target.Character:FindFirstChildOfClass("Humanoid").Health >1 and not Failed then
				KillPlayer(Target,Bullet,true)
			end
		end)
	end)()
	if CurrentTeam and not Player.Team == CurrentTeam and not DoChange then
		wait(.3)
		ChangeTeam(CurrentTeam,true)
	end
end
function FindPlayer(String,IgnoreError)
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
		         Notif("Error", "Player has left or is not in your current game.", 3)
	        end
	        return nil
	end
end
function killall(TeamToKill,Hit)
        if TeamToKill == "all" then
		local LastTeam = Player.Team
		local Hits = {}
		if LastTeam ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil and v.Team == game.Teams.Inmates or v.Team == game.Teams.Guards then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Hit do
					       Hits[#Hits + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character:FindFirstChild("Head"),
						}
					end
				end
			end
		end

		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		task.spawn(function()
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
			game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
		end)
		ChangeTeam(game.Teams.Inmates)
		plr.CharacterAdded:Wait()
		local Hits = {}
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Hit do
					       Hits[#Hits + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character:FindFirstChild("Head"),
						}
					end
				end
			end
		end
			
		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		task.spawn(function()
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
		        game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
		end)
	end
	if TeamToKill == game.Teams.Inmates or TeamToKill == game.Teams.Guards then
		if Player.Team ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
		end
	elseif TeamToKill == game.Teams.Criminals then
		if Player.Team ~= game.Teams.Inmates then
			ChangeTeam(game.Teams.Inmates)
			plr.CharacterAdded:Wait()
		end
	end
	local Hits = {}
	for i,v in pairs(TeamToKill:GetPlayers()) do
		if v and v~=Player and not table.find(API.Whitelisted,v) and not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("ForceField") then
			for i =1,Hit do
				Hits[#Hits + 1] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
					["Hit"] = v.Character:FindFirstChild("Head"),
				}
			end
		end
	end
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun

	task.spawn(function()
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
	end)
end
function AllGuns()
	local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		GetGun("M4A1", true)
	end
	GetGun("AK-47", true)
	task.spawn(function()
		GetGun("Remington 870", true)
	end)
	GetGun("M9", true)
	game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
end
function AllItems()
        local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		GetGun("M4A1", true)
	end
	GetGun("AK-47", true)
	task.spawn(function()
		API:GetGun("Remington 870", true)
	end)
	GetGun("M9", true)
	pcall(function()
		API:GetSingle("Hammer", true)
	end)
	GetSingle("Crude Knife")
	game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
end
function Notif(Title, Text, Time)
  game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time,})
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
	Notif("OK", StateType.." has been changed to "..tostring(Value), 3)
	return Value
end
function bring(Target,TeleportTo,MoreTP,DontBreakCar)
	if not IsBringing and Target and Target.Character:FindFirstChildOfClass("Humanoid") and Target.Character:FindFirstChildOfClass("Humanoid").Health>0 and Target.Character:FindFirstChildOfClass("Humanoid").Sit == false then
		if not TeleportTo then
			TeleportTo = GetPosition()
		end
		local Orgin = GetPosition()
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
			repeat wait()
				game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-524, 55, 1777))
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
		repeat wait()
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
			Notif("OK", "Failed to bring the player!", 3)
			return
		end
		for i =1,10 do
			car:SetPrimaryPartCFrame(TeleportTo)
			swait()
		end
		wait(.1)
		task.spawn(function()
			if not DontBreakCar then
				repeat task.wait() until Target.Character:FindFirstChildOfClass("Humanoid").Sit == false
				repeat wait()
					Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
				until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
				for i =1,10 do
					car:SetPrimaryPartCFrame(CFrame.new(0,workspace.FallenPartsDestroyHeight+10,0))
					swait()
				end
				UnSit()
				MoveTo(Orgin)
			end
		end)
		Notif("OK", "bringing "..Target.DisplayName, 3)
		TextBox.Text = ""
	else
		Notif("Error", "Player has died or is sitting or an unknown error.", 3)
		TextBox.Text = ""
	end
end
function BadArea(Target)
	local mod = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"])
	local a = pcall(function()
		if mod.findRegion(Target.Character) then
			mod = mod.findRegion(Target.Character)["Name"]
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
function Chat(msg)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "all")
end
function MeleeEvent(Targ)
	game.ReplicatedStorage.meleeEvent:FireServer(Targ)
end
function Meleekill(Tar)
	if not Tar.Character.Humanoid.Health == 0 or not Tar.Character:FindFirstChild("ForceField") then
		local Orgin = GetPosition()
		while Tar.Character.Humanoid.Health > 1 do task.wait()
			MoveTo(Tar.Character.HumanoidRootPart.CFrame)
			MeleeEvent(Tar)
		end
		MoveTo(Orgin)
	end
end
function PC(Message)
  if Unloaded then return end
  local args = Message:split(" ")
  local First = args[1]
  function Command(Cmd)
    return First == Prefix..Cmd
  end
  if Command("unload") then
	ScreenGui:Destroy()
	Unloaded = true
	Notif("OK", "Script is Unloaded", 3)
  end
  if Command("cmds") or Command("cmd") or Command("commands") then
    Notif("Notify", "The commands are listed in the console! \n Press F9 to view or chat /console", 3)
    TextBox.Text = ""
  end
  if Command("re") or Command("refresh") then
    Refresh()
    Notif("OK", "Refreshes Character", 3)
    TextBox.Text = ""
  end
  if Command("autore") or Command("autorespawn") then
    ChangeState(args[2],"AutoRespawn")
    TextBox.Text = ""
  end
  if Command("kill") or Command("oof") or Command("die") then
    if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
	Notif("OK", "Killed "..args[2], 3)
	TextBox.Text = ""
	killall("all",7)
    elseif args[2] == "inmates" then
	killall(game.Teams.Inmates,7)
	Notif("OK", "Killed "..args[2], 3)
	TextBox.Text = ""
    elseif args[2] == "guards" then
	killall(game.Teams.Guards,7)
	Notif("OK", "Killed "..args[2], 3)
	TextBox.Text = ""
    elseif args[2] == "criminals" then
	killall(game.Teams.Criminals,7)
	Notif("OK", "Killed "..args[2], 3)
	TextBox.Text = ""
    else
        local Target = FindPlayer(args[2])
        KillPlayer(Target,7)
        Notif("OK", "Killed "..Target.DisplayName, 3)
        TextBox.Text = ""
    end
  end
  if Command("whitelist") or Command("wl") then
      local Player = FindPlayer(args[2])
      if Player then
	  if not table.find(API.Whitelisted,Player) then
		table.insert(API.Whitelisted, Player)
		Notif("OK", "Whitelisted "..Player.DisplayName, 3)
		TextBox.Text = ""
	  end
      end
  end
  if Command("unwhitelist") or Command("unwl") then
      local Player = FindPlayer(args[2])
	 if Player then
		if table.find(API.Whitelisted,Player) then
			table.remove(API.Whitelisted,table.find(API.Whitelisted,Player))
			Notif("OK", "Blacklisted "..Player.DisplayName)
			TextBox.Text = ""
		end
	 end
  end
  if Command("inmate") then
      ChangeTeam(game.Teams.Inmates)
      Notif("OK", "Change team inmates", 3)
      TextBox.Text = ""
  end
  if Command("guard") then
      if not GuardsFull("c") then
		ChangeTeam(game.Teams.Guards)
		Notif("OK", "Change team guards", 3)
		TextBox.Text = ""
      else
		Notif("Error", "Guards Full!", 3)
		TextBox.Text = ""
      end
  end
  if Command("criminal") or Command("crim") then
      ChangeTeam(game.Teams.Criminals)
      Notif("OK", "Change team criminals", 3)
      TextBox.Text = ""
  end
  if Command("olditemmethod") or Command("oldimethod") then
      ChangeState(args[2],"OldItemMethod")
  end
  if Command("prefix") then
	local New = args[2]
	if New and tostring(New) then
		local Prefixn = tostring(New)
		Prefix = Prefixn
		TextBox.PlaceholderText = "Press "..New.." To Enter"
		Notif("OK", "prefix set to "..New, 3)
		TextBox.Text = ""
	else
		Notif("Error", "no prefix selected?", 3)
		TextBox.Text = ""
	end
   end
   if Command("pp") then
	AllGuns()
	wait(1)
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
	TextBox.Text = ""
    end
    if Command("bring") then
	local Target = FindPlayer(args[2])
	if Target then
	     bring(Target)
	end
    end
    if Command("damage") or Command("dmg") then
	local Bullets = tonumber(args[3])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
	        Notif("OK", "damage "..args[2].." "..Bullets, 3)
		TextBox.Text = ""
		if Bullets ~= nil then
			killall("all",Bullets)
		else
			Notif("Error", "no Amount found!", 3)
		end
	elseif args[2] == "inmates" then
		if Bullets ~= nil then
			killall(game.Teams.Inmates,Bullets)
			Notif("OK", "damage "..args[2].." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	elseif args[2] == "guards" then
		if Bullets ~= nil then
			killall(game.Teams.Guards,Bullets)
			Notif("OK", "damage "..args[2].." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	elseif args[2] == "criminals" then
		if Bullets ~= nil then
			killall(game.Teams.Criminals,Bullets)
			Notif("OK", "damage "..args[2].." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	else
		local p = FindPlayer(args[2])
		if Bullets ~= nil then
			KillPlayer(p,Bullets)
			Notif("OK", "damage "..p.DisplayName.." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	end
    end
    if Command("autoguns") or Command("aguns") then
	ChangeState(args[2],"AutoGuns")
	TextBox.Text = ""
    end
    if Command("autoitems") or Command("aitems") then
	ChangeState(args[2],"AutoItems")
	TextBox.Text = ""
    end
    if Command("autoremoveff") or Command("autorff") then
	ChangeState(args[2],"AutoRemoveff")
	TextBox.Text = ""
    end
    if Command("autoguard") or Command("aguard") then
	if GuardsFull("c") then
		Notif("Error", "Guards team is full!", 3)
		TextBox.Text = ""
	else
		ChangeState(args[2],"Autoguard")
		TextBox.Text = ""
	end
    end
    if Command("killaura") then
	ChangeState(args[2],"Killaura")
	TextBox.Text = ""
    end
    if Command("copychat") then
	ChangeState(args[2],"CopyChat")
	TextBox.Text = ""
    end
    if Command("notify") then
	ChangeState(args[2],"Notify")
	TextBox.Text = ""
    end
    if Command("antifling") then
	ChangeState(args[2],"AntiFling")
	TextBox.Text = ""
    end
    if Command('infjump') then
	local value = ChangeState(args[2],"Infjump")
	TextBox.Text = ""
	if value then
		game:GetService("UserInputService").JumpRequest:connect(function()
			if States.Infjump and not Unloaded then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	end
    end
    if Command("ff") or Command("forcefield") then
	ChangeState(args[2],"ff")
	TextBox.Text = ""
    end 
    if Command("arrest") or Command("ar") then
	if args[2] == "all" then
		local LastPosition = GetPosition()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v ~= game:GetService("Players").LocalPlayer and not table.find(API.Whitelisted,v) and v.Team == game.Teams.Criminals or (BadArea(v) and v.Team == game.Teams.Inmates) and v.Character.PrimaryPart and v.Character:FindFirstChildOfClass("Humanoid").Health>0 then
				repeat task.wait()
					MoveTo(v.Character:GetPrimaryPartCFrame())
					task.spawn(function()
						workspace.Remote.arrest:InvokeServer(v.Character.PrimaryPart)
					end)
				until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
				MoveTo(LastPosition)
			end
		end
		MoveTo(LastPosition)
		Notif("OK", "Arrested "..args[2], 3)
	elseif args[2] ~= "all" then
		local LastPosition = GetPosition()
		local Target = FindPlayer(args[2])
		if Target then
			if Target.Team == game.Teams.Guards or not BadArea(Target) or plr.Character.Humanoid.Health == 0 then
				return Notif("Error", "Can't arrest this player!", 3)
			else
				repeat task.wait()
					MoveTo(Target.Character.HumanoidRootPart.CFrame)
						task.spawn(function()
							workspace.Remote.arrest:InvokeServer(Target.Character.PrimaryPart)
						end)
				until Target.Character["Head"]:FindFirstChildOfClass("BillboardGui")
				Notif("OK", 'Arrested '..Target.DisplayName, 3)
			end
		end
		MoveTo(LastPosition)
	end
	TextBox.Text = ""
    end
    if Command("meleekill") then
	if args[2] == "all" then
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed "..args[2], 3)
	elseif args[2] == "inmates" then
		for i,v in pairs(game.Teams.Inmates:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed "..args[2], 3)
	elseif args[2] == "guards" then
		for i,v in pairs(game.Teams.Guards:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed "..args[2], 3)
	elseif args[2] == "criminals" then
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed "..args[2], 3)
	else
		local Target = FindPlayer(args[2])
		Meleekill(Target)
	end
	TextBox.Text = ""
    end
end 
Player.Chatted:Connect(PC)
plr.CharacterAdded:Connect(function(NewCharacter)
    if Unloaded then return end
    if States.AutoGuns then
	wait(.5)
	AllGuns()
    end
    if States.AutoItems then
	wait(.5)
	AllItems()
    end
    repeat swait() until NewCharacter
    NewCharacter:WaitForChild("HumanoidRootPart")
    NewCharacter:WaitForChild("Head")
    NewCharacter:WaitForChild("Humanoid").BreakJointsOnDeath = not States.AutoRespawn
    NewCharacter:WaitForChild("Humanoid").Died:Connect(function()
	   if not Unloaded and States.AutoRespawn then
		  Refresh()
	   end
    end)
    if Unloaded then return end
    if States.AutoRemoveff then
	pcall(function()
		NewCharacter:WaitForChild("ForceField"):Destroy()
	end)
    end
    if States.Autoguard then
	if not GuardsFull("c") then
		if plr.Team ~= game.Teams.Guards then
			ChangeTeam(game.Teams.Guards)
		end
	end
    end
    if States.AutoRespawn and API.ArrestOldP then
	for i =1,5 do
		MoveTo(API.ArrestOldP)
	end
    end
    if States.AutoRespawn then
	API.ArrestOldP = GetPosition()
    end
end)
coroutine.wrap(function()
	while wait() do
		if States.Killaura and not Unloaded then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v and v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("ForceField") then
						game.ReplicatedStorage.meleeEvent:FireServer(v)
					end
				end
			end
		end
		if States.ff and Unloaded == false then
			wait(4)
			ChangeTeam(game.Teams.Guards)
		end
	end
end)()
function CopyChat(PLR)
	PLR.Chatted:Connect(function(msg)
		if States.CopyChat and Unloaded == false then
			Chat("["..PLR.DisplayName.."]: "..msg)
		end
	end)
end
function PickUp(Target)
	Target.Backpack.ChildAdded:Connect(function(Item)
		if States.Notify and Unloaded == false then
			game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..Target.Name.." Pick Up "..Item.Name, Color = Color3.fromRGB(16, 243, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
                end
        end)
end
for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= plr then
		CopyChat(v)
		PickUp(v)
	end
end
TextBox.FocusLost:Connect(function(FocusLost)
	if FocusLost then
		if TextBox.Text:sub(1,#Prefix) ~= Prefix then
			PC(Prefix..TextBox.Text)
		else
			PC(TextBox.Text)
		end
	end
end)
game.Players.PlayerAdded:Connect(function(PLAYER)
	if States.Notify and Unloaded == false then
		game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has joined the game!", Color = Color3.fromRGB(16, 243, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	CopyChat(PLAYER)
	PickUp(PLAYER)
end)
game.Players.PlayerRemoving:Connect(function(PLAYER)
	if States.Notify and not Unloaded then
		game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has left the game!", Color = Color3.fromRGB(50, 14, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	CopyChat(PLAYER)
	PickUp(PLAYER)
end)
function NoCollision(PLR)
	 if States.AntiFling and not Unloaded and PLR.Character then
		 for _,x in pairs(PLR.Character:GetDescendants()) do
			 if x:IsA("BasePart") and not Unloaded and States.AntiFling then
				 x.CanCollide = false
			 end
		 end
	 end
 end
 for _,v in pairs(game.Players:GetPlayers()) do
	 if v ~= game.Players.LocalPlayer then
		 local antifling = game:GetService('RunService').Stepped:connect(function()
			 NoCollision(v)
		 end)
	 end
 end
 game.Players.PlayerAdded:Connect(function()
	 if v ~= game.Players.LocalPlayer and antifling then
		 local antifling = game:GetService('RunService').Stepped:connect(function()
			NoCollision(v)
		 end)
	 end
 end)
Refresh()
Notif("Loads", "Loaded Admin Commands, Chat ;cmds to show commands list", 6)
