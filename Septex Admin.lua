local plr,Player = game.Players.LocalPlayer,game.Players.LocalPlayer
local Prefix = ";"
local saved = workspace:FindFirstChild("Criminals Spawn").SpawnLocation.CFrame
local Unloaded = false
local States = {}
      States.AutoRespawn = true

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

function Notif(Title, Text, Time)
  game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time,})
end

function PC(Message)
  local args = Message:split(" ")
  function Command(Cmd)
    return args[1] == Prefix..Cmd
  end
  if Command("cmds") then
    Notif("Notify", "Text", 3)
  end
end

Player.Chatted:Connect(PC)

plr.CharacterAdded:Connect(function(NewCharacter)
    repeat swait() until NewCharacter
    NewCharacter:WaitForChild("HumanoidRootPart")
	  NewCharacter:WaitForChild("Head")
	  NewCharacter:WaitForChild("Humanoid").BreakJointsOnDeath = not States.AutoRespawn
	  NewCharacter:WaitForChild("Humanoid").Died:Connect(function()
		  if not Unloaded and States.AutoRespawn == true then
		  	Refresh()
		end
	end)
end)
Refresh()

Notif("Loads", "Loaded Admin Commands", 5)
