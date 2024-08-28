local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local function Tween(Obj, Prop, New, Time)
	if not Time then
		Time = .5
	end
	local TweenService = game:GetService("TweenService")
	local info = TweenInfo.new(
		Time, 
		Enum.EasingStyle.Quart, 
		Enum.EasingDirection.Out, 
		0, 
		false,
		0
	)
	local propertyTable = {
		[Prop] = New,
	}

	TweenService:Create(Obj, info, propertyTable):Play()
end

local function Notif(Text,Dur)
	task.spawn(function()
		if not Dur then
			Dur = 1.5
		end
		local Notif = Instance.new("ScreenGui")
		local Frame_1 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		Notif.Parent = (game:GetService("CoreGui") or gethui())
		Notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame_1.Parent = Notif
		Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame_1.BackgroundTransparency=1
		Frame_1.BorderSizePixel = 0
		Frame_1.Position = UDim2.new(0, 0, 0.0500000007, 0)
		Frame_1.Size = UDim2.new(1, 0, 0.100000001, 0)
		TextLabel.Parent = Frame_1
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.TextTransparency =1
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Highway
		TextLabel.Text = Text or "Text not found"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 21.000
		Tween(Frame_1,"BackgroundTransparency",0.350,.5)
		Tween(TextLabel,"TextTransparency",0,.5)
		wait(Dur+.7)
		Tween(Frame_1,"BackgroundTransparency",1,.5)
		Tween(TextLabel,"TextTransparency",1,.5)
		wait(.7)
		Notif:Destroy()
	end)
	return
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local AnimeBall = Window:NewSection("Main")

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

Notif("(Anime Ball) Script Loaded!",5)
