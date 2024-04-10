local Library = loadstring(game:HttpGetAsync(("https://github.com/bloodball/-back-ups-for-libs/raw/main/wizard")))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local JumpRequest = UserInputService.JumpRequest
local ScriptLoaded = false

local function Notify(Name, Content, Time)game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = Name;
                Text = Content;
		Icon = "rbxassetid://4483345998";
                Duration = Time;
            })
end
Notify("Inf Jump", "Loading Script.", 3)

                                                 wait(3)

Notify("Inf Jump", "Loading Script..", 3)

                                                 wait(3)

Notify("Inf Jump", "Loading Script...", 3)

                                                 wait(3)

local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")

local BreakIn2 = PhantomForcesWindow:NewSection("Inf Jump")

BreakIn2:CreateToggle("Inf Jump", function(State)InfJump = State
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfJump then
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
 end
end)
end)

Notify("Inf Jump", "Loaded Script!", 5)
ScriptLoaded = true
