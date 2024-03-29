local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local OrionLib = loadstring(Game:HttpGet(('https://github.com/NoobHubV1/NoobHubV1/raw/main/OrionLib.lua')))()

local function Notify(Name, Content, Image, Time)OrionLib:MakeNotification({
			                                 Name = Name,
			                                 Content = Content,
			                                 Image = Image,
			                                 Time = Time
		                                 })
end
Notify("NoobHubV1 Hub", "Loading Script.", "rbxassetid://4483345998", 3)

                                                 wait(3)

Notify("NoobHubV1 Hub", "Loading Script..", "rbxassetid://4483345998", 3)

                                                 wait(3)

Notify("NoobHubV1 Hub", "Loading Script...", "rbxassetid://4483345998", 3)

                                                 wait(3)

Notify("NoobHubV1 Hub", "Loaded Script!", "rbxassetid://4483345998", 3)

                                                 wait(3)

local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")

local AnimeBall = PhantomForcesWindow:NewSection("Main")

AnimeBall:CreateButton("Auto Parry V4", function()--Red Circle Auto-Block:
getgenv().visualizer = true
loadstring(Game:HttpGet('https://raw.githubusercontent.com/1f0yt/community/main/Circle'))()
end)

AnimeBall:CreateButton("Auto Parry V3", function()--Red Circle Auto-Block:
getgenv().visualizer = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/AutoBlockV2"))()
end)

AnimeBall:CreateButton("Auto Parry V2", function()--Red Circle Auto-Block:
getgenv().visualizer = true
loadstring(Game:HttpGet('https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock'))()
end)

AnimeBall:CreateButton("Auto Parry V1", function()--Red Circle Auto-Block:
getgenv().visualizer = true
loadstring(Game:HttpGet('https://raw.githubusercontent.com/1f0yt/community/main/autoparrybest'))()
end)

AnimeBall:CreateButton("Fps Boost", function()loadstring(Game:HttpGet('https://shz.al/KWfS'))()
end)

AnimeBall:CreateButton("KeyBoard", function()loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
end)

AnimeBall:CreateButton("FFJ Hub Anime Ball", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/AnimeBall.lua"))()
end)

AnimeBall:CreateButton("Fly", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Fly.lua"))()
end)

local AnimeBall = PhantomForcesWindow:NewSection("Player")

AnimeBall:CreateToggle("Inf Jump", function(Value)InfJump = Value
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfJump then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
 end
end)
end)

AnimeBall:CreateTextbox("Walk Speed", function(Amount)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Amount
end)

AnimeBall:CreateTextbox("Jump Power", function(Amount)game.Players.LocalPlayer.Character.Humanoid.JumpPower = Amount
end)
