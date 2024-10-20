print([[
// Commands list:
	refresh / re | Refresh Character
	autorespawn / autore | Auto Refresh Character (if died)
	kill [plr,all,team] | Kill a player(s)
	whitelist [plr] | Whitelisted a player
	unwhitelist [plr] | Backlisted a player
	inmate | Change team inmates
	guard | Change team guards
	criminal | Change team criminals
]])

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
local TextBox = Instance.new("TextBox",ScreenGui)
TextBox.Name = "TextBox"
TextBox.BackgroundColor3 = Color3.fromRGB(172, 172, 172)
TextBox.BackgroundTransparency = 0.400
TextBox.Position = UDim2.new(0.0255349874, 0, 0.800595582, 0)
TextBox.Size = UDim2.new(0, 238, 0, 23)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Press ; To Enter"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 23.000
TextBox.ClearTextOnFocus = false

local plr,Player = game.Players.LocalPlayer,game.Players.LocalPlayer
local Prefix = ";"
local saved = workspace:FindFirstChild("Criminals Spawn").SpawnLocation.CFrame
local Unloaded = false
local States, BulletTable = {}, {}
      States.AutoRespawn = true
      States.DraggableGuis = true
      States.OldItemMethod = false
local API = {}
      API.Whitelisted = {}

function CreateBulletTable(Bullet, Target)
	for i =1,Bullet do
		BulletTable[#BulletTable + 1] = {
			["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
			["Hit"] = Target.Character:FindFirstChild("Head"),
		}
	end
end

function FireGun(gun)
	task.spawn(function()
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(BulletTable, gun)
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(gun)
	end)
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
			if not Is then
				if not States.DraggableGuis then
					return
				end
			end
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if not Is then
				if States.DraggableGuis then
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
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if States.DraggableGuis then
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if States.DraggableGuis then
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end
		end)
	end)()
end
DragifyGui(TextBox)
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
	local Amount = 7
	if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
		Amount = 13
	end
	for i = 1, Amount do
		UnSit()
		Player.Character:WaitForChild("HumanoidRootPart").CFrame = Cframe
		swait()
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
				Cframe = ConvertPosition(Cframe)
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
			workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
				Position = Player.Character.Head.Position,
				Parent = workspace.Prison_ITEMS.giver:FindFirstChild(Item, true)
			})
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
			workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
				Position = Player.Character.Head.Position,
				Parent = workspace.Prison_ITEMS.single:FindFirstChild(Item, true)
			})
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
	FireGun(Gun)
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
		if LastTeam ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil and v.Team == game.Teams.Inmates or v.Team == game.Teams.Guards then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					CreateBulletTable(Hit, v)
				end
			end
		end

		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		FireGun(Gun)
		ChangeTeam(game.Teams.Inmates)
		plr.CharacterAdded:Wait()
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					CreateBulletTable(Hit, v)
				end
			end
		end
			
		local Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47")
		repeat task.wait() GetGun("AK-47") Gun = Player.Character:FindFirstChild("AK-47") or Player.Backpack:FindFirstChild("AK-47") until Gun

		FireGun(Gun)
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
	for i,v in pairs(TeamToKill:GetPlayers()) do
		if v and v~=Player and  not table.find(API.Whitelisted,v) then
			CreateBulletTable(Hit, v)
		end
	end
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun

	FireGun(Gun)
end
function KillAll()
	killall("all",7)
	Notif("OK", "Killed all", 3)
	TextBox.Text = ""
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

function PC(Message)
  local args = Message:split(" ")
  function Command(Cmd)
    return args[1] == Prefix..Cmd
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
  if Command("kill") then
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
      ChangeTeam(game.Teams.Guards)
      Notif("OK", "Change team guards", 3)
      TextBox.Text = ""
  end
  if Command("criminal") then
      ChangeTeam(game.Teams.Criminals)
      Notif("OK", "Change team criminals", 3)
      TextBox.Text = ""
  end
end
Player.Chatted:Connect(PC)
plr.CharacterAdded:Connect(function(NewCharacter)
    repeat swait() until NewCharacter
    NewCharacter:WaitForChild("HumanoidRootPart")
	  NewCharacter:WaitForChild("Head")
	  NewCharacter:WaitForChild("Humanoid").BreakJointsOnDeath = not States.AutoRespawn
	  NewCharacter:WaitForChild("Humanoid").Died:Connect(function()
		  if not Unloaded and States.AutoRespawn then
		  	Refresh()
		end
	end)
end)
TextBox.FocusLost:Connect(function(FocusLost)
	if FocusLost then
		if TextBox.Text:sub(1,#Prefix) ~= Prefix then
			PC(Prefix..TextBox.Text)
		else
			PC(TextBox.Text)
		end
	end
end)
Refresh()
Notif("Loads", "Loaded Admin Commands", 6)
