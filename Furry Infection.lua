pcall(function()
local OrionLib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/OrionLib.lua'))()
for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "ItemName" and v.Parent.Name == "Configuration" and v.Parent.Parent.Name == "Bat" and v.Value == "Metal  Bat" then
        _G.MetalBatProximity = v.Parent.Parent:FindFirstChild("ProximityPrompt")
        -- pass
    else
        --- not pass
    end    
end    

spawn(function()
    local msg = Instance.new("Message",workspace)
    msg.Text = "Loading."
    task.wait(3)
    msg.Text = "Loading.."
    task.wait(3)
    msg.Text = "Loading..."
    task.wait(3)
    msg.Text = "Loaded!"
    task.wait(3)
    msg:Destroy()
end)    

task.wait(5)

if workspace:FindFirstChild("FagFolder") then

else    

local fagfolder1 = Instance.new("Folder",workspace)
fagfolder1.Name = "FagFolder"

for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "Model 2 " or v.Name == "TransfurPart" then
        v.Parent = fagfolder1
    end    
end  

end

local fagfolder1 = workspace:FindFirstChild("FagFolder")

local W1 = OrionLib:MakeWindow({Name = "Furry Infection", HidePremium = true, SaveConfig = true, ConfigFolder = "Furry Infection"})

OrionLib:MakeNotification({
    Name = "Furry Infection NoobHubV1",
    Content = "NoobHubV2",
    Image = "rbxassetid://6890648157", --- rbxassetid://4483345998
    Time = 5
})

function notify(name,text)
    OrionLib:MakeNotification({
    Name = name,
    Content = text,
    Image = "rbxassetid://6890648157", --- rbxassetid://4483345998
    Time = 5
})

end

local Toggles = W1:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://6890648157", --- rbxassetid://4483345998
    PremiumOnly = false
})

local Others = W1:MakeTab({
    Name = "Others",
    Icon = "rbxassetid://6890648157", --- rbxassetid://4483345998
    PremiumOnly = false
})

Toggles:AddToggle({
    Name = "AntiFagInfect",
    Default = false,
    Callback = function(fagjuice1)
        if fagjuice1 then
            fagfolder1.Parent = nil
         else
             fagfolder1.Parent = game:GetService("Workspace")
         end
    end    
})

Toggles:AddToggle({
    Name = "KillAura",
    Default = false,
    Callback = function(kaura)
        spawn(function()
            if kaura then
                _G.killaura = true
                notify("Furry Infection NoobHubV1","KillAura On NoobHubV1")
            else
                _G.killaura = false
                notify("Furry Infection NoobHubV1","KillAura Off NoobHubV1")
            end
while _G.killaura do
for i = 1, 3 do
pcall(function()
for i,v in pairs(game.Players:GetPlayers()) do

        
    local lp = game.Players.LocalPlayer
    local character = v.Character
    local charactername = v.Name
    
	if v:IsFriendsWith(game:GetService("Players").LocalPlayer.UserId) then
		--- nothing
	else
        
        if (lp.Character and lp.Character:FindFirstChild("Head") and character:FindFirstChild("Head")) then
            local mag = (v.Character.Head.Position - lp.Character.Head.Position).Magnitude
                  if mag < 100 then


local ohInstance1 = v.Character.HumanoidRootPart
local ohInstance2 = v.Character.Humanoid
local ohVector33 = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Remote.Hit:FireServer(ohInstance1, ohInstance2, ohVector33)
end
end
end
end
end)
end
task.wait()
end
end)
end
})    

Toggles:AddToggle({
    Name = "AutoGetBat",
    Default = false,
    Callback = function(autogetbatt)
        spawn(function()
        if autogetbatt then
            _G.getbatcrack = true
            notify("Furry Infection NoobHubV1","AutoGetBat On NoobHubV1")
        else
            _G.getbatcrack = false
            notify("Furry Infection NoobHubV1","AutoGetBat Off NoobHubV1")
        end
while _G.getbatcrack do task.wait()  
    pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") then
    
else    
    local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)
    repeat task.wait()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)    
    fireproximityprompt(_G.MetalBatProximity, 2, false)
    until game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat")
    game:GetService("Players").localPlayer.Character:MoveTo(oldpos)
    notify("Furry Infection NoobHubV1","Grabbed Bat NoobHubV1")
end
end) 
end
end)

    end    
})

Toggles:AddButton({
	Name = "Kill All",
	Callback = function()
	    pcall(function()
      	for i,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Neon") or game.Players.LocalPlayer.Character:FindFirstChild("Neon") then
            if v.Character.Name == game.Players.LocalPlayer.Character.Name then
            
            else
            if v.Character:FindFirstChild("Humanoid").Health <= 0 or v.Character:FindFirstChild("ForceField") then
            
            else    
            if v.Character:FindFirstChild("LLeft Leg") or v.Character:FindFirstChild("Left Leg"):FindFirstChild("LLeft Leg") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position)
                oldposition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                repeat wait()
                    if game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Neon") then
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position+Vector3.new(0,2,0))
                    local ohInstance1 = v.Character.HumanoidRootPart
                    local ohInstance2 = v.Character.Humanoid
                    local ohVector33 = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Remote.Hit:FireServer(ohInstance1, ohInstance2, ohVector33)
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
		    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Neon") then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Neon"))
                    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Neon") then
                        local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)
                        repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)    
                        fireproximityprompt(_G.MetalBatProximity, 2, false)
                        until game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Neon") or game.Players.LocalPlayer.Character:FindFirstChild("Neon")
                        game:GetService("Players").localPlayer.Character:MoveTo(oldpos)
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
                        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then    
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Neon") then
			    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Neon"))
                        end    
                    end
            until v.Character.Humanoid.Health <= 0
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldposition)
            end
        end
      	end
else
    local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)
    repeat task.wait()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)    
    fireproximityprompt(_G.MetalBatProximity, 2, false)
    until game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat")
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then    
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Neon") then
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Neon"))
    end  
    game:GetService("Players").localPlayer.Character:MoveTo(oldpos)
end    
end
	    end) 
  end
})

Others:AddButton({
	Name = "KeyBoard",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
      end
})

Others:AddButton({
	Name = "Rejoin Button",
	Callback = function()
	    game:GetService("StarterGui"):SetCore("SendNotification",{
 Title = "NoobHubV1";
 Text = "Executed";
 Duration = 5;
 Icon = "rbxassetid://4483345998";
})
	    --Auto execute highly recommended (use it)
gui = game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt")

gui.Size = UDim2.new(0, 400, 0, 230)

leave = gui.MessageArea.ErrorFrame.ButtonArea.LeaveButton

gui.MessageArea.MessageAreaPadding.PaddingTop = UDim.new(0,-20)
gui.MessageArea.ErrorFrame.ErrorFrameLayout.Padding = UDim.new(0, 5)

gui.MessageArea.ErrorFrame.ButtonArea.ButtonLayout.CellPadding = UDim2.new(0, 0, 0, 5)

rejoin = leave:Clone()
rejoin.Parent = leave.Parent
rejoin.ButtonText.Text = "Rejoin"

Players = game:GetService("Players")
TeleportService = game:GetService("TeleportService")

rejoin.MouseButton1Up:Connect(function()
 if #Players:GetPlayers() <= 1 then
game.Players.LocalPlayer:Kick("Rejoining...")
rejoin: destroy ()
wait(1)
  TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
 else
  TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
 end
end)
       end
})

Toggles:AddToggle({
	Name = "Loop Kill All",
	Callback = function(lkillall)
	    spawn(function()
	        if lkillall then
	            _G.killall = true
	            notify("Furry Infection NoobHubV1","Loop Kill All On NoobHubV1")
	        else
	            _G.killall = false
	            notify("Furry Infection NoobHubV1","Loop Kill All Off NoobHubV1")
	        end 

while _G.killall do task.wait()
	    pcall(function()
      	for i,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") then
            if v.Character.Name == game.Players.LocalPlayer.Character.Name then
            
            else
            if v.Character:FindFirstChild("Humanoid").Health <= 0 or v.Character:FindFirstChild("ForceField") then
            
            else    
            if v.Character:FindFirstChild("LLeft Leg") or v.Character:FindFirstChild("Left Leg"):FindFirstChild("LLeft Leg") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position)
                oldposition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                repeat task.wait()
                    if game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat") then
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position+Vector3.new(0,2,0))
                    local ohInstance1 = v.Character.HumanoidRootPart
                    local ohInstance2 = v.Character.Humanoid
                    local ohVector33 = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Remote.Hit:FireServer(ohInstance1, ohInstance2, ohVector33)
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
                    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then
                        local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)
                        repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)    
                        fireproximityprompt(_G.MetalBatProximity, 2, false)
                        until game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat")
                        game:GetService("Players").localPlayer.Character:MoveTo(oldpos)
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
                        elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then    
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
                        end    
                    end
            until v.Character.Humanoid.Health <= 0
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldposition)
            end
        end
      	end
else
    local oldpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)
    repeat task.wait()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-136.6771240234375, 27.783193588256836, 20.907127380371094)    
    fireproximityprompt(_G.MetalBatProximity, 2, false)
    until game.Players.LocalPlayer.Character:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") or game.Players.LocalPlayer.Character:FindFirstChild("Metal  Bat")
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Bat"))
    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat") then    
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Metal  Bat"))
    end  
    game:GetService("Players").localPlayer.Character:MoveTo(oldpos)
end    
end
end)
end
end)
  end
})

Toggles:AddToggle({
	Name = "Auto Escape Grab",
	Callback = function(antigrabbed)
	    spawn(function()
	        if antigrabbed then
	            _G.autoescapegrab = true
	            notify("Furry Infection NoobHubV1","Auto Escape Grab On NoobHubV1")
	       else 
	           _G.autoescapegrab = false
	           notify("Furry Infection NoobHubV1","Auto Escape Grab Off NoobHubV1")
	        end
	        
local noescapeser
noescapeser = game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.autoescapegrab then  
    game.Players.LocalPlayer.PlayerGui.EscapeGui.Remote.Hit:InvokeServer()
else
    noescapeser:Disconnect()
end    
end)
end)
end)
end
})	

Toggles:AddToggle({
	Name = "Less Cooldown",
	Callback = function(lesscd)
	    spawn(function()
	        if lesscd then
	            _G.lesscooldown = true
	            notify("Furry Infection NoobHubV1","Less Cooldown On NoobHubV1")
	        else
	            _G.lesscooldown = false
	            notify("Furry Infection NoobHubV1","Less Cooldown Off NoobHubV1")
	        end 
        end)
    end
})

local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "Invoke" and tostring(self) == "Cooldown" then
    if _G.lesscooldown then    
        args[1] = 0
    end
    end
    return namecall(self, table.unpack(args))
end) 

end)
