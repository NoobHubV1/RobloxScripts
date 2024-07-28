local OrionLib = loadstring(Game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/OrionLib.lua"))()

local Notify = function(Name, Content, Time)
    OrionLib:MakeNotification({
            Name = Name,
            Content = Content,
            Image = "rbxassetid://4483345998",
            Time = Time
    })
end
Notify("Check Id", "Check Id Game", 5)

    wait(5)

Notify("Check Id Complete", "Loading Script...", 2)

    wait(2)

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local tasks = {}
local proximityprompts = {}
local path = PathfindingService:CreatePath({AgentCanJump = false,AgentCanClimb = false,})
local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local OrionLib = loadstring(Game:HttpGetAsync(("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/OrionLib.lua")))()
local Wait = library.subs.Wait
local config = require(game:GetService("ReplicatedStorage").config)
local HumanoidRootPart = Character.HumanoidRootPart


-- taken from devforum
local function GetPlayer(Input)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) then
            return Player;
        end
    end
end

local function getclosestprompt()
    local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
    local prompt, distance = nil, 9e9

    for i,v in pairs(proximityprompts) do
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local distanceBetween = (Character.HumanoidRootPart.Position - i.Position).Magnitude

            if distanceBetween < distance then
                distance = distanceBetween
                prompt = v
            end
        end
    end

    return prompt
end

local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                task.wait(Obj.HoldDuration + 1)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

local function killplayer(name)
    if name == "all" or name == "everyone" or name == "@" or name == "others" or name == "@a" then
        for i, v in pairs(Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer then
               game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(v.Character)
	    end
        end
    else
        game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(GetPlayer(name).Character)
    end
end

for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.RequestTaskList:InvokeServer()) do
    if v.TaskRequired then
        tasks[v.TaskName] = v
        print(v.TaskName .. " | " .. v.TaskDescriptor .. " | " .. v.TaskType)
    end
end

for i,v in pairs(workspace.LoadedMap:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        proximityprompts[v.Parent.Parent] = v
    end
end

local Notify = function(Name, Content, Time)
    OrionLib:MakeNotification({
            Name = Name,
            Content = Content,
            Image = "rbxassetid://4483345998",
            Time = Time
    })
end

local AllTasks = function()
    for i = 1, 25 do
        game.ReplicatedStorage.Remotes.InvokeTaskCompleted:InvokeServer(i)
    end
end

local function LoadHttps(Https)
	loadstring(game:HttpGet(Https))()
end

local goober = library:CreateWindow({
    Name = "dingus",
})

local Combat = goober:CreateTab({
    Name = "Main"
})

local Others = goober:CreateTab({
    Name = "Others"
})

local hidersection = Combat:CreateSection({
    Name = "hider"
})

local shootersection = Combat:CreateSection({
    Name = "hunter"
})

local otherssection = Others:CreateSection({
    Name = "Others Script"
})

shootersection:AddToggle({
    Name = "no shoot cooldown",
    Callback = function(v)
        if v then
            config.HUNTER_FIRE_COOLDOWN_EXTRA = 0
        else
            config.HUNTER_FIRE_COOLDOWN_EXTRA = 1.25
        end
    end
})

shootersection:AddToggle({
    Name = "no blindness",
    Callback = function(v)
        if v then
            config.HUNTER_MISS_BLIND_TIME = 0

        else
            config.HUNTER_MISS_BLIND_TIME = 12
        end
    end
})

otherssection:AddButton({
    Name = "Esp Player",
    Callback = function()
        LoadHttps("https://raw.githubusercontent.com/ToraScript/Script/main/HUNTDuels")
    end
})

otherssection:AddButton({
    Name = "Reaper Hub (not fluxus)",
    Callback = function()
	LoadHttps("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua")
    end
})

otherssection:AddButton({
    Name = "Janorax Hub",
    Callback = function()
	LoadHttps("https://raw.githubusercontent.com/Janorax/Dingus/main/script")
    end
})

otherssection:AddButton({
    Name = "SyniX Hub",
    Callback = function()
	LoadHttps("https://raw.githubusercontent.com/RayzMd/SyniX-Team/main/SyniXScripts")
    end
})

otherssection:AddButton({
    Name = "Rylvns Hub",
    Callback = function()
	LoadHttps("https://raw.githubusercontent.com/Rylvns/EnvisionExploits/master/game-scripts/dingus/source.lua")
    end
})

otherssection:AddButton({
    Name = "Keyboard",
    Callback = function()
	LoadHttps("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Frza")
    end
})

shootersection:AddTextbox({
    Name = "kill person",
    Flag = "goober"
})

shootersection:AddButton({
    Name = "kill him",
    Callback = function()
		killplayer(library.Flags["goober"])
	        wait(.10)
                Notify("Dingus", "Kill Execute", 5)
    end
})

hidersection:AddButton({
    Name = "All Tasks",
    Callback = function()
        AllTasks()
	wait(.10)
        Notify("Dingus", "All Tasks Execute")
    end
})
	
Notify("NoobHubV1 Hub", "Loaded Script!", 6)
