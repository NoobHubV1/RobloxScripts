local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
 
local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")
 
local WormFace = PhantomForcesWindow:NewSection("Main")
 
WormFace:CreateToggle("Auto Farm", function(Value)local items = game:GetService("Workspace").Items
local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
local tweenserv = game:GetService('TweenService')
local deletethis = game.Players.LocalPlayer.Character.HumanoidRootPart.StarterWorm.Head:FindFirstChild("FaceCenterAttachment")
local rebirthtext = game:GetService("Players").LocalPlayer.PlayerGui.RebirthGui.Button.ProgressBar.Background.Text
local rebirthevent = game:GetService("ReplicatedStorage").RebirthRequest
getgenv().active = Value
local doit = true
local function getGem()
  for _, v in ipairs(items:GetChildren()) do
       if not v then return end
       if not v:FindFirstChild('Part') then return end
       if(v.Part.Position.X < 325) then
          return v.Part
       end
   end
end
local function gotoGem()
  local gem = getGem()
  if not gem then return end
  local goal = {}
  goal.CFrame = gem.CFrame
  local tweenInfo = TweenInfo.new(0.01)
  local tween = tweenserv:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
  tween:Play()
  wait(WaitTime)
  if(gem.Parent) then
   gem.Parent:Destroy()
  end
end
 
local function canRebirth()
   local split1 = string.split(rebirthtext.Text, " ")
   local split2 = string.split(split1[2], "/")
   local returnval = tonumber(split2[1]) >= tonumber(split2[2])
   return returnval
end
if(deletethis) then
   deletethis:Destroy()
end
if(canRebirth()) then
      rebirthevent:InvokeServer()
end
local rebirthconnect = rebirthtext:GetPropertyChangedSignal("Text"):Connect(function()
  if(canRebirth()) then
      print('rebirthing')
      doit = false
      rebirthevent:InvokeServer()
      wait()
      if(game.Players.LocalPlayer.Character.HumanoidRootPart.StarterWorm.Head:FindFirstChild("FaceCenterAttachment")) then
           game.Players.LocalPlayer.Character.HumanoidRootPart.StarterWorm.Head:FindFirstChild("FaceCenterAttachment"):Destroy()
      end
       doit = true
   end
end)
 
local stopconnect = game.Players.LocalPlayer.Chatted:Connect(function(msg)
  if(msg == "???") then
      rebirthconnect:Disconnect()
   end
end)
while getgenv().active do
  if doit then
       gotoGem()
  end
  wait()
end
end)

WormFace:CreateTextbox("Wait Time", function(Amount)WaitTime = Amount
end)
